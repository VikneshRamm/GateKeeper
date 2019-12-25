/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('GatePassImage', {
    GatePassCopyPK: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("GatePassImage_GatePassCopyPK_seq"::regclass)',
      primaryKey: true
    },
    ImageFileName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    Image: {
      type: "BYTEA",
      allowNull: false
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
    tableName: 'GatePassImage'
  });
};
