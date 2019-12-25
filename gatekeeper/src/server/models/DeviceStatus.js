/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('DeviceStatus', {
    DeviceStatus: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'DeviceStatus'
  });
};
