//
//  addCheckInViewController.swift
//  Check-in
//
//  Created by iDreams on 2015/8/1.
//  Copyright (c) 2015年 HunagMay. All rights reserved.
//

import UIKit

class addCheckInViewController: UIViewController {

    @IBOutlet weak var workStartTime: UITextField!
    @IBOutlet weak var workEndTime: UITextField!
    @IBOutlet weak var workDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue: 100)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 100)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        animateViewMoving(true, moveValue: 100)
        textView.text = ""
    }
    func textViewDidEndEditing(textView: UITextView) {
        animateViewMoving(false, moveValue: 100)
    }
    
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        var movementDuration: NSTimeInterval = 0.3
        var movement: CGFloat = (up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func addButtomPressed(sender: UIBarButtonItem) {
        if (workStartTime.text == "" || workEndTime.text == "") {
            let alertController = UIAlertController(title: "Hey!", message: "You must put in work time!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        //ListMgr.addItem(startTime: workStartTime.text, endTime: workEndTime.text, desc: workDesc.text)
        workStartTime.text = ""
        workEndTime.text = ""
        workDesc.text = ""
        self.view.endEditing(true)
        self.navigationController?.popToRootViewControllerAnimated(true)
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
