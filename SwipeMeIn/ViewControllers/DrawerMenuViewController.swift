//
//  DrawerMenuViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    // MARK: - Properties

    // MARK: - Outlets
    @IBOutlet var profilePicImageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var dollarsMadeLabel: UILabel!
    @IBOutlet var mealsDonatedLabel: UILabel!
    @IBOutlet var myProfileView: UIView!
    @IBOutlet var walletView: UIView!
    @IBOutlet var settingsView: UIView!
    @IBOutlet var supportView: UIView!
    @IBOutlet var aboutView: UIView!
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /// Sets up views when the view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupUserInfo()
    }

    func setupUserInfo() {
        profilePicImageView.image = DEFAULT_NOT_LOADED
    }

    // MARK: - Actions

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
