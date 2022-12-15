//
//  AnswerController.swift
//  Psychological Test
//
//  Created by Jube on 2022/12/14.
//

import UIKit

class AnswerController: UIViewController {
    
    @IBOutlet var userOptions: [UILabel]!
    @IBOutlet var descriptions: [UILabel]!
    @IBOutlet var questionTitles: [UILabel]!
    @IBOutlet var descriptionBgs: [UIView]!
    
    var qnAInfo: QnAInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...4 {
            bgShadowStyle(view: descriptionBgs[i], shadowColor: CGColor(red: 138/255, green: 111/255, blue: 111/255, alpha: 1), shadowOpacity: 0.2, shadowRadius: 8)
        }
        updateUI()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    
    
    func updateUI() {
        for i in 0...4 {
            let userPressedOptionNum = qnAInfo.pressedOptions[i]
            questionTitles[i].text = qnAInfo.qnas[i].question
            userOptions[i].text = qnAInfo.qnas[i].options[userPressedOptionNum]
            descriptions[i].text = qnAInfo.qnas[i].description[userPressedOptionNum]
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
