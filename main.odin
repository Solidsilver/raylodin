package main

import "core:fmt"
import "core:math"
import "vendor:raylib"

main :: proc() {
	fmt.println("Hellope!")
	screenWidth: i32 = 800
	screenHeight: i32 = 450

	raylib.InitWindow(screenWidth, screenHeight, "Hello from Odin")
	raylib.SetTargetFPS(120)

	defer raylib.CloseWindow()

	ballPos := raylib.Vector2{f32(screenWidth) / 2, f32(screenHeight) / 2}
	ballRad: f32 = 10.0

	for (!raylib.WindowShouldClose()) {
		if (raylib.IsKeyDown(raylib.KeyboardKey.LEFT)) {
			ballPos.x -= 2.0
		}
		if (raylib.IsKeyDown(raylib.KeyboardKey.RIGHT)) {
			ballPos.x += 2.0
		}
		if (raylib.IsKeyDown(raylib.KeyboardKey.UP)) {
			ballPos.y -= 2.0
		}
		if (raylib.IsKeyDown(raylib.KeyboardKey.DOWN)) {
			ballPos.y += 2.0
		}
		if (raylib.IsKeyDown(raylib.KeyboardKey.P)) {
			ballRad += 2.0
		}
		if (raylib.IsKeyDown(raylib.KeyboardKey.O)) {
			ballRad -= 2.0
		}


		ballRad = clamp(ballRad, 4, f32(min(screenWidth, screenHeight)) / 2.0)
		ballPos.x = clamp(ballPos.x, ballRad, f32(screenWidth) - ballRad)
		ballPos.y = clamp(ballPos.y, ballRad, f32(screenHeight) - ballRad)

		raylib.BeginDrawing()
		raylib.ClearBackground(raylib.BLACK)
		raylib.DrawText("Hello Window from Zig!", 10, screenWidth / 2, 20, raylib.LIGHTGRAY)
		raylib.DrawCircleV(ballPos, ballRad, raylib.MAROON)
		raylib.EndDrawing()
	}


}
