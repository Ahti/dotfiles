local keys = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
               "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
               "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "SHARP",
               "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", ";", ":",
               "'", "\"", "\\", "|", ",", "<", ".", ">", "/", "?", "`", "~",
               "SPACE", "BS", "ENTER", "ESC" }

local text = ""
   
function keypress(k)
    if     k == "SPACE" then
        text = text .. " "
        update_prompt()
    elseif k == "BS" then
        text = text:gsub(".$", "")
        update_prompt()
    elseif k == "ENTER" then
        if text ~= "" then
            res, err = mp.command(text)
            if res == nil then
                completion_prompt("Error: " .. err)
            end
        else
            completion_prompt("")
        end
        text = ""
        disengage_bindings()
    elseif k == "ESC" then
        text = ""
        disengage_bindings()
        completion_prompt("")
    else
        text = text .. k
        update_prompt()
    end
end

function engage_bindings()
    for i, k in pairs(keys) do
        mp.add_forced_key_binding(k, "prompt-" .. k, function() keypress(k) end)
    end
end

function disengage_bindings()
    for i, k in pairs(keys) do
        mp.remove_key_binding("prompt-" .. k)
    end
end

function update_prompt()
    mp.osd_message(": " .. text, 10000000000) -- this should be long enough
end

function completion_prompt(msg)
    mp.osd_message(msg, 1)
end

function open_prompt()
    mp.resume_all()

    engage_bindings()
    update_prompt()
end
mp.add_key_binding(":", "open-prompt", open_prompt)
