## PassGuard 프로젝트

본 웹 사이트는 PassGuard 시스템에 대한 문서를 제공 합니다. 아키텍처와 관련된 문서들은 [C4 Model](https://c4model.com/) 의 가이드를 따르며, 추가적으로는 특정 주제에 최적화된 형태의 문서들도 포함하고 있습니다.

### 배경

대부분의 서비스는 회원 인증 시스템을 기본적으로 요구합니다.
회원 인증 즉, 사용자 식별 방식은 ID/PW 일치 확인 방식에서 OAuth2.0 프로토콜 기반의 간편 소셜 인증 방식으로 발전하고 있습니다.
하지만 OAuth 프로토콜은 사용자의 일부 리소스 권한을 3rd Party Application에게 위임하는 방식이므로 3rd Party Application 개발자는 서비스 진위 여부를 증명할 필요가 있습니다.

PassGuard는 서비스 개발자가 api를 통해 사용자 인증을 처리할 수 있도록 지원하는 Identity 솔루션입니다.
사용자 개인정보를 사용하지 않아서 안전하고, 서비스 등록 절차도 OAuth 인증 방식보다 간단합니다.

### 비즈니스 핵심 목표

1. 서비스 개발자가 회원 인증 기능 문제를 빠르게 해결하고 핵심 비즈니스에 집중한다.
2. 서비스 개발자가 [WebAuthn](https://webauthn.io/) 인증 방식을 간단하게 도입한다.
   - 민감한 회원 정보를 사용하지 않는다.
   - 회원은 인증 정보 및 방식을 기억할 필요가 없다.
   - 생체 인증 등을 지원하는 passkey 인증 적용

### 발전 방향

- 서비스간 사용자 리소스 공유
- 자기주권적 신원증명

### FAQ

Q. PassGuard는 OAuth 를 대체 하나요?

> 대부분의 서비스는 OAuth 기술을 소셜 로그인 인증 구현을 위해 사용하고 있습니다.
> PassGuard를 연동하면 소셜로그인 기반의 간편 인증보다 더 간단한 passkey 기반의 인증 기능을 도입할 수 있습니다. 따라서 사용자 인증 관점에서는 OAuth 프로토콜을 대체할 수 있습니다.

Q. PassGuard를 이용 했을 때, Google, Facebook 등 계정을 활용한 Social Login 을 여전히 지원하는 것인가요? 혹은 PassGuard가 또 하나의 Social Login 제공자 인가요?

> 소셜 로그인을 온전히 대체하는 것을 목표로하지만 기존 시스템과의 호환을 고려했을 때, 또하나의 소셜 로그인처럼 연동하는 것이 더 유리할 수 있습니다.

Q. PassGuard를 이용하는 방법은 API 통합인가요? 별도의 프로그램 설치 혹은 서버 구축인가요?

> 1. 서드파티 웹페이지 상에서 PassGuard 서버와 통신하여 사용자 인증을 진행합니다.
> 2. 서드파티 서버는 1의 결과로 얻은 정보를 검증하기위해 PassGuard 서버와 통신합니다.
>
> 예상 시나리오
>
> 1. 사용자가 A 서비스 웹사이트에서 pass guard api를 통해 임시 자격증명 생성을 위한 기본정보를 획득
> 2. 사용자가 해당 정보로 passkey 인증을 진행하고 임시 자격증명서를 발급
> 3. 사용자가 pass guard api에 임시 자격증명서를 포함하여 요청하고 임시 신원 증명서를 발급
>    - 임시 자격증명서는 만료 기한, 사용자 정보, 인증 정보, 서비스 정보 등을 포함
> 4. 발급 받은 신원 증명서를 A 서비스 api 요청에 포함
>    - 서비스 내 사용자 식별 정보, 관리자 추가 정보, 사용자 인증 유무, 만료 기한 등 포함
> 5. A 서비스는 신원증명서를 통해 사용자를 식별

### 제공하고 있는 문서들

1. [System Context View](identity-service/context/): 전체 시스템이 외부의 다른 시스템과 어떤 상호 관계가 있는지 나타냅니다. 시스템의 세부 항목들은 의도적으로 생략 합니다. 이해관계자와 역할 등을 표시하여 도메인이나 엔지니어링의 전문적인 배경이 없는 사람도 비교적 쉽게 이해할 수 있습니다.

2. [Container diagram](identity-service/container): 컨테이너는 코드를 실행하거나 데이터를 저장하는 등 실행/배포 가능한 단위 입니다. 소프트웨어 시스템에서 각 역할에 대한 요소들이 어떻게 배치(deployment)되고 어떠한 기술 사양으로 구현되는지에 대한 정보를 포함하고 있습니다.

### System Landscape Diagram

System Landscape Diagram 은 최고 수준의 추상화 관점에서 시스템이 외부의 요소들과 어떤 관계를 갖는지를 나타냅니다.
![System Landscape Diagram](embed:SystemLandscape)
