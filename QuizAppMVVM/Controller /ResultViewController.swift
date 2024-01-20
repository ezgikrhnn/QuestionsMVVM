//
//  ResultViewController.swift
//  QuizAppMVVM
//
//  Created by Ezgi Karahan on 17.01.2024.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelScore.text = "\(score)/10"
        print("veri gönderildi")
        
    }
    
    @IBAction func buttonBackToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
