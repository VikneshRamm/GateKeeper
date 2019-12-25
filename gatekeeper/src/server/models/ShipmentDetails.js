/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ShipmentDetails', {
    ShipmentPK: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("ShipmentDetails_ShipmentPK_seq"::regclass)',
      primaryKey: true
    },
    ShipFrom: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    ShipTo: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    CustomerID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    SolitonRespID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    ShippingNinja: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    DeliveryDate: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    ShipmentMode: {
      type: DataTypes.STRING,
      allowNull: true,
      primaryKey: true
    },
    ShipmentStatus: {
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
    tableName: 'ShipmentDetails'
  });
};
