//
//  TaskViewController.swift
//  ProjetoTeste
//
//  Created by Victor Hugo Martins Lisboa on 05/10/23.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var task: Task?
    
    /// Gerenciador de tarefas
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionTextView.delegate = self
        
        // Do any additional setup after loading the view.
        descriptionTextView.text = "Descrição"
        descriptionTextView.textColor = .lightGray
        
        if let task = task {
            titleTextField.text = task.title
            descriptionTextView.text = task.description
            descriptionTextView.textColor = .black
            dateLabel.text = "\(task.createdAt)"
        }
    }
    
    /// Verifica campos
    func isFieldEmpty() -> Bool {
        if titleTextField.text?.isEmpty ?? true {
            let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.titleTextField.becomeFirstResponder()
            }
            
            createAlert(alertTitle: "Por favor, digite um título", action: alertAction)
            
            return false
            
        } else if descriptionTextView.textColor == .lightGray {
            let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.descriptionTextView.becomeFirstResponder()
            }
            
            createAlert(alertTitle: "Por favor, digite uma descrição", action: alertAction)
            
            return false
        } else {
            return true
        }
    }

    /// Cria alerta de erro
    func createAlert(alertTitle: String, action: UIAlertAction) {
        let alert = UIAlertController(title: "", message: alertTitle, preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    /// Ação do botão salvar
    @IBAction func saveTask(_ sender: Any) {
        if isFieldEmpty() {
            if let task = task {
                taskManager.loadTasks()
                taskManager.editTask(task: task, title: titleTextField.text ?? "", description: descriptionTextView.text ?? "")
                taskManager.saveTasks()
            } else {
                taskManager.loadTasks()
                taskManager.addTask(title: titleTextField.text ?? "", description: descriptionTextView.text ?? "")
                taskManager.saveTasks()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension TaskViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Descrição"
            textView.textColor = .lightGray
        }
    }
}
