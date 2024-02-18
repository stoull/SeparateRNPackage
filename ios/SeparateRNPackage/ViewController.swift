//
//  ViewController.swift
//  SeparateRNPackage
//
//  Created by Stoull Hut on 2024/2/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "原生App Root"
    }

    @IBAction func pushRNVC(_ sender: Any) {
        if let rnVC = RNRootVC.createDeviceRootVC(nickName: "RN-RootVC", deviceSN: "Test-SN") {
            self.navigationController?.pushViewController(rnVC, animated: true)
        }
    }
    
}

