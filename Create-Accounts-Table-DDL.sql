-- Create the tables
CREATE TABLE Checking (
   AccountID CHAR (5) NOT NULL,
   Amount NUMBER NOT NULL,
   PRIMARY KEY (AccountID),
   CONSTRAINT Chk_ID_Ck CHECK (NOT REGEXP_LIKE (AccountID, '[^0-9]')),
   CONSTRAINT Chk_Amt_Ck CHECK (Amount >= 0)
);

CREATE TABLE Savings (
   AccountID CHAR (5) NOT NULL,
   Amount NUMBER NOT NULL,
   PRIMARY KEY (AccountID),
   CONSTRAINT Sav_ID_Ck CHECK (NOT REGEXP_LIKE (AccountID, '[^0-9]')),
   CONSTRAINT Sav_Amt_Ck CHECK (Amount >= 0)
);

CREATE TABLE Accounts (
   AccountID CHAR (5) NOT NULL,
   SavingsID CHAR (5) NOT NULL UNIQUE,
   PIN CHAR (5) NOT NULL,
   Name VARCHAR2 (50) NOT NULL,
   PRIMARY KEY (AccountID),
   FOREIGN KEY (AccountID) REFERENCES Checking (AccountID),
   FOREIGN KEY (SavingsID) REFERENCES Savings (AccountID),
   CONSTRAINT Acc_ID_Ck CHECK (NOT REGEXP_LIKE (AccountID, '[^0-9]')),
   CONSTRAINT Acc_Sav_Ck CHECK (NOT REGEXP_LIKE (SavingsID, '[^0-9]')),
   CONSTRAINT Acc_PIN_Ck CHECK (NOT REGEXP_LIKE (PIN, '[^0-9]'))
);


