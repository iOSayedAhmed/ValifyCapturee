//
//  CameraViewController.swift
//  ValifyCapture
//
//  Created by iOSAYed on 05/10/2024.
//

import AVFoundation
import Combine
import UIKit

public class CameraViewController: UIViewController {
    public var viewModel: CameraViewModel!
    public weak var delegate: CameraDelegate?
    var previewLayer: AVCaptureVideoPreviewLayer!
    var cancellables: Set<AnyCancellable> = []

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CameraViewModel()
        setupCameraPreview()
        bindViewModel()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.startSession()
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopSession()
    }

    private func setupCameraPreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session: viewModel.captureSession!)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        let captureButton = UIButton(frame: CGRect(x: (view.bounds.width - 70) / 2, y: view.bounds.height - 100, width: 70, height: 70))
        captureButton.backgroundColor = .white
        captureButton.layer.cornerRadius = 35
        captureButton.addTarget(self, action: #selector(capturePhoto), for: .touchUpInside)
        view.addSubview(captureButton)
    }

    @objc func capturePhoto() {
        viewModel.captureImage()
    }
    
    public func presentCameraVC(with delegate: CameraDelegate) -> UIViewController? {
           let selfieCameraVC = CameraViewController()
           selfieCameraVC.modalPresentationStyle = .fullScreen
           selfieCameraVC.viewModel = CameraViewModel()
           selfieCameraVC.delegate = delegate
        return selfieCameraVC
       }
}

extension CameraViewController {
    private func bindViewModel() {
        viewModel.imageCapturedSubject
            .sink(receiveValue: { [weak self] image in
                guard let self else {return}
                delegate?.didCaptureImage(image)
                print("Image captured successfully")
                dismissViewController()
            })
            .store(in: &cancellables)

        viewModel.errorSubject
            .sink(receiveValue: { [weak self] error in
                guard let self else {return}
                print("Failed to capture image: \(error.localizedDescription)")
                delegate?.didFailWithError(error)
                dismissViewController()
            })
            .store(in: &cancellables)
    }

    private func dismissViewController() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
