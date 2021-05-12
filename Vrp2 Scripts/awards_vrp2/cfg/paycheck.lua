local cfg = {}

-- paycheck and bill for users
cfg.message_paycheck = "Registered Citizen Cash Bonus: ~g~$" -- message that will show before payment of salary
cfg.message_bill = "You paid your taxes: ~r~$" -- message that will show before payment of bill


cfg.minutes_paycheck = 25 -- minutes between payment for paycheck
cfg.minutes_prize = 62 -- minutes between withdrawal for bill
cfg.minutes_police = 20 -- */*/minutes between withdrawal for bill
cfg.minutes_ems = 20 -- minutes between withdrawal for bill
cfg.minutes_noogle = 20 -- minutes between withdrawal for bill



cfg.paycheck = { 
  ["citizen.paycheck1111"] = 1500

}

cfg.prize = { 
  ["citizen.paycheck111"] = 150

}

cfg.police = { 
  ["police.pc"] = 150

}

cfg.ems = { 
  ["emergency.shop"] = 150

}

cfg.noogle = { 
  ["Noogle.Noogle"] = 150

}
return cfg
