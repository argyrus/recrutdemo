import Foundation
import UIKit

class ThingsTableViewControler: UITableViewController, Transition {
    
    private struct TableViewConstants {
        
        static let cellIdentifier = "Cell"
        static let rowHeight: CGFloat = 60
        static let estimatedRowHeight: CGFloat = 180
    }
    
    private var viewModel = ThingsTableViewModel()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        tableView.estimatedRowHeight = TableViewConstants.estimatedRowHeight
        tableView.rowHeight = TableViewConstants.rowHeight
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = .singleLine
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasourceCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ThingCell? = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellIdentifier) as? ThingCell
        
        if cell == nil {
            cell = ThingCell()
        }
        viewModel.bindModelWithView(cell: cell!, at: indexPath)
        
        let thingModel = viewModel.thing(for: indexPath)
        cell?.update(withText: thingModel.name)
        cell?.update(withLikeValue: thingModel.like)
        
        if let urlString = thingModel.image {
            viewModel.imageProvider.imageAsync(from: urlString, completion: { (image, imageUrl) in
                cell?.updateThingImage(image)
            })
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let thingModel = viewModel.thing(for: indexPath)
        pushDetailsViewController(thingModel)
    }
    
    private func pushDetailsViewController(_ thingModel: ThingModel) {
        
        let detailsViewController = ThingDetailsViewController()
        detailsViewController.thingModel = thingModel
        detailsViewController.imageProvider = viewModel.imageProvider
        detailsViewController.delegate = self
        pushViewControler(detailsViewController, animated: true)
    }
}

extension ThingsTableViewControler: ThingDetailsDelegate {
    
    func thingDetails(viewController: ThingDetailsViewController, didLike thingModel: ThingModel) {
        
        thingModel.like = true
        thingModel.setLike(value: true)
        popViewController(viewController, animated: true)
    }
    
    func thingDetails(viewController: ThingDetailsViewController, didDislike thingModel: ThingModel) {
        
        thingModel.like = false
        thingModel.setLike(value: false)
        popViewController(viewController, animated: true)
    }
    
    func thingDetails(viewController: ThingDetailsViewController, willDismiss thingModel: ThingModel) {
        popViewController(viewController, animated: true)
    }
}
