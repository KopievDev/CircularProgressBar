//
//  ViewController.swift
//  ProgressBar
//
//  Created by Ivan Kopiev on 15.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: ProgressBar!
    var count: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
            guard let `self` = self else {return}
            self.count += 1
            DispatchQueue.main.async {
                self.progressBar.progress = min(0.01 * self.count, 1)
                if self.progressBar.progress == 1 {
                    timer.invalidate()
                }
            }
        }
        
    }
    
    
}

