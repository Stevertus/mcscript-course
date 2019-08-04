import 'package:objd/core.dart';
import './files/main.dart';
import './files/click.dart';

var mainText = "this is the main";

main(List<String> args) {
  createProject(
    Project(
      name: "Test Pack",
      target: "../",
      generate: Pack(
        name: "example",
        main: File(
          "main",
          child: MainFile()
        ),
        load: File("load"),
        modules: [
          ClickEvent(
            onClick: ClickFile(),
          )
        ],
        files: [
          File("summon",child: Execute(
            children: [
              Command(
                      'summon boat ~0.5 ~0.5 ~0.5 {Tags:[target],NoGravity:1b,Invulnerable:1b,Type:"oak",Passengers:[{id:"minecraft:turtle",Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b},{id:"minecraft:turtle",Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b}]}'
            )
            ]
          ).center()),
          File(
            "files/main",
            child: For.of([
              Log(mainText),
              File.execute(
                "files/function",
                child: Log("this is the main")
              ),
              For(
                to: 5,
                create: (int i) => File(
                  "files/$i",
                  child: Log(i)
                )
              )
            ])
          )
        ]
      )
    ),
    args
  );
}