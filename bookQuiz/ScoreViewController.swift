//
//  ScoreViewController.swift
//  bookQuiz
//
//  Created by 小山内秀 on 2023/07/15.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var returnTopButton: UIButton!
    
    var correct = 0
    var selectLebel = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scoreLabel.text = "\(correct)問正解"
        if correct == 0 {
            scoreLabel.text = "騙された!"
        } else {
            scoreLabel.text = "難易度\(correct)クリア！"
        }
        
        buttonLayer(buttonObj: shareButton)
        buttonLayer(buttonObj: returnTopButton)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
        let activityItems = ["\(String(describing: scoreLabel.text)),”#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
    }
    
    func buttonLayer (buttonObj: UIButton!) {
        buttonObj.layer.borderWidth = 2
        buttonObj.layer.borderColor = UIColor.black.cgColor
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
