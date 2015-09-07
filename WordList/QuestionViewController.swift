//
//  QuestionViewController.swift
//  WordList
//
//  Created by Fumiya Yamanaka on 2015/09/07.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false
    var wordArray: [AnyObject] = []
    var shuffledWordArray: [AnyObject] = []
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordArray = saveData.arrayForKey("WORD")!
        
        shuffledWordArray = shuffle(wordArray)
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String

        answerLabel.text = ""
        
    }
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let countNum = count(list)
        for i in 0..<(countNum - 1) {
            let j = Int(arc4random_uniform(UInt32(countNum - i))) + i
            swap(&list[i], &list[i])
        }
        return list
    }
    
    @IBAction func nextButtonPushed() {
        if isAnswered {
            nowNumber++
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                isAnswered = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            } else {
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
            
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }
    
    
}
