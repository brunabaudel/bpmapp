//
//  CDBPMManager.swift
//  BPM
//
//  Created by Bruna Baudel on 12/22/20.
//

import CoreData

class CDBPMManager {
    fileprivate static let BPMName = "BPM"
    private let helper = CoreDataHelper()
    
    public lazy var fetchedResultController: NSFetchedResultsController<BPM_MO> = {
        let fetchRequest = BPM_MO.fetchRequest() as NSFetchRequest<BPM_MO>
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataHelper.persistentContainer.viewContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        return frc
    }()
    
    public func performFetchObjects() {
        do {
            try fetchedResultController.performFetch()
        } catch let nserror as NSError {
            //TODO: replace fatalError with error handler
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public func numberOfObjects() -> Int {
        return fetchedResultController.fetchedObjects?.count ?? 0
    }
    
    public func object(at index: Int) -> BPM_MO {
        return fetchedResultController.object(at: IndexPath(item: index, section: 0))
    }
    
    public func add(_ bpm: BPM) {
        let bpmMO = helper.add(BPM_MO.self)
        bpmMO.uuid = UUID.init()
        bpmMO.timestamp = Date()
        bpmMO.title = bpm.title
        bpmMO.taps = Int32(bpm.taps)
        bpmMO.tempo = bpm.tempo
        bpmMO.time = bpm.time
//        bpmMO.times = bpm.times as NSObject //TODO convert from Transformable to Binary Data
        helper.saveContext()
    }
    
//    public func update(_ item: ItemMO, with text: String) {
//        let index = category().items.index(of: item)
//        item.text = text
//        category().replaceItems(at: index, with: item)
//        helper.saveContext()
//    }
    
//    public func update(_ item: ItemMO, check: Bool) {
//        let index = category().items.index(of: item)
//        item.isCheck = check
//        category().replaceItems(at: index, with: item)
//        helper.saveContext()
//    }
    
//    public func update(_ item: ItemMO, index: Int) {
//        category().removeFromItems(item)
//        category().insertIntoItems(item, at: index)
//        helper.saveContext()
//    }
}
