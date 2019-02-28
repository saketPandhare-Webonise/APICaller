//
//  WebServiceHandler.swift
//  IOS-Starter

import UIKit
import Alamofire

public class WebServiceHandler {
    
    let NO_NETWORK = "No Network"
    let SUCCESS_RANGE = 200 ... 299
    /// This fucntion acts as a wrapper for webservice calls
    ///
    /// - Parameters:
    ///   - url: URL to be called
    ///   - methodType: GET/POST/PUT/DELETE
    ///   - parameters: paramenters for API call
    ///   - succeess: success block of API call
    ///   - failure: failure block of API call
    /// - Important:
    ///   - If there is no internet connectivity, the request shouldn`t be sent,  in this case, failure will return the utf8 encoded string "No Network"
    ///   - If there is no internet connectivity, the current screen should prompt a popup
  public init() {}
    
  public func callWebservice(url: String,
                        methodType: HTTPMethod,
                        parameters: [String: Any]?,
                        headerParameter: [String: String]?,
                        showLoader: Bool,
                        succeess: @escaping ((_ response: AnyObject?,_ headerFields: AnyObject?,_ statusCode: Int)->()),
                        failure: @escaping (_ error: AnyObject?,_ statusCode: Int)->()) {
        
        Alamofire.request(url,
                          method: methodType,
                          parameters: parameters,
                          encoding: getEncoding(methodType: methodType.rawValue),
                          headers: headerParameter)
            .responseJSON { response in
                ///Hide loader as soon as response is received
                ///if status code is not return then return from function
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                ///if status code is between 200...299 then its a success
                if((self.SUCCESS_RANGE).contains(statusCode)){
                    succeess(response.result.value as AnyObject?,
                             response.response?.allHeaderFields as AnyObject?,
                             statusCode)
                }else{ ////else its an error
                    // MARK: server error
                    guard let data = response.data else {
                        return
                    }
                    ///Convert NSData from server to Json and then send it back
                    failure(self.nsdataToJSON(data: data as NSData), statusCode)
                }
        }
    }
    
    /// This gives encoding type
    ///
    /// - Parameter methodType: type of method
    /// - Returns: param encoding
   public func getEncoding(methodType: String) -> ParameterEncoding{
        if (methodType == "Get") {
            return URLEncoding.default
        }
        else {
            return JSONEncoding.default
        }
    }
    
    /// This function is used to convert NSData to Json (readable) format
    ///
    /// - Parameter data: data received from server
    /// - Returns: json object or nil if not fount
   public func nsdataToJSON(data: NSData) -> AnyObject?{
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch let myJSONError {
            print(myJSONError) ///You can check error in console if any
        }
        return nil
    }
    
    /// This fucntion is fired when no internet connection is available
    ///
    /// - Returns: NSData
    public func networkNotAvailable() -> NSData {
        let nsData = NO_NETWORK.data(using: .utf8)! as NSData
        return nsData
    }
}


