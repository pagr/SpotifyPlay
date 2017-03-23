//
//  Album.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Album: Unmarshaling {

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

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    name = try? object.value(for: SerializationKeys.name)
    href = try? object.value(for: SerializationKeys.href)
    uri = try? object.value(for: SerializationKeys.uri)
    id = try? object.value(for: SerializationKeys.id)
    externalUrls = try? object.value(for: SerializationKeys.externalUrls)
    availableMarkets = try? object.value(for: SerializationKeys.availableMarkets)
    images = try? object.value(for: SerializationKeys.images)
    type = try? object.value(for: SerializationKeys.type)
    albumType = try? object.value(for: SerializationKeys.albumType)
    artists = try? object.value(for: SerializationKeys.artists)
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
