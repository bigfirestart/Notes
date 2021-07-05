extension NotesListViewController: INoteUpdateDelegate {
    func update(note: Note, name: String?, desc: String?) {
        cdNotesService.updateNote(note: note, name: name, desc: desc)
        refreshFullTable()
    }
}

