//
//  PeopleViewController.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        searchBar()
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
}


//MARK: - SwiftUI
import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) -> MainTabBarController {
            return tabbarVC
        }
        
        func updateUIViewController(_ uiViewController: PeopleVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) {
            
        }
    }
}

//MARK: - UISearchBarDelegate
extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
