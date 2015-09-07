//
//  ListTableViewController.swift
//  WordList
//
//  Created by Fumiya Yamanaka on 2015/09/07.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//
import UIKit

class ListTableViewController: UITableViewController {
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
    }
    
    // セクションの数を設定
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの個数を指定
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    // セルの中身の表示の仕方の設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]
        
        cell.englishLabel.text = nowIndexPathDictionary["english"] as? String
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"] as? String

        return cell
    }
    
    
    override func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            wordArray.removeAtIndex(indexPath.row)
            
//            saveData.removeObjectForKey("WORD")
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            tableView.reloadData()
        }
    }
    
    

}
