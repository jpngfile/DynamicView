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
    
    let colours : [[String : AnyObject]] = [
        ["title" : "Red" , "color" :  UIColor.redColor()],
        ["title" : "Blue" , "color" :  UIColor.blueColor()],
        ["title" : "Lime",  "color" : UIColor.greenColor()],
        ["title" : "Maroon", "color" : UIColor (red: 128, green : 0, blue : 0, alpha: 0.5)],
        ["title" : "Olive", "color" : UIColor (red: 128, green : 128, blue : 0, alpha: 0.5)],
        ["title" : "Green", "color" : UIColor (red: 0, green : 128, blue : 0, alpha: 0.5)],
        ["title" : "Purple", "color" : UIColor (red: 128, green : 0, blue : 128, alpha: 0.5)],
        ["title" :"Teal", "color" : UIColor (red: 0, green : 128, blue : 128, alpha: 0.5)],
        ["title" : "Navy", "color" : UIColor (red: 0, green : 0, blue : 128, alpha: 0.5)]
        ]
    
    
    
    
//    var colourWords : [String] = ["Red", "Blue", "Lime", "Maroon", "Olive","Green","Purple", "Teal", "Navy"]
    var colourDelegate : ChangeColourDelegate?
    
    override func tableView (tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier ("cell")! as UITableViewCell
        
        let item = colours[indexPath.row]
        if let title = item["title"] as? String , color = item["color"] as? UIColor {
            
            cell.textLabel?.text = title
            cell.backgroundColor = color
        }
        
        return cell
    }
    
    
    override func tableView (tablewView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return colours.count
        
    }
    
    override func tableView (tableView : UITableView, didSelectRowAtIndexPath indexPath : NSIndexPath){
        
        let item = colours[indexPath.row]
        if let color = item["color"] as? UIColor {
            
            colourDelegate?.ChangeColour(color)
        }
        
    }
    
    override func tableView (tableView : UITableView, heightForRowAtIndexPath indexPath : NSIndexPath) -> CGFloat {
        return tableView.bounds.height/CGFloat (colours.count)
    }
    
    convenience init (bounds : CGRect){
        self.init()
        tableView.frame = CGRect (x : 0,y : 0, width: bounds.width/2, height : bounds.height)
        tableView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth,.FlexibleRightMargin]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "cell")
        
    }
}

//This custom cell replaces the default selected style by only highlighting the text rather than the whole cell
class CustomCell : UITableViewCell {
    
    override func setSelected(selected: Bool, animated: Bool) {
        if selected {
            self.textLabel?.textColor = UIColor.whiteColor()
        }
        else {
            self.textLabel?.textColor = UIColor.blackColor()
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            self.textLabel?.textColor = UIColor.whiteColor()
        }
        else {
            self.textLabel?.textColor = UIColor.blackColor()
        }
    }
}
