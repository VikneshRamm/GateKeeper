/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ShipmentComments', {
    ShipmentCommentID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: 'nextval("ShipmentComments_ShipmentCommentID_seq"::regclass)',
      primaryKey: true
    },
    ShipmentID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    Comment: {
      type: DataTypes.STRING,
      allowNull: false
    },
    createdAt: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    updatedAt: {
      type: DataTypes.DATEONLY,
      allowNull: false
    }
  }, {
    tableName: 'ShipmentComments'
  });
};
