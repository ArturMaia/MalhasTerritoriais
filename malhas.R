#malhas territoriais
library(rnaturalearth)
library(rnaturalearthhires)
library(ggplot2)
library(geobr)
library(mapview)
library(maps)
library(cowplot)
library(dplyr)

#mundial
mundo <- map_data("world")
ggplot(mundo, aes(x=long, y=lat, group=group))+
  geom_polygon(fill="lightgray", colour = "black")

#continente
continente1<-ne_countries(continent = 'South America',returnclass = 'sf')
continente2<-ne_countries(continent = 'Africa',returnclass = 'sf')
c1<-ggplot()+geom_sf(data=continente1)
c2<-ggplot()+geom_sf(data=continente2)
plot_grid(c1,c2)

#países
an<-ne_states(country = 'Angola',returnclass = 'sf')
br<-read_state(code_state = "all",year = 2010)
df<-read_state(code_state = 53)
lu<-filter(an,name=="Luanda")
p1<-ggplot(br)+aes(group= 'code_tate')+geom_sf(size= 0.1,fill="#FFF9C5")+geom_sf(aes(group= 'code_state'),data = df,fill= "#EB8E18", col= "#EB8E18")+labs(x="longitude", y="latitude", title = "Brasil (capital: Distrito Federal)")+
  theme_bw()
p2<-ggplot(an)+aes(group= 'woe_id')+geom_sf(size= 0.1,fill="#FFF9C5")+geom_sf(aes(group= 'woe_id'),data = lu,fill= "#EB8E18", col= "#EB8E18")+labs(x="longitude", y="latitude", title = "Angola (capital: Luanda)")+
  theme_bw()
plot_grid(p1,p2)

mapview(lu)
mapview(df)


