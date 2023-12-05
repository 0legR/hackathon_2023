<template lang="pug">
.container.create-section.pt-16.min-w-full.flex.gap-x-6
  .card.flex.flex-col.gap-y-4.items-center.p-4.rounded-lg(class="w-1/2")
    h2.text-xl.text-light.font-bold Personal data
    input.w-full.border.border-dark.h-10.rounded-md.text-base.p-2.mt-6(placeholder="First Name")
    input.w-full.border.border-dark.h-10.rounded-md.text-base.p-2(placeholder="Second Name")
    input.w-full.border.border-dark.h-10.rounded-md.text-base.p-2(placeholder="Email")
    input.w-full.border.border-dark.h-10.rounded-md.text-base.p-2(placeholder="Phone")
    input.w-full.border.border-dark.h-10.rounded-md.text-base.p-2(placeholder="Address")
    button.p-3.text-sm.font-medium.text-light.text-center Save
  .flex.flex-col.gap-y-4(class="w-1/2")
    .card.flex.flex-col.gap-y-4.items-center.rounded-lg.w-full.p-4
      h2.text-xl.text-light.font-bold Reset password
      input.w-full.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(placeholder="Old Password" type="password")
      input.w-full.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(placeholder="New Password" type="password")
      input.w-full.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(placeholder="Confirm Password" type="password")
      button.p-3.text-sm.font-medium.text-light.text-center Save
    .card.flex.flex-col.gap-y-4.items-center.rounded-lg.w-full.p-4
      h2.text-xl.text-light.font-bold About Me
      input.w-full.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(placeholder="My role")
      textarea.w-full.border.border-dark.h-50.rounded-md.text-base.text-dark.p-2(placeholder="My main goals")
      button.p-3.text-sm.font-medium.text-light.text-center Save
</template>
<script setup>
definePageMeta({
  layout: 'cabinet',
})
</script>
<style>
.card button {
  width: 200px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  background: #4462FF;
}
.card textarea,
.card input {
  background: rgba(217, 217, 217, 0.10);
  color: #CBCBCB;
}
.card {
  background: rgb(44, 32, 66, 0.60);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
</style>