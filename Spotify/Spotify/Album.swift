//
//  Album.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Album {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let href = "href"
    static let uri = "uri"
    static let id = "id"
    static let externalUrls = "external_urls"
    static let availableMarkets = "available_markets"
    static let images = "images"
    static let type = "type"
    static let albumType = "album_type"
    static let artists = "artists"
  }

  // MARK: Properties
  public var name: String?
  public var href: String?
  public var uri: String?
  public var id: String?
  public var externalUrls: ExternalUrls?
  public var availableMarkets: [String]?
  public var images: [Images]?
  public var type: String?
  public var albumType: String?
  public var artists: [Artists]?

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
    name = json[SerializationKeys.name].string
    href = json[SerializationKeys.href].string
    uri = json[SerializationKeys.uri].string
    id = json[SerializationKeys.id].string
    externalUrls = ExternalUrls(json: json[SerializationKeys.externalUrls])
    if let items = json[SerializationKeys.availableMarkets].array { availableMarkets = items.map { $0.stringValue } }
    if let items = json[SerializationKeys.images].array { images = items.map { Images(json: $0) } }
    type = json[SerializationKeys.type].string
    albumType = json[SerializationKeys.albumType].string
    if let items = json[SerializationKeys.artists].array { artists = items.map { Artists(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = availableMarkets { dictionary[SerializationKeys.availableMarkets] = value }
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = albumType { dictionary[SerializationKeys.albumType] = value }
    if let value = artists { dictionary[SerializationKeys.artists] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
