import Foundation
import Kitura
import HeliumLogger
import LoggerAPI
import SwiftyJSON

// Disable buffering
setbuf(stdout, nil)

Log.logger = HeliumLogger()

let router = Router()
router.get("/") { request, response, next in
	response.status(.OK).send(json: JSON(["Hello": "Kitura!"]))
	next()
}

Log.info("Starting Server")
Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
