//
//  DrawerMenuTableViewDelegate.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

/// The delegate for the drawer menu table view
class DrawerMenuTableViewDelegate: NSObject, UITableViewDelegate {

    var parent:DrawerMenuViewController

    /// Initializes this delegate for the given DrawerMenuViewController
    ///
    /// - Parameter for:    the DrawerMenuViewController
    init(for parent:DrawerMenuViewController) {
        self.parent = parent
    }

    /// Gets the view for a section footer
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(
            frame: CGRect(x: 0,
                          y: 0,
                          width: self.parent.view.bounds.size.width,
                          height: 20))
        footerView.backgroundColor = UIColor(red: 94, green: 172, blue: 219, alpha: 1.0)
        footerView.tintColor = UIColor(red: 94, green: 172, blue: 219, alpha: 1.0)
        return footerView
    }

    /// Handles when a cell is selected
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        self.parent.tableViewDataSource.selected(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}