-- Insert data into the Checking table
INSERT INTO Checking (AccountID, Amount)
VALUES ('90617', 14687.01);
INSERT INTO Checking (AccountID, Amount)
VALUES ('56606', 41596.09);
INSERT INTO Checking (AccountID, Amount)
VALUES ('72914', 3092.27);
INSERT INTO Checking (AccountID, Amount)
VALUES ('78151', 29014.59);
INSERT INTO Checking (AccountID, Amount)
VALUES ('98045', 79554.07);
INSERT INTO Checking (AccountID, Amount)
VALUES ('59006', 2707.27);
INSERT INTO Checking (AccountID, Amount)
VALUES ('89469', 6380.08);
INSERT INTO Checking (AccountID, Amount)
VALUES ('14300', 70156.67);
INSERT INTO Checking (AccountID, Amount)
VALUES ('76599', 8721241.95);
INSERT INTO Checking (AccountID, Amount)
VALUES ('94537', 21143.23);
INSERT INTO Checking (AccountID, Amount)
VALUES ('64337', 947394.97);
INSERT INTO Checking (AccountID, Amount)
VALUES ('77897', 63483.96);
INSERT INTO Checking (AccountID, Amount)
VALUES ('87321', 41533.88);
INSERT INTO Checking (AccountID, Amount)
VALUES ('72215', 12778.20);
INSERT INTO Checking (AccountID, Amount)
VALUES ('89615', 126104.40);
INSERT INTO Checking (AccountID, Amount)
VALUES ('54432', 721545.53);
INSERT INTO Checking (AccountID, Amount)
VALUES ('55958', 526155.93);
INSERT INTO Checking (AccountID, Amount)
VALUES ('60291', 34386.35);
INSERT INTO Checking (AccountID, Amount)
VALUES ('02798', 151690.68);
INSERT INTO Checking (AccountID, Amount)
VALUES ('96238', 150401.16);
INSERT INTO Checking (AccountID, Amount)
VALUES ('91319', 400586.93);
INSERT INTO Checking (AccountID, Amount)
VALUES ('91929', 33119.88);
INSERT INTO Checking (AccountID, Amount)
VALUES ('89591', 48427.90);
INSERT INTO Checking (AccountID, Amount)
VALUES ('15260', 98745.87);
INSERT INTO Checking (AccountID, Amount)
VALUES ('76309', 36852.03);
INSERT INTO Checking (AccountID, Amount)
VALUES ('68994', 79343.31);
INSERT INTO Checking (AccountID, Amount)
VALUES ('69992', 31730.78);
INSERT INTO Checking (AccountID, Amount)
VALUES ('05606', 30005.95);
INSERT INTO Checking (AccountID, Amount)
VALUES ('64862', 573759.11);
INSERT INTO Checking (AccountID, Amount)
VALUES ('14625', 47272.19);
INSERT INTO Checking (AccountID, Amount)
VALUES ('62978', 78752.37);
INSERT INTO Checking (AccountID, Amount)
VALUES ('42746', 818057.62);
INSERT INTO Checking (AccountID, Amount)
VALUES ('32223', 27921.47);
INSERT INTO Checking (AccountID, Amount)
VALUES ('90873', 28508.90);
INSERT INTO Checking (AccountID, Amount)
VALUES ('85340', 26775.57);
INSERT INTO Checking (AccountID, Amount)
VALUES ('99784', 13235.32);
INSERT INTO Checking (AccountID, Amount)
VALUES ('43933', 8206.43);
INSERT INTO Checking (AccountID, Amount)
VALUES ('18283', 60.39);
INSERT INTO Checking (AccountID, Amount)
VALUES ('70039', 61858.10);
INSERT INTO Checking (AccountID, Amount)
VALUES ('96857', 48325.62);
INSERT INTO Checking (AccountID, Amount)
VALUES ('69472', 4072.04);
INSERT INTO Checking (AccountID, Amount)
VALUES ('86467', 134368.91);
INSERT INTO Checking (AccountID, Amount)
VALUES ('69360', 229117.95);
INSERT INTO Checking (AccountID, Amount)
VALUES ('56569', 2246.37);
INSERT INTO Checking (AccountID, Amount)
VALUES ('93368', 346289.43);
INSERT INTO Checking (AccountID, Amount)
VALUES ('97184', 8309.90);
INSERT INTO Checking (AccountID, Amount)
VALUES ('71720', 20396.45);
INSERT INTO Checking (AccountID, Amount)
VALUES ('87800', 74294.77);
INSERT INTO Checking (AccountID, Amount)
VALUES ('41856', 49372.68);
INSERT INTO Checking (AccountID, Amount)
VALUES ('70924', 24297.53);
INSERT INTO Checking (AccountID, Amount)
VALUES ('38918', 552911.83);
INSERT INTO Checking (AccountID, Amount)
VALUES ('86597', 6381.34);
INSERT INTO Checking (AccountID, Amount)
VALUES ('60709', 613031.66);
INSERT INTO Checking (AccountID, Amount)
VALUES ('28021', 3516.57);
INSERT INTO Checking (AccountID, Amount)
VALUES ('23197', 94517.06);
INSERT INTO Checking (AccountID, Amount)
VALUES ('44874', 26609.49);
INSERT INTO Checking (AccountID, Amount)
VALUES ('75914', 149836.25);
INSERT INTO Checking (AccountID, Amount)
VALUES ('24888', 600928.04);
INSERT INTO Checking (AccountID, Amount)
VALUES ('75085', 39652.45);
INSERT INTO Checking (AccountID, Amount)
VALUES ('59644', 70077452.95);
INSERT INTO Checking (AccountID, Amount)
VALUES ('65320', 19910.19);
INSERT INTO Checking (AccountID, Amount)
VALUES ('87310', 957883.14);
INSERT INTO Checking (AccountID, Amount)
VALUES ('65290', 16208.92);
INSERT INTO Checking (AccountID, Amount)
VALUES ('52751', 10020.60);
INSERT INTO Checking (AccountID, Amount)
VALUES ('93880', 114281.43);
INSERT INTO Checking (AccountID, Amount)
VALUES ('23151', 70513.29);
INSERT INTO Checking (AccountID, Amount)
VALUES ('23380', 16837951.74);
INSERT INTO Checking (AccountID, Amount)
VALUES ('77906', 10614.18);
INSERT INTO Checking (AccountID, Amount)
VALUES ('02031', 32399.93);
INSERT INTO Checking (AccountID, Amount)
VALUES ('15506', 57390522.99);
INSERT INTO Checking (AccountID, Amount)
VALUES ('72340', 31188.20);
INSERT INTO Checking (AccountID, Amount)
VALUES ('32059', 21312.30);
INSERT INTO Checking (AccountID, Amount)
VALUES ('53484', 8869.81);
INSERT INTO Checking (AccountID, Amount)
VALUES ('75014', 4714.78);
INSERT INTO Checking (AccountID, Amount)
VALUES ('11565', 28618.97);
INSERT INTO Checking (AccountID, Amount)
VALUES ('38787', 19083.43);
INSERT INTO Checking (AccountID, Amount)
VALUES ('19203', 79829.62);
INSERT INTO Checking (AccountID, Amount)
VALUES ('59903', 74726.61);
INSERT INTO Checking (AccountID, Amount)
VALUES ('06602', 27937.38);
INSERT INTO Checking (AccountID, Amount)
VALUES ('82429', 63130125.75);
INSERT INTO Checking (AccountID, Amount)
VALUES ('21429', 80022.47);
INSERT INTO Checking (AccountID, Amount)
VALUES ('59943', 50661.24);
INSERT INTO Checking (AccountID, Amount)
VALUES ('00908', 320171.75);
INSERT INTO Checking (AccountID, Amount)
VALUES ('46715', 931397.02);
INSERT INTO Checking (AccountID, Amount)
VALUES ('49387', 7167.46);
INSERT INTO Checking (AccountID, Amount)
VALUES ('52287', 44626.46);
INSERT INTO Checking (AccountID, Amount)
VALUES ('44270', 97776224.76);
INSERT INTO Checking (AccountID, Amount)
VALUES ('71638', 144773.18);
INSERT INTO Checking (AccountID, Amount)
VALUES ('39493', 49563.31);
INSERT INTO Checking (AccountID, Amount)
VALUES ('16352', 31878.03);
INSERT INTO Checking (AccountID, Amount)
VALUES ('79395', 39166.28);
INSERT INTO Checking (AccountID, Amount)
VALUES ('18320', 483407.53);
INSERT INTO Checking (AccountID, Amount)
VALUES ('46621', 44668.56);
INSERT INTO Checking (AccountID, Amount)
VALUES ('73913', 32766.17);
INSERT INTO Checking (AccountID, Amount)
VALUES ('58117', 16670.43);
INSERT INTO Checking (AccountID, Amount)
VALUES ('78821', 138995.21);
INSERT INTO Checking (AccountID, Amount)
VALUES ('86707', 10125.27);
INSERT INTO Checking (AccountID, Amount)
VALUES ('30481', 53206.26);
INSERT INTO Checking (AccountID, Amount)
VALUES ('62182', 17755.60);
INSERT INTO Checking (AccountID, Amount)
VALUES ('35940', 17016.76);

