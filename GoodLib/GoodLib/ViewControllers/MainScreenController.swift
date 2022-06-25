//
//  MainScreenController.swift
//  GoodLib
//
//  Created by Vladislav Smetanin on 23.06.2022.
//

import UIKit

class MainScreenController: UIViewController {
    
    @IBOutlet weak var libraryStackView: UIStackView!
    @IBOutlet weak var wishlistStackView: UIStackView!
    @IBOutlet weak var readlistStackView: UIStackView!
    @IBOutlet weak var magazineStackView: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureNavigationBar()
        setStackViews()
    }
}

extension MainScreenController {
    
    private func setStackViews() {
        let stackViews: [UIStackView] = [libraryStackView, wishlistStackView, readlistStackView,magazineStackView]
        for stackView in stackViews {
            stackView.layer.cornerRadius = 12
            stackView.layer.shadowOffset = CGSize(width: 0, height: 5)
            stackView.layer.shadowRadius = 5
            stackView.layer.shadowOpacity = 0.2
        }
        libraryStackView.isUserInteractionEnabled = true
        libraryStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(libraryStackViewTapped)))
    }
    
    private func configureNavigationBar(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "GoodLibPastelYellow")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "GoodLibBrown") ?? UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "GoodLibBrown") ?? UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func libraryStackViewTapped() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let libraryVC = storyboard.instantiateViewController(withIdentifier: "LibraryController") as? LibraryController else { return }
        navigationController?.pushViewController(libraryVC, animated: true)
    }
}
