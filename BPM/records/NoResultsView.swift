//
//  NoResultsView.swift
//  BPM
//
//  Created by Bruna Baudel on 12/23/20.
//

import UIKit

class NoResultsView: BaseView {
    let noResultLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "No Results"
        return label
    }()
    
    override func setupViews() {
        self.backgroundColor = .black
        super.setupViews()
    }
    
    override func addSubviews() {
        addSubview(noResultLbl)
        super.addSubviews()
    }
    
    override func setupAutoLayout() {
        NSLayoutConstraint.activate([
            noResultLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            noResultLbl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            noResultLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultLbl.widthAnchor.constraint(equalTo: widthAnchor),
        ])
        super.setupAutoLayout()
    }
}
