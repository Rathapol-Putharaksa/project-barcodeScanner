import CoreData

struct PersistentController {
    static let shared = PersistentController()
    let container: NSPersistentContainer
  
    init() {
      container = NSPersistentContainer(name: "Nutri")
        container.loadPersistentStores{(storeDescription, error) in
          if let error = error as NSError?{
            fatalError("unresolved error: \(error)")
          }
        }
    }
}
