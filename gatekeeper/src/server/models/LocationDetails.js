/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('LocationDetails', {
    Name: {
      type: "NAME",
      allowNull: false
    },
    Address: {
      type: DataTypes.STRING,
      allowNull: false
    },
    ContactNo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    City: {
      type: DataTypes.STRING,
      allowNull: true
    },
    State: {
      type: DataTypes.STRING,
      allowNull: true
    },
    Country: {
      type: DataTypes.STRING,
      allowNull: true
    },
    LocationID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("LocationDetails_LocationID_seq"::regclass)',
      primaryKey: true
    },
    LocationType: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'LocationDetails'
  });
};
