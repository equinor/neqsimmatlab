function S = enthalpy(thermoSystem,t,p)
% Calculates the molar enthalpy for a given thermodynamic system
% function S = enthalpy(thermoSystem,t,p)
%
% INPUT:
%  - thermoSystem - Thermodynamic system object
%
% OPTIONAL INPUT:
%  - t            - Set temperature of thermoSystem
%  - p            - Set pressure of thermoSystem
%
% OUTPUT:
%  - S            - Output array
%
% DESCRIPTION:
% Calculates the molar enthalpy for a given thermodynamic system.
% If temperature or pressure are specified - a TP flash is done.
% The output is mix enthalpy, gas phase enthalpy, liquid phase enthalpy
% and the number of phases.
%
% EXAMPLE:
% S = enthalpy(thermoSystem,t,p);

% Even Solbraa, 2001.

if nargin > 2
    thermoSystem.setPressure(p);
end
if nargin > 1
    if ~isempty(t)
        thermoSystem.setTemperature(t);
    end
    TPflash(thermoSystem,0);
end
thermoSystem.init(3);

S(4) = thermoSystem.getNumberOfPhases();
S(1) = thermoSystem.getEnthalpy/thermoSystem.getNumberOfMoles();
if thermoSystem.getNumberOfPhases == 1
    if thermoSystem.getPhase(0).getPhaseType == 1
        S(2) = thermoSystem.getPhase(0).getEnthalpy()/thermoSystem.getPhase(0).getNumberOfMolesInPhase();
        S(3) = 0;
    else
        S(3) = thermoSystem.getPhase(0).getEnthalpy()/thermoSystem.getPhase(0).getNumberOfMolesInPhase();
        S(2) = 0;
    end
else
    S(2) = thermoSystem.getPhase(0).getEnthalpy()/thermoSystem.getPhase(0).getNumberOfMolesInPhase();
    S(3) = thermoSystem.getPhase(1).getEnthalpy()/thermoSystem.getPhase(1).getNumberOfMolesInPhase();
end