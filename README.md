# s2_app

### web 실행 
```
 $ flutter run -d chrome
```

### web 빌드
~~~
 $ flutter build web
~~~
### flutter 주요 widget 
- 레이아웃: Scaffold, Stack, Row, Column
- 구조: Button, Toast, MenuDrawer
- 스타일: TextStyle, Color
- 애니메이션: FadeInPhoto, Transform
- 위치와 정렬: Center, Padding
### Package 관리 
- pub 주요 사용
~~~
$ flutter pub add http // http 의존성 추가 
$ flutter pub get // 패키지 재로딩 
~~~
- pub 명령어 
~~~
  add         pubspec.yaml에 의존성을 추가한다.
  cache       Work with the Pub system cache.
  deps        패키지 의존성들을 출력한다.
  downgrade   플러터 프로젝트의 패키지들을 다운그레이드한다.
  get         플러터 프로젝트로 패키지들을 가져온다.
  global      Work with Pub global packages.
  login       Log into pub.dev..
  logout      Log out of pub.dev..
  outdated    업그레이드 가능한 패키지를 찾아준다.
  pub         Pass the remaining arguments to Dart's "pub" tool.
  publish     Publish the current package to pub.dartlang.org.
  remove      Removes a dependency from the current package..
  run         Run an executable from a package.
  test        Run the "test" package.
  upgrade     Upgrade the current package's dependencies to latest versions..
  uploader    Manage uploaders for a package on pub.dev.
  version     Pub의 버전을 출력한다.
~~~
### 로컬에 대한 cors 검증 제거
~~~
$ dart pub global activate flutter_cors // 설치 
$ export PATH="$PATH":"$HOME/.pub-cache/bin" // ~/.zshrc 환경 변수 추가

$ fluttercors --disable // 비활성화 (이걸해야 로컬 cors 제거)
$ fluttercors --enable // 활성화 
~~~