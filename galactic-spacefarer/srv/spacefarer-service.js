const cds = require("@sap/cds");
const sendMail = require("./sendMail");

module.exports = cds.service.impl(function () {
  const { Spacefarers } = this.entities;

  this.before("CREATE", Spacefarers, (req) => {
    const data = req.data;

    if (data.stardustCollection == null) {
      data.stardustCollection = 0;
    }

    if (data.wormholeNavigationSkill == null) {
      data.wormholeNavigationSkill = 1;
    }

    if (
      !Number.isInteger(data.stardustCollection) ||
      data.stardustCollection < 0
    ) {
      req.reject(400, "stardustCollection must be a non-negative integer");
    }

    if (
      !Number.isInteger(data.wormholeNavigationSkill) ||
      data.wormholeNavigationSkill < 1 ||
      data.wormholeNavigationSkill > 10
    ) {
      req.reject(
        400,
        "wormholeNavigationSkill must be an integer between 1 and 10",
      );
    }
  });

  this.after("CREATE", Spacefarers, async (created) => {
    try {
      await sendMail({
        to: created.email,
        subject: "Welcome aboard, Spacefarer!",
        text: `Hello ${created.firstName} ${created.lastName}, welcome to the Galactic Spacefarer program!`,
        html: `<p>Hello <b>${created.firstName} ${created.lastName}</b>, welcome to the Galactic Spacefarer program!</p>`,
      });
    } catch (err) {
      console.error("Email sending failed:", err.message);
    }
  });
});
