function start() 
buildEnvironment()
end 

prepared = false
speed = 4
blockDist = 5
maxBlocks = 12
flagSpawned = false

function update()
arrow = WorldController:findObject("pointer")
arrow:getTransform():setPosition(myObject:getTransform():getPosition())

rb = myObject:getPhysics():getPhysicsEntity()

joystick = Input:getAxis("joystick"):getValue()
if (joystick:getX()==0) and (joystick:getY()==0) then
    arrow:setEnabled(false)
    
    if prepared then
        prepared = false
        launch(arrow)
    end
else
    arrow:setEnabled(true)
    prepared = true
end

mpos = myObject:getTransform():getPosition()
lookpos = Vector3:new(0,0,0)
lookpos:setX(mpos:getX()+joystick:getX())
lookpos:setY(mpos:getY())
lookpos:setZ(mpos:getZ()+joystick:getY())
arrow:getTransform():lookTo(lookpos)

if rb:colliderWithName("flag") then
collection = myObject:findComponent("ObjectsStorage")
world = collection:getWorld()
WorldController:loadWorld(world)
end

y = myObject:getTransform():getPosition():getY()
if y < 0 then
collection = myObject:findComponent("ObjectsStorage")
world = collection:getWorld()
WorldController:loadWorld(world)
end

end

function disabledUpdate()

end

function launch(arrowObject)
    Console:log("launched")
    
    fwd = arrow:getTransform():forward()
    dir = Vector3:new(0,0,0)
    dir:setX(speed*fwd:getX())
    dir:setY(speed*fwd:getY())
    dir:setZ(speed*fwd:getZ())
    
    rb:addForce(dir)
end

function buildEnvironment()
math.randomseed(os.time())
collection = myObject:findComponent("ObjectsStorage")

tile = collection:getTile(0)
objects = collection:getObjects()

i = 1
pos = Vector3:new(0,-3,0)
dirs = {"right","left","forward","back"}
while i < maxBlocks do
mvdir = dirs[math.random(#dirs)]
if mvdir == "right" then
pos:setX(pos:getX()+blockDist)
elseif mvdir == "left" then
pos:setX(pos:getX()-blockDist)
elseif mvdir == "forward" then
pos:setZ(pos:getZ()+blockDist)
elseif mvdir == "back" then
pos:setZ(pos:getZ()-blockDist)
end
i = i + 1

spos = Vector3:new(0,0,0)
spos:setX(pos:getX())
spos:setY(pos:getY())
spos:setZ(pos:getZ())

myObject:instantiate(tile,spos)

choice = {0,1}
choose = choice[math.random(#choice)]
if (i + 1 >= maxBlocks) and not flagSpawned then
choose = 1
flagPos = Vector3:new(0,0,0)
flagPos:setX(math.random(spos:getX()-1,spos:getX()+1))
flagPos:setY(2.5)
flagPos:setZ(math.random(spos:getZ()-1,spos:getZ()+1))

flag = collection:getFlag()
myObject:instantiate(flag,flagPos)

flagSpawned = true
end

if choose == 0 then
objPos = Vector3:new(0,0,0)
objPos:setX(math.random(spos:getX()-1,spos:getX()+1))
objPos:setY(2.5)
objPos:setZ(math.random(spos:getZ()-1,spos:getZ()+1))
object = objects[math.random(#objects)]
myObject:instantiate(object,objPos)
end
end

end
