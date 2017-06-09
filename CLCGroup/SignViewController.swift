//
//  SignViewController.swift
//  CLCGroup
//
//  Created by i_chiouhweyshen on 2017/6/8.
//  Copyright © 2017年 i_chiouhweyshen. All rights reserved.
//

import UIKit
import Firebase





class SignViewController: UIViewController {
    
 
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    @IBOutlet weak var userPwdTextFiled: UITextField!
    
   
    @IBOutlet weak var userEmailTextField: UITextField!
    
    
    
    
    @IBAction func checkBtn(_ sender: Any) {
        Auth.auth().createUser(withEmail: userEmailTextField.text!, password: userPwdTextFiled.text!) { (user, error) in
            print(user)
            if error == nil{
                
                  self.ref.child(self.userEmailTextField.text!).setValue(self.userProfile)
                
            }else{
              print("錯誤產生")
            
            
            }
        
        
        
        }
    }
   
    var userProfile:NSMutableDictionary = [:]
    
    
    var ref: DatabaseReference!
   
    override func viewDidLoad() {
        super.viewDidLoad()
         configureDatabase()
        
        
        userProfile =
            ["姓名": self.userNameTextField.text!,
             "電話": self.userPhoneTextField.text!,
             "密碼": self.userPwdTextFiled.text!,
             "email": self.userEmailTextField.text!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureDatabase() {
        //Gets a FIRDatabaseReference for the root of your Firebase Database.
        ref = Database.database().reference()
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
