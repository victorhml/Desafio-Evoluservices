//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class ViewController: UIViewController {

    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var tableView: UITableView!

    /// Gerenciador de tarefas
    let taskManager = TaskManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: "goToTask")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskManager.loadTasks()
        tableView.reloadData()
    }
    
    @objc func goToTask() {
        performSegue(withIdentifier: "taskSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskSegue" {
//            if let destVC = segue.destination as? UINavigationController, let taskController = destVC.topViewController as? TaskViewController {
//                taskController.task = selectedTask
//            }
            if let vc = segue.destination as? TaskViewController, let selectedTask = sender as? Task {
                vc.task = selectedTask
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.getTasks().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = taskManager.getTasks()[indexPath.row]
        cell.titleLabel.text = task.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, _ in
            self.taskManager.deleteTasks(index: indexPath.row)
            self.taskManager.saveTasks()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeConfiguration
    }
}

extension ViewController: UITableViewDelegate {
    // TODO: implementar comportamento ao selecionar uma tarefa
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var selectedTask: Task
        selectedTask = taskManager.getTasks()[indexPath.row]
        
        performSegue(withIdentifier: "taskSegue", sender: selectedTask)
    }
    
    
}
