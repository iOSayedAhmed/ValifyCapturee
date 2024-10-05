//
//  ViewController.swift
//  ValifyCapture
//
//  Created by iOSAYed on 10/05/2024.
//  Copyright (c) 2024 iOSAYed All rights reserved.
//

import UIKit
import ValifyCapture

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var selfiCapturedImageView: UIImageView!
    
    //MARK: Properties
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func startSelfieCapture() {
        let selfieCameraVC = CameraViewController()
        selfieCameraVC.modalPresentationStyle = .fullScreen
        selfieCameraVC.viewModel = CameraViewModel()
        selfieCameraVC.delegate = self
        present(selfieCameraVC, animated: true)
       }

    @IBAction func CaptureSelfiTapped(_ sender: UIButton) {
        startSelfieCapture()
    }
}

extension ViewController : CameraDelegate{
    func didCaptureImage(_ image: UIImage) {
            print("Finished")
            self.selfiCapturedImageView.image = image
        }

    func didFailWithError(_ error: Error) {
            print("Error capturing image: \(error)")
    }
}
