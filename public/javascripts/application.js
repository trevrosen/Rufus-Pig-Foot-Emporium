$.dashboard = {
  init:{
    trendLineGraph: function(wrapperSelector, coordinates) {
      coordinates = $.parseJSON(coordinates);
      console.info(coordinates);
      $.plot($(wrapperSelector), coordinates);
    }
  } // end init
}
