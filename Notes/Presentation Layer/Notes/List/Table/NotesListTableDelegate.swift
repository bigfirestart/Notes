//
//  NotesListTableDelegate.swift
//  Notes
//
//  Created by 19330635 on 05.07.2021.
//

import UIKit

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notesEditVC = NotesEditViewController()
        notesEditVC.note = data[indexPath.row]
        notesEditVC.updateNoteDelegate = self
        navigationController?.pushViewController(notesEditVC, animated: true)
    }
}
