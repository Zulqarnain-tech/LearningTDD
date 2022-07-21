//
//  ViewController.swift
//  TDDPractice
//
//  Created by Zulqarnain on 15/07/2022.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = dataService
        self.tableView.delegate = dataService
    }


}

