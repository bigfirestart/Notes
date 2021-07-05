//
//  NotesListTableDataSource.swift
//  Notes
//
//  Created by 19330635 on 05.07.2021.
//

import UIKit


extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoItem = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! NotesListTableCell
        cell.configure(name: todoItem.name ?? "No name", description: todoItem.desc ?? "No description")
        return cell
    }
}
