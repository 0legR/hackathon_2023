<template lang="pug">
.container
  .flex.justify-between
    h1 campaign list
    NuxtLink.p-3.text-sm.font-medium.text-dark.uppercase.bg-primary.rounded(to="cabinet/create") create campaign
</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})
</script>