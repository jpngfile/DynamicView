//
//  ViewController.swift
//  DynamicView
//
//  Created by Jason P'ng on 2016-05-04.
//  Copyright © 2016 Jason P'ng. All rights reserved.
//

import UIKit


protocol ChangeColourDelegate {
    func ChangeColour (colour : UIColor)
}

class ViewController: UIViewController, ChangeColourDelegate {

    
    let canvasController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Adding the menu
        let menuVC = MenuVC (bounds : view.bounds)
        menuVC.colourDelegate = self
        
        addChildViewController(menuVC)
        menuVC.didMoveToParentViewController(self)
        view.addSubview(menuVC.tableView)

        //adding the canvas
        canvasController.view.frame = CGRect (x : (view.bounds.width/2), y : 0, width: (view.bounds.width/2), height: (view.bounds.height/2))
        canvasController.view.backgroundColor = UIColor.blackColor()
        canvasController.view.autoresizingMask = [.FlexibleHeight,.FlexibleWidth, .FlexibleBottomMargin, .FlexibleLeftMargin]
        
        addChildViewController(canvasController)
        canvasController.didMoveToParentViewController(self)
        view.addSubview(canvasController.view)
        
    
        //adding the cyan box
        let cyanController =  UIViewController()
        cyanController.view.backgroundColor = UIColor.cyanColor()
        cyanController.view.autoresizingMask = [.FlexibleHeight,.FlexibleWidth,.FlexibleTopMargin,.FlexibleLeftMargin]
        cyanController.view.frame = CGRect (x : (view.bounds.width/2), y : (view.bounds.height/2), width: (view.bounds.width/2), height: (view.bounds.height/2))
        
        addChildViewController(cyanController)        
        cyanController.didMoveToParentViewController(self)
        view.addSubview(cyanController.view)
        
    }
    
    func ChangeColour(colour: UIColor) {
        canvasController.view.backgroundColor = colour
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

