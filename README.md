# Mapcrafter Docker Image

[Mapcrafter](https://mapcrafter.org/index) ([Github](https://github.com/mapcrafter/mapcrafter)) packed into a Docker image, so you
can run it without having to install anything but docker itself.

Run it using something like this:

```
docker run -it --rm \
    -v /var/lib/minecraft/world:/minecraft_world \
    -v /var/lib/mapcrafter:/map \
    t9t9t/mapcrafter -b -j2 -c /map/mapcrafter.conf
```

You can also use it without `--rm` and with `--name=mapcrafter`, then you only have to use `docker start -ai mapcrafter`
in the future to execute it using the same settings.

You would use [a config file](https://docs.mapcrafter.org/builds/stable/configuration.html) like this (which would be
located at `/var/lib/mapcrafter/mapcrafter.conf`):
```
output_dir = /map/output

[global:map]
world = myworld
rotations = top-left top-right bottom-right bottom-left
water_opacity=0.5
texture_dir=/map/textures

[world:myworld]
input_dir = /minecraft_world
default_zoom = 6
default_view = 362,-174,64

[map:map_myworld]
name = Overworld

[map:map_myworld_night]
name = Overworld - Night
render_mode = nightlight

[map:map_myworld_topdown]
name = Overworld - Top-down
render_view = topdown
```

In this particular example, the host directory `/var/lib/minecraft/world` holds the Minecraft world data, which is
mounted as a volume inside the container on `/minecraft_world` which is in turn specified as the `input_dir` of the
world. The directory `/var/lib/mapcrafter` on the host machine contains mapcrafter related data, in particular the
`output` directory where the generated map will be stored, a `textures` directory containing custom textures, and
the configuration file itself (`mapcrafter.conf`).
