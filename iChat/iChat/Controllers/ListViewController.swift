//
//  ListViewController.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

struct MChat: Hashable {
    var id = UUID()
    var userName: String
    var userImage: UIImage
    var lastMessage: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class ListViewController: UIViewController {
    
    let activeChats: [MChat] = [
        MChat(userName: "Pavel", userImage: UIImage(named: "human1")!, lastMessage: "How are you?"),
        MChat(userName: "Bob", userImage: UIImage(named: "human2")!, lastMessage: "How are you?"),
        MChat(userName: "Misha", userImage: UIImage(named: "human3")!, lastMessage: "How are you?"),
        MChat(userName: "Mila", userImage: UIImage(named: "human4")!, lastMessage: "How are you?")
    ]
    
    private enum Section: Int, CaseIterable {
        case activeChats
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar()
        setupCollectionView()
        createdDataSource()
        reloadData()
    }
    
    
    private func searchBar() {
        navigationController?.navigationBar.barTintColor = .specialMainWhite
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
     
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .specialMainWhite
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    
    private func createdDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { collectionView, indexPath, chat in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind") }
            
            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.activeChats])
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(84))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets.init(top: 0,
                                                               leading: 0,
                                                               bottom: 8,
                                                               trailing: 0)
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 16,
                                                            leading: 20,
                                                            bottom: 0,
                                                            trailing: 20)
            
            return section
        }
        return layout
    }
}



//MARK: - UICollectionViewDelegate
extension ListViewController: UICollectionViewDelegate {
    
}

//MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

//MARK: - SwiftUI
import SwiftUI

struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) -> MainTabBarController {
            return tabbarVC
        }
        
        func updateUIViewController(_ uiViewController: ListVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) {
            
        }
    }
}
