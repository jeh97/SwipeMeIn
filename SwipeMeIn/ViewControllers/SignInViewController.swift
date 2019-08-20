//
//  SignInViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/8/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignInViewController: UIViewController {
    // MARK: - Properties
    // MARK: - Outlets
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    @IBAction func signInButtonTouchUp(_ sender: Any) {
        // TODO: Authenticate user
        let storyboard = UIStoryboard(name: "BuySell", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func cancelButtonTouchUp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Methods
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
