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
    
    let colours : [UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(),
                               UIColor (red: 128, green : 0, blue : 0, alpha: 0.5),
                               UIColor (red: 128, green : 128, blue : 0, alpha: 0.5),
                               UIColor (red: 0, green : 128, blue : 0, alpha: 0.5),
                               UIColor (red: 128, green : 0, blue : 128, alpha: 0.5),
                               UIColor (red: 0, green : 128, blue : 128, alpha: 0.5),
                               UIColor (red: 0, green : 0, blue : 128, alpha: 0.5)]
    var colourWords : [String] = ["Red", "Blue", "Lime", "Maroon", "Olive","Green","Purple", "Teal", "Navy"]
    var colourDelegate : ChangeColourDelegate?
    
    override func tableView (tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell{
        if let cell = self.tableView.dequeueReusableCellWithIdentifier ("cell"){
            cell.textLabel?.text = colourWords [indexPath.row]
            return cell
        }
        let newCell = UITableViewCell (style: .Default, reuseIdentifier: "cell")
        newCell.textLabel?.text = colourWords[indexPath.row]
        let cellFrame = CGRect (x: 0, y: 0, width: newCell.bounds.width, height: newCell.bounds.height)
        let cellBackgroundView = UIView (frame: cellFrame)
        cellBackgroundView.backgroundColor = colours [indexPath.row]
        newCell.backgroundView = cellBackgroundView
        return newCell
    }
    
    
    override func tableView (tablewView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return colourWords.count
        
    }
    
    override func tableView (tableView : UITableView, didSelectRowAtIndexPath indexPath : NSIndexPath){
        colourDelegate?.ChangeColour(colours[indexPath.row])
    }
    
    override func tableView (tableView : UITableView, heightForRowAtIndexPath indexPath : NSIndexPath) -> CGFloat {
        return tableView.bounds.height/CGFloat (colours.count)
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
