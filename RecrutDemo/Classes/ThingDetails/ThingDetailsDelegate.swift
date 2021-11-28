import Foundation

protocol ThingDetailsDelegate {
    func thingDetails(viewController: ThingDetailsViewController, didLike thingModel: ThingModel)
    func thingDetails(viewController: ThingDetailsViewController, didDislike thingModel: ThingModel)
    func thingDetails(viewController: ThingDetailsViewController, willDismiss thingModel: ThingModel)
}
