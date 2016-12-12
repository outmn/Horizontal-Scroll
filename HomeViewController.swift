//
//  HomeViewController.swift
//  Horizontal Scroll
//
//  Created by Maxim  Grozniy on 10.06.16.
//  Copyright © 2016 Maxim  Grozniy. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    var views = [UIView]()
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collider: UICollisionBehavior!
    
    let nytimesURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...6 {
            let v = UIView(frame: CGRect(x: (i * 150) + 50, y: 100, width: 100, height: 100))
            v.backgroundColor = UIColor.whiteColor()
            v.layer.cornerRadius = 10
            v.layer.shadowColor = UIColor.blackColor().CGColor;
            v.layer.shadowOffset = CGSizeZero;
            v.layer.shadowRadius = 5.0;
            v.layer.shadowOpacity = 0.5;
            createTapGesture(v)
            views.append(v)
            scrollView.addSubview(v)
        }
        
       self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
        
    }

    
    func fallAnimation(view: UIView) {
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.CurveEaseOut], animations: {
                if view.center.y != 150 {
                  view.center.y -= 350
                } else {
                    view.center.y += 350
                }
                
            }, completion: nil)

    }
    
    func createTapGesture(view: UIView) {
        //var tap: UITapGestureRecognizer!
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.haddleTap(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    func haddleTap(sender: UITapGestureRecognizer) {
        
        let tapLocation = sender.locationInView(self.view)
        let scrollX = scrollView.contentOffset.x
        
        let point = tapLocation.x + scrollX
        
        for i in 0...6 {
            if point > CGFloat((i * 150) + 50) && point < CGFloat((i * 150) + 150) {
                fallAnimation(views[i])
            }
            
//            let v = UIView(frame: CGRect(x: (i * 150) + 50, y: 100, width: 100, height: 100))
//            v.backgroundColor = UIColor.whiteColor()
//            v.layer.cornerRadius = 10
//            v.layer.shadowColor = UIColor.blackColor().CGColor;
//            v.layer.shadowOffset = CGSizeZero;
//            v.layer.shadowRadius = 5.0;
//            v.layer.shadowOpacity = 0.5;
//            createTapGesture(v)
//            views.append(v)
//            scrollView.addSubview(v)
        }

        
//        if point > 50 && point < 150 {
//            fallAnimation(views[0])
//        } else if point >= 200 && point <= 300 {
//            fallAnimation(views[1])
//        } else if point >= 350 && point <= 450 {
//            fallAnimation(views[2])
//        } else if point >= 500 && point <= 600 {
//            fallAnimation(views[3])
//        } else if point >= 650 && point <= 750 {
//            fallAnimation(views[4])
//        } else if point >= 800 && point <= 900 {
//            fallAnimation(views[5])
//        } else if point >= 950 && point <= 1050 {
//            fallAnimation(views[6])
//        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
