// Stand for bubble magus curve 5.

// Measurements

footDistance = 105;
footWidth = 10;

// Targets

targetHeight = 80;

// Design Parameters

bottomPlateThickness = 3;
cupHeight = 3;

cylinderExtension = 3;
columnRadiusTop = footWidth / 2 + cylinderExtension;
columnRadiusBottom = columnRadiusTop + 25;

plateWidth = footDistance + (columnRadiusBottom * 2);

module bottomPlate() {
    cube([plateWidth, plateWidth, bottomPlateThickness]);
}

module column() {
    difference() {
        cylinder(h = targetHeight, r1 = columnRadiusBottom, r2 = columnRadiusTop, $fn = 30);
        translate([0, 0, targetHeight - cupHeight]) {
            footCup();
        }
        
    }
    
}

module footCup() {
    cupRadius = footWidth / 2;
    
    cylinder(h = cupHeight, r1 = cupRadius, r2 = cupRadius, $fn = 30);
}

module columnSet() {
    column();
    translate([footDistance, 0, 0]) {
        column();
    }
    translate([footDistance, footDistance, 0]) {
        column();
    }
    translate([0, footDistance, 0]) {
        column();
    }
    translate([footDistance, 0, 0]) {
        column();
    }
}

module stand() {
    union() {
        columnSet();
        translate([-columnRadiusBottom, -columnRadiusBottom, 0]) {
            bottomPlate();
        }
        
    }
}


stand();
