library(hexSticker)
library(showtext)


borders("Iran")
ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group)) +
  coord_fixed(1.3)

font_add_google("Inconsolata")
imgurl <- system.file("~/Documents/hesaba/HW7/IranCovid/corona.png", package="IranCovid")

sticker("coronaa.png",package="IranCovid",p_color = "#f39c12",
        p_size=20, s_x=1, s_y=.8, s_width=0.5, s_height=0.3,
        h_fill="#ffffff",
        h_color="#f39c12",
        p_family = "Inconsolata",
        filename="logo.png")

