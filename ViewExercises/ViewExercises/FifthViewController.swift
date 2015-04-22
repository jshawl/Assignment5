//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {
    var top = NSLayoutConstraint()
    var left = NSLayoutConstraint()
    var height = NSLayoutConstraint()
    var width = NSLayoutConstraint()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        createButton("top left")
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }
    
    func createButton(position: String){
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.layer.backgroundColor = UIColor.greenColor().CGColor
        button.setTitle("Tap Me!", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        if position.rangeOfString("top") != nil {
            self.top = NSLayoutConstraint(
                item: button,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.navigationBar,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0.0
            )
        }
        if position.rangeOfString("bottom") != nil {
            self.top = NSLayoutConstraint(
                item: button,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: -45.0
            )
        }
        if position.rangeOfString("left") != nil {
            self.left = NSLayoutConstraint(
                item: button,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0.0
            )
        }
        if position.rangeOfString("right") != nil {
            self.left = NSLayoutConstraint(
                item: button,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0.0
            )
        }
        self.view.addSubview(button)
        self.view.addConstraints([left, top])
    }
    
    func tapped( sender: UIButton!){
        
        UIView.animateWithDuration(1.0, animations: {
            self.view.layoutIfNeeded()
            sender.layer.backgroundColor = UIColor.redColor().CGColor
            
        })
        UIView.animateWithDuration(1.0, animations: {
            self.view.layoutIfNeeded()
            sender.layer.backgroundColor = UIColor.greenColor().CGColor
        })
    }
}
