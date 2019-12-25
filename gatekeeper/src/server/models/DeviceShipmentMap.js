/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('DeviceShipmentMap', {
    ShipmentID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DeviceID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'DeviceShipmentMap'
  });
};
