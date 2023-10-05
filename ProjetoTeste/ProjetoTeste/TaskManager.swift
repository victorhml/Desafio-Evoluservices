//
//  TaskManager.swift
//  ProjetoTeste
//

import Foundation

class TaskManager {

    private var tasks: [Task] = []

    private let tasksKey = "tasksKey"

    /// Adiciona uma nova tarefa na lista
    func addTask(title: String, description: String) {
        let task = Task(title: title, description: description, createdAt: Date())
        tasks.append(task)
    }

    /// Informa a lista atual de tarefas
    func getTasks() -> [Task] {
        return tasks
    }

    /// Salva a lista de tarefas
    func saveTasks() {
            let encoder = JSONEncoder()
            if let encodedTasks = try? encoder.encode(tasks) {
                UserDefaults.standard.set(encodedTasks, forKey: tasksKey)
            }
        }

    /// Recupera as tarefas salvas
    func loadTasks() {
        //TODO: criar a implementação real
        createDefaultTasks()
        }

    /// Mock inicial das tarefas, não deve ser usado na versão final
    private func createDefaultTasks() {
        let task1 = Task(title: "Lavar a roupa", description: "Utilizar sabão em pó, amaciante e alvejante", createdAt: Date())
            let task2 = Task(title: "Preparar o almoço", description: "Arroz, carne moída, legumes e verduras", createdAt: Date())
            let task3 = Task(title: "Atividade física", description: "Corrida, musculação ou tirar um cochilo na rede", createdAt: Date())
            tasks = [task1, task2, task3]
        }
}

struct Task: Codable {
    let title: String
    let description: String
    let createdAt: Date
}
