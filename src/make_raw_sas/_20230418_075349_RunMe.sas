%macro grabpath;
  %qsubstr(%sysget(SAS_EXECFILEPATH),1,%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILEname)))
%mend grabpath;
%let path=%grabpath;
%let prefix=_20230418_075349_;
%include "&path.\CSV2SAS.sas";
%doWork(&path.,&prefix.);
