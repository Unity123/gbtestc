#include <SDL2/SDL.h>
#include <stdio.h>

int main(int argc, char **argv) {
	if (SDL_Init(SDL_INIT_VIDEO)) {
    printf("Failed to initialize SDL2: %s\n", SDL_GetError());
    return 1;
  }
  SDL_Window *window = SDL_CreateWindow("TestGB", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 320, 288, 0);
  if (!window) {
    printf("Failed to create window: %s\n", SDL_GetError());
    SDL_Quit();
    return 1;
  }
  SDL_Renderer* renderer = SDL_CreateRenderer(window, 0, SDL_RENDERER_ACCELERATED);

  SDL_Event event;

  int running = 1;
  while (running) {
    while (SDL_PollEvent(&event)) {
      printf("Event: %d\n", event.type);
      if (event.type == SDL_QUIT) {
        running = 0;
      }
      if (event.type == SDL_KEYDOWN) {
        running = 0;
      }
    }
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    SDL_RenderClear(renderer);
    SDL_RenderPresent(renderer);
    SDL_Delay(100);
  }

  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();
  return 0;
}