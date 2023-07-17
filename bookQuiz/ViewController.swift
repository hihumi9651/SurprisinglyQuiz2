//
//  ViewController.swift
//  bookQuiz
//
//  Created by 小山内秀 on 2023/07/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
    }


}

