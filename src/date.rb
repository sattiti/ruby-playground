def isLeapYear(y)
  if y % 4 == 0 && y % 100 != 0 || y % 400 == 0
    return true
  else
    return false
  end
end


# 0: sat
# 1: sun
# 2: mon
def zeller(y, m, d)
  day = ['sa', 'su', 'mo', 'tu', 'we', 'th', 'fr']
  # convert jan to 13, feb to 14
  if m == 1
    m = 13
    y -=1
  elsif m == 2
    m = 14
    y -=1
  end

  # calculate the century and year of century
  century       = y / 100
  yearOfCentury = y % 100

  r = ((d + (((m + 1) * 26) / 10) +  yearOfCentury + (yearOfCentury / 4) + (century / 4)) + (5 * century)) % 7
  day[r]
end

puts isLeapYear(2016)
puts zeller(2016,5,15)
