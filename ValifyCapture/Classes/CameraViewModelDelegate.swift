//
//  CameraViewModelDelegate.swift
//  ValifyCapture
//
//  Created by iOSAYed on 05/10/2024.
//

import Foundation

protocol CameraViewModelDelegate: AnyObject {
    func didCaptureImage(_ image: UIImage)
    func didFailWithError(_ error: Error)
}
