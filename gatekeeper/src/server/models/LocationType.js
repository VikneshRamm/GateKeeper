/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('LocationType', {
    LocationType: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    }
  }, {
    tableName: 'LocationType'
  });
};
