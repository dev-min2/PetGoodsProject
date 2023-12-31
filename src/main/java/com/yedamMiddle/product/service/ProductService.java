package com.yedamMiddle.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.ApiInfoVO;
import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;

public interface ProductService {
	public CategoryVO getCategoryInfo(int categoryNo);
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductReviewJoinVO> searchProductList(String query, String type, int page);
	public ProductVO productDetail(int productNo);
	
	public List<ProductVO> productList();
	public List<ProductReviewJoinVO> searchCategory(int categoryNo, String type, int page);
	
	public int searchCategoryCount(int categoryNo, String type);
	public int searchProductListCount(String query, String type);
	public ApiInfoVO getApiInfo(String apiName);
	public boolean addPaymentInfo(List<ProductOrderVO> vo);
	
	public List<ProductVO> getProductPrice(int[] productNos);
	public List<ProductOrderVO> getProductOrder(int[] productNos, long merUid, int userNo);
	
	public List<ProductReviewJoinVO> searchRegistDateDescFromMain(String petType);
	public List<ProductReviewJoinVO> searchReviewDescFromMain(String petType);
	public List<ProductReviewJoinVO> searchStarCntDescFromMain(String petType);
	public int reduceProductStock(int cnt, int productNo);
	public List<ProductOrderJoinVO> getAllMyProductOrderList(int userNo);
	
	public List<ProductReviewJoinVO> searchRegistDateDescFromTab(String petType);
	public List<ProductReviewJoinVO> searchBestSellProductFromTab(String petType);
	public List<ProductReviewJoinVO> searchHighStarProductFromTab(String petType);
	public List<ProductVO> categoryList(int categoryNo,int productNo,String petType);

}
