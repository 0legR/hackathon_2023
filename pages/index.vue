<template lang="pug">
.container-publick__wrapper.w-full.pb-4
  .container-publick.mx-auto.px-6
    .container-publick__header.flex.items-center.px-4
      .w-fill
        NuxtLink(to="/cabinet")
          img(src="/logo.png" class="h-16")
      .w-full.flex.justify-between.mx-auto
        .text-white.mr-2(v-for="(link, ndex) in headerDataLinks")
          NuxtLink(to="#") {{ link }}
      .w-fill
        NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Sign up
    .container-publick__title-content.flex.flex-col.items-center.w-full
      .flex.relative
        .circle.absolute
        span.mr-4 Click
        span IT
      .flex.flex-col.text-center.my-16
        span.text-white Gain valuable<br>insights into your audience.
        span.container-publick__title-content-subtitle Create a landing page instantly with our AI-powered tool and<br>detailed analytics support.
      NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Get Started
    .container-publick__solution.px-10
      .title-main Our solution:
      img(src="~/public/solution.png")
    .container-publick__integrations.px-10
      .title-main CRM Integrations
      .list-integrations.flex.justify-center.flex-wrap.w-full.mx-auto.space-x-10
        img(src='~/public/hubspot.png' alt="img")
        img(src='~/public/zoho.png' alt="img")
        img(src='~/public/pipedrive.png' alt="img")
        img(src='~/public/zapier.png' alt="img")
        img(src='~/public/salesforce.png' alt="img")
    .container-publick__middle-block-wrapper.w-full
      .title-main.px-10 How It works
      .container-publick__middle-block
        .flex
          .middle-block__icon
          span Sign up and log in: Register and log in effortlessly to get started.
        .flex.items-center.mt-12
          .middle-block__icon
          span Create Your Company: Establish your company profile with a short description.
        .flex.items-center.mt-12
          .middle-block__icon
          span Instant AI-Generated landing pages: Click once and let AI craft a compelling, custom landing page<br>for your business effortlessly
        .flex.items-center.mt-12
          .middle-block__icon
          span Import your prospects and AI Generate you unique URLs for each lead: Input prospects, and unique URLs<br>are automatically generated for each.
        .flex.items-center.mt-12
          .middle-block__icon
          span Track Analytics: Stay informed with real-time analytics for effective campaign management.
    .container-publick__plan.flex.flex-col
      .title-main.px-10.w-full Choose Your Plan
      .flex.justify-center.flex-wrap.w-full.px-10
        .plans.m-6.p-5(
          v-for="(plan, index) in planList"
          :key="index"
          :class="choosedPlan === plan.slug ? 'plans-active' : ''"
        )
          .title-section-price
            .flex {{ plan.title }}
            .flex.mt-4 {{ plan.price }}
            .flex.mt-2 {{ plan.save }}
            .flex.my-4 {{ plan.subtitle }}
          .main-section-price
            .price-btn__wrapper.border.w-full.flex.justify-center
              button.price-btn.mt-10.mb-6(@click="choosedPlan = plan.slug") Start free trial
            .features.mb-8 Features:
            .features-content.flex.flex-col.pl-4
              span {{ plan?.features?.one }}
              span {{ plan?.features?.two }}
              span {{ plan?.features?.three }}
              span {{ plan?.features?.foure }}
              span {{ plan?.features?.five }}
              span {{ plan?.features?.six }}
    .container-publick__reason
      .title-main.px-10 Why Choose Us?
      .container-publick__reason-content.text-center.flex.flex-col.items-center
        .flex.relative Empowering Agencies with AI-Driven Innovation
          .circle__three.absolute
        .flex.text-center.mt-10 ClickIT for a seamless integration of cutting-edge AI, deep engagement insights, and<br> innovative marketing solutions.<br> We're not just a platform; we're your partner in redefining digital marketing success.
        img.reason-content__image(src="~/public/diagrams.png" alt="image")
    .container-publick__custom-plan
      .container-publick__custom-plan-title.flex.flex-col.px-10.relative
        .circle-foure.absolute
        span.relative.z-10 Empower your business:
        div.relative.z-10
          span upgrade to 
          span.custom-plan Custom plan 
          span now!
      .container-publick__custom-plan-subtitle.relative.z-10
        span Strengthen <span class="custom-plan"> your B2B connections</span>: reliable, efficient, and innovative<br>solutions for seamless partnerships and growth
        .custom-plan__input.mx-auto.flex.justify-between
          input.h-full(placeholder="Email address...")
          button Start now
    .container-publick__feedback
      .title-main.w-full.px-10.mb-5 What our client say bout us
      .flex.justify-center.flex-wrap.w-full.px-10
        .feedback.flex.flex-col.items-center.p-4.mx-auto.mt-10
          img(src='~/public/user-one.png')
          span.name.my-7 Elise
          span.overflow-auto Game-changing SaaS solution! Boosted efficiency and data-driven insights. Highly recommended!
        .feedback.flex.flex-col.items-center.p-4.relative.mx-auto.mt-10
          .circle__two.absolute
          img.relative.z-10(src='~/public/user-two.png')
          span.relative.z-10.name.my-7 Kris
          span.overflow-auto.relative.z-10   User-friendly interface, abundant features, and remarkable tracking capabilities make this product a standout in its category. The simplicity of navigation ensures that even those new to the application can quickly grasp its functionality. With a plethora of features at your fingertips, it's a versatile tool that caters to a wide range.
        .feedback.flex.flex-col.items-center.p-4.mx-auto.mt-10
          img(src='~/public/user-three.png')
          span.name.my-7 Anna
          span.overflow-auto I recently started using ClickIt for our digital marketing campaigns, and it has proven to be a game-changer. The ability to create unique landing pages tailored to each campaign has significantly improved our targeting and conversion rates. The feature that stands out the most is the innovative chatbot integration, providing real-time communication. Highly recommended!
    .footer.flex.items-center.p-4
      .footer-logo
        NuxtLink(to="/cabinet")
          img(src="/logo.png" class="h-16")
      .footer-devider.h-full
      .footer-Links.flex.flex-wrap
        .text-white.flex.flex-col.m-auto
          NuxtLink(to="#") About
          NuxtLink.my-4(to="#") Integration
          NuxtLink(to="#") Pricing
        .text-white.flex.flex-col.m-auto
          NuxtLink(to="#") Reviews
          NuxtLink.my-4(to="#") Contact
          .h-6
      .footer-devider.h-full
      .footer-contacts.flex.h-full.p-7
        .flex.flex-col.text-white.w-full
          span Contacts:
          span.mt-2.truncate ClickIT@clickit.fit
        .flex.flex-col.justify-center.socials.ml-auto.space-y-8
          .flex.space-x-8
            NuxtLink(to="#")
              img(src="~/public/twitter.png" alt="image")
            NuxtLink(to="#")
              img(src="~/public/facebook.png" alt="image")
          .flex.space-x-8
            NuxtLink(to="#")
              img(src="~/public/linkedin.png" alt="image")
            NuxtLink(to="#")
              img(src="~/public/youtube.png" alt="image")
