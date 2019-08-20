//
//  SignUpViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/8/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController, UITextFieldDelegate {
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
    @IBOutlet var scrollView: UIScrollView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupKeyboardNotifications()



    }

    /// Sets up properties for the text fields
    func setupTextFields() {
        // Set tags for each text field
        firstNameTextField.tag   = 0
        lastNameTextField.tag    = 1
        emailTextField.tag       = 2
        phoneNumberTextField.tag = 3
        passwordTextField.tag    = 4
        schoolTextField.tag      = 5
        majorTextField.tag       = 6

        // Set delegate for each text field
        firstNameTextField.delegate   = self
        lastNameTextField.delegate    = self
        emailTextField.delegate       = self
        phoneNumberTextField.delegate = self
        passwordTextField.delegate    = self
        schoolTextField.delegate      = self
        majorTextField.delegate       = self

        // Set up miscellaneous settings
        passwordTextField.isSecureTextEntry = true
    }

    /// Sets up notifications for hiding and showing keyboard.
    /// Used to move text fields so as to not be hidden by keyboard.
    func setupKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter
            .addObserver(self,
                         selector: #selector(adjustForKeyboard),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
        notificationCenter
            .addObserver(self,
                         selector: #selector(adjustForKeyboard),
                         name: UIResponder.keyboardWillChangeFrameNotification,
                         object: nil)
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

        // TODO: Create new user
    }

    @IBAction func cancelButtonTouchUp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.resignFirstResponder()
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset =
                UIEdgeInsets(top: 0,
                             left: 0,
                             bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom,
                             right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    // MARK: - UITextFieldDelegate

    /// When text field should return, move cursor to next text field.
    ///
    /// - Parameter textField: the text field that should return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview!.viewWithTag(nextTag)
        if (nextResponder != nil) {
            // Found next responder, so set it
            nextResponder?.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        return false
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
