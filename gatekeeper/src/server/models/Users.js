/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Users', {
    UserName: {
      type: "NAME",
      allowNull: false
    },
    UserNickName: {
      type: "NAME",
      allowNull: false
    },
    UserContactNo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    UserAlternateContactNo: {
      type: DataTypes.STRING,
      allowNull: true
    },
    UserEmailID: {
      type: DataTypes.STRING,
      allowNull: false
    },
    UserAccessLevel: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    UserID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval("Users_UserID_seq"::regclass)',
      primaryKey: true
    },
    UserLocation: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: true
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    tableName: 'Users'
  });
};
