function separator = separator(teststream,name)
global processOperations

pathNeqSim();

separator = neqsim.processSimulation.processEquipment.separator.ThreePhaseSeparator(teststream);
if (nargin >= 2)
    separator.setName(name);
end
processOperations.add(separator);