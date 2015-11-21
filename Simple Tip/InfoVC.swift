//
//  InfoVC.swift
//  Simple Tip
//
//  Created by Jeremy Evans on 11/20/15.
//  Copyright © 2015 Jeremy Evans. All rights reserved.
//

import UIKit
import Parse

class InfoVC: UIViewController {

    override func viewWillAppear(animated: Bool) {
        let topColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
        view.backgroundColor = UIColor.clearColor()
        let backgroundLayer = GradientColor.init().gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        
        navigationController?.navigationBar.barTintColor = topColor
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
    }
    
    // REMOVE ADS
    @IBAction func didTapRemoveAds(sender: UIButton!) {
        // Dispose of any resources that can be recreated.
        PFPurchase.buyProduct("info.jeremyevans.Simple_Tip.remove_ads") { (error: NSError?) -> Void in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
