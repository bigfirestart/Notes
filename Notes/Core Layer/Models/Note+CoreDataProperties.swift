//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by 19330635 on 05.07.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var desc: String?
    @NSManaged public var lastUpdate: Date?
    @NSManaged public var name: String?

}

extension Note : Identifiable {

}
