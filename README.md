# PassGuard System Architecture

이 문서는 C4 model 에 기초하여 passguard 프로젝트의 소프트웨어(시스템) 아키텍처에 대한 문서 프로젝트 입니다.
Documentation as a Code 의 아이디어를 착안해 [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr)를 이용해서 작성된 코드를 github webpage hosting 을 이용해서 발행하고 있습니다.

## 호스팅 주소

github pages hosting URL: [intellectuscorp.github.io/passguard-docs](https://intellectuscorp.github.io/passguard-docs/master/)

## 문서의 편집과 발행

### 문서의 편집

[문서 레포지토리](./)를 clone 하고, 에디터를 이용해서 필요한 문서를 추가하거나 편집 합니다.

### 문서 발행 전 디버깅

아래 명령어를 이용하면 docker container를 실행시킬 수 있습니다. Port forwarding 옵션을 추가해서 로컬 환경의 웹브라우저를 통해 발행 될 사이트에 대한 디버깅을 수행할 수 있습니다. 자세한 사용법은 [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr)에서 확인 가능합니다.

```bash
docker run -it --rm -v /path/to/local-repository/workspace:/var/model -p 8080:8080 \
ghcr.io/avisi-cloud/structurizr-site-generatr serve -w passguard-c4.dsl --assets-dir docs/assets
```

> [!TIP]
> docker 프로세스의 실행 OS User의 파일 시스템에 대한 권한 문제로 container 인스턴스 내부에 마운트 된 파일 시스템에 사이트 파일 생성이 실패할 수 있습니다.
> root 실행 권한이 있을 경우, container 실행을 root 유저로 실행해서 권한 문제를 회피할 수 있습니다.
>
> ```bash
> sudo docker run --user root -it --rm -v /path/to/local-repository/workspace:/var/model -p 8080:8080 \
> ghcr.io/avisi-cloud/structurizr-site-generatr serve -w passguard-c4.dsl --assets-dir docs/assets
> ```

[dsl reference document](https://github.com/structurizr/dsl/blob/master/docs/language-reference.md) 에서 workspace.dsl 문서의 사용법을 확인할 수 있습니다.
