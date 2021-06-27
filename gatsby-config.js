module.exports = {
    siteMetadata: {
        description: "Personal website",
        locale: "en",
        title: "David Estabén",
        formspreeEndpoint: "https://formspree.io/f/mzbygrdp",
        },
    plugins: [
      {
        resolve: "@wkocjan/gatsby-theme-intro",
        options: {
          theme: "bright-red",
          basePath: "/",
          contentPath: "website/",
          showThemeLogo: false
        },
      },
      {
        resolve: "gatsby-plugin-google-analytics",
        options: {
          trackingId: "G-E2VDW2HM59",
          head: false,
          anonymize: true,
          respectDNT: true,
          exclude: ["/preview/**", "/do-not-track/me/too/"],
          pageTransitionDelay: 0,
          defer: false,
          sampleRate: 5,
          siteSpeedSampleRate: 10,
          cookieDomain: "info.destaben.dev",
        },
      }
    ],
  }