-- Insert data into the Savings table
INSERT INTO Savings (AccountID, Amount)
VALUES ('21757', 1788.20);
INSERT INTO Savings (AccountID, Amount)
VALUES ('73744', 71392.48);
INSERT INTO Savings (AccountID, Amount)
VALUES ('07964', 52577.88);
INSERT INTO Savings (AccountID, Amount)
VALUES ('42121', 2816.83);
INSERT INTO Savings (AccountID, Amount)
VALUES ('26332', 35866.78);
INSERT INTO Savings (AccountID, Amount)
VALUES ('35437', 1254.01);
INSERT INTO Savings (AccountID, Amount)
VALUES ('14348', 69415.52);
INSERT INTO Savings (AccountID, Amount)
VALUES ('95637', 19278.83);
INSERT INTO Savings (AccountID, Amount)
VALUES ('95942', 157030.40);
INSERT INTO Savings (AccountID, Amount)
VALUES ('47513', 37058.60);
INSERT INTO Savings (AccountID, Amount)
VALUES ('60478', 14803.29);
INSERT INTO Savings (AccountID, Amount)
VALUES ('79126', 15494.23);
INSERT INTO Savings (AccountID, Amount)
VALUES ('61122', 116635.73);
INSERT INTO Savings (AccountID, Amount)
VALUES ('83181', 15071.93);
INSERT INTO Savings (AccountID, Amount)
VALUES ('44011', 59853295.45);
INSERT INTO Savings (AccountID, Amount)
VALUES ('59475', 35870.30);
INSERT INTO Savings (AccountID, Amount)
VALUES ('16177', 20207.03);
INSERT INTO Savings (AccountID, Amount)
VALUES ('16188', 74578.16);
INSERT INTO Savings (AccountID, Amount)
VALUES ('36878', 72423.69);
INSERT INTO Savings (AccountID, Amount)
VALUES ('27263', 14952.00);
INSERT INTO Savings (AccountID, Amount)
VALUES ('61925', 53536.74);
INSERT INTO Savings (AccountID, Amount)
VALUES ('64572', 125923.33);
INSERT INTO Savings (AccountID, Amount)
VALUES ('51227', 27476.05);
INSERT INTO Savings (AccountID, Amount)
VALUES ('84433', 1804.84);
INSERT INTO Savings (AccountID, Amount)
VALUES ('56283', 7855.25);
INSERT INTO Savings (AccountID, Amount)
VALUES ('31895', 12334.77);
INSERT INTO Savings (AccountID, Amount)
VALUES ('64396', 39000.71);
INSERT INTO Savings (AccountID, Amount)
VALUES ('32902', 9539.21);
INSERT INTO Savings (AccountID, Amount)
VALUES ('55448', 29802.46);
INSERT INTO Savings (AccountID, Amount)
VALUES ('68485', 148319.94);
INSERT INTO Savings (AccountID, Amount)
VALUES ('05861', 2053.01);
INSERT INTO Savings (AccountID, Amount)
VALUES ('71504', 59730.56);
INSERT INTO Savings (AccountID, Amount)
VALUES ('49119', 32766.46);
INSERT INTO Savings (AccountID, Amount)
VALUES ('00383', 62062.09);
INSERT INTO Savings (AccountID, Amount)
VALUES ('49126', 36999.61);
INSERT INTO Savings (AccountID, Amount)
VALUES ('06208', 27207.91);
INSERT INTO Savings (AccountID, Amount)
VALUES ('71598', 253907.78);
INSERT INTO Savings (AccountID, Amount)
VALUES ('62931', 167607.51);
INSERT INTO Savings (AccountID, Amount)
VALUES ('95493', 163460.50);
INSERT INTO Savings (AccountID, Amount)
VALUES ('50011', 55014.70);
INSERT INTO Savings (AccountID, Amount)
VALUES ('29257', 77904.25);
INSERT INTO Savings (AccountID, Amount)
VALUES ('40307', 22715.27);
INSERT INTO Savings (AccountID, Amount)
VALUES ('42082', 69472.16);
INSERT INTO Savings (AccountID, Amount)
VALUES ('59002', 65326.49);
INSERT INTO Savings (AccountID, Amount)
VALUES ('04230', 50502.19);
INSERT INTO Savings (AccountID, Amount)
VALUES ('69171', 19104.11);
INSERT INTO Savings (AccountID, Amount)
VALUES ('55206', 46411.63);
INSERT INTO Savings (AccountID, Amount)
VALUES ('12272', 48717.11);
INSERT INTO Savings (AccountID, Amount)
VALUES ('53685', 38675.40);
INSERT INTO Savings (AccountID, Amount)
VALUES ('20517', 41557.84);
INSERT INTO Savings (AccountID, Amount)
VALUES ('98720', 436044.45);
INSERT INTO Savings (AccountID, Amount)
VALUES ('94077', 311612.86);
INSERT INTO Savings (AccountID, Amount)
VALUES ('44356', 39011.07);
INSERT INTO Savings (AccountID, Amount)
VALUES ('05061', 51903.97);
INSERT INTO Savings (AccountID, Amount)
VALUES ('97908', 87190.82);
INSERT INTO Savings (AccountID, Amount)
VALUES ('72487', 16342.68);
INSERT INTO Savings (AccountID, Amount)
VALUES ('63326', 15751.78);
INSERT INTO Savings (AccountID, Amount)
VALUES ('78726', 18974.40);
INSERT INTO Savings (AccountID, Amount)
VALUES ('62664', 44604.42);
INSERT INTO Savings (AccountID, Amount)
VALUES ('64201', 89362.89);
INSERT INTO Savings (AccountID, Amount)
VALUES ('74356', 14084.73);
INSERT INTO Savings (AccountID, Amount)
VALUES ('12124', 24062.74);
INSERT INTO Savings (AccountID, Amount)
VALUES ('35606', 2034453.44);
INSERT INTO Savings (AccountID, Amount)
VALUES ('86863', 77345.48);
INSERT INTO Savings (AccountID, Amount)
VALUES ('34747', 70299.92);
INSERT INTO Savings (AccountID, Amount)
VALUES ('59090', 210346.08);
INSERT INTO Savings (AccountID, Amount)
VALUES ('72669', 34981.68);
INSERT INTO Savings (AccountID, Amount)
VALUES ('17877', 38501.75);
INSERT INTO Savings (AccountID, Amount)
VALUES ('93020', 512778.07);
INSERT INTO Savings (AccountID, Amount)
VALUES ('17825', 721181.50);
INSERT INTO Savings (AccountID, Amount)
VALUES ('42924', 28818.41);
INSERT INTO Savings (AccountID, Amount)
VALUES ('50210', 3432035.35);
INSERT INTO Savings (AccountID, Amount)
VALUES ('29134', 122394.70);
INSERT INTO Savings (AccountID, Amount)
VALUES ('45356', 2720.89);
INSERT INTO Savings (AccountID, Amount)
VALUES ('92426', 30720.15);
INSERT INTO Savings (AccountID, Amount)
VALUES ('34595', 54664.77);
INSERT INTO Savings (AccountID, Amount)
VALUES ('62159', 97203.62);
INSERT INTO Savings (AccountID, Amount)
VALUES ('63739', 958619.26);
INSERT INTO Savings (AccountID, Amount)
VALUES ('21870', 46789.56);
INSERT INTO Savings (AccountID, Amount)
VALUES ('79328', 13993.22);
INSERT INTO Savings (AccountID, Amount)
VALUES ('17140', 48440.25);
INSERT INTO Savings (AccountID, Amount)
VALUES ('37770', 20847.33);
INSERT INTO Savings (AccountID, Amount)
VALUES ('38415', 20108.58);
INSERT INTO Savings (AccountID, Amount)
VALUES ('40274', 36168.04);
INSERT INTO Savings (AccountID, Amount)
VALUES ('22165', 24851.63);
INSERT INTO Savings (AccountID, Amount)
VALUES ('95850', 27640.05);
INSERT INTO Savings (AccountID, Amount)
VALUES ('00135', 6518.53);
INSERT INTO Savings (AccountID, Amount)
VALUES ('04742', 787138.70);
INSERT INTO Savings (AccountID, Amount)
VALUES ('30594', 16971.08);
INSERT INTO Savings (AccountID, Amount)
VALUES ('49177', 13189.61);
INSERT INTO Savings (AccountID, Amount)
VALUES ('90611', 9399.92);
INSERT INTO Savings (AccountID, Amount)
VALUES ('04284', 8371.56);
INSERT INTO Savings (AccountID, Amount)
VALUES ('26656', 46285.00);
INSERT INTO Savings (AccountID, Amount)
VALUES ('54794', 26834.53);
INSERT INTO Savings (AccountID, Amount)
VALUES ('72787', 37015.18);
INSERT INTO Savings (AccountID, Amount)
VALUES ('56722', 25775.94);
INSERT INTO Savings (AccountID, Amount)
VALUES ('49751', 13593.75);
INSERT INTO Savings (AccountID, Amount)
VALUES ('94336', 49846.85);
INSERT INTO Savings (AccountID, Amount)
VALUES ('50370', 402328.93);
INSERT INTO Savings (AccountID, Amount)
VALUES ('96606', 19097.42);

