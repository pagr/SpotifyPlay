//
//  Owner.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Owner {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let href = "href"
    static let id = "id"
    static let externalUrls = "external_urls"
    static let type = "type"
    static let uri = "uri"
  }

  // MARK: Properties
  public var href: String?
  public var id: String?
  public var externalUrls: ExternalUrls?
  public var type: String?
  public var uri: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    href = json[SerializationKeys.href].string
    id = json[SerializationKeys.id].string
    externalUrls = ExternalUrls(json: json[SerializationKeys.externalUrls])
    type = json[SerializationKeys.type].string
    uri = json[SerializationKeys.uri].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    return dictionary
  }

}
