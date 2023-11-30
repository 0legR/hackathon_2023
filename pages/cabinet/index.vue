<template lang="pug">
.container
  .flex.justify-between
    h1 campaign list
    NuxtLink.p-4.border(to="cabinet/create") create campaign
</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})
</script>