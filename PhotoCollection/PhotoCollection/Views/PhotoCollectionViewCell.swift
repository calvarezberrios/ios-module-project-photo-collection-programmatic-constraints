//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var imageLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    private func setUpSubviews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageLabel = UILabel()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.textAlignment = .center
        addSubview(imageLabel)
        
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: imageView, attribute: .height , relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0),
            
            NSLayoutConstraint.init(item: imageLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: imageLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 4),
            NSLayoutConstraint.init(item: imageLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        self.imageView = imageView
        self.imageLabel = imageLabel
    }
    
    private func updateViews() {
        if let photo = photo {
            imageView.image = UIImage(data: photo.imageData)
            imageLabel.text = photo.title
        }
    }
}
