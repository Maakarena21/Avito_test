

import Foundation
import Combine



protocol WorkersPresenter {
    func viewLoaded()
}

class WorkersPresenterImpl: WorkersPresenter {
    
    
    weak var view: WorkersView?
    var networkService: NetworkService!
    var cancellable: AnyCancellable?
    
    
    
    func viewLoaded() {
        cancellable = networkService.load()
                   .receive(on: DispatchQueue.main)
                   .sink(receiveCompletion:{_ in}) { [weak self] in 
                    self?.view?.tableInfo = TableInfo(workers: $0.company.employees.sorted(by: {$0.name < $1.name}))
                    print($0.company.employees)
        }
      
    }
}
