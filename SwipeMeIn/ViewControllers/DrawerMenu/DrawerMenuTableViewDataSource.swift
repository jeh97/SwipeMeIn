//
//  DrawerMenuTableViewDataSource.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

let DRAWER_MENU_CELL_IDENTIFIER = "drawerMenuCell"

/// The data source for the drawer menu table view
class DrawerMenuTableViewDataSource: NSObject, UITableViewDataSource {

    var parent:DrawerMenuViewController
    var sections:[DrawerMenuSection] = []

    /// Initializes this data source for the given DrawerMenuViewController.
    /// Creates the sections and entries for the table
    ///
    /// - Parameter for:    the DrawerMenuViewController
    init(for parent:DrawerMenuViewController) {
        self.parent = parent
        super.init()
        self.initializeSections(with: parent)
    }

    /// Selects the entry at the given index path
    ///
    /// - Parameter at:     the selected IndexPath
    func selected(at indexPath:IndexPath) {
        self.sections[indexPath.section].entries[indexPath.row].selected()
    }

    /// Number of sections is the number of entries in data
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    /// Number of rows in a section si the number of entries in its Array
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].entries.count
    }

    /// Sets the views for the cell at the given index
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: DRAWER_MENU_CELL_IDENTIFIER) as! DrawerMenuCell

        let section = self.sections[indexPath.section]
        let entry = section.entries[indexPath.row]

        cell.iconLabel.text = entry.icon
        cell.titleLabel.text = entry.name
        cell.subtitleLabel.text = entry.subtitle

        return cell
    }

    /// Gets the title for the given section
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].name
    }

    /// Initializes the sections for the table
    ///
    /// - Parameter with:   the DrawerMenuViewController
    private func initializeSections(with parent:DrawerMenuViewController) {
        self.sections = [
            DrawerMenuSection(name: "Swipes", entries: [
                DrawerMenuSegueEntry(
                    parent: parent,
                    name: "Buy and Sell",
                    icon: .cashRegister,
                    segueID: "BuySellDrawerMenuSegue"),
                DrawerMenuSegueEntry(
                    parent: parent,
                    name: "Statistics",
                    icon: .chartBar,
                    segueID: "StatisticsDrawerMenuSegue")
                ]),
            DrawerMenuSection(name: "Profile", entries: [
                DrawerMenuSegueEntry(
                    parent: parent,
                    name: "Wallet",
                    icon: .moneyBillWave,
                    segueID: "WalletDrawerMenuSegue"),
                DrawerMenuSegueEntry(
                    parent: parent,
                    name: "Profile",
                    icon: .userCircle,
                    segueID: "ProfileDrawerMenuSegue")
                ]),
            DrawerMenuSection(name: "Utilities", entries: [
                DrawerMenuSegueEntry(
                    parent: parent,
                    name: "Settings",
                    icon: .cog,
                    segueID: "SettingsDrawerMenuSegue")
                ]),
            DrawerMenuSection(name: "", entries: [
                DrawerMenuLogoutEntry(
                    parent: parent,
                    name: "Logout",
                    icon: .signOutAlt)
                ])
        ]
    }
}
