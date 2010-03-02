
-- Tree Fractal.
--	Based on ANUPlot code by Clem Baker-Finch.
--	
import Graphics.Gloss

main =  displayInWindow
		"Tree Fractal"
		(500, 650) 
		(20,  20)
		(greyN 0.2)
		(picture 4)


-- The picture is a tree fractal, graded from brown to green
picture :: Int -> Picture	
picture degree
	= Translate 0 (-300)
	$ tree degree brown


-- Basic stump shape
stump :: Color -> Picture
stump color 
	= Color color
	$ Polygon [(30,0), (15,300), (-15,300), (-30,0)]


-- Make a tree fractal.
tree 	:: Int 		-- Fractal degree
	-> Color 	-- Color for the stump
	-> Picture

tree 0 color = stump color
tree n color 
 = let	smallTree 
		= Scale 0.5 0.5 
		$ tree (n-1) (greener color)
   in	Pictures
		[ stump color
		, Translate 0 300 $ smallTree
		, Translate 0 240 $ Rotate 20	 smallTree
		, Translate 0 180 $ Rotate (-20) smallTree
		, Translate 0 120 $ Rotate 40 	 smallTree
		, Translate 0  60 $ Rotate (-40) smallTree ]
		

-- A starting colour for the stump
brown :: Color
brown =  makeColor8 139 100 35  255


-- Make this color a little greener
greener :: Color -> Color
greener c = mixColors 1 8 green c

