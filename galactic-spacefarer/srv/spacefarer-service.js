const cds = require("@sap/cds");
const sendMail = require("./sendMail");

module.exports = cds.service.impl(function () {
  const { Spacefarers } = this.entities;

  const validateSpacefarer = (req) => {
    const data = req.data;

    if (
      data.stardustCollection == null ||
      !Number.isInteger(data.stardustCollection) ||
      data.stardustCollection <= 0
    ) {
      req.reject(400, "stardustCollection must be a positive integer");
    }

    if (
      data.wormholeNavigationSkill == null ||
      !Number.isInteger(data.wormholeNavigationSkill) ||
      data.wormholeNavigationSkill <= 0
    ) {
      req.reject(400, "wormholeNavigationSkill must be a positive integer");
    }
  };

  this.before("NEW", Spacefarers.drafts, (req) => {
    req.data.originPlanet = req.user.attr?.planet;
  });

  this.before("CREATE", Spacefarers, validateSpacefarer);
  this.before("UPDATE", Spacefarers, validateSpacefarer);

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
