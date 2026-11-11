-- v21 minifié
local L={["rbxassetid://1461128166"]={n="Light1",r=10,m=400},["rbxassetid://1461128859"]={n="Light2",r=10,m=500},["rbxassetid://1461136273"]={n="Light3",r=14,m=500},["rbxassetid://1461136875"]={n="Light4",r=11,m=400},["rbxassetid://1461137417"]={n="LightFinish",r=10,m=400}}
local P,W,R,V=game:GetService("Players"),game:GetService("Workspace"),game:GetService("RunService"),game:GetService("VirtualInputManager")
local lp=P.LocalPlayer
local lt,fh,tt=0,false,{}
local function pF(d)if typeof(keypress)=="function"and d then return keypress(0x46)end;if typeof(keyrelease)=="function"and not d then return keyrelease(0x46)end;V:SendKeyEvent(d,Enum.KeyCode.F,false,game)end
local function cM()if typeof(mouse1click)=="function"then return mouse1click()end;V:SendMouseButtonEvent(0,0,0,true,game,0);V:SendMouseButtonEvent(0,0,0,false,game,0)end
local function fin()if fh then pF(false);fh=false end;cM()end
local function dto(c)local m=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")local t=c:FindFirstChild("HumanoidRootPart")if not m or not t then return 999 end;return(m.Position-t.Position).Magnitude end
R.Heartbeat:Connect(function()local l=W:FindFirstChild("Live")if not l then return end;for _,c in ipairs(l:GetChildren())do if c~=lp.Character then local h=c:FindFirstChildOfClass("Humanoid")if h then local ok,ts=pcall(function()return h:GetPlayingAnimationTracks()end)if ok then for _,t in ipairs(ts)do if not tt[t]then local id=t.Animation and t.Animation.AnimationId;local cfg=L[id]if cfg and dto(c)<=cfg.r and tick()*1000-lt>100 then tt[t]=true;lt=tick()*1000;if not fh then pF(true);fh=true end;print("[parry] "..c.Name.." "..cfg.n)local done=false;local cc;cc=t.Stopped:Connect(function()if cc then cc:Disconnect()end;if not done then done=true;fin()end end);task.delay(cfg.m/1000,function()if cc then cc:Disconnect()end;if not done then done=true;fin()end end);task.delay(2,function()tt[t]=nil end)break end end end end end end end end)
print("[auto_parry_aba v21mini] loaded")
