//
//  MainView.swift
//  BPM
//
//  Created by Bruna Baudel on 10/18/20.
//

import Foundation
import UIKit

class MainView: UIView {
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    let vStack2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    let startBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .black
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8.0
        button.titleLabel?.font = .systemFont(ofSize: 32)
        return button
    }()
    
    let resetBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.setupViews()
        self.addSubviews()
    }
    
    @objc func doneAction() {
        print("done")
    }
}

// MARK: - Setup

extension MainView {
    func setupViews() {
        self.backgroundColor = .black
    }
    
    func formatTittleButton(str: String, ext: String) {
        let mutableAttributedString = NSMutableAttributedString()
        let str = NSAttributedString(string: str,
                                     attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 48)])
        let ext = NSAttributedString(string: ext,
                                     attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19)])
        mutableAttributedString.append(str)
        mutableAttributedString.append(ext)
        startBtn.setAttributedTitle(mutableAttributedString, for: .normal)
    }
}

// MARK: - AutoLayout
extension MainView {
    
    func addSubviews() {
        vStack2.addArrangedSubview(tapsLbl)
        vStack2.addArrangedSubview(tempoLbl)
        vStack2.addArrangedSubview(timeLbl)
        vStack2.addArrangedSubview(UIView())
        
        vStack.addArrangedSubview(vStack2)
        vStack.addArrangedSubview(startBtn)
        vStack.addArrangedSubview(resetBtn)
        
        addSubview(vStack)
        self.setupAutoLayout()
    }
    
    fileprivate func setupAutoLayout() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                vStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                vStack.topAnchor.constraint(equalTo: topAnchor),
                vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.widthAnchor.constraint(equalTo: widthAnchor),
            
            startBtn.heightAnchor.constraint(equalTo: vStack.heightAnchor, multiplier: 0.4),
        ])
    }
}