-- Insert data into the Accounts table
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('90617', '21757', '39955', 'Vincent Powell');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('56606', '73744', '60515', 'Brian Murphy');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('72914', '07964', '60223', 'Jeffrey Perez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('78151', '42121', '03980', 'Russell Jones');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('98045', '26332', '57451', 'Rachel Martin');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('59006', '35437', '05447', 'Doris Martinez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('89469', '14348', '90026', 'Jessica Thomas');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('14300', '95637', '59171', 'Peter Carter');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('76599', '95942', '49336', 'Jessica Phillips');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('94537', '47513', '08402', 'Christina Kelly');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('64337', '60478', '05433', 'Catherine Parker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('77897', '79126', '02997', 'Sarah Moore');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('87321', '61122', '33423', 'Teresa Scott');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('72215', '83181', '00796', 'Carl Bryant');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('89615', '44011', '80627', 'Samuel Miller');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('54432', '59475', '38872', 'Ruth Long');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('55958', '16177', '59719', 'Roy Bryant');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('60291', '16188', '05546', 'Martha Gonzalez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('02798', '36878', '34202', 'Louis Ramirez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('96238', '27263', '62265', 'Elijah Bryant');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('91319', '61925', '16490', 'Adam Lee');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('91929', '64572', '48681', 'Ashley Rodriguez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('89591', '51227', '41210', 'Kenneth Powell');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('15260', '84433', '83003', 'Barbara Harris');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('76309', '56283', '34701', 'Dylan Howard');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('68994', '31895', '23613', 'Gregory Walker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('69992', '64396', '11352', 'Adam Perez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('05606', '32902', '66414', 'Alexis Baker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('64862', '55448', '55371', 'Arthur Ward');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('14625', '68485', '98983', 'Jack Cox');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('62978', '05861', '86834', 'Jack Brown');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('42746', '71504', '21811', 'Paul Sanders');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('32223', '49119', '59952', 'Anna Howard');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('90873', '00383', '35367', 'Zachary Adams');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('85340', '49126', '67890', 'Jonathan Miller');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('99784', '06208', '63208', 'Harold Collins');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('43933', '71598', '59818', 'Brandon Cox');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('18283', '62931', '79199', 'Jack Hall');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('70039', '95493', '72830', 'Russell Phillips');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('96857', '50011', '81725', 'Mason Young');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('69472', '29257', '96955', 'Patricia Gonzalez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('86467', '40307', '16833', 'Alexander Baker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('69360', '42082', '17627', 'Carl King');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('56569', '59002', '96197', 'Steven Perez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('93368', '04230', '76153', 'Julia Kelly');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('97184', '69171', '13811', 'Natalie Jenkins');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('71720', '55206', '80519', 'Carl Lewis');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('87800', '12272', '89894', 'Roy Butler');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('41856', '53685', '38593', 'Lauren Harris');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('70924', '20517', '62142', 'Christian Russell');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('38918', '98720', '36247', 'Sandra Sanchez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('86597', '94077', '26956', 'Ruth Moore');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('60709', '44356', '75333', 'Brian Hayes');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('28021', '05061', '69625', 'Frances Nelson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('23197', '97908', '24199', 'Roy Walker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('44874', '72487', '39196', 'Charlotte Brown');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('75914', '63326', '46764', 'Patricia Collins');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('24888', '78726', '00958', 'Ashley Gray');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('75085', '62664', '53474', 'Joshua Patterson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('59644', '64201', '44908', 'Mason Brown');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('65320', '74356', '43381', 'Jonathan Morgan');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('87310', '12124', '24271', 'Joseph Edwards');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('65290', '35606', '65536', 'Patrick Smith');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('52751', '86863', '12771', 'Carolyn Gray');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('93880', '34747', '17282', 'Betty Miller');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('23151', '59090', '41267', 'Ruth Collins');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('23380', '72669', '19466', 'Daniel Bennett');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('77906', '17877', '51513', 'Betty Foster');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('02031', '93020', '62786', 'Amy Diaz');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('15506', '17825', '70502', 'Lauren Scott');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('72340', '42924', '40620', 'Kevin Anderson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('32059', '50210', '04734', 'Brenda Reed');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('53484', '29134', '52869', 'Eugene Sanders');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('75014', '45356', '14836', 'Amber Young');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('11565', '92426', '78031', 'William Griffin');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('38787', '34595', '58978', 'Patrick Sanchez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('19203', '62159', '88889', 'Jose Bennett');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('59903', '63739', '31185', 'Harold Peterson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('06602', '21870', '77255', 'Elizabeth Flores');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('82429', '79328', '01337', 'Jeffrey Washington');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('21429', '17140', '74493', 'Kathleen Johnson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('59943', '37770', '80702', 'Kayla Simmons');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('00908', '38415', '18756', 'Sara Robinson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('46715', '40274', '71485', 'Samuel Thomas');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('49387', '22165', '42027', 'Randy Perez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('52287', '95850', '49530', 'Scott Walker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('44270', '00135', '69782', 'Marilyn Reed');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('71638', '04742', '72533', 'Samuel Young');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('39493', '30594', '50480', 'Edward Green');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('16352', '49177', '48771', 'Alexis James');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('79395', '90611', '80542', 'Olivia Bryant');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('18320', '04284', '02716', 'Gerald Walker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('46621', '26656', '83705', 'Juan Hill');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('73913', '54794', '88300', 'Peter Watson');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('58117', '72787', '39786', 'Carolyn Perez');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('78821', '56722', '04938', 'Raymond Garcia');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('86707', '49751', '54732', 'Julie Baker');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('30481', '94336', '22484', 'Sophia Barnes');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('62182', '50370', '32682', 'John Davis');
INSERT INTO Accounts (AccountID, SavingsID, PIN, Name)
VALUES ('35940', '96606', '16215', 'Teresa Torres');
  
Commit;
