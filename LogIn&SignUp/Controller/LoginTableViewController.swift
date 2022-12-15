//
//  LoginTableViewController.swift
//  LogIn&SignUp
//
//  Created by Abul Kashem on 5/12/22.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func buttonLoginAction(_ sender : UIButton){
        ValidationCode()
    }
 
    @IBAction func buttonSignupAction(_ sender : UIButton){
        if let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
        
    }
    
}

extension LoginTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
}

extension LoginTableViewController{
    
    fileprivate func ValidationCode() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email Address Not Found", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay Clicked!")
                }])
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay Clicked!")
                }])
            }else{
                
            }
            
        }
        else{
            openAlert(title: "Alert", message: "Please add Detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay Clicked!")
            }])
        }
    }
    
}

