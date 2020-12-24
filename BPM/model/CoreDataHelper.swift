//
//  CoreDataHelper.swift
//  BPM
//
//  Created by Bruna Baudel on 12/22/20.
//

import Foundation
import CoreData

final class CoreDataHelper {
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BPM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                //TODO: replace fatalError with error handler
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = CoreDataHelper.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                //TODO: replace fatalError with error handler
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    public func add<T: NSManagedObject>(_ type: T.Type) -> T {
        return T(entity: T.entity(), insertInto: CoreDataHelper.persistentContainer.viewContext)
    }
    
    public func delete(_ object: NSManagedObject) {
        CoreDataHelper.persistentContainer.viewContext.delete(object)
        saveContext()
    }
    
    public func fetch<T: NSManagedObject>(_ request: NSFetchRequest<T>) -> [NSFetchRequestResult] {
        do {
            return try CoreDataHelper.persistentContainer.viewContext.fetch(request)
        } catch let nserror as NSError {
            //TODO: replace fatalError with error handler
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public func execute(_ request: NSPersistentStoreRequest) {
        do {
            try CoreDataHelper.persistentContainer.viewContext.execute(request)
            saveContext()
        } catch let nserror as NSError {
            //TODO: replace fatalError with error handler
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
