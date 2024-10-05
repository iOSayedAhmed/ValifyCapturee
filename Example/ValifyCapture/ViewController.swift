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
    
    //MARK: OUTLETS
    
    @IBOutlet weak var selfiCapturedImageView: UIImageView!
    
    var selfieCameraVC: CameraViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selfi = SelfiCapture()
        selfi.sayHello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func startSelfieCapture() {
           selfieCameraVC = CameraViewController()
           selfieCameraVC?.modalPresentationStyle = .fullScreen
           selfieCameraVC?.viewModel = CameraViewModel()
           selfieCameraVC?.delegate = self
           present(selfieCameraVC!, animated: true, completion: nil)
       }

    @IBAction func CaptureSelfiTapped(_ sender: UIButton) {
        startSelfieCapture()
    }
}

extension ViewController :CameraViewModelDelegate{
    func didCaptureImage(_ image: UIImage) {
            print("Finished")
            self.selfiCapturedImageView.image = image
        }

    func didFailWithError(_ error: Error) {
            print("Error capturing image: \(error)")
    }
}
