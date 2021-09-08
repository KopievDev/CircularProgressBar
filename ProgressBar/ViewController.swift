//
//  ViewController.swift
//  ProgressBar
//
//  Created by Ivan Kopiev on 15.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: ProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(to: 67, with: 0.05)
    }
    
    
}

