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
             print ("error:\(String(describing: error))")
            //密碼要至少六碼
            
            self.userProfile =
                ["姓名": self.userNameTextField.text!,
                 "電話": self.userPhoneTextField.text!,
                 "密碼": self.userPwdTextFiled.text!,
                 "email": self.userEmailTextField.text!]
            
            
              print(self.userProfile)
            if ((error) != nil) {
                print("錯誤產生")
                
                
            }else{
                for (_, value) in self.userProfile{
                    print(value)
                  let letter = self.eliminateSpecificCharacters(originStr: value as! String)
                    print(letter)

                }
                
                
                
             self.ref.childByAutoId().child(self.userEmailTextField.text!).setValue(self.userProfile)
            
            
            }
        
        
        
        }
    }
   
    var userProfile:NSMutableDictionary = [:]
    
    
    var ref: DatabaseReference!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatabase()
   
        
       
        // Do any additional setup after loading the view.
  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func eliminateSpecificCharacters(originStr:String){
     
        //let result = originStr.trimmingCharacters(in: CharacterSet(charactersIn: "@."))
        let result = originStr.components(separatedBy: CharacterSet(charactersIn: "@.#$[]")).joined()
        print(result)
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
