
import CoreData

@objc(Note)
class Note: NSManagedObject
{ //add the var id,title,description and date
	@NSManaged var id: NSNumber!
	@NSManaged var title: String!
	@NSManaged var desc: String!
	@NSManaged var deletedDate: Date?

}
