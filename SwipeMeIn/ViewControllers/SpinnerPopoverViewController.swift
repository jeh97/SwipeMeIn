//
//  SpinnerPopoverViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 8/5/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class SpinnerPopoverViewController: UIViewController {
    // MARK: - Properties
    var delegate:UIPickerViewDelegate?
    var dataSource:UIPickerViewDataSource?
    // MARK: - Outlets
    @IBOutlet var pickerView: UIPickerView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
