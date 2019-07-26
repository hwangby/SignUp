//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 황병윤 on 2019. 4. 30..
//  Copyright © 2019년 HBY. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var newIdField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var checkField: UITextField!
    
    @IBOutlet weak var NextButton: UIButton!
    

    @IBAction func touchUpNextButton(_ sender: UIButton) {
        UserInformation.shared.newId = newIdField.text
    }
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        let password: String = self.passwordField.text!
        let checkPassword: String = self.checkField.text!
        
        if password != checkPassword {
            NextButton.isEnabled = false
        } else if password == checkPassword && newIdField.text != "" {
            NextButton.isEnabled = true
        }
    }
    
    // MARK: - ImagePikcer
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
     
        return picker
    }()
    
    
    @IBOutlet weak var ButtonView: UIButton!
    
    @IBAction func touchUpSelectImageButton(_sender: UIImageView) {
        self.present(self.imagePicker, animated:  true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // MARK: Original Image
//        if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            self.ButtonView.setImage(originalImage, for: UIControlState.normal)
//
//        }
        // MARK: Edited Image
        if let cropImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.ButtonView.setImage(cropImage, for: UIControlState.normal)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Modal
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        self.newIdField.addTarget(self, action: #selector(self.passwordEditingChanged(_:)), for: UIControlEvents.editingChanged)
        self.passwordField.addTarget(self, action: #selector(self.passwordEditingChanged(_:)), for: UIControlEvents.editingChanged)
        self.checkField.addTarget(self, action: #selector(self.passwordEditingChanged(_:)), for: UIControlEvents.editingChanged)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
