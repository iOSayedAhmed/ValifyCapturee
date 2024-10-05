//
//  CameraDelegate.swift
//  ValifyCapture
//
//  Created by iOSAYed on 05/10/2024.
//

import Foundation

public protocol CameraDelegate: AnyObject {
    func didCaptureImage(_ image: UIImage)
    func didFailWithError(_ error: Error)
}
