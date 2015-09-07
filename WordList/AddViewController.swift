//
//  AddViewController.swift
//  WordList
//
//  Created by Fumiya Yamanaka on 2015/09/07.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        
    }
    
    @IBAction func saveWord() {
        if englishTextField.text != "" && japaneseTextField.text != "" {
            let wordDicitionary = ["english":englishTextField.text, "japanese":japaneseTextField.text]
            wordArray.append(wordDicitionary)
            saveData.setObject(wordArray, forKey: "WORD")
        
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録完了",
                preferredStyle: UIAlertControllerStyle.Alert
            )
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler:nil
                )
            )
    
            self.presentViewController(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
        
    }
    
}
