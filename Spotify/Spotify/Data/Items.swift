//
//  Items.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Items: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let href = "href"
    static let addedAt = "added_at"
    static let track = "track"
    static let durationMs = "duration_ms"
    static let explicit = "explicit"
    static let type = "type"
    static let trackNumber = "track_number"
    static let snapshotId = "snapshot_id"
    static let collaborative = "collaborative"
    static let id = "id"
    static let owner = "owner"
    static let availableMarkets = "available_markets"
    static let images = "images"
    static let followers = "followers"
    static let name = "name"
    static let uri = "uri"
    static let externalUrls = "external_urls"
    static let genres = "genres"
    static let previewUrl = "preview_url"
    static let externalIds = "external_ids"
    static let artists = "artists"
    static let album = "album"
    static let isLocal = "is_local"
    static let popularity = "popularity"
    static let discNumber = "disc_number"
    static let tracks = "tracks"
    static let addedBy = "added_by"
    static let public = "public"
    static let albumType = "album_type"
  }

  // MARK: Properties
  public var href: String?
  public var addedAt: String?
  public var track: Track?
  public var durationMs: Int?
  public var explicit: Bool? = false
  public var type: String?
  public var trackNumber: Int?
  public var snapshotId: String?
  public var collaborative: Bool? = false
  public var id: String?
  public var owner: Owner?
  public var availableMarkets: [String]?
  public var images: [Images]?
  public var followers: Followers?
  public var name: String?
  public var uri: String?
  public var externalUrls: ExternalUrls?
  public var genres: [String]?
  public var previewUrl: String?
  public var externalIds: ExternalIds?
  public var artists: [Artists]?
  public var album: Album?
  public var isLocal: Bool? = false
  public var popularity: Int?
  public var discNumber: Int?
  public var tracks: Tracks?
  public var addedBy: AddedBy?
  public var public: Bool? = false
  public var albumType: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    href = try? object.value(for: SerializationKeys.href)
    addedAt = try? object.value(for: SerializationKeys.addedAt)
    track = try? object.value(for: SerializationKeys.track)
    durationMs = try? object.value(for: SerializationKeys.durationMs)
    explicit = try? object.value(for: SerializationKeys.explicit)
    type = try? object.value(for: SerializationKeys.type)
    trackNumber = try? object.value(for: SerializationKeys.trackNumber)
    snapshotId = try? object.value(for: SerializationKeys.snapshotId)
    collaborative = try? object.value(for: SerializationKeys.collaborative)
    id = try? object.value(for: SerializationKeys.id)
    owner = try? object.value(for: SerializationKeys.owner)
    availableMarkets = try? object.value(for: SerializationKeys.availableMarkets)
    images = try? object.value(for: SerializationKeys.images)
    followers = try? object.value(for: SerializationKeys.followers)
    name = try? object.value(for: SerializationKeys.name)
    uri = try? object.value(for: SerializationKeys.uri)
    externalUrls = try? object.value(for: SerializationKeys.externalUrls)
    genres = try? object.value(for: SerializationKeys.genres)
    previewUrl = try? object.value(for: SerializationKeys.previewUrl)
    externalIds = try? object.value(for: SerializationKeys.externalIds)
    artists = try? object.value(for: SerializationKeys.artists)
    album = try? object.value(for: SerializationKeys.album)
    isLocal = try? object.value(for: SerializationKeys.isLocal)
    popularity = try? object.value(for: SerializationKeys.popularity)
    discNumber = try? object.value(for: SerializationKeys.discNumber)
    tracks = try? object.value(for: SerializationKeys.tracks)
    addedBy = try? object.value(for: SerializationKeys.addedBy)
    public = try? object.value(for: SerializationKeys.public)
    albumType = try? object.value(for: SerializationKeys.albumType)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = addedAt { dictionary[SerializationKeys.addedAt] = value }
    if let value = track { dictionary[SerializationKeys.track] = value.dictionaryRepresentation() }
    if let value = durationMs { dictionary[SerializationKeys.durationMs] = value }
    dictionary[SerializationKeys.explicit] = explicit
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = trackNumber { dictionary[SerializationKeys.trackNumber] = value }
    if let value = snapshotId { dictionary[SerializationKeys.snapshotId] = value }
    dictionary[SerializationKeys.collaborative] = collaborative
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = owner { dictionary[SerializationKeys.owner] = value.dictionaryRepresentation() }
    if let value = availableMarkets { dictionary[SerializationKeys.availableMarkets] = value }
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    if let value = followers { dictionary[SerializationKeys.followers] = value.dictionaryRepresentation() }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = genres { dictionary[SerializationKeys.genres] = value }
    if let value = previewUrl { dictionary[SerializationKeys.previewUrl] = value }
    if let value = externalIds { dictionary[SerializationKeys.externalIds] = value.dictionaryRepresentation() }
    if let value = artists { dictionary[SerializationKeys.artists] = value.map { $0.dictionaryRepresentation() } }
    if let value = album { dictionary[SerializationKeys.album] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.isLocal] = isLocal
    if let value = popularity { dictionary[SerializationKeys.popularity] = value }
    if let value = discNumber { dictionary[SerializationKeys.discNumber] = value }
    if let value = tracks { dictionary[SerializationKeys.tracks] = value.dictionaryRepresentation() }
    if let value = addedBy { dictionary[SerializationKeys.addedBy] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.public] = public
    if let value = albumType { dictionary[SerializationKeys.albumType] = value }
    return dictionary
  }

}
