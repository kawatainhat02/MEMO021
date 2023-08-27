1+1
2

1+1 == 2
true

2 sqrt
1.414214

a := 1
1

a
1

b := 2 * 3
6

a + b
7

a := 2

(a == 1) ifTrue("a is one" println) ifFalse("a is not one" println)
a is not one

if(a == 1, writeln("a is one"), writeln("a is not one"))
a is not one

d := List clone append(30, 10, 5, 20)    
list(30, 10, 5, 20)

d size
4

d print
list(30, 10, 5, 20)

d := d sort
list(5, 10, 20, 30)

d first
5

d last
30

d at(2)
20

d remove(30)
list(5, 10, 20)

d atPut(1, 123)
list(5, 123, 20)

list(30, 10, 5, 20) select(>10)
list(30, 20)

list(30, 10, 5, 20) detect(>10)
30

list(30, 10, 5, 20) map(*2)
list(60, 20, 10, 40)

list(30, 10, 5, 20) map(v, v*2)
list(60, 20, 10, 40)

for(i, 1, 10, write(i, " "))
1 2 3 4 5 6 7 8 9 10 

d foreach(i, v, writeln(i, ": ", v))
0: 5
1: 123
2: 20

list("abc", "def", "ghi") foreach(println)
abc
def
ghi

dict := Map clone    
dict atPut("hello", "a greeting")   
dict atPut("goodbye", "a parting")   
dict hasKey("hello")   
true

dict hasValue("a greeting")   
true

dict at("hello")   
a greeting

dict keys  
list("hello", "goodbye")

dict foreach(k, v, (k .. ":" .. v) println)
hello: a greeting
goodbye: a parting

a := "foo"
"foo"

b := "bar"
"bar"

c := a .. b
"foobar"

c at(0)
102

c at(0) asCharacter
"f"

s := "this is a test"
"this is a test"

words := s split(" ", "\t") 
list(this, is, a, test)

words join(" ")
this is a test

s findSeq("is")
2

s findSeq("test")
10

s slice(10)
"test"

s slice(2, 10)
"is is a "

Contact := Object clone
 Contact_0x7fad4365a640:
    type = "Contact"

Contact type
Contact

Contact proto type
Object

Contact name ::= nil
nil

Contact address ::= nil
nil

Contact city ::= nil
nil

holmes := Contact clone setName("Holmes") setAddress("221B Baker St") setCity("London")
Contact_0x7fad4365a640
    type = "Contact"
    name = "Holmes"
    address = "221B Baker St"
    city = "London"

holmes slotNames
list("type", "name", "address", "city")

Contact fullAddress := method(list(name, address, city) join("\n"))
method(
  list(name, address, city) join("\n")
)

holmes fullAddress
"Holmes
221B Baker St
London"

holmes getSlot("fullAddress")
method(
  list(name, address, city) join("\n")
)

BusinessContact := Contact clone do(
	companyName ::= ""
	fullAddress := method(
		list(companyName, "Care of: " .. name, address, city) join("\n")
	)
)

steve := BusinessContact clone do(
	setName("Steve") 
	setCompanyName("Apple Inc.") 
	setAddress("1 Infinite Loop")
	setCity("Cupertino")
)

steve fullAddress

   Apple Inc.
   Care of: Steve Jobs
   1 Infinite Loop
   Cupertino


Lazy Evaluation

assert := method(
	call sender doMessage(call message argAt(0)) ifFalse(
		Exception raise("failed assertion: " .. call message asString)
	)
)

assert(1 == 3)


  Exception: failed assertion: assert(1 ==(3))
  ---------
  Exception raise                      Command Line 1
  Object assert                        Command Line 1

Address := Object clone do(
		fields ::= list("name", "street", "city", "state", "zipCode")

		init := method(
			fields foreach(key, 
				if (self hasSlot(key) not,
					self newSlot(key, nil)
				) 
			)
		)

		emptyFields := method(
			fields select(k, self getSlot(k) == nil)
		)

		isValid := method(errors size == 0)

		assertValid := method(
			if (emptyFields size, 
				Exception raise(
				   self type .. " missing: " .. emptyFields join(", ")
				)
			)
		)
	)

	anAddress := Address clone setName("Alan") setStreet("6502 Mem Ln")

	anAddress assertValid


  Exception: Address missing: city, state, zipCode
  ---------
  Exception raise                      test.io 19
  Address assertValid                  test.io 25
  CLI doFile                           Z_CLI.io 140
  CLI run                              IoState_runCLI() 1

e := try(
    anAddress assertValid
)

e catch(Exception,
    writeln("Caught: ", e error, "\nstack:\n", e coroutine backTraceString)
)


	Caught: Address missing: state, zipCode
	stack:

	  Exception: Address missing: state, zipCode
	  ---------
	  Exception raise                      test.io 19
	  Address assertValid                  test.io 28


Lobby slotNames
list(set_, Protos, Lobby, _, exit, forward)
  
Lobby Protos slotNames
list(Core, Addons)

Lobby protos Core slotNames
list(Duration, Number, Eol, Coroutine, Sequence, DynLib, Normal, Notifier, ImmutableSequence, Collector, Debugger, Directory, CFunction, Block, vector, WeakLink, nil, false, CLI, Compiler, RunnerMixIn, Continue, File, TestSuite, Future, DirectoryCollector, Scheduler, UnitTest, FileCollector, FutureProxy, Date, true, Map, Break, List, AddonLoader, Call, String, Sandbox, Importer, Exception, DummyLine, Locals, Error, TestRunner, Profiler, Object, System, Path, Addon, SerializationStream, Return, OperatorTable, Vector, Message)

Lobby protos Core Date slotNames
list(zone, -=, month, fromNumber, asSerialization, secondsToRun, +, print, isValidTime, setGmtOffset, fromSerialization, fromString, setDay, now, asJson, clock, timeStampString, setToUTC, asNumberString, setSecond, second, minute, format, year, convertToLocal, today, -, setYear, setMinute, hour, +=, asString, asAtomDate, secondsSinceNow, isDaylightSavingsTime, justSerialized, secondsSince, isDST, cpuSecondsToRun, gmtOffsetSeconds, asNumber, copy, isPast, gmtOffset, setHour, isToday, convertToUTC, convertToZone, setMonth, day)

m := method(a(b) + c)
 method(
   a(b) + c
)

getSlot("m") message
 a(b) +(c)

getSlot("m") message next
 +(c)

getSlot("m") message name
 a

getSlot("m") message setName("foo")
 foo(b) +(c)

getSlot("m") message name
 foo

getSlot("m") message arguments
 list(b)

Message slotNames
 list(name, lastBeforeEndOfLine, removeCachedResult, union, fromString, asMessageWithEvaluatedArgs, appendArg, argAt, argCount, clone, setCharacterNumber, isEndOfLine, label, code, setLineNumber, lineNumber, codeOfLength, doInContext, cachedResult, previous, asStackEntry, setLabel, setArguments, appendCachedArg, setCachedResult, asString, arguments, hasCachedResult, description, nextIgnoreEndOfLines, last, setName, setNext, opShuffle, asSimpleString, OperatorTable, argsEvaluatedIn, next, opShuffleC, characterNumber)


