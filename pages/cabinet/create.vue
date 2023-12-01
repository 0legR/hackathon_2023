<template lang="pug">
.container.pt-6
  .flex.w-fit.justify-center.items-center.mx-auto
    button.w-40.h-10(:class="{ 'activeTab': activeTab === mainTab }" @click="activeTab = mainTab") Main Settings
    button.w-40.h-10(:class="{ 'activeTab': activeTab === prospectsTab }" @click="activeTab = prospectsTab") Prospects
  .flex.flex-col.gap-y-4.items-center.w-full.min-h-screen.mt-6(v-if="activeTab === mainTab")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Company name")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Domain name")
    teaxtarea.border.border-dark.h-60.rounded-md.text-base.text-dark.p-2(class="w-1/2")
  .flex.w-full.min-h-screen(v-if="activeTab === prospectsTab") Prospects
</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})
const activeTab = ref('main')
const mainTab = 'main'
const prospectsTab = 'prospects'
</script>

<style>
/*  */
</style>