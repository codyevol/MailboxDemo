//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Cody Evol on 11/3/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var singleMessage: UIView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var leftSwipe: UIView!
    @IBOutlet weak var rightSwipe: UIView!

    
    var messageOriginalCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
            scrollView.contentSize = imageView.image!.size
            messageOriginalCenter = messageView.frame.origin
            singleMessage.backgroundColor = UIColor(hue: 123, saturation: 0, brightness: 88, alpha: 100)
        

    
        
    }
   
    @IBAction func messageScroll(sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        
        
        if sender.state == UIGestureRecognizerState.Began {
           
            print("began")
            
            messageOriginalCenter = messageView.center

        }else if sender.state == UIGestureRecognizerState.Changed {
           
            print(translation.x)
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            
        
        }else if sender.state == UIGestureRecognizerState.Ended {
            
            print("ended")
            
        }
    }
}