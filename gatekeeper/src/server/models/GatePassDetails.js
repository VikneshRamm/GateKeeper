/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('GatePassDetails', {
    GatePassPK: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("GatePassDetails_GatePassPK_seq"::regclass)',
      primaryKey: true
    },
    GatePassExtID: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    GatePassRaisedBy: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DeviceSentBy: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    IssueDate: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    ReturnableStatus: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    ReturnDate: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    Comments: {
      type: DataTypes.STRING,
      allowNull: true
    },
    ScannedCopyID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      primaryKey: true
    },
    SolitonContact: {
      type: DataTypes.INTEGER,
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
    tableName: 'GatePassDetails'
  });
};
