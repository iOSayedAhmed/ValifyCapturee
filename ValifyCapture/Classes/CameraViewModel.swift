//
//  CameraViewModel.swift
//  ValifyCapture
//
//  Created by iOSAYed on 05/10/2024.
//

import Foundation
import AVFoundation
import Combine

public class CameraViewModel: NSObject {
    var captureSession: AVCaptureSession?
    var photoOutput: AVCapturePhotoOutput?
    var cameraPosition = AVCaptureDevice.Position.front
    
    var imageCapturedSubject = PassthroughSubject<UIImage, Never>()
    var errorSubject = PassthroughSubject<Error, Never>()
    
   public override init() {
        super.init()
        setupSession()
    }

    private func setupSession() {
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else { return }

        captureSession.beginConfiguration()

        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: cameraPosition),
              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice), captureSession.canAddInput(videoDeviceInput) else {
            return
        }
        captureSession.addInput(videoDeviceInput)

        // Setup Photo Output
        photoOutput = AVCapturePhotoOutput()
        if let photoOutput = photoOutput, captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }

        captureSession.commitConfiguration()
    }

    func startSession() {
           DispatchQueue.global(qos: .userInitiated).async { [weak self] in
               self?.captureSession?.startRunning()
           }
       }

       func stopSession() {
           DispatchQueue.global(qos: .userInitiated).async { [weak self] in
               self?.captureSession?.stopRunning()
           }
       }

    func captureImage() {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            self.errorSubject.send(error)
            return
        }
        if let imageData = photo.fileDataRepresentation(), let image = UIImage(data: imageData) {
            DispatchQueue.main.async {
                self.imageCapturedSubject.send(image)
            }
        }
    }
}
