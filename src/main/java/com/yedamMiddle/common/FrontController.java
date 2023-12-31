package com.yedamMiddle.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.web.AddMainCategoryControl;
import com.yedamMiddle.admin.web.AddProductControl;
import com.yedamMiddle.admin.web.AddSubCategoryControl;
import com.yedamMiddle.admin.web.AdminDeleteReviewControl;
import com.yedamMiddle.admin.web.AdminPageControl;
import com.yedamMiddle.admin.web.CategoryManageControl;
import com.yedamMiddle.admin.web.GetProductControl;
import com.yedamMiddle.admin.web.MemberListControl;
import com.yedamMiddle.admin.web.ModProductControl;
import com.yedamMiddle.admin.web.ModProductFormControl;
import com.yedamMiddle.admin.web.ProductFormControl;
import com.yedamMiddle.admin.web.ProductListControl;
import com.yedamMiddle.admin.web.RemoveProductControl;
import com.yedamMiddle.admin.web.productOrderListControl;
import com.yedamMiddle.cart.web.AddCartControl;
import com.yedamMiddle.cart.web.CartCheckControl;
import com.yedamMiddle.cart.web.MyCartControl;
import com.yedamMiddle.cart.web.UpdateCartControl;
import com.yedamMiddle.cart.web.deleteCartControl;
import com.yedamMiddle.coupon.web.MyCouponListForm;
import com.yedamMiddle.coupon.web.insertCouponControl;
import com.yedamMiddle.coupon.web.insertCouponFormControl;
import com.yedamMiddle.login.web.AddUserControl;
import com.yedamMiddle.login.web.AddUserFormControl;
import com.yedamMiddle.login.web.DelUserControl;
import com.yedamMiddle.login.web.DelUserFormControl;
import com.yedamMiddle.login.web.FindIdControl;
import com.yedamMiddle.login.web.FindIdFormControl;
import com.yedamMiddle.login.web.FindPwControl;
import com.yedamMiddle.login.web.FindPwFormControl;
import com.yedamMiddle.login.web.IdCheckControl;
import com.yedamMiddle.login.web.LoginControl;
import com.yedamMiddle.login.web.LoginFormControl;
import com.yedamMiddle.login.web.LogoutControl;
import com.yedamMiddle.login.web.updatePwControl;
import com.yedamMiddle.myPage.web.AddMyPetControl;
import com.yedamMiddle.myPage.web.CouponDetailFormControl;
import com.yedamMiddle.myPage.web.IdpwCheckControl;
import com.yedamMiddle.myPage.web.IdpwCheckFormControl;
import com.yedamMiddle.myPage.web.MyInfoControl;
import com.yedamMiddle.myPage.web.MyPageControl;
import com.yedamMiddle.myPage.web.MyPetFormControl;
import com.yedamMiddle.myPage.web.MyPetInfoControl;
import com.yedamMiddle.myPage.web.MyProdQnaDetailFormControl;
import com.yedamMiddle.myPage.web.MyReviewDetailFormControl;
import com.yedamMiddle.myPage.web.OrderDetailFormControl;
import com.yedamMiddle.myPage.web.UpdateInfoControl;
import com.yedamMiddle.myPage.web.UpdateInfoFormControl;
import com.yedamMiddle.myPage.web.UpdatePw2Control;
import com.yedamMiddle.myPage.web.UpdatePwFormControl;
import com.yedamMiddle.notice.web.AddNoticeControl;
import com.yedamMiddle.notice.web.GetNoticeControl;
import com.yedamMiddle.notice.web.NoticeFormControl;
import com.yedamMiddle.notice.web.NoticeListControl;
import com.yedamMiddle.notice.web.RemoveNoticeControl;
import com.yedamMiddle.product.web.CategorySearchControl;
import com.yedamMiddle.product.web.PayCompleteFormControl;
import com.yedamMiddle.product.web.PaymentCompleteControl;
import com.yedamMiddle.product.web.PaymentFormControl;
import com.yedamMiddle.product.web.ProductDetailControl;
import com.yedamMiddle.product.web.ProductSearchControl;
import com.yedamMiddle.product.web.ShowBestProductControl;
import com.yedamMiddle.product.web.ShowNewProductControl;
import com.yedamMiddle.product.web.ShowRecommendProductControl;
import com.yedamMiddle.review.web.AddReviewControl;
import com.yedamMiddle.review.web.AddReviewFormControl;
import com.yedamMiddle.review.web.ModifyReviewControl;
import com.yedamMiddle.review.web.ModifyReviewFormControl;
import com.yedamMiddle.review.web.ModifyreviewLikeCntControl;
import com.yedamMiddle.review.web.MyReviewDetailControl;
import com.yedamMiddle.review.web.MyReviewListControl;
import com.yedamMiddle.review.web.deleteReviewControl;
import com.yedamMiddle.userQna.web.AddQnaControl;
import com.yedamMiddle.userQna.web.AddQnaFormControl;
import com.yedamMiddle.userQna.web.DeleteUserQnaControl;
import com.yedamMiddle.userQna.web.GetQnaAllListControl;
import com.yedamMiddle.userQna.web.GetQnaListControl;
import com.yedamMiddle.userQna.web.ModifyUserQnaControl;
import com.yedamMiddle.userQna.web.ModifyUserQnaFormControl;
import com.yedamMiddle.userQna.web.QnaReplyControl;
import com.yedamMiddle.userQna.web.getCategoryNoToProductNameContorl;

