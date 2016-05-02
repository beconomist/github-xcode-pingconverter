//
//  ViewController.swift
//  PingConverter
//
//  Created by Baowen on 2016-05-01.
//  Copyright © 2016 Senseable Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var squareMeterTextField: UITextField!
    @IBOutlet weak var pingTextField: UITextField!
    @IBOutlet weak var tatamiTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.squareMeterTextField.delegate = self
        self.pingTextField.delegate = self
        self.tatamiTextField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.sayGoodbye(_:)), name: UIApplicationWillResignActiveNotification, object: nil)
        
        let blueView = UIView()
        self.view.addSubview(blueView)
        
    }
    

    @IBAction func calculate(sender: UIButton) {
    
        
        if let sm = Double(squareMeterTextField.text!) {
            pingTextField.text = String(0.3025 * sm)
            tatamiTextField.text = String(0.6 * sm)
        }
    
        if let p = Double(pingTextField.text!) {
            squareMeterTextField.text = String(3.31 * p)
            tatamiTextField.text = String(2 * p)
        }
        
        if let t = Double(tatamiTextField.text!) {
            squareMeterTextField.text = String(1.65 * t)
            pingTextField.text = String(0.5 * t)
        }
    }
        
    @IBAction func clearValue(sender: UIButton) {
            squareMeterTextField.text = ""
            pingTextField.text = ""
            tatamiTextField.text = ""
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func sayGoodbye(noti: NSNotification) {
        print("sayGoodBye from \(noti)")
    }
    
}

