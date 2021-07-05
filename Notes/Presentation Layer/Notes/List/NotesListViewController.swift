//
//  TodosListViewController.swift
//  TestTodoTask
//
//  Created by 19330635 on 03.07.2021.
//

import UIKit
import CoreData

class NotesListViewController: UIViewController {
    
    let todosTable = UITableView()
    let searchBar = UISearchBar()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let cdNotesService: ICoreDataNoteService
    var data = [Note]()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        cdNotesService = CoreDataNoteService(context: context)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Todo Tasks"
        view.addSubview(todosTable)
        
        refreshFullTable()
        
        // setup table
        todosTable.delegate = self
        todosTable.dataSource = self
        todosTable.rowHeight = 65
        todosTable.register(NotesListTableCell.self, forCellReuseIdentifier: "TodoCell")
        
        searchBar.delegate = self
        
        configureSubs()
        
    }
    
    func refreshFullTable() {
        data = cdNotesService.getAllNotes()
        reloadTableData()
    }
    
    func reloadTableData() {
        DispatchQueue.main.async {
            self.todosTable.reloadData()
        }
    }
    
    @objc private func addBtnTap() {
        let alert = UIAlertController(title: "Add Task",
                                      message: "Enter new Todo",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let name = field.text, !name.isEmpty else {
                return
            }
            self?.cdNotesService.createNote(name: name)
            self?.refreshFullTable()
            self?.searchBar.text = ""
        }))
        present(alert, animated: true)
    }
    
    private func configureSubs() {
        // MARK: - AddButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnTap))
        
        // MARK: - SerchBar
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        navigationItem.titleView = searchBar
        
        // MARK: - TodosTable
        todosTable.translatesAutoresizingMaskIntoConstraints = false
        todosTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        todosTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        todosTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        todosTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

