//
//  ViewController.swift
//  multiple
//
//  Created by Lu Andy on 2018/12/3.
//  Copyright © 2018 Lu Andy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Qa{
        var question:String
        var answer:[String]
        var correct:String
    }

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var qnumber: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet var button: [UIButton]!
    var number = 0
    var ans = ""
    var grade = 0
    var qa =
[
Qa(question:"Pineapple",answer:["鳳梨","蘋果","香蕉","芭樂"],correct:"鳳梨"),
Qa(question:"chocolate",answer:["軟糖","巧克力","洋芋片","汽水"],correct:"巧克力"),
Qa(question:"airplane",answer:["汽車","機車","火車","飛機"],correct:"飛機"),
Qa(question:"hat",answer:["褲子","帽子","衣服","手錶"],correct:"帽子"),
Qa(question:"beef",answer:["豬肉","羊肉","牛肉","雞肉"],correct:"牛肉"),
Qa(question:"glass",answer:["電腦","眼鏡","滑鼠","吸管"],correct:"眼鏡"),
Qa(question:"clock",answer:["門","窗","把手","時鐘"],correct:"時鐘"),
Qa(question:"curtain",answer:["冷氣","窗簾","搖控器","屏幕"],correct:"窗簾"),
Qa(question:"keyboard",answer:["鍵盤","鼠標","鑰匙","橡皮擦"],correct:"鍵盤"),
Qa(question:"peanut",answer:["堅果","花生","橄欖","火龍果"],correct:"花生"),
Qa(question:"toast",answer:["蛋餅","鐵板麵","薯餅","吐司"],correct:"土司"),

]

    @IBAction func choose(_ sender: UIButton)
    {
        number+=1
        
        if (sender.currentTitle==ans)
        {
            grade+=10
            score.text = "得分: "+String(grade)
        }
        
        
        if (number == 10)
        {
            let alertController = UIAlertController(
                title: "遊戲結束",
                message: "分數 ：\(grade)分",
                preferredStyle: .alert)
            
            let okBtn = UIAlertAction(
                title: "離開",
                style: .default,
                handler:
                {
                    (action: UIAlertAction!) -> Void in exit(0)
                })
            
            let remake = UIAlertAction(
                title: "重新開始",
                style: .default,
                handler:
                {
                    (action: UIAlertAction!) -> Void in self.viewDidLoad()
            })
              alertController.addAction(okBtn)
              alertController.addAction(remake)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
        qnumber.text = "第" + String(number+1) + "題"
        Play()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = 0
        ans = ""
        grade = 0
        qa.shuffle()
        qnumber.text = "第" + String(number+1) + "題"
        score.text = "得分: "+String(grade)
        
        Play()
    }
    
    func Play()
    {
        question.text = qa[number].question
        ans = qa[number].correct
        for i in 0...3{
            button[i].setTitle(qa[number].answer[i], for: .normal)
        }
    }
    
}


