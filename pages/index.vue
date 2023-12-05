<template lang="pug">
.container-publick__wrapper.w-full.pb-4
  .container-publick.mx-auto.px-6(@click="isHeaderOpen = false")
    .container-publick__header.flex.items-center.px-4.w-full.py-4
      .header-logo.w-fill
        NuxtLink(to="/")
          img(src="/logo.png" class="h-16")
      .header-burger
        .relative
          img.h-6.cursor-pointer.mr-2(@click.stop="isHeaderOpen = !isHeaderOpen" src="/open-menu.png")
          .header-popup.absolute.p-6.space-y-2(v-if="isHeaderOpen")
            .text-white.mr-2(v-for="(link, ndex) in headerDataLinks")
              NuxtLink(to="#") {{ link }}
      .header-links.w-fill.flex.justify-between.mx-auto
        .text-white.mr-2(v-for="(link, ndex) in headerDataLinks")
          NuxtLink(to="#") {{ link }}
      .flex.ml-auto
        NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Sign up
    .container-publick__title-content.flex.flex-col.items-center.w-full
      .flex.relative
        .circle.absolute
        span.mr-4.relative.z-50 Click
        span IT
      .flex.flex-col.text-center.mb-14.mt-10
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
        .flex.items-center
          .middle-block__icon
          span <b>Sign up and log in</b>: Register and log in effortlessly to get started.
        .flex.items-center.mt-12
          .middle-block__icon
          span <b>Create Your Company</b>: Establish your company profile with a short description.
        .flex.items-center.mt-12
          .middle-block__icon
          span <b>Instant AI-Generated landing pages</b>: Click once and let AI craft a compelling, custom landing page<br>for your business effortlessly
        .flex.items-center.mt-12
          .middle-block__icon
          span Import your prospects and AI Generate you unique URLs for each lead: Input prospects, and unique URLs<br>are automatically generated for each.
        .flex.items-center.mt-12
          .middle-block__icon
          span <b>Track Analytics</b>: Stay informed with real-time analytics for effective campaign management.
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
              NuxtLink.price-btn.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg.mt-10.mb-6(to="/cabinet") Start free trial
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
          NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Start now
    .container-publick__feedback
      .title-main.w-full.px-10.mb-5 What our client say about us
      .carusel-container.flex.justify-center.flex-wrap.px-40.relative
        .circle__two.absolute
        Carousel(:itemsToShow="slidesCount" :transition="500")
          Slide(v-for="slide in slides" :key="slide.id")
            .feedback.m-2.flex.flex-col.items-center.p-4.mt-10
              img(:src='`/${slide.img}.png`')
              span.name.my-7 {{ slide.name }}
              span.overflow-auto {{ slide.content }}
          template(v-slot:addons='{}')
            Navigation
    .footer.flex.items-center.p-4
      .footer-logo
        NuxtLink(to="/")
          img(src="/logo.png" class="h-16")
      .footer-Links.text-white.py-6.mr-2
        NuxtLink(to="#") About
        NuxtLink(to="#") Integration
        NuxtLink(to="#") Pricing
        NuxtLink(to="#") Reviews
        NuxtLink(to="#") Contact
      .footer-contacts.h-full
        .flex.flex-col.text-white
          span Contacts:
          span.mt-4.truncate ClickIT@clickit.fit
          span.mt-4.truncate +1 267 808 7628
        .flex.flex-col.justify-center.socials.space-y-8.mt-4
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
import 'vue3-carousel/dist/carousel.css'
import { Carousel, Slide, Navigation } from 'vue3-carousel'
const slides = [
  { id: '1', img: 'user_three', name: 'Elise', content: 'Game-changing SaaS solution! Boosted efficiency and data-driven insights. Highly recommended!' },
  { id: '2', img: 'user_one', name: 'Kris', content: 'User-friendly interface, abundant features, and remarkable tracking capabilities make this product a standout in its category. The simplicity of navigation ensures that even those new to the application can quickly grasp its functionality. With a plethora of features at your fingertips, it\'s a versatile tool that caters to a wide range.' },
  { id: '3', img: 'user_two', name: 'Anna', content: 'I recently started using ClickIt for our digital marketing campaigns, and it has proven to be a game-changer. The ability to create unique landing pages tailored to each campaign has significantly improved our targeting and conversion rates. The feature that stands out the most is the innovative chatbot integration, providing real-time communication. Highly recommended!' },
  { id: '4', img: 'user_one', name: 'Kris', content: 'User-friendly interface, abundant features, and remarkable tracking capabilities make this product a standout in its category. The simplicity of navigation ensures that even those new to the application can quickly grasp its functionality. With a plethora of features at your fingertips, it\'s a versatile tool that caters to a wide range.'},
  { id: '5', img: 'user_three', name: 'Elise', content: 'Game-changing SaaS solution! Boosted efficiency and data-driven insights. Highly recommended!'},
]
const showSlide = ref(3)
const isHeaderOpen = ref(false)
const slidesCount = computed(() => {
  return showSlide.value
})
const choosedPlan = ref('busines')
const planList = [
  {
    slug: 'starter',
    title: 'Starter',
    price: '$59/month',
    save: 'Save $212/ year',
    subtitle: 'Conversions |  500',
    features: {
      one: '✓ 3 Custom domains',
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
      one: '✓ 5 Custom domains',
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
    price: 'Contact sales team',
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

function openLink() {
  if (link) window.open('/cabinet', '_blank', 'noopener')
}

onMounted(() => {
  if (document?.body?.clientWidth < 1174) showSlide.value = 2
  if (document?.body?.clientWidth < 768) showSlide.value = 1
})
</script>


<style>
.header-popup {
  top: 40px;
  width: 200px;
  border-radius: 10px;
  background: rgba(44, 32, 66, 0.50);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.header-popup a:hover {
  color: #415EF7;
}
.carusel-container .carousel {
  max-width: 300px;
}
.carousel__prev svg,
.carousel__next svg {
  color: white;
}
.carousel__prev {
  left: -40px;
}
.carousel__next {
  right: -40px;
}
.socials img {
  width: 26px;
  min-width: 26px;
  height: 26px;
}
.footer-logo {
  width: 10%;
  min-width: 100px;
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
  width: 10px;
  height: 10px;
  margin-right: 60px;
  flex-shrink: 0;
  border-radius: 50%;
  background: #415EF7;
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
  box-shadow: 2px -44px 292px 62px rgba(68,98,255,0.7);
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
  left: 30%;
  width: 40%;
  box-shadow: 0px 4px 250px 100px #26378E;
}
.container-publick__wrapper {
  background: #000;
  box-shadow: 0px 4px 25px 2px #000A40 inset;
}
.container-publick {
  max-width: 1220px;
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
  padding: 120px 0 0;
}
.container-publick__title-content-subtitle {
  margin-top: 20px;
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
.footer-Links {
  width: 50%;
  height: 100%;
  grid-row-gap: 1rem;
  border-right: 1px solid #21307D;
  border-left: 1px solid #21307D;
  display: grid;
  grid-template-columns: 1fr;
  justify-items: center;
}
.footer-contacts {
  width: 40%;
  display: grid;
  grid-template-columns: 1fr;
  justify-items: center;
}
.header-logo,
.header-links {
  display: none;
}
@media(min-width: 768px) {
  .header-burger {
    display: none;
  }
  .header-logo,
  .header-links {
    display: flex;
  }
  .carusel-container .carousel {
    max-width: 100%;
  }
  .container-publick__header > div:nth-child(3) {
    width: 50%;
    max-width: 630px;
    min-width: fit-content;
  }
  .footer-contacts {
    grid-template-columns: repeat(2, 1fr);
  }
  .footer-Links {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>
