//
//  BPM_MO+CoreDataProperties.swift
//  BPM
//
//  Created by Bruna Baudel on 12/23/20.
//
//

import Foundation
import CoreData


extension BPM_MO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BPM_MO> {
        return NSFetchRequest<BPM_MO>(entityName: "BPM_MO")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var taps: Int32
    @NSManaged public var tempo: Float
    @NSManaged public var time: Float
    @NSManaged public var times: NSObject?
    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?

}
