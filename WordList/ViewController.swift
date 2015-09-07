//
//  ViewController.swift
//  WordList
//
//  Created by Fumiya Yamanaka on 2015/09/06.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtontapped() {
        
        let saveData = NSUserDefaults.standardUserDefaults()
        
        var wordArray: [AnyObject] = []
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
            if wordArray.count > 0 {
                self.performSegueWithIdentifier("toQuestionView", sender: nil)
                return
            }
        }
        
        let alert = UIAlertController(
            title: "単語登録",
            message: "まずは「単語一覧」をタップして単語登録してください",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler:nil
            )
        )
        self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    


