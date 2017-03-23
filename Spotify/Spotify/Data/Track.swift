//
//  Track.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Track: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let href = "href"
    static let uri = "uri"
    static let externalUrls = "external_urls"
    static let durationMs = "duration_ms"
    static let previewUrl = "preview_url"
    static let explicit = "explicit"
    static let type = "type"
    static let externalIds = "external_ids"
    static let artists = "artists"
    static let album = "album"
    static let trackNumber = "track_number"
    static let popularity = "popularity"
    static let id = "id"
    static let discNumber = "disc_number"
    static let availableMarkets = "available_markets"
  }

  // MARK: Properties
  public var name: String?
  public var href: String?
  public var uri: String?
  public var externalUrls: ExternalUrls?
  public var durationMs: Int?
  public var previewUrl: String?
  public var explicit: Bool? = false
  public var type: String?
  public var externalIds: ExternalIds?
  public var artists: [Artists]?
  public var album: Album?
  public var trackNumber: Int?
  public var popularity: Int?
  public var id: String?
  public var discNumber: Int?
  public var availableMarkets: [String]?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    name = try? object.value(for: SerializationKeys.name)
    href = try? object.value(for: SerializationKeys.href)
    uri = try? object.value(for: SerializationKeys.uri)
    externalUrls = try? object.value(for: SerializationKeys.externalUrls)
    durationMs = try? object.value(for: SerializationKeys.durationMs)
    previewUrl = try? object.value(for: SerializationKeys.previewUrl)
    explicit = try? object.value(for: SerializationKeys.explicit)
    type = try? object.value(for: SerializationKeys.type)
    externalIds = try? object.value(for: SerializationKeys.externalIds)
    artists = try? object.value(for: SerializationKeys.artists)
    album = try? object.value(for: SerializationKeys.album)
    trackNumber = try? object.value(for: SerializationKeys.trackNumber)
    popularity = try? object.value(for: SerializationKeys.popularity)
    id = try? object.value(for: SerializationKeys.id)
    discNumber = try? object.value(for: SerializationKeys.discNumber)
    availableMarkets = try? object.value(for: SerializationKeys.availableMarkets)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = durationMs { dictionary[SerializationKeys.durationMs] = value }
    if let value = previewUrl { dictionary[SerializationKeys.previewUrl] = value }
    dictionary[SerializationKeys.explicit] = explicit
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = externalIds { dictionary[SerializationKeys.externalIds] = value.dictionaryRepresentation() }
    if let value = artists { dictionary[SerializationKeys.artists] = value.map { $0.dictionaryRepresentation() } }
    if let value = album { dictionary[SerializationKeys.album] = value.dictionaryRepresentation() }
    if let value = trackNumber { dictionary[SerializationKeys.trackNumber] = value }
    if let value = popularity { dictionary[SerializationKeys.popularity] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = discNumber { dictionary[SerializationKeys.discNumber] = value }
    if let value = availableMarkets { dictionary[SerializationKeys.availableMarkets] = value }
    return dictionary
  }

}
