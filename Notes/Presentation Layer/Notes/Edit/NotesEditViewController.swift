import UIKit

class NotesEditViewController: UIViewController {
    
    let nameField = UITextField()
    let descField = UITextField()
    let saveBtn = UIButton(type: .roundedRect)
    
    var note: Note?
    var updateNoteDelegate: INoteUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(nameField)
        view.addSubview(descField)
        view.addSubview(saveBtn)
        
        nameField.textAlignment = .center
        descField.textAlignment = .center
        
        nameField.text = note?.name
        descField.text = note?.desc
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.addTarget(self, action: #selector(saveBtnClicked), for: .touchUpInside)
        
        configureSubs()
    }
    
    @objc func saveBtnClicked() {
        updateNoteDelegate?.update(note: note ?? Note(), name: nameField.text, desc: descField.text)
        navigationController?.popViewController(animated: true)
    }
    
    private func configureSubs(){
        // MARK: - NameField
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.layer.borderColor = UIColor( red: 0, green: 0, blue:0, alpha: 1.0).cgColor
        nameField.layer.borderWidth = 2
        nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        // MARK: - DescField
        descField.translatesAutoresizingMaskIntoConstraints = false
        descField.layer.borderColor = UIColor( red: 0, green: 0, blue:0, alpha: 1.0).cgColor
        descField.layer.borderWidth = 2
        descField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descField.topAnchor.constraint(equalTo: nameField.topAnchor, constant: 100).isActive = true
        descField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        // MARK: - SaveButton
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.layer.borderColor = UIColor( red: 0, green: 0, blue:0, alpha: 1.0).cgColor
        saveBtn.layer.borderWidth = 2
        saveBtn.setTitleColor(.black, for: .normal)
        saveBtn.layer.cornerRadius = 5
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveBtn.topAnchor.constraint(equalTo: descField.topAnchor, constant: 100).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
