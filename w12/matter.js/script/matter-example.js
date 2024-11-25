// module aliases - 가명 aka같은 느낌
// var Engine = Matter.Engine, //오래된 틀딱!코드-var
//   Render = Matter.Render,
//   Runner = Matter.Runner,
//   Bodies = Matter.Bodies,
//   Composite = Matter.Composite;

//짧게 쓰기위한 변수처리 objectdis Destructuring
const { Engine, Render, Runner, Bodies, Composite } = Matter;
// matter안에 engin...들이있으니까 .해서 불러오는 것들을 engine.matter이런식으로 입력한다고 짧게 만든것

// create an engine
// var engine = Engine.create();
//엔진 생성(물리 시뮬레이션을 위한) - 필수
const anyEngine = Engine.create();

// create a renderer
// var render = Render.create({
//   element: document.body,
//   engine: engine,
// });
//화면에 그리기위한 랜더러 생성 p5에서 그릴거라면 필수는 X
const anyRender = Render.create({
  element: document.body,
  engine: anyEngine,
  options: { width: 600, height: 800 }, // 창 크기 변경사항
});

// create two boxes and a ground
// var boxA = Bodies.rectangle(400, 200, 80, 80);
// var boxB = Bodies.rectangle(450, 50, 80, 80);
// var ground = Bodies.rectangle(400, 610, 810, 60, { isStatic: true });//istatic물리적으로 못건드리게 하는코드

//월드에 집어 넣을 바디를 생성 두개는 박스, 하나는 같은 박스지만 static처리가 되어서 바닥으로 역할한다.
let boxA = Bodies.rectangle(400, 200, 80, 80); //중앙 좌표center를 중심으로 제작됨
let boxB = Bodies.rectangle(450, 50, 80, 80);
let circle = Bodies.circle(200, 100, 80);
let ground = Bodies.rectangle(400, 610, 810, 60, { isStatic: true }); //istatic물리적으로 못건드리게 하는코드

// add all of the bodies to the world
// Composite.add(engine.world, [boxA, boxB, ground]);
//월드에서 만든 것들을 모두 집어넣기위해서 컴포짓트를 사용함
Composite.add(anyEngine.world, [boxA, boxB, ground]);
Composite.add(anyEngine.world, [circle]);

// run the renderer
// Render.run(render);

//렌더 모듈에게 만든객체를 랜더로 만들라고 말함
Render.run(anyRender);

// create runner
// var runner = Runner.create();

//러너 객체 제작
const anyRunner = Runner.create();

// run the engine
// Runner.run(runner, engine);

//생성된 러너 모듈 실행하도록
Runner.run(anyRunner, anyEngine);
