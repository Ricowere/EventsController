
import Foundation

typealias EventIdentifier = String


protocol Event: NotificationAdapter {
    static var identifier: EventIdentifier { get }
}

protocol NotificationAdapter {
    init(notification: Notification)
    
    var notification: Notification { get }
    
    var params: [AnyHashable: Any]? { get }
}

extension Event {
    static var identifier: EventIdentifier {
        return String(describing: Self.self)
    }
    
    var params: [AnyHashable: Any]? {
        return nil
    }
    
    var notification: Notification {
        return Notification(name: Notification.Name(rawValue: Self.identifier),
                              object: nil,
                              userInfo: params)
    }
}
