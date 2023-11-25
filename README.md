# 마이디어 펫(반려용품 판매 쇼핑몰)
**예담 중간프로젝트**

## 목차
  - [프로젝트 개요](#프로젝트-개요)
  - [DB구성도](#DB-구성도)
  - [프로젝트 구현 요약](#프로젝트-구현-요약)

## 프로젝트 개요
- 프로젝트 이름: PetGoodsProject
- 프로젝트 개발기간: 2023.11.10 ~ 2023.11.22 (약 2주)
- 프로젝트 구현기술: html/css/js/bootstrap,Java,jsp,servlet,mybatis,tiles,git, oracle DB
- 멤버: 전민교, 서영희, 김준성, 김은별

![개요](https://github.com/dev-min2/PetGoodsProject/assets/82199372/0146888c-8309-4984-891d-92b54fe46fce)

## DB 구성도
![db구성도](https://github.com/dev-min2/PetGoodsProject/assets/82199372/ba2589c2-6426-4e9e-bce4-455332cb40ca)

## 프로젝트 구현 요약
### 1. 메인페이지
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/1921d02d-209a-426d-8107-2fc3ba3bc1e9)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/331b992e-9967-4d0e-b646-4f6b6318770d)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/96ee99c2-e02a-413a-b961-42099f9b309c)
- 상품마다 강아지/고양이 상품인지에 대한 정보를 통해 상품리스트들이 노출됨
- 고양이버튼 클릭후 고양이 상품으로 전환 → 다시 강아지 상품으로 전환가능
- 메인페이지에 노출되는 상품리스트는 상품등록일, 판매량이 높은순, 별점 높은순으로 4개씩 상품을 노출
- 신상품,베스트상품,추천상품또한 위와 같은 기준으로 노출을 하되 전체 리스트를 보여주게 했으며 페이징 기능 구현

### 2. 상품 검색 및 카테고리
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/a9a2c289-88dd-4a63-b006-94296f9e7020)
- SQL의 LIKE 연산자를 이용해 검색한 문자가 상품이름에 포함 된 상품 리스트를 가져와 노출.
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/ce76fc9c-59e0-4ec1-a3eb-ffacd49011b5)
- 상품이 가지는 카테고리 정보를 통해 카테고리 상품 조회 가능
- 한 페이지에 8개의 상품 리스트를 노출하며, 그 이상의 상품들은 페이징을 통해 볼 수있게 처리.

### 3. 결제 기능
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/9778da4b-d098-4023-a9a0-b042813bc7cd)
- 장바구니에서 선택한 물품들을 결제 기능구현 화면에서 가져와 결제준비
- 결제수단은 아임포트api를 이용하여 다양한 결제사(kg이니시스,토스,카카오페이)를 선택할 수 있음
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/dc259995-b7e2-4a79-ae83-0309bbd7ac80)
- 클라이언트측의 상품 가격 조작 시 서버에서 가격검증을 할 때 결제한 금액과 DB상에 저장된 실제 상품 가격의 총합이 다르다면 결제취소 및 환불처리를 진행

### 4. 결제시 쿠폰 사용
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/bb4bf627-06e7-49d2-bc00-9e781d5134d7)
- 쿠폰 사용 시 현재 상품 목록의 가격에 쿠폰 할인 퍼센트를 적용하여 해당 금액만큼 할인 적용 서버에서도 쿠폰을 사용했다면 실제 사용한 쿠폰이 있는지 확인 후 사용처리.

### 5. 결제 완료
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/b4113dbe-1ec3-4f37-acd1-0fc00af38bde)
- 결제가 정상적으로 완료될 시 결제완료 화면으로 이동. 결제 시 구매한 상품명과 팀에서 관리되는 주문번호를 노출
- 주문내역 확인하기 버튼을 통해 마이페이지의 주문내역 화면으로 이동 가능

### 6. 주문 내역 확인
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/ff7e7ce4-54a3-40b3-88b6-bd90db9c3d73)
- 결제가 완료된 상품들을 마이페이지안의 주문내역 화면에서 확인이 가능. 리뷰 작성 및 작성한 리뷰가 있다면 리뷰 보기 및 해당 상품의 하이퍼 링크 연결

### 7. 로그인 및 회원가입
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/b63c3300-51d0-40c4-87b0-5bcc0f3c129d)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/8ef33bc0-89fa-4bf0-b422-5eac1d924c7f)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/7fdb5a25-8490-457d-a00f-08a87bbfce51)
- 현재 페이지에서 아이디/비밀번호 입력 후 로그인 가능
- 카카오 로그인 시 처음 로그인하는 회원이면 회원 가입 페이지로 이동을 하고 이미 가입을 한 회원이라면 자동으로 로그인이 되게 구현
- 회원 가입을 누르면 개인 정보를 입력 후 회원 가입 할 수 폼이 나옴
- 아이디를 까먹었을 경우 이름,전화번호를 입력 후 찾을 수 있고 비밀번호를 까먹었을 경우 아이디/전화번호를 입력 후 새로 변경 가능하게 구현

