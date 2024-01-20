//
//  ViewController.swift
//  QuizAppMVVM
//
//  Created by Ezgi Karahan on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonPlay(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonTopics(_ sender: Any) {
    }
    
    
}


    
    
    








