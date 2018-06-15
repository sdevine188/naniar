library(naniar)
library(UpSetR)


# https://github.com/njtierney/naniar
# https://cran.r-project.org/web/packages/UpSetR/vignettes/basic.usage.html

# geom_miss_point
# allows for seeing distribution of missing variables in two variables, based on distribution of the other
ggplot(data = airquality,
       aes(x = Ozone,
           y = Solar.R)) +
        geom_point()

ggplot(data = airquality,
       aes(x = Ozone,
           y = Solar.R)) +
        geom_miss_point()

ggplot(data = airquality,
       aes(x = Ozone,
           y = Solar.R)) + 
        geom_miss_point() + 
        facet_wrap(~Month, ncol = 2) + 
        theme(legend.position = "bottom")


############################################


# shadow dataframes 
head(airquality)
# as_shadow gives NA for NA values and !NA for non-NA values
as_shadow(airquality) 

# bind_shadow binds the shadow df onto the original df
airquality %>% bind_shadow()

# allows for visualizing NA portion of data for one variable based on in density plot of another variable
airquality %>%
        bind_shadow() %>%
        ggplot(aes(x = Temp,
                   fill = Ozone_NA)) + 
        geom_density(alpha = 0.5)


#############################################


airquality %>%
        as_shadow_upset() %>%
        upset()

airquality %>% upset()








