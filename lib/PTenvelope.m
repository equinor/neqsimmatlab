function testFlash = PTenvelope(testSystem)
pathNeqSim();

testSystem.init(0)
testSystem.init(1)
testFlash = neqsim.thermodynamicOperations.ThermodynamicOperations(testSystem);
testFlash.calcPTphaseEnvelope();
testFlash.displayResult();
return;