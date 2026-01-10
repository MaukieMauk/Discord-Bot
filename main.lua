print("Lua is working!")
print("Hello, World!")

local function add(a, b)
    return a + b
end

local sum = add(5, 7)
print("The sum of 5 and 7 is: " .. sum)

local hello = "Hello, Lua!"
print(hello)

for i = 1, 5 do
    print("Count: " .. i)
end

print("Script finished.")