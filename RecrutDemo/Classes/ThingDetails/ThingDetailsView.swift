import Foundation
import UIKit

class ThingDetailsView: UIView {
    
    private let imageView = UIImageView()
    private let buttons = UIStackView()
    let likeButton = UIButton()
    let dislikeButton = UIButton()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        likeButton.setImage(#imageLiteral(resourceName: "likeO96"), for: .normal)
        //addSubview(likeButton)
        
        dislikeButton.setImage(#imageLiteral(resourceName: "dontlikeO96"), for: .normal)
        //addSubview(dislikeButton)
        
        buttons.addArrangedSubview(likeButton)
        buttons.addArrangedSubview(dislikeButton)
        
        buttons.axis = .horizontal
        buttons.alignment = .center
        buttons.distribution = .fillEqually
        buttons.spacing = 10.0
        addSubview(buttons)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        let imageSize: CGFloat = 300.0
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100.0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        
        let buttonSize: CGFloat = 50.0
        
        likeButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        dislikeButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        dislikeButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        buttons.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        buttons.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
        layoutIfNeeded()
    }
    
    func setThing(image: UIImage?) {
        imageView.image = image
    }
}
