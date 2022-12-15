//
//  quizController.swift
//  Psychological Test
//
//  Created by Jube on 2022/12/14.
//

import UIKit

class quizController: UIViewController {
    
    @IBOutlet weak var quetionTitle: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet var optionBgs: [UIView]!
    @IBOutlet var optionButtons: [UIButton]!
    
    var qnAInfo = QnAInfo(number: 1, qnas: [QnA](), pressedOptions: [Int]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...3 {
            bgShadowStyle(view: optionBgs[i], shadowColor: CGColor(red: 138/255, green: 111/255, blue: 111/255, alpha: 1), shadowOpacity: 0.2, shadowRadius: 8)
        }
        shuffleQnA()
        updateQnAUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressOption(_ sender: UIButton) {
        if let pressedIndex = optionButtons.firstIndex(of: sender) {
            qnAInfo.pressedOptions.append(pressedIndex)
        }
        qnAInfo.number += 1
        if qnAInfo.number < 6 {
            updateQnAUI()
        } else {
            performSegue(withIdentifier: "finishQuiz", sender: sender)
        }
    }
    
    @IBSegueAction func finishQuiz(_ coder: NSCoder) -> AnswerController? {
        let controller = AnswerController(coder: coder)
        controller?.qnAInfo = QnAInfo(number: qnAInfo.number, qnas: qnAInfo.qnas, pressedOptions: qnAInfo.pressedOptions)
        return controller
    }
    
    func updateQnAUI() {
        questionNumber.text = "Q" + "\(qnAInfo.number)"
        quetionTitle.text = qnAInfo.qnas[qnAInfo.number-1].question
        for i in 0..<qnAInfo.qnas[qnAInfo.number-1].options.count {
            optionButtons[i].setTitle("\(qnAInfo.qnas[qnAInfo.number-1].options[i])", for: .normal)
        }
        switch qnAInfo.qnas[qnAInfo.number-1].options.count {
        case 4:
            optionBgs[2].isHidden = false
            optionBgs[3].isHidden = false
        case 3:
            optionBgs[2].isHidden = false
            optionBgs[3].isHidden = true
        case 2:
            optionBgs[2].isHidden = true
            optionBgs[3].isHidden = true
        default:
            break
        }
    }
    func shuffleQnA() {
        qnAInfo.qnas = [
            QnA(question: "請選一個顏色", options: ["紅色", "藍色", "黃色", "白色"], description: ["你是一個非常活潑開朗人的，總是擁有滿滿的鬥志，喜歡挑戰不同事物，就算遇到困難也會積極想辦法解決。", "你是一個內斂浪漫的人，不善於表現太多情感面的東西，溫和且實在，是屬於小太陽類型的人類，安靜卻又散發著溫暖光芒。", "你非常注重美感，喜歡任何變動與未知事物，好奇心很重，內心有點好強，思維獨特，是帶有高質感魅力類型的人類。", "你是智慧的化身，集於一身的優秀，卻從不自負自滿，邏輯能力好，對於任何事都有自己的一套原則。"]),
            QnA(question: "你的食指比較長還是無名指比較長？", options: ["食指比較長", "無名指比較長"], description: ["你是一個認真的人，對未來充滿著憧憬，面對機會從不畏懼，任何事都會執行到底。", "你的原則性很強，不喜歡被破壞，同時執行力非常好，擁有足夠的膽識及勇氣。"]),
            QnA(question: "路上有個老人擁有預知能力，並可以告知你一些事情，你希望...", options: ["讓他告訴你未來一年間發生的事", "讓他告訴你明天發生的事", "讓他什麼都不要說"], description: ["你的外表看起來隨和、好相處，但內裡其實有點固執，意志非常的堅強，面對自己在乎的事情會非常執著。", "你的個性有點急躁，想到什麼就做什麼，但也非常的單純，從來不記仇，社交能力很強，是大家的開心果。", "你總是非常的小心謹慎，個性有點內向，不太懂得如何表達自己的情感面，很多時候你更喜歡自己待著，會讓你感到相較自在。"]),
            QnA(question: "在巴黎香榭大道上，看到一對擁吻的情侶，你覺得他們身分可能是？", options: ["學生", "咖啡廳老闆", "清潔工"], description: ["你從不追求功名利祿，對於地位及名譽不貪圖，總是正向和善的生活。", "你非常有計畫性，讓自己隨時都處於警覺狀態，生活有點緊繃。", "你是樸實的純情派人類，有點耿直，總是坦率自然的生活。"]),
            QnA(question: "當收到禮物時，你的反應是？", options: ["開心收下，並感謝對方", "靦腆接受，並輕輕放下禮物", "馬上拆開，並給予評價"], description: ["你常常因為太過於顧慮對方感受而委屈自己，很多時候，你的善良反而成為別人傷害你的助力。", "你就像小強，到哪都能夠好好的生存，適應能力很強，雖時都能為了生存而改變自己的原則。", "你現階段對工作或課業上感到非常厭倦，有點到了自怨自艾的模式，如果能夠找人聊聊，又或者是給自己一些放空的時間，會比較有幫助喔。"])
        ]
        qnAInfo.qnas.shuffle()
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
