<template lang="pug">
.container.flex.items-center.justify-center.gap-x-4.h-screen
  NuxtLink.p-3.text-sm.font-medium.text-light.uppercase.bg-firebrick.rounded.text-center(to="https://www.anybiz.io")
    span.default Stay in Matrix
    span.hovered Leave
  NuxtLink.p-3.text-sm.font-medium.text-light.uppercase.bg-darkcyan.rounded.text-center(to="cabinet")
    span.default Go to Reality
    span.hovered Ready
</template>

<style>
.bg-firebrick {
  background-color: firebrick;
  min-width: 132px;
}
.bg-darkcyan {
  background-color: darkcyan;
  min-width: 132px;
}
.bg-darkcyan:hover .default,
.bg-firebrick:hover .default {
  display: none;
}
.bg-darkcyan:hover .hovered,
.bg-firebrick:hover .hovered {
  display: block;
}
.hovered {
  display: none;
}
.default {
  display: block;
}
</style>