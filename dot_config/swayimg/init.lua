-- ~/.config/swayimg/init.lua

-- ── nvim 风格：viewer 模式导航 ──
-- 上一张 / 下一张（nvim 的 h/l）
swayimg.viewer.on_key("h", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("l", function() swayimg.viewer.open("next") end)

-- 第一张 / 最后一张（nvim 的 g / G；G 是 Shift-g）
swayimg.viewer.on_key("g", function() swayimg.viewer.open("first") end)
swayimg.viewer.on_key("Shift-g", function() swayimg.viewer.open("last") end)

-- 缩小 / 放大（nvim 的 j/k）
swayimg.viewer.on_key("j", function() swayimg.viewer.set_abs_scale(swayimg.viewer.scale * 0.8) end)
swayimg.viewer.on_key("k", function() swayimg.viewer.set_abs_scale(swayimg.viewer.scale * 1.25) end)

-- 常用操作
swayimg.viewer.on_key("i", function() swayimg.text.visible = not swayimg.text.visible end)
swayimg.viewer.on_key("f", function() swayimg.fullscreen = not swayimg.fullscreen end)
swayimg.viewer.on_key("r", function() swayimg.viewer.reload() end)
swayimg.viewer.on_key("x", function() swayimg.viewer.mark_image() end)
swayimg.viewer.on_key("space", function() swayimg.viewer.animation = not swayimg.viewer.animation end)
swayimg.viewer.on_key("q", function() swayimg.exit() end)
swayimg.viewer.on_key("Escape", function() swayimg.exit() end)

-- 中文字体
swayimg.text.font = "Noto Sans CJK SC:lang=und"
