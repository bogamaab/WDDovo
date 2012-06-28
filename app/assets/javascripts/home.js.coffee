$ ->
  loadBackground()

loadBackground = ->
  imageURL=loadFlickrimage()
  ($ '.flickr').attr 'src',imageURL
  sounCloudUrl=loadSCsound()
  imageURL=loadFlickrimage()
  ($ '.flickr').attr 'src',imageURL

loadFlickrimage = ->
  api_key = ($ 'body').data("flickr")
  tags = ["art","beach","blue","bw","california","canada","canon","china","christmas","city","concert","de","england","europe","family","festival","film","flowers","food","france","friends","instagramapp","iphoneography","italia","japon","live","london","music","nature","new","newyork","nigth","nikon","nyc","paris","park","party","people","photography","portrait","red","sky","snow","square","squareformat","street","summer","sunset","travel","trip","uk","usa","vacation","water","animals","wedding","white","winter","black"]
  photo = null
  numb = Math.random(Math.floor()+1)*60
  $.ajax
    async: false
    url: "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{api_key}&tags=#{tags[numb]}%2Cblack%2Cwhite%2Clandscape&per_page=#{numb}&page=1&format=json&nojsoncallback=1"
    dataType: 'json'
    type: 'GET'
    success: (response, textStatus, jqXHR) ->
      photo =  response.photos.photo[0]
  a="http://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_z.jpg"
  a

loadSCsound = ->
  api_key = ($ 'body').data("soundcloud")
  SC.initialize
    client_id: "#{api_key}"
    redirect_uri: "http://wddovo.herokuapp.com/"
  #SC.connect ->
  SC.Widget.Events.READY