### 8. 상품 상세페이지
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/bae1ac89-8e7c-47e3-ae4a-e02c4caafef2)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/1cf666f2-fcf3-4bd1-95b0-fa80d4079b28)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/629db826-0937-4aaf-9224-b1f824ff5c85)
- 상품에 대한 상세정보를 볼 수 있음
- 재고량이 5개 이하이면 현재 재고량이 아래에 뜨게 해놨고 품절인 경우 장바구니에 추가할 수 없도록 ‘품절입니다‘가 뜨도록 설정
- 상세이미지는 길기때문에 따로 스크롤을 내려서 확인할 수 있게 구현
- 아래쪽에 있는 관련상품은 같은 카테고리에 있는 상품만 뜨도록 함
- 장바구니에 추가 시 장바구니에 담긴 수량과 선택한 수량이 남은 재고량과 비교하여 초과하면 장바구니에 담기지 않고 알림창이 뜸
- 장바구니에 담기면 장바구니 옆에 숫자가 자동으로 변경됨

### 9. 장바구니
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/10ebd934-5b4f-499d-9189-5a1e77a93f93)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/7a216f44-4a12-416f-a8ca-f48c18e6636b)
- 장바구니에 담길 시 기존에 있던 제품이면 update문을 사용하여 수량을 변경해주고 처음 담기는 제품이면 insert문을 사용하여 담아주었습니다.
- 5개 이하인 제품은 재고량이 뜨고 품절이 되면 품절 상태로 변경됩니다.
- 체크된 상품만 결제하기로 넘어가게 값을 저장했습니다.
- 수량 변경은 1개 이상만 가능하고 1개보다 적게 선택하면 알림창을 띄우고 선택한 수량이 남은 재고량보다 많을 시 재고가 부족하다는 알림창이 뜹니다.

### 10. 회원정보 수정 및 탈퇴
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/39591d9d-e043-49e2-9739-5be1684f098b)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/2a08df4c-30cc-47d4-8e86-b6fed9b0fc63)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/f3f8e6d0-8b04-4280-a45f-ec0c065f10c7)
- 회원 정보를 볼 수 있는 페이지에서 회원 정보 변경 및 비밀번호 변경 가능(카카오로 로그인 시 비밀번호 변경은 불가능하기에 버튼이 나오지 않음
- 회원 탈퇴 시 아이디 비밀번호를 입력하여 일치하면 탈퇴 가능, 카카오 사용자는 카카오 로그인 탈퇴(일반 사용자가 카카오 탈퇴를 하면 알림창이 뜸)

### 11. 쿠폰 지급 및 확인
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/46284027-6918-48ad-a546-80b8143fea3a)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/c2880aa6-4526-48c8-8fb3-2fbe21737583)
- 회원가입 시 자동으로 회원가입 축하 쿠폰 insert됨
- 반려동물 등록 후, 로그인 시 당일이 반려동물 생일이면 반려동물 생일쿠폰 insert
- 쿠폰 만료일이 지나고 로그인을 하면 기간만료 처리됨. 상태는 미사용, 기간만료, 사용완료가 있음

### 12. 리뷰(마이페이지, 상품 상세페이지)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/cbd722fb-9e88-4c58-9be3-8bae49b2f932)
- 마이페이지 나의 리뷰. 유저 본인이 작성한 리뷰 조회 가능
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/f9227b7c-ddd2-4d6f-a111-d14621ea4d70)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/d8a193b5-d5cc-4193-8fc6-2fc42a21f938)
- 리뷰 상세 페이지. 수정 및 삭제가능
- 리뷰 작성을 하면 구매내역에서 구매한 상품정보를 당겨옴
- 사진을 수정하지 않고 내용만 수정할 시, 전에 사용한 사진이 그대로 남아있음
- 초기화를 누르면 고치기 이전의 상태로 돌아감
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/80968b3d-69a6-4990-9581-cd467abf910e)
(상품 상세페이지의 리뷰 : 해당 상품의 리뷰만 볼 수 있음)
- 리뷰제목 클릭 시 사진과 내용이 공개되게 만들었음
- 패치를 통해 좋아요 버튼을 누르면 숫자가 올라가도록 만들었음
- 로그인을 하지 않은 상태에서 좋아요를 누르면 로그인 창으로 이동됨

