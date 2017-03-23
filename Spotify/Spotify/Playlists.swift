//
//  Playlists.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Playlists {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let limit = "limit"
    static let href = "href"
    static let offset = "offset"
    static let next = "next"
    static let total = "total"
    static let items = "items"
  }

  // MARK: Properties
  public var limit: Int?
  public var href: String?
  public var offset: Int?
  public var next: String?
  public var total: Int?
  public var items: [Items]?

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
    limit = json[SerializationKeys.limit].int
    href = json[SerializationKeys.href].string
    offset = json[SerializationKeys.offset].int
    next = json[SerializationKeys.next].string
    total = json[SerializationKeys.total].int
    if let items = json[SerializationKeys.items].array { self.items = items.map { Items(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = limit { dictionary[SerializationKeys.limit] = value }
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = offset { dictionary[SerializationKeys.offset] = value }
    if let value = next { dictionary[SerializationKeys.next] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = items { dictionary[SerializationKeys.items] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
