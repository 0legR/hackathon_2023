<template lang="pug">
#campaign-form.container.pt-6
  .flex.w-fit.justify-center.items-center.mx-auto
    button.w-40.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === mainTab }" @click="activeTab = mainTab") Main Settings
    button.w-40.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === prospectsTab }" @click="activeTab = prospectsTab") Prospects
  .flex.flex-col.gap-y-4.items-center.w-full.min-h-screen.mt-6(v-if="activeTab === mainTab")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.name" class="w-1/2" placeholder="Company name")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.domain" class="w-1/2" placeholder="Domain name")
    select.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.goal" class="w-1/2" placeholder="Select your goal")
      option.text-light(:disabled="true") Select your goal
      option(v-for="goal of goals" :key="goal") {{ goal }}
    textarea.border.border-dark.h-60.rounded-md.text-base.text-dark.p-2(v-model="form.description" class="w-4/5" placeholder="Deepest Insights, Alerts, & Automation Platform to Improve User Experience, real-time, 24×7")
    .flex.flex-col.gap-y-4(class="w-1/2")
      .flex.justify-center.items-center.gap-x-4.f-wull(v-if="form.buttons.length" v-for="(btn, index) of form.buttons" :key="`${btn}-${index}`")
        input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="btn.title" class="w-1/2" placeholder="Btn Label")
        input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="btn.url" class="w-1/2" placeholder="Btn Url")
      .flex.justify-center.items-center.gap-x-4.f-wull(v-else)
        input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.buttons[0].title" class="w-1/2" placeholder="Btn Label")
        input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.buttons[0].url" class="w-1/2" placeholder="Btn Url")
    button.p-3.text-sm.font-medium.text-light.uppercase.bg-primary.rounded.text-center Generate
  .flex.w-full.min-h-screen(v-if="activeTab === prospectsTab") Prospects
</template>

<script setup>
definePageMeta({
  layout: 'cabinet',
})

const activeTab = ref('main')
const form = ref({
  name: '',
  domain: '',
  description: '',
  goal: 'Select your goal',
  buttons: [
		{
			title: '',
			url: '',
		},
    {
			title: '',
			url: '',
		},
	],
})

const mainTab = 'main'
const prospectsTab = 'prospects'
const goals = [
  'Collect Emails',
  'Get Contacted',
  'Schedule Appointments',
  'Link to Site',
]
// ----------methods--------
function tabToggler(val) {
  console.log('.value', val)
  // activeTab.value = val
}
</script>

<style>
.vs__dropdown-toggle {
  color: rgb(9, 29, 37);
  padding: 0.5rem;
  border: 1px solid rgb(9, 29, 37);
  border-radius: 0.375rem;
  width: 100%;
  height: 2.5rem;
}
.btn-tab {
  background-color: azure;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.btn-tab--active {
  background-color: aquamarine;
}
</style>