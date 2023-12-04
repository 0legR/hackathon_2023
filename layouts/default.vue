<template lang="pug">
.bg-dark.w-full.bg-img
  slot
</template>
<script setup>
useHead({
  title: 'Landing',
  link: {
    rel: 'icon',
    href: '/logo.png',
  },
})
</script>
<style>
.bg-img {
  /* background-image: url('matrix.gif'); */
}
</style>
