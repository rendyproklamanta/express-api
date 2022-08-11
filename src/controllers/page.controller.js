const db = require('../config/db.config');

const Page = db.pages;

exports.getAllPages = async (req, res) => {
  try {
    const data = await Page.findAll({
      attributes: { exclude: ['content'] },
    });
    return res.json(data);
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
exports.getPageBySlug = async (req, res) => {
  const { slug } = req.params;
  try {
    const data = await Page.findOne({
      where: { slug },
    });
    return res.json(data);
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
exports.createPage = async (req, res) => {
  try {
    const data = await Page.create(req.body);
    return res.json(data);
  } catch (err) {
    return res.status(400).json({ message: err.message });
  }
};
exports.updatePage = async (req, res) => {
  const { slug } = req.params;
  try {
    await Page.update(req.body, { where: { slug } });
    return res.json({ message: 'Page Updated' });
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
exports.deletePage = async (req, res) => {
  const { slug } = req.params;

  try {
    const num = await Page.destroy({ where: { slug } });
    const ifDeleted = parseInt(num, 10);
    if (ifDeleted === 1) {
      return res.json({ message: 'Page Deleted' });
    }
    return res.status(500).json({ message: 'Cannot delete page' });
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }
};
