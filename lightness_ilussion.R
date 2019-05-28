library(grid)
library(ggplot2)

m <- t(colorRampPalette(c("#000000", "#FFFFFF"))(10000))

g <- rasterGrob(
  m,
  width= unit(29.7,"cm"), height = unit(21,"cm"))

gg <- ggplot() + 
  annotation_custom(g , -Inf, Inf, -Inf, Inf) +
  ylim(c(1,8)) + 
  ggmap::theme_nothing() 

gg

ggsave("lightness_ilussion_back.png",gg, width = 11.693, height = 8.268)


# 10000 ... 29.7 cm
# x     ... 4 cm (side of the square)
# x = floor(10000*(4/29.7)) = 1346
# the square starts at (10000-1346) / 2
sq_side = floor(10000*(4/29.7))
ix_low <- (10000-sq_side) / 2
ix_high <- (10000-sq_side) / 2 + sq_side
patch <- m[ix_low:ix_high]

g_patch <- rasterGrob(
    patch,
    width= unit(2,"cm"), height = unit(2,"cm"))

gg_patch <- ggplot() + 
  annotation_custom(g_patch , -Inf, Inf, -Inf, Inf) +
  ggmap::theme_nothing() 

gg_patch

ggsave("lightness_ilussion_patch.png",gg_patch, width = 0.787401575, height = 0.787401575)
