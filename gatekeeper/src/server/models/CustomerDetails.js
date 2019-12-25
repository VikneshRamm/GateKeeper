/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('CustomerDetails', {
    Name: {
      type: "NAME",
      allowNull: false
    },
    ContactNo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    AlternateContactNo: {
      type: DataTypes.STRING,
      allowNull: true
    },
    EmailID: {
      type: DataTypes.STRING,
      allowNull: false
    },
    TeamName: {
      type: "NAME",
      allowNull: true
    },
    CustomerID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("CustomerDetails_CustomerID_seq"::regclass)',
      primaryKey: true
    },
    LocationID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'CustomerDetails'
  });
};
