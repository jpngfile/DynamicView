//
//  ViewController.swift
//  DynamicView
//
//  Created by Jason P'ng on 2016-05-04.
//  Copyright © 2016 Jason P'ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Setting up the tall blue box
        let blueFrame = CGRect (x : 0, y : 0, width: (view.bounds.width/2), height: view.bounds.height)
        let blueView = UIView (frame : blueFrame)
        blueView.backgroundColor = UIColor.blueColor()
        blueView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        
        blueView.layer.borderColor = (UIColor(red : 0, green : 250, blue: 0, alpha : 0.5)).CGColor
        blueView.layer.borderWidth = 5;
        
        view.addSubview(blueView)
        
        //setting up the top-right black box
        let blackFrame = CGRect (x : (view.bounds.width/2), y : 0, width: (view.bounds.width/2), height: (view.bounds.height/2))
        let blackView = UIView (frame : blackFrame)
        blackView.backgroundColor = UIColor.blackColor()
        blackView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth,.FlexibleBottomMargin,.FlexibleLeftMargin]
        
        blackView.layer.borderColor = (UIColor(red : 250, green : 0, blue: 0, alpha : 0.5)).CGColor
        blackView.layer.borderWidth = 5;
        
        view.addSubview(blackView)
        
        //setting up the bottom-left cyan box
        let cyanFrame = CGRect (x : (view.bounds.width/2), y : (view.bounds.height/2), width: (view.bounds.width/2), height: (view.bounds.height/2))
        let cyanView = UIView (frame : cyanFrame)
        cyanView.backgroundColor = UIColor.cyanColor()
        cyanView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth,.FlexibleTopMargin,.FlexibleLeftMargin]
        
        cyanView.layer.borderColor = (UIColor(red : 0, green : 0, blue: 0, alpha : 1)).CGColor
        cyanView.layer.borderWidth = 5
        
        cyanView.layer.shadowOpacity  = 5;
        view.addSubview(cyanView)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

