//
//  UsersTVC.swift
//  ChatApp
//
//  Created by Jorge Gomez on 2017-11-14.
//  Copyright © 2017 Jorge Gomez. All rights reserved.
//

import UIKit

class UsersTVC: UITableViewController {
  
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let userView = UINib(nibName: userNib, bundle: nil)
        tableView.register(userView, forCellReuseIdentifier: cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserCell
      let currentUser = SampleData.shared.senders[indexPath.row]
      cell.userNameLabel.text = "\(currentUser.displayName) (Me)"
      return cell
      
    }
  


}