// 0 -> 개 type
// 1 -> 고양이 type
public class FrontController extends HttpServlet {
	

   private static final long serialVersionUID = 1L;
   private Map<String, Command> commandByURL = new HashMap<>();
   
   @Override
   public void init() throws ServletException {
      // map에 command추가할 때 옆에 기능 주석적어주세요.
      
      // 김은별
	  //문의게시판
      commandByURL.put("/getUserQnaAllList.do", new GetQnaAllListControl());//Qna목록
      commandByURL.put("/getUserQnaList.do", new GetQnaListControl()); //Qna조회
      commandByURL.put("/qnaReply.do", new QnaReplyControl());//Qna관리자 답글달기(수정은 보류)
      commandByURL.put("/addUserQnaForm.do", new AddQnaFormControl());
      commandByURL.put("/getCategoryNoToProductName.do", new getCategoryNoToProductNameContorl());//상품번호로 상품이름 찾기
      commandByURL.put("/addUserQna.do", new AddQnaControl());//Qna등록
      commandByURL.put("/modifyUserQnaForm.do", new ModifyUserQnaFormControl());//Qna수정
      commandByURL.put("/modifyUserQna.do", new ModifyUserQnaControl());//Qna수정
      commandByURL.put("/deleteUserQna.do", new DeleteUserQnaControl()); //Qna삭제 
      
      //나의쿠폰확인창
      commandByURL.put("/myCouponList.do", new MyCouponListForm()); //내 쿠폰 전체보기
      
      //리뷰
      commandByURL.put("/myReviewList.do", new MyReviewListControl());//나의리뷰목록
      commandByURL.put("/myReviewDetail.do", new MyReviewDetailControl());//나의 상세리뷰
      commandByURL.put("/modifyreviewLikeCnt.do", new ModifyreviewLikeCntControl());//좋아요 수 상승
      commandByURL.put("/addReviewForm.do", new AddReviewFormControl());//리뷰등록폼
      commandByURL.put("/addReview.do", new AddReviewControl());//리뷰등록
      commandByURL.put("/modifyReviewForm.do", new ModifyReviewFormControl());//리뷰수정폼
      commandByURL.put("/modifyReview.do", new ModifyReviewControl());//리뷰수정
      commandByURL.put("/deleteReview.do", new deleteReviewControl());//리뷰삭제
     
      
      
      // 김준성
      //공지사항 게시판
      commandByURL.put("/noticeList.do", new NoticeListControl()); //공지사항 리스트
      commandByURL.put("/getNotice.do", new GetNoticeControl()); //선택된 공지사항보기 
      commandByURL.put("/noticeForm.do", new NoticeFormControl()); //새 공지사항 작성
      commandByURL.put("/addNotice.do", new AddNoticeControl()); //공지사항 등록
      commandByURL.put("/removeNotice.do", new RemoveNoticeControl()); //공지사항 삭제
      
      //관리자페이지
      commandByURL.put("/adminPage.do", new AdminPageControl()); //관리자메인페이지
      commandByURL.put("/adminDeleteReview.do", new AdminDeleteReviewControl());//리뷰삭제
      //회원목록
      commandByURL.put("/memberList.do", new MemberListControl()); //회원목록
      //상품
      commandByURL.put("/productList.do", new ProductListControl()); //상품목록
      commandByURL.put("/productForm.do", new ProductFormControl()); //새 상품 작성
      commandByURL.put("/addProduct.do", new AddProductControl()); //상품등록 
      commandByURL.put("/getProduct.do", new GetProductControl()); //상품조회
      commandByURL.put("/modProductForm.do", new ModProductFormControl()); //상품수정화면
      commandByURL.put("/modProduct.do", new ModProductControl()); //상품수정
      commandByURL.put("/removeProduct.do", new RemoveProductControl()); //상품삭제
      commandByURL.put("/categoryManage.do", new CategoryManageControl()); //카테고리관리
      commandByURL.put("/addMainCategory.do", new AddMainCategoryControl()); //메인카테고리추가
      commandByURL.put("/addSubCategory.do", new AddSubCategoryControl()); //서브카테고리추가
      //마이페이지
      commandByURL.put("/myPage.do", new MyPageControl()); //마이페이지
      commandByURL.put("/couponDetailForm.do", new CouponDetailFormControl()); //내 쿠폰
      commandByURL.put("/myProdQnaDetailForm.do", new MyProdQnaDetailFormControl()); //내 Q&A
      commandByURL.put("/myReviewDetailForm.do", new MyReviewDetailFormControl()); //내 Q&A
      commandByURL.put("/myPetInfo.do", new MyPetInfoControl()); //내 반려동물정보
      commandByURL.put("/myPetForm.do", new MyPetFormControl()); //반려동물 등록화면
      commandByURL.put("/addMyPet.do", new AddMyPetControl()); //반려동물 등록
      
      
      
      // 서영희
      //회원가입
      commandByURL.put("/addUserForm.do", new AddUserFormControl());
      commandByURL.put("/addUser.do", new AddUserControl());
      //로그인
      commandByURL.put("/loginForm.do", new LoginFormControl());
      commandByURL.put("/login.do", new LoginControl());
      //로그아웃
      commandByURL.put("/logout.do", new LogoutControl());
      //회원탈퇴
      commandByURL.put("/delUserForm.do", new DelUserFormControl());
      commandByURL.put("/delUser.do", new DelUserControl());
      //아이디 중복 체크
      commandByURL.put("/idCheck.do", new IdCheckControl());
      //상세페이지 보기+문의게시판+상품별리뷰게시판
      commandByURL.put("/detailProduct.do", new ProductDetailControl());
      //장바구니 추가
      commandByURL.put("/addCart.do", new AddCartControl());
      //장바구니 삭제
      commandByURL.put("/deleteCart.do", new deleteCartControl());
      //장바구니
      commandByURL.put("/myCart.do", new MyCartControl());
      //수량
      commandByURL.put("/updateCart.do", new UpdateCartControl());
      commandByURL.put("/cartCheck.do", new CartCheckControl());
      //아이디 비밀번호 찾기
      commandByURL.put("/findIdForm.do", new FindIdFormControl());
      commandByURL.put("/findId.do", new FindIdControl());
      commandByURL.put("/findPwForm.do", new FindPwFormControl());
      commandByURL.put("/findPw.do", new FindPwControl());
      commandByURL.put("/updatePw.do", new updatePwControl());
      //회원정보 수정
      commandByURL.put("/idpwCheck.do", new IdpwCheckControl());
      commandByURL.put("/idpwCheckForm.do", new IdpwCheckFormControl());
      commandByURL.put("/updateInfoForm.do", new UpdateInfoFormControl());
      commandByURL.put("/updateInfo.do", new UpdateInfoControl());
      commandByURL.put("/updatePwForm.do", new UpdatePwFormControl());
      commandByURL.put("/updatePw2.do", new UpdatePw2Control());
      //회원정보 조회
      commandByURL.put("/myInfo.do", new MyInfoControl());
      //배송리스트 조회
      commandByURL.put("/productOrderList.do", new productOrderListControl());
      //관리자가 주는 쿠폰
      commandByURL.put("/insertCouponForm.do", new insertCouponFormControl());
      commandByURL.put("/insertCoupon.do", new insertCouponControl());
      
      // 전민교
      commandByURL.put("/main.do", new MainPageControl()); // 메인페이지
      commandByURL.put("/productSearch.do", new ProductSearchControl()); // 상품검색(헤더 검색바)
      commandByURL.put("/categorySearch.do", new CategorySearchControl()); // 카테고리검색(카테고리바)
      commandByURL.put("/fileUploadTestForm.do", new TestUploadFormControl()); // 테스트 파일업로드
      commandByURL.put("/fileUpload.do", new TestFileUpload());
      commandByURL.put("/showNewProduct.do", new ShowNewProductControl()); // 신상품(등록일기준)
      commandByURL.put("/showBestProduct.do", new ShowBestProductControl()); // 베스트상품(판매순)
      commandByURL.put("/showRecommendProduct.do", new ShowRecommendProductControl()); // 추천상품(리뷰순)
      
      commandByURL.put("/changePetType.do", new ChangePetControl()); // 고양이/강아지 상품 전환
      commandByURL.put("/testCartForm.do", new TestCartFormControl()); // 결제창 구현을 위한 테스트화면
      commandByURL.put("/paymentForm.do", new PaymentFormControl()); // 결제화면 요청
      commandByURL.put("/paymentComplete.do", new PaymentCompleteControl()); // 결제완료처리(검증 및 결제데이터 삽입)
      commandByURL.put("/payCompleteForm.do", new PayCompleteFormControl()); // 결제완료화면 요청
      commandByURL.put("/orderDetailForm.do", new OrderDetailFormControl()); // 내주문내역 보기
   }
   
   //끼양
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      
      String uri = req.getRequestURI();
      String contextPath = req.getContextPath();
      String reqURL = uri.substring(contextPath.length());
      Command cmd = commandByURL.get(reqURL);
      if(cmd != null) {
         cmd.execute(req, resp);
      }
      else {
         // 에러
         System.out.println("없음");
      }
   }
}
