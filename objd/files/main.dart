import 'package:objd/core.dart';

class MainFile extends Widget {
  @override
  generate(Context context) {
    Tag isWall = Tag("isWall", entity: Entity.Selected());

    return Execute.asat(
      Entity.All(),
      children: [

        Fill.replace(
          Block.air,
          replace: Block.barrier,
          area: Area.fromLocations(
            Location.rel(x:2,y:2,z:2),
            Location.rel(x:-2,y:-2,z:-2),
          )
        ),

        isWall.removeIfExists(
          then: If(
            Condition.block(Location.rel(y:-1),block: Block.air),
            Then: [
              SetBlock(Block.barrier,location: Location.rel(y:-1))
            ]
          )
        ),

        If(
          Condition.block(
            Location.rel(y: -1),
            block: Block.orange_concrete,
          ),
          Then: [
            Effect(
              EffectType.speed,
              entity: Entity.Selected(),
              duration: 1,
              amplifier: 5,
              showParticles: false,
            ),
          ],
        ),
        If(
          Condition.block(
            Location.rel(y: -1),
            block: Block.lime_concrete,
          ),
          Then: [
            Effect(
              EffectType.jump_boost,
              entity: Entity.Selected(),
              duration: 1,
              amplifier: 3,
              showParticles: false,
            ),
          ],
        ),
        AroundLocation(
          1,
          top: false,
          bottom: false,
          build: (Location loc) => If(
            Condition.block(loc, block: Block.pink_concrete),
            Then: [isWall.add()],
          ),
        ),
        Execute.positioned(Location.rel(y: 1), children: [
          AroundLocation(
            1,
            top: false,
            bottom: false,
            build: (Location loc) => If(
              Condition.block(loc, block: Block.pink_concrete),
              Then: [isWall.add()],
            ),
          ),
        ]),
      ],
    );
  }
}
