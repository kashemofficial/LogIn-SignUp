//
//  SignupViewController.swift
//  LogIn&SignUp
//
//  Created by Abul Kashem on 13/12/22.
//

import UIKit

class SignupViewController: UITableViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageProfile.layer.cornerRadius = imageProfile.frame.width/2
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageProfile.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        // print("Image Tapped!")
        openGallery()
    }
    
    
    @IBAction func buttonSignupAction(_ sender: UIButton) {
        
     //   let imageSystem = UIImage(systemName: "person.crop.circle.badge.plus")
        
//        if imageProfile.image?.pngData() == imageSystem?.pngData(){
//            if let email = textFieldEmail.text, let password = textFieldPassword.text, let username = textFieldUsername.text, let confirmPassword = textFieldConfirmPassword.text {
                
//                if username == ""{
//                    print("Please enter username")
//                }
//                else if !email.validateEmailId(){
//                    openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in}])
//
//                    print("email is not valid")
//                }else if !password.validatePassword(){
//                    print("password is not valid")
//                }else{
//                    if confirmPassword == ""{
//                        print("Please confirm password")
//                    }else{
//                        if password == confirmPassword{
//
//                        }else{
//                            print("Password dose not match")
//                        }
//                    }
//                }
//
//            }else{
//                print("Please check your details")
//            }
//
//        }else{
//            print("Please select profile picture")
//            openAlert(title: "Alert", message: "Please select profile picture", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            
    //    }
        
        let imageSystem = UIImage(systemName: "person.crop.circle.badge.plus")
        
        if imageProfile.image?.pngData() != imageSystem?.pngData(){
            // profile image selected
            if let email = textFieldEmail.text, let password = textFieldPassword.text, let username = textFieldUsername.text, let confirmPassword = textFieldConfirmPassword.text{
                if username == ""{
                    print("Please enter username")
                }else if !email.validateEmailId(){
                    openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                    print("email is not valid")
                }else if !password.validatePassword(){
                    print("Password is not valid")
                } else{
                    if confirmPassword == ""{
                        print("Please confirm password")
                    }else{
                        if password == confirmPassword{
                            // navigation code
                            print("Navigation code Yeah!")
                        }else{
                            print("password does not match")
                        }
                    }
                }
            }else{
                print("Please check your details")
            }
        }else{
            print("Please select profile picture")
            openAlert(title: "Alert", message: "Please select profile picture", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
        }
    
    }
    
    @IBAction func buttonLoginAction(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
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

extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let images = info[.originalImage] as? UIImage{
            imageProfile.image = images
        }
        dismiss(animated: true)
    }
    
    
}
