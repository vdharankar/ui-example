//
//  StartViewController.swift
//  PhotoSync
//
//  Created by vishal dharnkar on 08/03/18.
//  Copyright © 2018 PhotoSyncApp. All rights reserved.
//

import UIKit
import JGProgressHUD

class StartViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var firstLetter : UITextField?
    @IBOutlet var secondLetter : UITextField?
    @IBOutlet var thirdLetter : UITextField?
    @IBOutlet var fourthLetter : UITextField?
    @IBOutlet var fifthLetter : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    func setupView() {
        firstLetter?.delegate = self
        secondLetter?.delegate = self
        thirdLetter?.delegate = self
        fourthLetter?.delegate = self
        fifthLetter?.delegate = self
        
        firstLetter?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        secondLetter?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        thirdLetter?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        fourthLetter?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        fifthLetter?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func textFieldDidChange(textField: UITextField) {
        if textField == firstLetter {
            secondLetter?.becomeFirstResponder()
        }
        else if textField == secondLetter {
            thirdLetter?.becomeFirstResponder()
        }
        else if textField == thirdLetter {
            fourthLetter?.becomeFirstResponder()
        }
        else if textField == fourthLetter {
            fifthLetter?.becomeFirstResponder()
        }
    }
    @IBAction func continueBtnClicked() {
        
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
      
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            hud.dismiss()
            self.performSegue(withIdentifier: "MainSegue", sender: self)
        }
       //
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
