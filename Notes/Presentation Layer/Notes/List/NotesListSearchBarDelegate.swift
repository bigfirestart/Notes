import UIKit

extension NotesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            data = cdNotesService.getAllNotes()
        }
        else {
            data = cdNotesService.filterNotes(key: searchText)
        }
        reloadTableData()
    }
}

