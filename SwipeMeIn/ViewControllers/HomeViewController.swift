//
//  HomeViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/10/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit
import SideMenu

let LEFT_MENU_NAVIGATION_CONTROLLER_ID = "LeftMenuNavigationController"

class HomeViewController: UIViewController {
    // MARK: - Properties
    // MARK: - Outlets
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var restaurantView: UIView!
    @IBOutlet var restaurantLabel: UIView!
    @IBOutlet var statsSegmentedControl: UISegmentedControl!
    @IBOutlet var statsView: UIView!
    @IBOutlet var dontationBalanceValueLabel: UILabel!
    @IBOutlet var mealsDonatedValueLabel: UILabel!
    @IBOutlet var donationBalanceTitleLabel: UILabel!
    @IBOutlet var mealsDonatedTitleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var quantityStepper: UIStepper!
    @IBOutlet var buySwipeButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViews()
        setUpSideMenus()


    }

    func setUpSideMenus() {
        // Define the menus
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: LEFT_MENU_NAVIGATION_CONTROLLER_ID) as? UISideMenuNavigationController

        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

        SideMenuManager.default.menuAnimationBackgroundColor = .black
        SideMenuManager.default.menuFadeStatusBar = false
    }

    func setUpViews() {
        restaurantView.clipsToBounds = true
        restaurantView.layer.cornerRadius = 8.0

        statsView.clipsToBounds = true
        statsView.layer.cornerRadius = 8.0

        buySwipeButton.clipsToBounds = true
        buySwipeButton.layer.cornerRadius = 8.0
    }

    // MARK: - Actions
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
