//
//  DrawerMenuSegueEntry.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

/// A entry in a section of the drawer menu table view.
/// Segue entries perform a segue with their identifier when they are selected.
class DrawerMenuSegueEntry: DrawerMenuEntry {

    var segueID:String      // The segue identifier for this entry

    /// Initializes this DrawerMenuEntry with its attributes
    ///
    /// - Parameter parent:     the DrawerMenuViewController
    /// - Parameter option:     the type of the entry
    /// - Parameter name:       the name of the entry
    /// - Parameter segueID:    the ID of the segue.
    /// - Parameter subtitle:   the subtitle for the entry (default "").
    init(parent:DrawerMenuViewController,
         name:String,
         icon:FontAwesome,
         segueID:String,
         subtitle:String? = "") {
        self.segueID = segueID
        super.init(parent: parent,
                   name: name,
                   icon: icon,
                   subtitle: subtitle)
    }

    /// Handles this entry being selected.
    /// Segues to the segue identifier for this entry
    override func selected() {
        self.parent.performSegue(withIdentifier: segueID, sender: self.parent)
    }
}
