module maybeOrNot

import stools

function getMonthName = |mo| {
  let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
      "Aug", "Sep", "Oct", "Nov", "Dec"]
  try {
    return months: get(mo - 1)
  } catch(err) {
    raise("Invalid Month Number")
  }
}

function getDayName = |da| {
  let days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
  try {
    return days: get(da - 1)
  } catch(err) {
    raise("Invalid Day Number")
  }
}


function main = |args| {

  let giveMeMonthName = |monthNumber| {
    try {
      return Either(): right(getMonthName(monthNumber))
    } catch (e) {
      return Either(): left(e: message())
    }
  }

  let giveMeDayName = |dayNumber| {
    try {
      return Either(): right(getDayName(dayNumber))
    } catch (e) {
      return Either(): left(e: message())
    }
  }

  println( giveMeMonthName(1): getOrElse("oups") )
  println( giveMeMonthName(15): getOrElse("oups") )
  println( giveMeDayName(42): getOrElse("oups") )

}