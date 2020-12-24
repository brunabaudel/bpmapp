//
//  BaseView.swift
//  BPM
//
//  Created by Bruna Baudel on 12/23/20.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //TODO: replace fatalError with error handler
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.addSubviews()
        self.setupAutoLayout()
        self.layoutView()
        self.setupViews()
    }
    
    func setupViews() {
    }
    
    func addSubviews() {
    }
    
    func setupAutoLayout() {
    }
    
    func layoutView() {
    }
}
