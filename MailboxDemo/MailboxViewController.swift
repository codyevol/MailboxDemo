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
    @IBOutlet weak var rescheduleView: UIImageView!

    
    var messageOriginalCenter: CGPoint!
    var messageSwipeLeft: Bool!
    var messageSwipeRight: Bool!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
            scrollView.contentSize = imageView.image!.size
            messageOriginalCenter = messageView.frame.origin
             singleMessage.backgroundColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
            messageSwipeRight = false
            messageSwipeLeft = false
            deleteIcon.alpha = 0
            archiveIcon.alpha = 0.5
            listIcon.alpha = 0
            laterIcon.alpha = 0.5
        
        
    }
    
   
    @IBAction func messageScroll(sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translationInView(view)
        //let velocity = sender.velocityInView(view)
        
        
        
        if sender.state == UIGestureRecognizerState.Began {
           
            print("began")
            
            messageOriginalCenter = messageView.center

        }else if sender.state == UIGestureRecognizerState.Changed {
           
            print(translation.x)
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x > 64 && translation.x < 160{
                
                  singleMessage.backgroundColor = UIColor(red: 111/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
            
            } else if translation.x > 160{
                
                singleMessage.backgroundColor = UIColor(red: 203/255.0, green: 6/255.0, blue: 30/255.0, alpha: 1.0)
                
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
            
            } else if translation.x < 63 && translation.x > -63 {
                
                singleMessage.backgroundColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)

            } else if translation.x < -64  && translation.x > -160{
                
                singleMessage.backgroundColor = UIColor(red: 249/255.0, green: 210/255.0, blue: 70/255.0, alpha: 1.0)
                laterIcon.alpha = 1
                listIcon.alpha = 0
            
            
            } else if translation.x < -160 {
                
                singleMessage.backgroundColor = UIColor(red: 215/255.0, green: 166/255.0, blue: 120/255.0, alpha: 1.0)
                laterIcon.alpha = 0
                listIcon.alpha = 1
                rescheduleView.alpha = 0
            }

        
        }else if sender.state == UIGestureRecognizerState.Ended {
            
            print("ended")
            
            }
       
        }
        
    }
