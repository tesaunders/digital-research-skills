

library(tidyverse)

?mpg

mileage <- mpg

# dplyr

### slice_head()

mileage |> 
  slice_head(n = 5)

top_10 <- mileage |> 
  arrange(desc(hwy)) |> 
  slice_head(n = 10)

### case_when()

range(top_10$year)

top_10 |> 
  mutate(
    decade = case_when(year < 2000 ~ "1990s",
                       .default = "2000s")
  )

### left_join()

manufacturers <- data.frame(manufacturer = unique(top_10$manufacturer),
                   hq = c("Germany", "Japan", "Japan"))

combined <- top_10 |> 
  left_join(manufacturers)