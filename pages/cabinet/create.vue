<template lang="pug">
.container.pt-6
  .flex.w-fit.justify-center.items-center.mx-auto
    button.w-40.h-10(:class="{ 'activeTab': activeTab === mainTab }" @click="activeTab = mainTab") Main Settings
    button.w-40.h-10(:class="{ 'activeTab': activeTab === prospectsTab }" @click="activeTab = prospectsTab") Prospects
  .flex.flex-col.gap-y-4.items-center.w-full.min-h-screen.mt-6(v-if="activeTab === mainTab")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Company name")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Domain name")
    teaxtarea.border.border-dark.h-60.rounded-md.text-base.text-dark.p-2(class="w-1/2")
  .flex.flex-col.w-full.overflow-auto(v-if="activeTab === prospectsTab")
    .flex.justify-between.w-full.mt-10
      button.w-40.h-10.border.border-dark.h-10.rounded-md.text-base.text-dark(@click="importProspect") Import
      button.w-40.h-10.border.border-dark.h-10.rounded-md.text-base.text-dark(@click="exportProspect") Export
    .flex.mt-10
      input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Search")
    .prospect-tab__list-table.flex.flex-col.w-full.space-y-4.mt-10
      .prospect-tab__list-header.flex.border.border-dark.h-10.rounded-md
        .flex.items-center.justify-center(
          v-for="item in prospectsListHeader"
          :key="item"
        ) {{ item }}
      .prospect-tab__list-content.flex.w-full.border.border-dark.h-20.rounded-md.text-base.text-dark.p-2(
        v-for="(prospect, index) in prospectsList"
      )
        .flex.items-center.justify-center
          .truncate {{ prospect.id || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.name || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.url || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.opens || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.time || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.clicks || 'N/A' }}

</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})
const activeTab = ref('main')
const mainTab = 'main'
const prospectsTab = 'prospects'

const prospectsListHeader = ref(['Id', 'Name', 'Links', 'Opens', 'Times', 'Click'])
const prospectsList = ref([
	{
		id: "234234234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "232434234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23322234234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23423465465434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "2334",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "24",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23465434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	}
])

function importProspect() {
  console.log('Import')
}

function exportProspect() {
  console.log('Export')
}
</script>

<style>
.prospect-tab__list-header > div:nth-child(1),
.prospect-tab__list-header > div:nth-child(2),
.prospect-tab__list-header > div:nth-child(3) {
  width: 20%;
}
.prospect-tab__list-header > div:nth-child(4),
.prospect-tab__list-header > div:nth-child(5),
.prospect-tab__list-header > div:nth-child(6) {
  width: 13.3%;
}
.prospect-tab__list-content > div:nth-child(1),
.prospect-tab__list-content > div:nth-child(2),
.prospect-tab__list-content > div:nth-child(3) {
  width: 20%;
}
.prospect-tab__list-content > div:nth-child(4),
.prospect-tab__list-content > div:nth-child(5),
.prospect-tab__list-content > div:nth-child(6) {
  width: 13.3%;
}
</style>