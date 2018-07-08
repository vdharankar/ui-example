//
//  PhotosViewController.swift
//  PhotoSync
//
//  Created by vishal dharnkar on 08/03/18.
//  Copyright © 2018 PhotoSyncApp. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController , CategorySelectionDelegate, UITextFieldDelegate{

    @IBOutlet var catButton : UIButton?
    @IBOutlet var subCatButton : UIButton?
    @IBOutlet var catTextField : UITextField?
    @IBOutlet var subCatTextField : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        catTextField?.delegate = self
        subCatTextField?.delegate = self
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! CategoriesViewController
        
        if segue.identifier == "CatSegue" {
            
            vc.type = 0
        }
        else {
           
            vc.type = 1
        }
        vc.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func categorySelected(name: String,type : Int) {
        if type == 0 {
            self.catButton?.setTitle(name, for: UIControlState.normal)
        }
        else {
            self.subCatButton?.setTitle(name, for: UIControlState.normal)
        }
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
