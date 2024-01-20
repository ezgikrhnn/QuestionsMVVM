//
//  QuizViewController.swift
//  QuizAppMVVM
//
//  Created by Ezgi Karahan on 17.01.2024.
//

import UIKit

class QuizViewController: UIViewController {

    
    @IBOutlet weak var QuestionCollectionView: UICollectionView!
    
    var viewModel = QuestionViewModel()
    var questions: [Questions]?
    var answerSelected = false
    var isCorrectAnswer = false
    var points = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellProperties()
        
        viewModel.getAllTheQuestions { [weak self] in
            self?.questions = self?.viewModel.questionData?.data?.questions //iyi incele
            DispatchQueue.main.async {
                self?.QuestionCollectionView.delegate = self
                self?.QuestionCollectionView.dataSource = self
            }
        }
    }

    @IBAction func buttonExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true) //ana ekrana dönmesi için yazılan kod.
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        if !answerSelected { //şık seçilmediyse alert göster
            let alert = UIAlertController(title: "Select One Option!", message: "Please select one option before moving to the next question.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        
        if index < (self.questions?.count ?? 0) - 1 {
            index += 1
            QuestionCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else{
            //move the user on the result controller
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
            vc.score = points
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
       
    }
    
    func cellProperties(){
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tasarim.minimumInteritemSpacing = 0
        tasarim.minimumLineSpacing = 0
        
        let ekranGenisliği = UIScreen.main.bounds.width ///ekran genişliğni verir
        let itemGenislik = (ekranGenisliği)
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.8)
        tasarim.scrollDirection = .horizontal
        QuestionCollectionView.collectionViewLayout = tasarim
    }
}

//MARK: Extension
extension QuizViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return questions?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //buradada
        guard let cell = QuestionCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? QuizCollectionViewCell else{ return QuizCollectionViewCell()}
        
        cell.setValues = questions?[indexPath.row]
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }
    
}
