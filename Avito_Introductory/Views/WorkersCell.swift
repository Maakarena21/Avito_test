

import UIKit

class WorkerCell: UITableViewCell {
    
   static let id = "cell_id"
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.borderWidth = 2
        return view
    }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .white
        nameLabel.layer.borderColor = UIColor.systemBlue.cgColor
        nameLabel.layer.borderWidth = 2
        
        return nameLabel
    }()
    
    
    let numberPhoneLabel: UILabel = {
        let numberPhoneLabel = UILabel()
        numberPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneLabel.backgroundColor = .white
        numberPhoneLabel.layer.borderColor = UIColor.systemBlue.cgColor
        numberPhoneLabel.layer.borderWidth = 2
        return numberPhoneLabel
    }()
    
    
    let talantLabel: UILabel = {
        let talantLabel = UILabel()
        talantLabel.translatesAutoresizingMaskIntoConstraints = false
        talantLabel.backgroundColor = .white
        talantLabel.layer.borderColor = UIColor.systemBlue.cgColor
        talantLabel.layer.borderWidth = 2
        return talantLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           backgroundColor = .white
            configurate()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    private func configurate() {
        
        contentView.addSubview(view)
        view.addSubview(nameLabel)
        view.addSubview(talantLabel)
        view.addSubview(numberPhoneLabel)
        
        NSLayoutConstraint.activate([
                    view.topAnchor.constraint(equalTo: contentView.topAnchor),
                    view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
                    view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
                    view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
                    nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                    nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
                    numberPhoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                    numberPhoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
                    talantLabel.topAnchor.constraint(equalTo: numberPhoneLabel.bottomAnchor, constant: 20),
                    talantLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                    talantLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
    }
    
    
}
