//
//  Users.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/17/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import Foundation
import AWSDynamoDB

/// Default image for users with no available profile picture
let DEFAULT_NOT_LOADED = UIImage.fontAwesomeIcon(
    name: .userCircle,
    style: .solid,
    textColor: .gray,
    size: PORTRAIT_SIZE)
let PORTRAIT_SIZE = CGSize(width: 100, height: 100)

class Users: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    @objc var email:String?
    @objc var firstName:String?
    @objc var lastName:String?
    @objc var major:String?
    @objc var schoolName:String?

    class func dynamoDBTableName() -> String {
        return "SwipeMeIn_Users"
    }

    class func hashKeyAttribute() -> String {
        return "email"
    }
    static func getUserInfo() {
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDBObjectMapper.load(Users.self, hashKey: "jacob.hausmann@utexas.edu", rangeKey: nil).continueWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request has failed. Error: \(error)")
            } else if let resultUser = task.result as! Users? {
                print(resultUser.firstName)
            }
            return nil
        })
    }
}
