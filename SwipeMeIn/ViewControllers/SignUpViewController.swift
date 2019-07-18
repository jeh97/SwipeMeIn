//
//  SignUpViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/8/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController {
    // MARK: - Properties
    // MARK: - Outlets
    @IBOutlet var firstNameTextField: SkyFloatingLabelTextField!
    @IBOutlet var lastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet var schoolTextField: SkyFloatingLabelTextField!
    @IBOutlet var majorTextField: SkyFloatingLabelTextField!
    @IBOutlet var bottomLengthConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    @IBAction func signUpButtonTouchUp(_ sender: Any) {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let phoneNumber = phoneNumberTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let school = schoolTextField.text else { return }
        guard let major = majorTextField.text else { return }
    }

    @IBAction func cancelButtonTouchUp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
