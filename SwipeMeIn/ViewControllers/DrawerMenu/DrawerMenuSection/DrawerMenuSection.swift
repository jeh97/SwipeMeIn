//
//  DrawerMenuSection.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

/// A section in the drawer menu table view.
/// Each section has a name and an Array of DrawerMenuEntry that are the entries
/// for that section.
class DrawerMenuSection {

    var name:String
    var entries:[DrawerMenuEntry] = []

    /// Initializes this DrawerMenuSection with the given attributes
    ///
    /// - Parameter name:       the name of the section
    /// - Parameter entries:    the DrawerMenuEntries for the section
    init(name:String, entries:[DrawerMenuEntry]) {
        self.name = name
        self.entries = entries
    }
}
