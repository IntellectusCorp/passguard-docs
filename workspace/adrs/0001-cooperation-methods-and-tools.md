# 1. 협업을 위한 통합 문서 관리

Date: 2023-06-27

## Status

Proposed

## Context

효과적인 협업 방법 및 도구들에 대한 가이드를 수립해야 한다. 온라인과 오프라인에서 여러 형태의 소통의 기회는 제한적이기 때문에 진행 과정에서 지속적으로 일관성을 유지하면서 아이디어를 구체화 하기 위해서는 적절한 도구가 필요하다. 문서는 이러한 상황에 매우 적합한 도구이지만 형태의 자유성 때문에 불필요한 작업들을 초래하는 비효율이 발생한다.

프로젝트 과정에서 1) 팀원 사이의 소통의 결과를 일관성 있게 관리하고, 최종적으로는 2) 구축된 시스템에 대한 이해를 돕기위해 필요한 **최소한의 문서**만 작성하는 것을 원칙으로 하는 작업 규약이 필요하다.

## Decision

1. **Architecture Decision Records** 기록이 필요한 중요한 의사 결정에 대해서 ARD(Architecture Decision Records)의 사례를 프로젝트 진행에 적용한다. 본 문서와 같이 Title, Context, Decision, Status, Consequences 의 구조를 갖는 짧은 텍스트 형태의 문서이다. 각 섹션에 해당하는 내용들은 모호하지 않은 용어를 선택하고 완성된 문장으로 작성해야 한다.

        ADR에 대한 설명은 described by Michael Nygard: http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions 참고

2. **C4 model** C4 model 은 소프트웨어 아키텍처를 다이어그램으로 설명하는 접근 방법이다. 총 4 단계의 추상화 레벨에 따라 다이어그램을 작성한다. zoom in and out 을 통해 각 레벨을 연결하여 지속적인 변경 상황에 발생할 수 있는 불일치를 방지한다.

        C4 model 에 대한 설명은 https://c4model.com/ 참고

3. **structurizr-site-generatr** structurizr 는 ADR 과 C4 model 을 작성할 수 있는 도구이다. structurizr-site-generatr 는 작성된 문서를 웹에 호스팅 할 수 있도록 static pages 로 생성해 준다. github repository 와 github action 을 설정해서 작성하고 있는 문서의 변경 관리를 하고, 자동 빌드 및 github pages 를 활용한 호스팅을 설정하면 문서의 관리와 공유에 필요한 노력을 최소화 할 수 있다.

## Consequences

- 자율주행 빅데이터 플랫폼 프로젝트의 ADR은 github repository 의 해당 [폴더](https://github.com/IntellectusCorp/data-fabric-docs/tree/main/workspace/adrs)를 통해 관리한다. Repository 에 수정 권한이 있는 사용자들이 문서를 추가하거나 수정할 수 있다.
- C4 Model 문서는 structurizr 의 DSL 문법에 따라 작성하며 동일한 Github Repository 를 통해서 관리한다. 파일 위치: [workspace.dsl](https://github.com/IntellectusCorp/data-fabric-docs/blob/main/workspace/workspace.dsl)
- 동일한 Github Repository 에서 작성된 문서를 호스팅한다. 주소는: [intellectuscorp.github.io/data-fabric-docs](https://intellectuscorp.github.io/data-fabric-docs/master/)