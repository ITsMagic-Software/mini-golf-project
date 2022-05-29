
function start() 

end

function update() 
player = WorldController:findObject("ball")

ppos = player:getTransform():getPosition()
myObject:getTransform():setPosition(ppos:getX()+5,ppos:getY()+12,ppos:getZ()-5)
end

function disabledUpdate()

end
