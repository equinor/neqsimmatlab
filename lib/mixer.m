function mixer = mixer(name)
% p specifies the outlet pressure
global processOperations

pathNeqSim();

mixer = neqsim.processSimulation.processEquipment.mixer.StaticMixer;
if (nargin >= 1)
    mixer.setName(name);
end
processOperations.add(mixer);