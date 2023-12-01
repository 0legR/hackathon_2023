<template lang="pug">
.w-full.min-h-screen.preview-bg
  .container
    .hero.w-full.h-60.flex.justify-center.items-center
      h1.text-light.text-6xl.font-bold {{ campaign.name }}
    .w-full.flex
      .flex.flex-col.gap-y-4.border-r(class="w-1/3")
        NuxtLink.p-3.text-sm.font-medium.text-light.uppercase.bg-light.text-center.shadow-xl.rounded-full(
          v-if="btn.title && btn.url"
          v-for="btn of campaign.buttons"
          :key="btn.title"
          :to="btn.url"
        ) {{ btn.title }}
      .flex(class="w-2/3")
</template>
<script setup>
const {campaign} = defineProps(['campaign'])
</script>
<style>
.hero {
  background-image: url('@/hero-bg.jpeg');
}
.preview-bg {
  background: linear-gradient(150deg, #d0f8e2, transparent);
}
.border-r {
  border-right: 1px solid #ccc; 
}
</style>