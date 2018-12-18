//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64

}
