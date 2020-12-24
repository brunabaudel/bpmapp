//
//  BaseCollectionViewCell.swift
//  BPM
//
//  Created by Bruna Baudel on 12/23/20.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupAutoLayout()
        layoutViews()
        actions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //TODO: replace fatalError with error handler
        fatalError("init(coder:) has not been implemented")
    }
    
    func actions() {
    }
    
    func addSubviews() {
    }
    
    func setupAutoLayout() {
    }
    
    func layoutViews() {
    }
}
