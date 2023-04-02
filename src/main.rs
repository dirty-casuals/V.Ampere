use bevy::prelude::*;
use bevy::window::{PrimaryWindow, WindowResolution};

pub const SCREEN_WIDTH: f32 = 960.0;
pub const SCREEN_HEIGHT: f32 = 592.0;

fn main() {
    App::new()
        .add_startup_system(spawn_camera)
        .add_plugins(DefaultPlugins.set(WindowPlugin {
            primary_window: Some(Window {
                resolution: WindowResolution::new(SCREEN_WIDTH, SCREEN_HEIGHT),
                ..default()
            }),
            ..default()
        }))
        .run();
}

fn spawn_camera(mut commands: Commands, window_query: Query<&Window, With<PrimaryWindow>>) {
    let window = window_query.get_single().unwrap();

    commands.spawn(Camera2dBundle {
        transform: Transform::from_xyz(window.width() / 2.0, window.height() / 2.0, 0.0),
        ..default()
    });
}
