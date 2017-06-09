//
//  ViewController.swift
//  CLCGroup
//
//  Created by i_chiouhweyshen on 2017/6/8.
//  Copyright © 2017年 i_chiouhweyshen. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var phoneNum: UITextField!

    @IBOutlet weak var accountPwd: UITextField!
    
    
    @IBAction func signBtn(_ sender: Any) {
        let vc  = storyboard?.instantiateViewController(withIdentifier: "SignViewController") as! SignViewController
          self.navigationController?.pushViewController(vc, animated: true)
       
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

