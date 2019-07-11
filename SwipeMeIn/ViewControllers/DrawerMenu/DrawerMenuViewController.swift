//
//  DrawerMenuViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class DrawerMenuViewController: UIViewController, UITableViewDelegate {
    // MARK: - Properties
    var tableViewDataSource: DrawerMenuTableViewDataSource!
    var tableViewDelegate: DrawerMenuTableViewDelegate!

    // MARK: - Outlets
    @IBOutlet var tableView: UITableView!


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source
        self.tableViewDataSource = DrawerMenuTableViewDataSource(for: self)
        tableView.dataSource = self.tableViewDataSource


        // Set the delegate
        self.tableViewDelegate = DrawerMenuTableViewDelegate(for: self)
        tableView.delegate = self.tableViewDelegate
    }

    /// Sets up views when the view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*tableView.frame = CGRect(x: tableView.frame.origin.x,
         y: tableView.frame.origin.y,
         width: tableView.frame.size.width,
         height: tableView.contentSize.height)*/
        tableView.reloadData()
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
