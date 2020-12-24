//
//  ListCollectionViewCell.swift
//  BPM
//
//  Created by Bruna Baudel on 12/23/20.
//

import UIKit

class ListCollectionViewCell: BaseCollectionCell {
    
    static let cellReuseIdentifier = "ListCollectionViewCell"
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let tapsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let tempoLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let timeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let timestampLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    func fill(item: BPM_MO) {
        self.titleLbl.text = item.title
        self.tapsLbl.text = "\(item.taps)"
        self.tempoLbl.text = "\(item.tempo)"
        self.timeLbl.text = "\(item.time)"
        
        if let timestamp = item.timestamp {
            self.timestampLbl.text = "\(timestamp.description)"
        }
    }

    override func layoutViews() {
        contentView.layer.cornerRadius = 3.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.masksToBounds = true
        super.layoutViews()
    }
    
    override func addSubviews() {
        vStack.addArrangedSubview(titleLbl)
        vStack.addArrangedSubview(tapsLbl)
        vStack.addArrangedSubview(tempoLbl)
        vStack.addArrangedSubview(timeLbl)
        vStack.addArrangedSubview(timestampLbl)
        
        contentView.addSubview(vStack)
        super.addSubviews()
    }
    
    override func setupAutoLayout() {
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vStack.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
            vStack.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95),
        ])
        super.setupAutoLayout()
    }
}
