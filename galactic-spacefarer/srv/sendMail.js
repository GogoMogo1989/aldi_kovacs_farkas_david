const nodemailer = require("nodemailer");
require("dotenv").config();

const emailUser = process.env.EMAIL_USER;
const emailPass = process.env.NODEMAILER_SECRET_KEY;

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: emailUser,
    pass: emailPass,
  },
});

const sendMail = async ({ to, subject, text, html }) => {
  try {
    const info = await transporter.sendMail({
      from: `"Galactic Spacefarer" <${emailUser}>`,
      to,
      subject,
      text,
      html,
    });

    console.log("E-mail sikeresen elküldve:", info.response);
    return info;
  } catch (error) {
    console.error("Hiba az e-mail küldésekor:", error);
    throw error;
  }
};

module.exports = sendMail;
