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
    var filteredReminders: [Reminder] {
        return reminders.filter { listStyle.shouldInclude(date: $0.dueDate) }.sorted { $0.dueDate < $1.dueDate }
    }
    var listStyle: ReminderListStyle = .today
    let listStyleSegmentedControl = UISegmentedControl(items: [
        ReminderListStyle.today.name, ReminderListStyle.future.name, ReminderListStyle.all.name
    ])
    
    // MARK: - Life Cycle
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
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))
        addButton.accessibilityLabel = NSLocalizedString("Add reminder", comment: "Add button accessibility label")
        navigationItem.rightBarButtonItem = addButton
        
        listStyleSegmentedControl.selectedSegmentIndex = listStyle.rawValue
        navigationItem.titleView = listStyleSegmentedControl
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = filteredReminders[indexPath.item].id
        showDetail(for: id)
        return false
    }
    
    func showDetail(for id: Reminder.ID) {
        let reminder = reminder(for:  id)
        let viewController = ReminderViewController(reminder: reminder) { [weak self] reminder in
            self?.update(reminder, with: reminder.id)
            self?.updateSnapshot(reloading: [reminder.id])
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /// This function creates a new list configuration variable with the grouped appearance.
    /// compositionalLayout 으로 collectionViewLayout 을 구성
    private func listLayout() -> UICollectionViewCompositionalLayout {
        /// UICollectionLayoutListConfiguration creates a section in a list layout
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        // swipe action 추가
        listConfiguration.trailingSwipeActionsConfigurationProvider = makeSwipeActions
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    // swipe 해서 delete
    // 각각의 swipe action 에는 사용자가 왼쪽 또는 오른쪽으로 살짝 밀어 수행할 수 있는 작업을 정의하는
    // UIContextualAction 객체의 집합이 포함되어 있다.
    
    // 목록의 각 항목에 대한 UISwipeActionsConfiguration 을 생성하는 함수를 생성한다.
    private func makeSwipeActions(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
        guard let indexPath = indexPath, let id = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let deleteActionTitle = NSLocalizedString("Delete", comment: "Delete action title")
        let deleteAction = UIContextualAction(style: .destructive, title: deleteActionTitle) { [weak self] _, _, completion in
            self?.deleteReminder(with: id)
            self?.updateSnapshot()
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
