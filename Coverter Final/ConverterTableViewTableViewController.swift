//
//  ConverterTableViewTableViewController.swift
//  Coverter Final
//
//  Created by Bryan  Miller on 9/13/16.
//  Copyright © 2016 swift 3. All rights reserved.
//

import UIKit

class ConverterTableViewTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var dollarAmountTextfield: UITextField!
    
    //button
 let button = UIButton(type: UIButtonType.Custom)
    
    
    
    
    
    
    @IBOutlet weak var EurResultLabel: UILabel!
    
    
    
    @IBOutlet weak var MexicoResltsLabel: UILabel!
    
    
    @IBOutlet weak var ChinaResultsLabel: UILabel!
    
    
    @IBOutlet weak var CanadaResultLabel: UILabel!
    
    
    
    
    @IBOutlet weak var convertButon: UIButton!
    
    
    @IBOutlet weak var indiaResultLabel: UILabel!
    
    
    
    @IBOutlet weak var crotiaResultLabel: UILabel!
    
    
    @IBOutlet weak var austrailiaResultLabel: UILabel!
    
    @IBOutlet weak var bagledeshResultLabel: UILabel!
    
    @IBOutlet weak var belizeResultLabel: UILabel!
    
    
    
    
    @IBAction func conVertButtonPressed(sender: AnyObject) {
        
        
        
        
        
        
        
        //convert to eur
        let dollarAmount =  Double(dollarAmountTextfield.text!)
        
        
        
        
        
        
        let eur = dollarAmount! * 0.90
        EurResultLabel.text = String (eur)
        
        
        
        //convert to peso
        
        let peso = dollarAmount! * 18.39
        MexicoResltsLabel.text = String (peso)
        
        //convert to China
        
        let yuan = dollarAmount! * 6.66
        ChinaResultsLabel.text = String (yuan)
        
        //convert to Canada
        
        
        let can = dollarAmount! * 1.32
        CanadaResultLabel.text = String (can)
        
        //convert to India
        
        let india = dollarAmount! * 66.87
        indiaResultLabel.text = String(india)
        
        //convert to Crotia
        
        let croatia = dollarAmount! * 6.67
        crotiaResultLabel.text = String(croatia)
        
        //convert to Austrailia
        
        let austrailia = dollarAmount! * 1.32
        austrailiaResultLabel.text = String(austrailia)
        
        //convert to bangledesh
        
        let bangledesh = dollarAmount! * 78.71
        bagledeshResultLabel.text = String(bangledesh)
        
    //    convert to Belize
      
             let belize = dollarAmount! * 2.00
             belizeResultLabel.text  = String(belize)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        button.setTitle("Return", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.frame = CGRectMake(0, 163, 106, 53)
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: "Done:", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




func textFieldDidBeginEditing(textField: UITextField) {
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    
}

func keyboardWillShow(note : NSNotification) -> Void{
    
    dispatch_async(dispatch_get_main_queue()) { () -> Void in
        
        self.button.hidden = false
        let keyBoardWindow = UIApplication.sharedApplication().windows.last
        self.button.frame = CGRectMake(0, (keyBoardWindow?.frame.size.height)!-53, 106, 53)
        keyBoardWindow?.addSubview(self.button)
        keyBoardWindow?.bringSubviewToFront(self.button)
        
        UIView.animateWithDuration(((note.userInfo! as NSDictionary).objectForKey(UIKeyboardAnimationCurveUserInfoKey)?.doubleValue)!, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            
            self.view.frame = CGRectOffset(self.view.frame, 0, 0)
            }, completion: { (complete) -> Void in
                print("Complete")
        })
    }
    
}

func Done(sender : UIButton){
    
    dispatch_async(dispatch_get_main_queue()) { () -> Void in
        
        self.dollarAmountTextfield.resignFirstResponder()
        
        }
    }
}
