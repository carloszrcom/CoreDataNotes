//
//  HomeViewController.swift
//  CoreDataNotas
//
//  Created by Bluumi on 3/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewDidAppear(_ animated: Bool) {
        let addViewController = AddViewController(nibName: "AddViewController", bundle: nil)
        present(addViewController, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
