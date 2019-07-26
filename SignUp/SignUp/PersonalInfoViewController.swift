//
//  PersonalInfoViewController.swift
//  SignUp
//
//  Created by 황병윤 on 2019. 5. 2..
//  Copyright © 2019년 HBY. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController, UIGestureRecognizerDelegate {

  
    
    // MARK: - POP button
    @IBAction func popTopPrev() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpJoinButton(_ sender: UIButton) {
        UserInformation.shared.id = UserInformation.shared.newId
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("PersonalInfoViewContoller의 view가 화면에서 사라질 예정")
    }
    
    // MARK: - Date Picker & birth Label
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.dateFormat = "yyyy년 MM월 dd일"
    
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let birthday: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: birthday)
        
        self.birthLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Tap Gesture Recognizer
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
