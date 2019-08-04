import 'package:objd/core.dart';

class ClickFile extends Widget {
  @override
  generate(Context context) {
    Entity target = Entity(tags: ["target"]);
    Entity nearTarget = target.copyWith(distance: Range(to: 0.6));
    Score motionX = Score(nearTarget, "motionX");
    Score motionZ = Score(nearTarget, "motionY");

    return Raycast(Entity.Selected(), onhit: [
      Execute.align(
        "x",
        children: [
          Execute.positioned(Location.rel(x:0.5,z:0.7),children:[
            motionX.subtract(),
          ]),
          Execute.positioned(Location.rel(x:0.5,z:-0.7),children:[
            motionX.add(),
          ]),
        ],
      ),
      Execute.align(
        "z",
        children: [
          Execute.positioned(Location.rel(x:0.7,z:0.5),children:[
            motionZ.subtract(),
          ]),
          Execute.positioned(Location.rel(x:-0.7,z:-0.5),children:[
            motionZ.add(),
          ]),
        ],
      ),
      Execute.as(target.copyWith(distance: Range(to: 5)), children: [
        Data.fromScore(
          Entity.Selected(),
          path: "Motion[0]",
          score: Score.fromSelected("motionX"),
          scale: 0.1,
          datatype: "double",
        ),
        Data.fromScore(
          Entity.Selected(),
          path: "Motion[1]",
          score: Score.fromSelected("motionZ"),
          scale: 0.1,
          datatype: "double",
        ),
      ])
    ], ray: (_, hit) {
      return For.of([
        If(
          Entity.Selected(
            distance: Range(from: 5),
          ),
          Then: [
            Particle(ParticleType.flame, location: Location.here()),
          ],
        ),
        If(
          Condition.block(Location("~ 54 ~"), block: Block.gray_stained_glass),
          Then: [hit()],
        )
      ]);
    });
  }
}
