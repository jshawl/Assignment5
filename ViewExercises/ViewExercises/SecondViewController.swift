//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        createBlueBox("top left")
        createBlueBox("top right")
        createBlueBox("bottom left")
        createBlueBox("bottom right")
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
    
    //func prepareView(UIView) -> (){}
    
    func createBlueBox(position: String){
        var blueBox = UIView()
        var top = NSLayoutConstraint()
        var left = NSLayoutConstraint()
        var height = NSLayoutConstraint()
        var width = NSLayoutConstraint()
        
        self.add(blueBox, superView: self.view)
        blueBox.backgroundColor = UIColor.blueColor()
        if position.rangeOfString("top") != nil {
                top = NSLayoutConstraint(
                item: blueBox,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 65.0
            )
        }
        if position.rangeOfString("bottom") != nil {
                top = NSLayoutConstraint(
                item: blueBox,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: -45.0
            )
        }
        height = NSLayoutConstraint(
            item: blueBox,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 0.5,
            constant: 20.0
        )
        width = NSLayoutConstraint(
            item: blueBox,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 20.0
        )
        if position.rangeOfString("left") != nil {
            left = NSLayoutConstraint(
                item: blueBox,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0.0
            )
        }
        if position.rangeOfString("right") != nil {
            left = NSLayoutConstraint(
                item: blueBox,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.exerciseView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0.0
            )
        }
        
        self.view.addConstraints([height, width, left, top])
    }
}