</template>

<script setup>
const choosedPlan = ref('')
const planList = [
  {
    slug: 'starter',
    title: 'Starter',
    price: '$59/month',
    save: 'Save $212/ year',
    subtitle: 'Conversions |  500',
    features: {
      one: '✓ 3 Custom domain',
      two: '✓ 30 AI landing page templates',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '',
      six: '✓ Prospect level personalization',
    }
  },
  {
    slug: 'busines',
    title: 'Business',
    price: '$117/month',
    save: 'Save $421/ year',
    subtitle: 'Conversions |  1000',
    features: {
      one: '✓ 5 Custom domain',
      two: '✓ 50 AI landing page templates',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '✓ API',
      six: '✓ Prospect level personalization',
    }
  },
  {
    slug: 'custom',
    title: 'Custom plan',
    price: 'Conntact sales team',
    save: '',
    subtitle: 'Conversions |  (based on specific needs)',
    features: {
      one: '✓ 10 and more',
      two: '✓ Unlimited',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '✓ API',
      six: '✓ Prospect level personalization',
    }
  }
]
const headerDataLinks = ref(['About', 'Integration', 'Pricing', 'Reviews', 'Contact'])
</script>

<style>
.socials img {
  width: 26px;
  min-width: 26px;
  height: 26px;
}
.footer-contacts {
  width: 40%;
  flex-wrap: wrap;
}
.footer-logo {
  width: 10%;
  min-width: 100px;
}
.footer-Links {
  width: 50%;
  height: 100%;
  columns: 6rem auto;
}
.footer-devider {
  border: 1px solid #21307D;
  box-shadow: 0px 0px 20px 0px #415EF7;
}
.container-publick__plan .title-main,
.container-publick__feedback .title-main {
  margin-bottom: 30px;
}
.custom-plan {
  color: white;
  font-weight: 700;
}
.container-publick__custom-plan {
  margin-top: 264px;
}
.container-publick__custom-plan-title > div:nth-child(3) {
  color: #9C9C9C;
}
.custom-plan__input input {
  width: 100%;
  min-width: 120px;
  padding-left: 21px;
  color: #4A4A4A;
  font-family: Tahoma;
  font-size: 16px;
  border: 0px solid;
  background: rgba(217, 217, 217, 0.00);
}
.custom-plan__input input:focus{
  outline: none;
}
.custom-plan__input button {
  color: #FFF;
  font-family: Tahoma;
  font-size: 18px;
  font-weight: 400;
  width: 100%;
  max-width: 200px;
  height: 100%;
  border-radius: 10px;
  background: #4462FF;
}
.custom-plan__input {
  margin-top: 40px;
  width: 100%;
  max-width: 600px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  border: 1px solid #415EF7;
  background: rgba(217, 217, 217, 0.00);
}
.container-publick__custom-plan-subtitle {
  margin-top: 60px;
  color: #9C9C9C;
  text-align: center;
  font-family: Roboto;
  font-size: 24px;
  font-style: normal;
  font-weight: 700;
  line-height: 128.906%;
}
.container-publick__custom-plan-title {
  color: #FFF;
  font-family: Roboto;
  font-size: 36px;
  font-style: normal;
  font-weight: 400;
  line-height: 128.906%;
}
.container-publick__reason-content {
  color: #FFF;
  font-family: Roboto;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 128.906%;
  margin: 0 auto;
  width: 100%;
  max-width: 900px;
}
.reason-content__image {
  margin-top: 200px;
}
.container-publick__reason-content > div:nth-child(1) {
  font-size: 36px;
}
.plans-active .title-section-price > div:nth-child(1) {
  color: #415EF7;
}

