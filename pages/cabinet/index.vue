<template lang="pug">
.container.min-w-full
  .campaign-list__wrapper.flex.flex-col.py-4.px-6
    .flex.mb-12.w-full
      NuxtLink.campaign-list__btn.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet/create") Create
    .flex.flex-col.space-y-4.overflow-auto
      NuxtLink.campaigns__list.flex.w-full.border.border-dark.text-base.pl-8.py-2.cursor-pointer(
        v-for="(campaign, index) in campaignsList"
        :key="campaign.id"
				:to="{name: 'cabinet-create', query: { id: campaign.id }}"
      )
        .flex.items-center.text-2xl.mr-4 {{ campaign?.name }}
        .flex.flex-col.items-center.justify-center.w-full
          img(src="~/public/click.png" width="20" height="20" alt="click image")
          span.w-full.text-2xl.font-medium.text-center.truncate {{ campaign?.clicks }}
          span.campaigns__list-click Click
        .flex.flex-col.items-center.justify-center.w-full
          img(src="~/public/open.png" width="20" height="20" alt="open image")
          span.w-full.text-2xl.font-medium.text-center.truncate {{ campaign?.opens }}
          span.campaigns__list-open Open
</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})

const campaignsList = ref([])

// -------methds-----------
async function getCampaigns() {
  try {
    const { data } = await useFetch(`campaigns`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    campaignsList.value = data.value
  } catch (error) {
    console.log('getCampaigns Error')
  }
}
await getCampaigns()
</script>
<style>
.campaign-list__wrapper {
  height: calc(100vh - 36px);
}
.campaigns__list {
  color: white;
  height: 100px;
	border-radius: 10px;
  background: rgba(22, 31, 80, 0.50);
}
.campaigns__list > div:nth-child(1) {
  width: 60%;
  border-right: 1px solid white;
}
.campaigns__list > div:nth-child(2),
.campaigns__list > div:nth-child(3) {
  width: 20%;
}
.campaign-list__btn {
  color: white;
  font-family: Tahoma;
  font-size: 18px;
  width: 100%;
  max-width: 200px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  background: #4462FF;
}
.campaigns__list-open,
.campaigns__list-click {
  font-size: 12px;
}
</style>