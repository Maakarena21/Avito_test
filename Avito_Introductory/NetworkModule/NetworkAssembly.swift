

import EasyDi

class NetworkAssembly: Assembly {
    var network: NetworkService {
        return define(init: NetworkServiceImpl())
    }
}
