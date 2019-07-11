//
//  DrawerMenuEntry.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

/// An entry in a section of the drawer menu table view.
/// Each entry has a name and icon and handles behavior when selected.
/// DrawerMenuEntries should not be initiated directly, instead classes that
/// inhert from DrawerMenuEntry should be instantiated.
/// Inheriting classes must implement DrawerMenuEntry#selected()
class DrawerMenuEntry {

    var parent:DrawerMenuViewController   // The view controller to segue with
    var name:String                     // The name of the entry
    var icon:String                     // The icon for the entry
    var subtitle:String?                // The subtitle for the entry

    /// Initializes this DrawerMenuEntry with its attributes
    ///
    /// - Parameter parent:     the DrawerMenuViewController
    /// - Parameter name:       the name of the entry
    /// - Parameter subtitle:   the subtitle for the entry (default "").
    init(parent:DrawerMenuViewController,
         name:String,
         icon:FontAwesome,
         subtitle:String? = "") {
        self.parent = parent
        self.name = name
        self.icon = String.fontAwesomeIcon(name: icon)
        self.subtitle = subtitle
    }

    /// Handles this entry being selected.
    /// Must be implemented by inheriting classes.
    func selected() {
        fatalError("Not implemented by inheriting class")
    }
}
