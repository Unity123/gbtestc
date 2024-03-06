{ pkgs }: {
	deps = [
   pkgs.python3
   pkgs.wget
   pkgs.pkg-config-unwrapped
   pkgs.xterm
   pkgs.neofetch
	 pkgs.cmake
	 pkgs.gdb
   pkgs.xorg.xauth
   pkgs.alsa-lib
	];
}