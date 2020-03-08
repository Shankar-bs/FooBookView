//
//  ViewController.swift
//  FooBook
//
//  Created by Shankar B S on 09/02/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: ViewControllerViewModel!
    @IBOutlet weak var feedTableView: UITableView!
    let cellReuseID: String = "FooBookTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedTableView.separatorStyle = .none
        //Register custom cell
        feedTableView.register(UINib(nibName: "FooBookTableCell", bundle: nil), forCellReuseIdentifier: cellReuseID)
        //initilise view model and populate data
        viewModel = ViewControllerViewModel()
        viewModel.populateFeedModels()
    }
}

//Tableview data source and delegate methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        guard let fooBookCell = cell as? FooBookTableCell else {
            return UITableViewCell()
        }
        fooBookCell.updateCellWith(feed: viewModel.getFeedAt(index: indexPath.row))
        return fooBookCell
    }
}

