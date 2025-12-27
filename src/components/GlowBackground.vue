<template>
  <!-- Wrapper fills the entire slide canvas -->
  <div class="glow-wrapper w-full h-full relative">
    <!-- Gradient layer fills wrapper -->
    <div class="glow-bg" aria-hidden="true"></div>

    <!-- Centered content -->
    <div class="relative z-10 flex items-center justify-center h-full">
      <slot />
    </div>
  </div>
</template>

<script setup lang="ts">
// No additional logic needed
</script>

<style scoped>
.glow-wrapper {
  position: relative;
  width: 100%;
  height: 100%; /* respect slide canvas height */
  overflow: hidden;
}

.glow-bg {
  position: absolute;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
}

.glow-bg::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  width: 200vmax;
  height: 200vmax;
  transform: translate(-50%, -50%);
  background: conic-gradient(from 0deg, #ff0080, #ff8c00, #40e0d0, #ff0080);
  filter: blur(140px) saturate(1.4);
  opacity: 0.7;
  animation: subtleGlow 35s ease-in-out infinite alternate;
}

@keyframes subtleGlow {
  0% {
    transform: translate(-50%, -50%) scale(1);
    opacity: 0.6;
  }
  50% {
    transform: translate(-55%, -45%) scale(1.15);
    opacity: 0.8;
  }
  100% {
    transform: translate(-50%, -50%) scale(1);
    opacity: 0.6;
  }
}
</style> 