.plans-active .price-btn {
  background: #415EF7;
}
.features {
  color: #9C9C9C;
  font-size: 24px;
}
.features-content {
  color: white;
}
.title-section-price {
  height: 163px;
  color: white;
  font-family: Roboto;
  font-size: 32px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  border-bottom: 1px solid #415EF7;
}
.title-section-price > div:nth-child(1) {
  color: #8D8D8D;
  font-weight: 700;
}
.title-section-price > div:nth-child(3) {
  color: #415EF7;
  font-size: 14px;
  font-weight: 700;
  height: 17px;
}
.title-section-price > div:nth-child(4) {
  font-size: 14px;
}
.price-btn {
  color: white;
  width: 200px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  border: 1px solid #1F2D78;
  background: rgba(68, 98, 255, 0.00);
}
.price-btn:hover {
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.title-main {
  color: #FFF;
  font-family: Tahoma;
  font-size: 36px;
  font-style: normal;
  font-weight: 700;
  line-height: normal;
  margin-top: 100px;
  margin-bottom: 50px;
}
.container-publick__solution img {
  width: 100%;
  max-width: 916px;
  margin: 0 auto;
}
.footer {
  border-radius: 10px;
  margin-top: 112px;
  width: 100%;
  height: 196px;
  flex-shrink: 0;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.feedback {
  color: #FFF;
  font-family: Roboto;
  font-size: 14px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  width: 100%;
  max-width: 250px;
  height: 410px;
  flex-shrink: 0;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.50);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.feedback .name {
  font-size: 18px;
}
.feedback img {
  width: 77px;
  height: 90px;
}
.plans {
  width: 300px;
  min-height: 550px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__middle-block {
  padding: 70px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.middle-block__icon {
  width: 25px;
  height: 25px;
  margin-right: 60px;
  flex-shrink: 0;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__middle-block span {
  color: #FFF;
  font-family: Roboto;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}

.list-integrations {
  margin-top: 100px;
  max-width: 90%;
}
.list-integrations img {
  max-width: 25%;
  min-width: 100px;
  max-height: 60px;
}
.circle__three {
  bottom: -70%;
  left: 20%;
  width: 60%;
  box-shadow: 2px -44px 280px 62px rgba(68,98,255,1);
}
.circle {
  bottom: -50%;
  left: -25%;
  width: 140%;
}
.circle-foure {
  z-index: 0;
  width: 30%;
  top: 30%;
  left: 10%;
  background: rgba(65, 32, 125, 0.50);
  box-shadow: 0px 4px 250px 100px #5212D0;
}
.circle__two {
  bottom: 40%;
  left: -20%;
  width: 140%;
  box-shadow: 0px 4px 250px 100px #26378E;
}
.circle {
  box-shadow: 2px -44px 292px 62px rgba(68,98,255,1);
}
.container-publick__wrapper {
  background: #000;
  box-shadow: 0px 4px 25px 2px #000A40 inset;
}
.container-publick {
  max-width: 1220px;
}
.container-publick__header {
  flex-direction: column;
}
.container-publick__header > div:nth-child(1) {
  min-width: fit-content;
}
.container-publick__header > div:nth-child(2) {
  width: 50%;
  max-width: 630px;
  min-width: fit-content;
}
.btn-link {
  color: white;
  font-size: 18px;
  width: 200px;
  height: 40px;
  border-radius: 10px;
  background: #4462FF;
}
.container-publick__title-content {
  padding: 200px 0 0;
}
.container-publick__title-content-subtitle {
  margin-top: 70px;
  color: rgba(141, 141, 141, 0.85);
  text-align: center;
  font-family: Tahoma;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}
.container-publick__title-content > div:nth-child(1) span {
  font-size: 70px;
}
.container-publick__title-content > div:nth-child(2),
.container-publick__title-content > div:nth-child(1) span {
  color: #4462FF;
  text-align: center;
  text-shadow: 0px 6px 6px rgba(0, 0, 0, 0.25);
  font-family: Tahoma;
  font-size: 70px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}
.container-publick__title-content > div:nth-child(1) span:nth-child(2) {
  color: white;
}
.container-publick__title-content > div:nth-child(2) {
  font-size: 40px;
}
@media(min-width: 768px) {
  .container-publick__header {
    flex-direction: row;
  }
  .container-publick__header > div:nth-child(3) {
    margin-left: auto;
  }
  .footer-contacts {
    flex-wrap: nowrap;
  }
}
</style>
