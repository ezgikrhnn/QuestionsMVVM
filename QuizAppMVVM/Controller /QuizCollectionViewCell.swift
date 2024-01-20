//
//  QuizCollectionViewCell.swift
//  QuizAppMVVM
//
//  Created by Ezgi Karahan on 17.01.2024.
//

import UIKit

//şıkların seçim halini enum içinde yazıyorum:
//burası chanceOrder func içinde kullanılacak. swich-xase kısmı bu func içinde yazıldı.
enum SelectedOption {
    case optionA
    case optionB
    case optionC
    case optionD
    
}

class QuizCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelOption1: UILabel!
    @IBOutlet weak var labelOPtion2: UILabel!
    @IBOutlet weak var labelOption3: UILabel!
    //options:
    @IBOutlet weak var optionA: UIControl!
    @IBOutlet weak var optionB: UIControl!
    @IBOutlet weak var optionC: UIControl!
    @IBOutlet weak var optionD: UIControl!
    
    
    @IBOutlet weak var labelOption4: UILabel!
    private var correctAnswer: String?
    
    var setValues: Questions? {
        didSet{
            labelQuestion.text = setValues?.question
            labelOption1.text = setValues?.option_1
            labelOPtion2.text = setValues?.option_2
            labelOption3.text = setValues?.option_3
            labelOption4.text = setValues?.option_4
            
            correctAnswer = setValues?.correct_answer
        }
    }
    
    //CLOSURE:
    var selectedOption: ((_ selectedAnswer: Bool)-> Void)?
    
    //OPTION BUTTONS
    @IBAction func onClickOptionA(_ sender: Any) {
        var isCorrect = false
        
        if correctAnswer == setValues?.option_1{
            isCorrect = true
        }
        selectedOption?(isCorrect) //closure
        changeBorder(selectedOption: .optionA)
    }
    
    @IBAction func onClickOptionB(_ sender: Any) {
        var isCorrect = false
        
        if correctAnswer == setValues?.option_2{
            isCorrect = true
        }
        selectedOption?(isCorrect) //closure
        changeBorder(selectedOption: .optionB)
    }
   
    @IBAction func onClickOptionC(_ sender: Any) {
        var isCorrect = false
        
        if correctAnswer == setValues?.option_3{
            isCorrect = true
        }
        selectedOption?(isCorrect) //closure
        changeBorder(selectedOption: .optionC)
    }
    
    @IBAction func onClickOptionD(_ sender: Any) {
        var isCorrect = false
        
        if correctAnswer == setValues?.option_4{
            isCorrect = true
        }
        selectedOption?(isCorrect) //closure
        changeBorder(selectedOption: .optionD)
    }
    
    //tıklama anında şıkların etrafına border veriyorum
    func updateOptionBorder (myView : UIView, borderWidth: CGFloat = 0){
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.blue.cgColor
    }
    
    func changeBorder(selectedOption: SelectedOption){
        switch selectedOption{
        case .optionA:
            print("OptionA is clicked")
            optionA.layer.opacity = 0.5
            updateOptionBorder(myView: optionA, borderWidth: 3.0)
            updateOptionBorder(myView: optionB)
            updateOptionBorder(myView: optionC)
            updateOptionBorder(myView: optionD)
          
        case .optionB:
            print("OptionB is clicked")
            optionB.layer.opacity = 0.5
            updateOptionBorder(myView: optionB, borderWidth: 3.0)
            updateOptionBorder(myView: optionA)
            updateOptionBorder(myView: optionC)
            updateOptionBorder(myView: optionD)
            
        case .optionC:
            print("OptionC is clicked")
            optionC.layer.opacity = 0.5
            updateOptionBorder(myView: optionC, borderWidth: 3.0)
            updateOptionBorder(myView: optionB)
            updateOptionBorder(myView: optionA)
            updateOptionBorder(myView: optionD)
            
        case .optionD:
            print("OptionD is clicked")
            optionD.layer.opacity = 0.5
            updateOptionBorder(myView: optionD, borderWidth: 3.0)
            updateOptionBorder(myView: optionB)
            updateOptionBorder(myView: optionC)
            updateOptionBorder(myView: optionA)
        
        }
    }
}
