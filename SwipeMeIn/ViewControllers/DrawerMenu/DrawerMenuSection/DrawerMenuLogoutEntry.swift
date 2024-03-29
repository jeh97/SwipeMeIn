//
//  DrawerMenuLogoutEntry.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

/// An entry in a section of the drawer menu table view.
/// Logout entries log the user out when they are selected.
class DrawerMenuLogoutEntry: DrawerMenuEntry {

    /// Handles this entry being selected.
    /// Logs the user out and returns the the user to the login view.
    override func selected() {
        /*UsersDatabase.shared.logoutUser {(error) in
            if error != nil {
                // TODO: Handle error
            } else {
                // Return the user to the login view
                let storyBoard = UIStoryboard(name:"Main", bundle:nil)
                let entryViewController = storyBoard.instantiateViewController(
                    withIdentifier: "entryViewController")
                if let appDel = UIApplication.shared.delegate as? AppDelegate {
                    appDel.window?.rootViewController = entryViewController
                }
                // Clear App state when user logs off
                AppState.clear()
            }
        }*/
    }
}
