//
//  QuizViewController.swift
//  bookQuiz
//
//  Created by 小山内秀 on 2023/07/15.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLevel = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("選択したレベルは\(selectLevel)")
        
        
        
        csvArray = loadCSV(fileName: "quiz\(selectLevel)")
        csvArray.shuffle()
        print(csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        //print(quizArray)

        quizNumberLabel.text = "第\(quizCount + 1)門"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
        
        buttonLayer(buttonObj: answerButton1)
        buttonLayer(buttonObj: answerButton2)
        buttonLayer(buttonObj: answerButton3)
        buttonLayer(buttonObj: answerButton4)
        
        // Do any additional setup after loading the view.
    }
    
    func buttonLayer (buttonObj: UIButton!) {
        buttonObj.layer.borderWidth = 2
        buttonObj.layer.borderColor = UIColor.black.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //ボタンを押下時に起動
    @IBAction func btnAction(sender: UIButton) {
        print(sender.tag)
        if sender.tag == Int(quizArray[1]){
            print("正解")
            correctCount += 1
            judgeImageView.image = UIImage(named: "correct")
        }else{
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("スコア：\(correctCount)")
        
        judgeImageView.isHidden = false
        
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
        
        
    }
    
    func loadCSV(fileName: String) -> [String] {
        let csvBandle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBandle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("error")
        }
        return csvArray
    }
    
    func nextQuiz() {
        quizCount += 1
        
        //if quizCount < csvArray.count {
        if quizCount == 0 {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            //print(quizArray)
            quizNumberLabel.text = "第\(quizCount + 1)門"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
