//
//  HomeViewController.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        // present view
        let addViewController = AddViewController(nibName: "AddViewController", bundle: nil)
        present(addViewController, animated: true)
    }
}
