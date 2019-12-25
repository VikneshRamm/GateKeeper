/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('DeviceDetails', {
    DevicePK: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("DeviceDetails_DevicePK_seq"::regclass)',
      primaryKey: true
    },
    DeviceUID: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    GatePassFK: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DeviceName: {
      type: "NAME",
      allowNull: true
    },
    Description: {
      type: DataTypes.STRING,
      allowNull: true
    },
    DeviceStatus: {
      type: DataTypes.STRING,
      allowNull: true,
      primaryKey: true
    },
    createdAt: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    updatedAt: {
      type: DataTypes.DATEONLY,
      allowNull: true
    }
  }, {
    tableName: 'DeviceDetails'
  });
};
