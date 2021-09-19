

import EasyDi


class RootAssembly: Assembly {
    private lazy var network: NetworkAssembly = context.assembly()
    
    func viewController() -> UIViewController {
        define(init: WorkersViewController()) {
        $0.presenter = self.presenter(view: $0)
        return $0
        }
        
    }
    
    func presenter(view: WorkersView) -> WorkersPresenter {
        define(init: WorkersPresenterImpl()) {
            $0.view = view
            $0.networkService = self.network.network
            return $0
        }
    }
    
    
}
