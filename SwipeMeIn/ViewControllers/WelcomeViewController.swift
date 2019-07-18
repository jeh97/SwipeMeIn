//
//  ViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/8/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - Properties
    // MARK: - Outlets
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var subtitleTextView: UITextView!
    @IBOutlet var infoImageView: UIImageView!
    @IBOutlet var infoTitleTextView: UITextView!
    @IBOutlet var infoSubtitleTextView: UITextView!
    @IBOutlet var InfoPageControl: UIPageControl!
    @IBOutlet var copyrightTextView: UITextView!
    
    @IBOutlet var getStartedButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Users.getUserInfo()
    }

    // MARK: - Actions


}

