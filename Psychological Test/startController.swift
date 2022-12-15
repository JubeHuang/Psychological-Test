//
//  startController.swift
//  Psychological Test
//
//  Created by Jube on 2022/12/14.
//

import UIKit

class startController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bgShadowStyle(view: circleView, shadowColor: CGColor(red: 138/255, green: 111/255, blue: 111/255, alpha: 1), shadowOpacity: 0.5, shadowRadius: 10)
        // Do any additional setup after loading the view.
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
