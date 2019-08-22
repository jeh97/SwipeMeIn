//
//  AboutViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 8/20/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    // MARK: - Properties

    // MARK: - Outlets

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func backButtonTouchUp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Methods

}
