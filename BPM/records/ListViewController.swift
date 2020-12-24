//
//  ListViewController.swift
//  BPM
//
//  Created by Bruna Baudel on 12/21/20.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    private let cdBPMManager = (UIApplication.shared.delegate as? AppDelegate)?.cdBPMManager
    
    let listCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ListCollectionViewCell.self,
                                forCellWithReuseIdentifier: ListCollectionViewCell.cellReuseIdentifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let noResultsView: NoResultsView = {
        let view = NoResultsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        self.cdBPMManager?.fetchedResultController.delegate = self
        
        self.setupNavigationController()
        self.addSubvies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.cdBPMManager?.performFetchObjects()
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width - 32,
                      height: 150)
        //TODO: check the height
    }
}
    
extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfObjects = self.cdBPMManager?.numberOfObjects() else {
            return 0
        }
        return numberOfObjects
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.cellReuseIdentifier, for: indexPath) as! ListCollectionViewCell
        
        guard let item = self.cdBPMManager?.object(at: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.fill(item: item)
        return cell
    }
}

extension ListViewController {
    func setupNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    //TODO: improve this method
    func addSubvies() {
        guard let count = self.cdBPMManager?.numberOfObjects() else {
            return
        }
        
        if count > 0 {
            self.addCollectionView()
        } else {
            self.addNoResultView()
        }
    }
    
    fileprivate func addNoResultView() {
        view.addSubview(noResultsView)
        self.setupAutoLayoutNoResultView()
    }
    
    fileprivate func addCollectionView() {
        view.addSubview(listCollectionView)
        self.setupAutoLayoutCollectionView()
    }
       
    fileprivate func setupAutoLayoutCollectionView() {
        NSLayoutConstraint.activate([
            listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            listCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    fileprivate func setupAutoLayoutNoResultView() {
        NSLayoutConstraint.activate([
            noResultsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noResultsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noResultsView.widthAnchor.constraint(equalTo: view.widthAnchor),
            noResultsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension ListViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    }
}
