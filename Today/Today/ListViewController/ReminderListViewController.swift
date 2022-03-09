//
//  ReminderListViewController.swift
//  Today
//
//  Created by 하늘이 on 2022/03/04.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
//    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
//    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: collectionView 레이아웃
        /// After the view controller loads its view hierarchy into memory,
        /// the system calls viewDidLoad()
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
    
        /// Reusing cell allows your app to perform well even with a vast number of items
        /// itemIdentifier 를 String 에서 Reminder.ID 로 변경
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    /// This function creates a new list configuration variable with the grouped appearance.
    /// compositionalLayout 으로 collectionViewLayout 을 구성
    private func listLayout() -> UICollectionViewCompositionalLayout {
        /// UICollectionLayoutListConfiguration creates a section in a list layout
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
