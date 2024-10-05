//
//  CameraViewController.swift
//  ValifyCapture
//
//  Created by iOSAYed on 05/10/2024.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, CameraViewModelDelegate {
    var viewModel: CameraViewModel!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CameraViewModel()
        viewModel.delegate = self

        setupCameraPreview()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.startSession()
    }

    override func viewWillDisappear(_ animated: Bool) {
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

    // MARK: - CameraViewModelDelegate methods
    func didCaptureImage(_ image: UIImage) {
        // Handle the captured image, e.g., transition to an image preview screen
    }

    func didFailWithError(_ error: Error) {
        // Handle error, e.g., show an alert to the user
    }
}
