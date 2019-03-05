//
//  TileView.swift
//  tiles
//
//  Created by Edno Fedulo on 05/03/19.
//  Copyright © 2019 Edno Fedulo. All rights reserved.
//

import UIKit

class TileView: UIView {
    private var backgroundImageView = UIImageView()
    private var titleLabel = UILabel()
    private var titleOverlay = UIView()
    
    private var backgroundImageviewHeightConstraint : NSLayoutConstraint!
    private var backgroundImageviewWidthConstraint : NSLayoutConstraint!
    private var backgroundImageviewLeadingConstraint: NSLayoutConstraint!
    
    var backgroundImage = UIImage() {
        didSet {
            backgroundImageView.image = backgroundImage
            backgroundImageviewWidthConstraint.constant = backgroundImage.size.width
            backgroundImageviewHeightConstraint.constant = backgroundImage.size.height
            layoutIfNeeded()
        }
    }
    var title = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    var titleSize:CGFloat = 12.0 {
        didSet {
            self.titleLabel.font = self.titleLabel.font.withSize(titleSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
        configureSubviews()
    }
    
    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(titleOverlay)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageviewLeadingConstraint = backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        backgroundImageviewLeadingConstraint.isActive = true
        
        backgroundImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        backgroundImageviewHeightConstraint = backgroundImageView.heightAnchor.constraint(equalToConstant: 0)
        backgroundImageviewHeightConstraint.isActive = true
        
        backgroundImageviewWidthConstraint = backgroundImageView.widthAnchor.constraint(equalToConstant: 0)
        backgroundImageviewWidthConstraint.isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        titleOverlay.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleOverlay.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleOverlay.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleOverlay.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5).isActive = true
        
    }
    
    private func configureSubviews() {
        self.backgroundColor = UIColor.blue
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = titleLabel.font.withSize(12)
        
        backgroundImageView.contentMode = .center
        backgroundImageView.backgroundColor = UIColor.blue
        
        titleOverlay.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateBackground(withDuration duration: TimeInterval) {
        
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse], animations: {
            
            self.backgroundImageviewLeadingConstraint.constant = self.frame.width * -1
            self.layoutIfNeeded()
            
        }, completion: nil)
    }

}
