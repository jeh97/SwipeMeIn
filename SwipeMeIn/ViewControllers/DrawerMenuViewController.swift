//
//  DrawerMenuViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

protocol DrawerMenuDelegate {
    func homeSelected()
    func myProfileSelected()
    func walletSelected()
    func settingsSelected()
    func supportSelected()
    func aboutSelected()
}

class DrawerMenuViewController: UIViewController {
    // MARK: - Properties
    var delegate:DrawerMenuDelegate?

    // MARK: - Outlets
    @IBOutlet var profilePicImageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var dollarsMadeLabel: UILabel!
    @IBOutlet var mealsDonatedLabel: UILabel!
    @IBOutlet var homeView: UIView!
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
        setupGestureRecognizers()
    }

    func setupUserInfo() {
        profilePicImageView.image = DEFAULT_NOT_LOADED
    }

    /// Add gesture recognizers to the various views in the menu.
    func setupGestureRecognizers() {
        let homeTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.homeTouchUp(_:)))
        homeView.addGestureRecognizer(homeTapGesture)

        let myProfileTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.myProfileTouchUp(_:)))
        myProfileView.addGestureRecognizer(myProfileTapGesture)

        let walletTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.walletTouchUp(_:)))
        walletView.addGestureRecognizer(walletTapGesture)

        let settingsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.settingsTouchUp(_:)))
        settingsView.addGestureRecognizer(settingsTapGesture)

        let supportTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.supportTouchUp(_:)))
        supportView.addGestureRecognizer(supportTapGesture)

        let aboutTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.aboutTouchUp(_:)))
        aboutView.addGestureRecognizer(aboutTapGesture)

    }

    // MARK: - Actions
    /// When 'Home' is selected from menu, segue to the Home View Controller
    @objc func homeTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            // TODO: Segue to home
            self.dismiss(animated: true) {
                self.delegate?.homeSelected()
            }
        }
    }

    /// When 'My Profile' is selected from menu, segue to the My Profile View Controller
    @objc func myProfileTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            self.dismiss(animated: true) {
                self.delegate?.myProfileSelected()
            }
        }
    }

    /// When 'Wallet' is selected from menu, segue to the Wallet View Controller
    @objc func walletTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            self.dismiss(animated: true) {
                self.delegate?.walletSelected()
            }
        }
    }

    /// When 'Settings' is selected from menu, segue to the Settings View Controller
    @objc func settingsTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            self.dismiss(animated: true) {
                self.delegate?.settingsSelected()
            }
        }
    }

    /// When 'Support' is selected from menu, segue to the Support View Controller
    @objc func supportTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            self.dismiss(animated: true) {
                self.delegate?.supportSelected()
            }
        }
    }

    /// When 'About' is selected from menu, segue to the About View Controller
    @objc func aboutTouchUp(_ gestureRecognizer : UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }

        // Segue to home viewcontroller when tapped
        if gestureRecognizer.state == .ended {
            self.dismiss(animated: true) {
                self.delegate?.aboutSelected()
            }
        }
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
