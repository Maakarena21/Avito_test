
import UIKit



struct TableInfo {
    let workers: [Employee]
}

protocol WorkersView: AnyObject {
    var tableInfo: TableInfo? { get set }
}

class WorkersViewController: UIViewController {
    
    var tableInfo: TableInfo? {
        didSet {
            workersTableView.reloadData()
        }
    }
    
    var presenter: WorkersPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workersTableView.delegate = self
        workersTableView.dataSource = self
        presenter.viewLoaded()
        configurate()
    }
    
    private lazy var workersTableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WorkerCell.self, forCellReuseIdentifier: WorkerCell.id)
        tableView.backgroundColor = .white
        tableView.layer.borderColor = UIColor.systemBlue.cgColor
        return tableView
    }()
    
    private func configurate() {
        
        view.addSubview(workersTableView)
        
                NSLayoutConstraint.activate([
                    workersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    workersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    workersTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                    workersTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
                ])
    }

    
}

extension WorkersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableInfo?.workers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkerCell.id, for: indexPath) as! WorkerCell
        
        cell.nameLabel.text = tableInfo?.workers[indexPath.row].name
        cell.numberPhoneLabel.text = tableInfo?.workers[indexPath.row].phoneNumber
        cell.talantLabel.text = tableInfo?.workers[indexPath.row].skills.joined(separator: ", ")
        
        return cell
    }
    
}

extension WorkersViewController: WorkersView {
}
