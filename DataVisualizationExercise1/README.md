# Springboard

## Exploratory Data Analysis in R - Titanic Exercise

`Titanic.R` is the solution of the below datacamp exercise

```
Titanic

You've watched the movie Titanic by James Cameron (1997) again and after a good portion of sobbing you decide to investigate whether you'd have a chance of surviving this disaster.

To start your investigation, you decide to do some exploratory visualization with ggplot(). You have information on who survived the sinking given their age, sex and passenger class.


* Have a look at the str() of the titanic dataset, which has been loaded into your workspace. Looks like the data is pretty tidy!
* Plot the distribution of sexes within the classes of the ship.
  * Use ggplot() with the data layer set to titanic.
  * Map Pclass onto the x axis, Sex onto fill and draw a dodged bar plot using geom_bar(), i.e. set the geom position to "dodge".
* These bar plots won't help you estimate your chances of survival. Copy the previous bar plot, but this time add a facet_grid() layer: . ~ Survived.
* We've defined a position object for you.
* Include Age, the final variable.
  * Take plot 3 and add a mapping of Age onto the y aesthetic.
  * Change geom_bar() to geom_point() and set its attributes size = 3, alpha = 0.5 and position = posn.jd.
  * Make sure that Sex is mapped onto color instead of fill to correctly color the scatter plots. (This was discussed in detail here and here).

```

Reference:
[Data Visualization with ggplot2 chapter5 qplot-and-wrap-up](https://campus.datacamp.com/courses/data-visualization-with-ggplot2-1/chapter-5-qplot-and-wrap-up?ex=8)