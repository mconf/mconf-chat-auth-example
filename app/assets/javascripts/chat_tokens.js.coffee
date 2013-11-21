$ ->
  clip = new ZeroClipboard $("#copy-button"),
    moviePath: "/ZeroClipboard.swf"

  clip.on "load", (client) ->
    console.log "movie is loaded"
    client.on "complete", (client, args) ->
      # `this` is the element that was clicked
      alert "Token copied to clipboard!"
