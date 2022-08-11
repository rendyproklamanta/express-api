const sequelizeQuery = require('sequelize-query');
const db = require('../config/db.config');

const queryParser = sequelizeQuery(db);

const Method = db.methods;

exports.getAllMethods = async (req, res) => {
  const query = await queryParser.parse(req);
  try {
    const data = await Method.findAll({
      ...query,
      where: req.user.role === 0 ? {} : { active: true },
    });
    const count = await Method.count({
      ...query,
      where: req.user.role === 0 ? {} : { active: true },
    });
    return res.json({ count, data });
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
exports.getMethodById = async (req, res) => {
  const { id } = req.params;
  const query = await queryParser.parse(req);
  try {
    const data = await Method.findByPk(id, {
      ...query,
      where: req.user.role === 0 ? {} : { active: true },
    });
    return res.json(data);
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};

exports.createMethod = async (req, res) => {
  try {
    const data = await Method.create(req.body);
    return res.json(data);
  } catch (err) {
    return res.status(400).json({ message: err.message });
  }
};

exports.updateMethod = async (req, res) => {
  const { id } = req.params;
  try {
    const num = await Method.update(req.body, { where: { id } });
    const ifUpdated = parseInt(num, 10);
    if (ifUpdated === 1) {
      return res.json({ message: 'Method Updated' });
    }
    return res.status(500).json({ message: 'Cannot update method' });
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};

exports.deleteMethod = async (req, res) => {
  const { id } = req.params;
  try {
    const num = await Method.destroy({ where: { id } });
    const ifUpdated = parseInt(num, 10);
    if (ifUpdated === 1) {
      return res.json({ message: 'Method Deleted' });
    }
    return res.status(500).json({ message: 'Cannot delete method' });
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