### 13. 문의사항(QNA)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/ba6205a0-1592-4618-aa15-17601d6aa052)
(전체 문의사항 페이지 : 전체공개와 비밀글로 나눠져 있음, 상태는 문의대기중과 답변완료로 나눠져있음)
- 글을 작성한 본인은 본인 글 수정, 삭제가능(다만 관리자가 이미 답변을 단 상태에서는 삭제만 가능)
- 비밀글은 비밀번호를 알기만하면 누구나 볼 수 있음 하지만 본인이 아니면 수정불가
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/000dd75f-3bd5-4cba-b375-bc34a7436763)
(문의글 작성 )
- 비밀번호를 넣으면 자동으로 비밀글이 됨
- 글제목과 글내용은 필수라서 안 넣으면 알림창이 뜸
- 문의종류가 상품문의일시 상품 카테고리와 카테고리에 따른 상세 상품명이 활성화 됨
- 문의글 또한 리뷰와 같이 수정, 삭제기능을 가지고 있음
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/6e3037fc-9c5e-45c9-a477-e8cae05b58fd)
(관리자가 답변 단 다른 유저의 문의글 디테일화면 예시)
- 답변이 달리면 문의상태가 답변완료로 변경됨
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/3f166c9a-e074-4e5c-b747-211b157fe09c)
(마이페이지 문의사항 : 나의 문의사항만을 볼 수 있음)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/2c2ff4fe-40f4-44d3-a67e-3589a5e57406)
(상품페이지의 해당 상품의 리뷰와 문의글 예시)

### 14. 공지사항
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/53d943f3-6df0-4477-a5bf-03e2423bf792)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/ee0d7f48-b0a5-4f6b-8d99-bbaf0a5c45fb)
- 공지사항게시판 전체 글 목록(클릭 시 상세보기 페이지 이동)
- 관리자 계정일 경우에만 하단의 공지작성 버튼 및 공지사항 상세페이지에서 수정/삭제버튼 노출

### 15. 관리자 페이지
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/aca6de1f-aab4-42f5-87a7-6dcd06ecd87d)
- 관리자로 로그인 한 경우 관리자 번호(0)과 관리자 권한인지 한번 더 확인 후 헤더에  
  관리자페이지 메뉴가 출력됨 
- 바디 상단의 4개의 카드를 이용해 각각의 메뉴로 이동
- 전체 리뷰를 최근 작성순으로 나열, 도배/광고성 리뷰일 경우 관리자가 삭제 가능 
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/f36f0da5-9e43-41ce-9648-af899ef8f1a7)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/7888455b-ef8d-4a87-a0c6-4752018a210f)
- 전체 회원목록 조회
- 쿠폰발급 버튼을 눌러 쿠폰발급페이지로 이동 후 해당하는 회원에게 쿠폰발급 가능
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/383e9571-9883-4ee6-ac41-6728f9abaceb)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/05769449-d784-4bb0-a688-217622f47312)
- 상품관리페이지에서 하단의 상품추가 선택시 상품등록화면으로 이동(상품 등록 후 다시 상품목록으로 이동)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/d962ae6c-16e3-4aae-a476-13bb1480097f)
- 상품목록에서 상품명 클릭시 상품에 대한 상세정보 확인 및 수정, 삭제 가능
- 수정 버튼 클릭 시 수정 페이지로 이동(수정 후 상품목록페이지로 이동)
- 삭제 버튼 클릭 시 상품 삭제 후 상품 목록페이지로 이동
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/fc8b8faf-0443-44a9-92b2-aab7953b4101)
- 메인카테고리와 서브카테고리 추가기능

### 16. 마이페이지
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/1f9ea0f7-3a1e-4d90-b490-1d4888558b1e)
- 왼쪽 네이게이션 상단에 현재 로그인한 유저의 닉네임을 출력해 현재 로그인한 계정 확인 
  가능
- 주문내역, 상품문의, 최근작성리뷰는 최근날짜의 데이터 최대 3건 출력
- 만료예정쿠폰은 보유중인 쿠폰 중 만료까지 일주일 이하이고 사용전인 쿠폰 최대 3개 출력(일주일 이상 남은 쿠폰의 경우 더보기를 클릭해 발급된 전체 쿠폰 확인 가능)
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/7c0978a2-a6af-40f5-ba3c-1b9f1774f7d8)
- 쿠폰사용기간이 만료됬거나 이미 사용한 쿠폰의 경우 구분 될 수 있게 배경색 회색처리
![image](https://github.com/dev-min2/PetGoodsProject/assets/82199372/d45822d3-340d-4531-96f4-bee1618e4e2d)
- 등록한 반려동물 정보 확인
- 반려동물 생일날 로그인시 반려동물 생일축하 쿠폰 발급












