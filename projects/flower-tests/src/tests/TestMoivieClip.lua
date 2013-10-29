
--- test target
local MovieClip = flower.MovieClip

--- test case
local TestMovieClip = {}
_G.TestMovieClip = TestMovieClip

---
-- setUp
function TestMovieClip:setUp()
    self.prop = MovieClip("actor.png")
end

---
-- tearDown
function TestMovieClip:tearDown()

end

---
-- test: setTexture
function TestMovieClip:test1_texture()
    local prop = self.prop
    assertEquals(prop.texture, flower.getTexture("actor.png"))
    
    prop:setTexture("numbers.png")
    assertEquals(prop.texture, flower.getTexture("numbers.png"))
end

---
-- test: setTextureAtlas
function TestMovieClip:test2_textureAtlas()
    local prop = self.prop
    prop:setTextureAtlas("texturepack1.lua", "texturepack1.png")
    prop:setIndexByName("one")
    
    assertEquals(prop.sheetSize, 3)
    assertEquals(prop.sheetNames, {cathead = 1, one = 2, two = 3})
    assertEquals(prop:getIndex(), 2)
end

---
-- test: setSheetSize
function TestMovieClip:test3_sheetSize()
    local prop = self.prop
    prop:setSheetSize(3, 4)
    
    assertEquals(prop.sheetSize, 3 * 4)
    assertEquals(prop.sheetNames, {})
end

---
-- test: setSheetSize
function TestSheetImage:test4_sheetSize()
    local prop = self.prop
    prop:setSheetSize(3, 4, 1, 2, true, true)
    
    assertEquals(prop.sheetSize, 2 * 3)
    assertEquals(prop.sheetNames, {})
end

---
-- test: setTileSize
function TestSheetImage:test5_tileSize()
    local prop = self.prop
    prop:setTileSize(32, 32)
    
    assertEquals(prop.sheetSize, 3 * 4)
    assertEquals(prop.sheetNames, {})
end
