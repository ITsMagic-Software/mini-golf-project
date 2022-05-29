function start() 
Console:log("Hello, Lua!") 
Console:log("test")
end 

function update()
    for i = 1, 10 do
        if i % 2 == 0 then
            Console:log(i);
        end
    end
end

function disabledUpdate()

end
