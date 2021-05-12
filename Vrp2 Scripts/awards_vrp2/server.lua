

local lang = vRP.lang
local Luang = module("vrp", "lib/Luang")

local cfg = module("awards_vrp2", "cfg/paycheck")

local paycheck = class("paycheck", vRP.Extension)


function paycheck:__construct()
  vRP.Extension.__construct(self)

  -- task: mission
  local function paycheck_giver()
    SetTimeout(1000*60*cfg.minutes_paycheck,paycheck_giver)
    self:paycheck_giver()
  end
  async(function()
    paycheck_giver()
  end)
  
  
  -- task: mission
  local function paycheck_prize()
    SetTimeout(1000*60*cfg.minutes_prize,paycheck_prize)
    self:paycheck_prize()
  end
  async(function()
    paycheck_prize()
  end)  

  -- task: mission
  local function aptitude_police()
    SetTimeout(1000*60*cfg.minutes_police,aptitude_police)
    self:aptitude_police()
  end
  async(function()
    aptitude_police()
  end)    


  -- task: mission
  local function aptitude_ems()
    SetTimeout(1000*60*cfg.minutes_ems,aptitude_ems)
    self:aptitude_ems()
  end
  async(function()
    aptitude_ems()
  end)  
  
  -- task: mission
  local function aptitude_noogle()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_noogle)
    self:aptitude_noogle()
  end
  async(function()
    aptitude_noogle()
  end) 
  
  local function aptitude_MacroSoft()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_MacroSoft)
    self:aptitude_MacroSoft()
  end
  async(function()
    aptitude_MacroSoft()
  end) 
  
  local function aptitude_YouCube()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_YouCube)
    self:aptitude_YouCube()
  end
  async(function()
    aptitude_YouCube()
  end) 
  
  local function aptitude_LanFlix()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_LanFlix)
    self:aptitude_LanFlix()
  end
  async(function()
    aptitude_LanFlix()
  end) 
  
  local function aptitude_PonrBuh()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_PonrBuh)
    self:aptitude_PonrBuh()
  end
  async(function()
    aptitude_PonrBuh()
  end) 
  
  local function aptitude_Odnokyrsniki()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_Odnokyrsniki)
    self:aptitude_Odnokyrsniki()
  end
  async(function()
    aptitude_Odnokyrsniki()
  end) 
  
  local function aptitude_Somy()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_Somy)
    self:aptitude_Somy()
  end
  async(function()
    aptitude_Somy()
  end) 
  
  local function aptitude_FiveN()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_FiveN)
    self:aptitude_FiveN()
  end
  async(function()
    aptitude_FiveN()
  end) 
  
  local function aptitude_AmazingAndCorp()
    SetTimeout(1000*60*cfg.minutes_noogle,aptitude_AmazingAndCorp)
    self:aptitude_AmazingAndCorp()
  end
  async(function()
    aptitude_AmazingAndCorp()
  end) 

  
end


function paycheck:aptitude_noogle(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(1450,1700)
	  if user:hasPermission("Noogle.Noogle") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату Noogle:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_MacroSoft(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(1150,1350)
	  if user:hasPermission("MacroSoft.MacroSoft") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату MacroSoft:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_YouCube(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(950,1100)
	  if user:hasPermission("YouCube.YouCube") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату YouCube:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_LanFlix(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(700,850)
	  if user:hasPermission("LanFlix.LanFlix") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату LanFlix:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_PonrBuh(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(500,600)
	  if user:hasPermission("PonrBuh.PonrBuh") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату PonrBuh:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_Odnokyrsniki(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(400,460)
	  if user:hasPermission("Odnokyrsniki.Odnokyrsniki") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату Odnokyrsniki:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_Somy(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(225,275)
	  if user:hasPermission("Somy.Somy") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату Somy:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_FiveN(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(150,170)
	  if user:hasPermission("FiveN.FiveN") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату FiveN:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_AmazingAndCorp(user)
  for k,v in pairs(cfg.noogle) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(15,17)
	  if user:hasPermission("AmazingAndCorp.AmazingAndCorp") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили выплату AmazingAndCorp:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_police(user)
  for k,v in pairs(cfg.police) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(250,300)
	  if user:hasPermission("police.pc") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили ЗП:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
	  end
	end
  end
end

function paycheck:aptitude_ems(user)
  for k,v in pairs(cfg.ems) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  local paycheck = math.random(250,300)
	  if user:hasPermission("emergency.shop") then
		vRP.EXT.Base.remote._notify(user.source,"Вы получили ЗП:~g~ $"..paycheck)
		
		user:giveBank(paycheck)
		
		end
	end
  end
end

function paycheck:paycheck_giver(user)
  for k,v in pairs(cfg.paycheck) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	local paycheck = math.random(200,1000)

	  if user:hasPermission("citizen.paycheck") then
		user:giveBank(paycheck)	
		vRP.EXT.Base.remote._notifyPicture(user.source,cfg.paycheck_picture, 9, cfg.paycheck_title_picture, false, cfg.message_paycheck..paycheck)
		end
	end
  end
end

function paycheck:paycheck_prize(user)
  for k,v in pairs(cfg.prize) do
    local users = vRP.EXT.Group:getUsersByPermission(k)
    for _,user in pairs(users) do
	  
	  local st = "strength.t"
	  local ammo = "wammo|WEAPON_COMBATPISTOL|50"
	  local ammo2 = "wammo|WEAPON_PISTOL|50"
	  local ammo3 = "wammo|WEAPON_PUMPSHOTGUN|50"
	  local drink = "edible|redgull"
	  local taco = "edible|tacos"


	  if user:hasPermission("citizen.paycheck") then
	  vRP.EXT.Base.remote._notifyPicture(user.source,cfg.bill_picture, 9, cfg.bill_title_picture, false, "Registered Citizen Item Bonus")
	  user:tryGiveItem(st,math.random(-15,20))
	  user:tryGiveItem(ammo,math.random(-30,2))
	  user:tryGiveItem(ammo2,math.random(-30,3))
	  user:tryGiveItem(ammo3,math.random(-30,1))
	  user:tryGiveItem(drink,math.random(1,1))
	  user:tryGiveItem(taco,math.random(1,1))
	  user:tryGiveItem("gem",math.random(-50,1))

	  end
	end
  end
end


vRP:registerExtension(paycheck)