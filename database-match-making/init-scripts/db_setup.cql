CREATE KEYSPACE match_making WITH 
replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE match_making.users 
(   userId text, 
    name text,
    accessToken text, 
    accessTokenExpirationTime text, 
    permissions list<text>, 
    type text,     
    PRIMARY KEY (userId, type) );

CREATE TABLE match_making.user_calibrations 
(   calibrationId text PRIMARY KEY, 
    userId text, 
    startDate timestamp,
    endDate timestamp,
    modelsGenerated boolean );

CREATE INDEX userCalibrationsByUserId ON match_making.user_calibrations (userId);

CREATE TABLE match_making.user_calibrations_eeg_data 
(   pk timeuuid PRIMARY KEY,
    userId text, 
    calibrationId text, 
    eeg list<text>,
    date timestamp,
    label text );

CREATE INDEX userCalibrationsEegDataByCalibrationId ON match_making.user_calibrations_eeg_data (calibrationId);

CREATE TABLE match_making.user_instructions_eeg_data 
(   pk timeuuid,
    userId text, 
    eeg list<text>,
    date timestamp,
    predictedLabels map<text,text>,
    PRIMARY KEY ((userId), pk) );

CREATE TABLE match_making.meditation_rooms 
(   roomId text PRIMARY KEY, 
    students list<text>,
    size bigint,
    status text );

CREATE INDEX meditationRoomsByStatus ON match_making.meditation_rooms (status);
