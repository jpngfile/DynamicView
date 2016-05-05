//
//  File.swift
//  DynamicView
//
//  Created by Jason P'ng on 2016-05-05.
//  Copyright © 2016 Jason P'ng. All rights reserved.
//

import Foundation

import UIKit

class MenuVC : UITableViewController {
    
    let colours : [UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor()]
    var colourWords : [String] = ["red", "blue", "green"]
    
    override func tableView (tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell{
        //will this break?
        if let cell = self.tableView.dequeueReusableCellWithIdentifier ("cell"){
            cell.textLabel?.text = colourWords [indexPath.row]
            print ("retuned")
            return cell
        }
        let newCell = UITableViewCell (style: .Default, reuseIdentifier: "cell")
        newCell.textLabel?.text = colourWords[indexPath.row]
        return newCell
    }
    
    
    override func tableView (tablewView : UITableView, numberOfRowsInSection section : Int) -> Int {
        print ("counted")
        return colourWords.count
        
    }
    
    override func tableView (tableView : UITableView, didSelectRowAtIndexPath indexPath : NSIndexPath){
        colourWords [indexPath.row] = "selected"
        tableView.cellForRowAtIndexPath(indexPath)!.textLabel?.text = colourWords [indexPath.row]
        print ("select")
    }
    
    convenience init (bounds : CGRect){
        self.init()
        tableView = UITableView (frame: CGRect (x : 0,y : 0, width: bounds.width/2, height : bounds.height), style: .Plain)
        tableView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth,.FlexibleRightMargin]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
}
