//
//  ViewController.swift
//  BPM
//
//  Created by Bruna Baudel on 12/21/20.
//

import UIKit

class ViewController: UIViewController {
    var bpmManager: BPMManager = BPMManager()
    
    let main: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        addSubviews()
        setupViews()
    }
}

// MARK: - Setup
extension ViewController {
    func setupViews() {
        main.startBtn.addTarget(self, action: #selector(start), for: .touchUpInside)
        main.resetBtn.addTarget(self, action: #selector(reset), for: .touchUpInside)
        main.resetBtn.setTitle(NSLocalizedString("reset", comment: "Reset the counter."), for: .normal)
        resetFields()
    }
}

// MARK: - Actions
extension ViewController {
    @objc func start() {
        bpmManager.recordTime()
        
        bpmManager.tempo()
        bpmManager.time()
        bpmManager.taps()
        
        fillFields()
    }
    
    @objc func reset() {
        bpmManager.clear()
        bpmManager = BPMManager()
        resetFields()
    }
    
    fileprivate func fillFields() {
        guard let bpm = bpmManager.bpm else {
            return
        }
        main.startBtn.setTitle(String(format: "%.2f", bpm.tempo), for: .normal)
        main.tapsLbl.text = "\(NSLocalizedString("taps", comment: "Count taps.")): \(bpm.taps)"
        main.tempoLbl.text = "\(NSLocalizedString("tempo", comment: "Count tempo.")): \(String(format: "%.2f", bpm.tempo)) bpm"
        main.timeLbl.text = "\(NSLocalizedString("time", comment: "Count time.")): \(String(format: "%.3f", (bpm.time/1000)))s"
    }
    
    fileprivate func resetFields() {
        main.startBtn.setTitle(NSLocalizedString("start", comment: "Start the counter."), for: .normal)
        main.tapsLbl.text = "\(NSLocalizedString("taps", comment: "Count taps.")): 0"
        main.tempoLbl.text = "\(NSLocalizedString("tempo", comment: "Count tempo.")): 0 bpm"
        main.timeLbl.text = "\(NSLocalizedString("time", comment: "Count time.")): 0ms"
    }
}

// MARK: - NavigationController
extension ViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        saveBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    @objc func save() {
        print("save")
    }
}

// MARK: - AutoLayout
extension ViewController {
    func addSubviews() {
        view.addSubview(main)
        setupAutoLayout()
    }
    
    fileprivate func setupAutoLayout() {
        NSLayoutConstraint.activate([
            main.topAnchor.constraint(equalTo: view.topAnchor),
            main.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            main.widthAnchor.constraint(equalTo: view.widthAnchor),
            main.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}
