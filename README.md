# Dự án Xây Dựng Kho Dữ Liệu từ Nền Tảng Olist tại Brazil

## Mô tả dự án
Dự án này nhằm thiết kế và triển khai một hệ thống kho dữ liệu (Data Warehouse) từ bộ dữ liệu thương mại điện tử Olist - nền tảng marketplace tại Brazil. Dữ liệu phản ánh toàn bộ quy trình mua sắm, thanh toán và vận chuyển của khách hàng.

Thông qua các công cụ Microsoft SQL Server, SSIS, SSAS, Excel và Power BI, nhóm xây dựng quy trình ETL, mô hình dữ liệu đa chiều (Star Schema), triển khai OLAP Cube và trực quan hóa các insight phục vụ phân tích nghiệp vụ.

## Mục tiêu
- Thiết kế kiến trúc kho dữ liệu từ dữ liệu thực tế.
- Thực hiện quy trình ETL bằng SSIS.
- Xây dựng Data Cube trong SSAS để phân tích OLAP.
- Tạo báo cáo phân tích bằng Excel và Power BI.

## Công nghệ sử dụng
- **SQL Server**: Lưu trữ dữ liệu, xử lý truy vấn.
- **SSIS**: Thực hiện ETL.
- **SSAS**: Xây dựng mô hình dữ liệu OLAP.
- **Excel (Pivot Table)**: Phân tích dữ liệu.
- **Power BI**: Trực quan hóa kết quả phân tích.

## Dữ liệu đầu vào
Nguồn dữ liệu từ [Kaggle - Olist Brazilian E-commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

Các bảng chính bao gồm:
- `orders`, `order_items`, `order_reviews`, `order_payments`
- `customers`, `sellers`, `products`, `geolocation`
- `product_category_name_translation`

![Lược đồ dữ liệu](Diagram-Image.png)

## Kiến trúc kho dữ liệu

### Star Schema
- **Fact tables**:
  - `FactSales`: Theo dõi đơn hàng và doanh thu.
  - `FactOrderDelivery`: Theo dõi hiệu quả giao hàng.
  - `FactProductPrice`: Theo dõi giá và số lượng sản phẩm.

- **Dimension tables**:
  - `DimCustomer`, `DimProduct`, `DimOrder`, `DimDate`

## Quy trình ETL
1. Trích xuất dữ liệu từ file CSV.
2. Làm sạch và chuyển đổi dữ liệu.
3. Nạp vào các bảng Staging.
4. Tải lên Data Warehouse sử dụng SCD (Slowly Changing Dimension).

## Phân tích & Báo cáo

### OLAP với SSAS
- Tổng doanh thu theo năm, tháng, ngày.
- Top 10 thành phố có doanh thu cao nhất.
- Hiệu quả giao hàng theo thời gian.
- Phân tích sản phẩm theo danh mục và xu hướng.

### Power BI Dashboard
- Tổng quan đơn hàng, doanh thu, chi phí vận chuyển.
- Phân tích theo thời gian, vị trí, trạng thái đơn hàng.
- Biểu đồ trực quan giúp hỗ trợ ra quyết định.

## Kết quả đạt được
- Thiết kế đầy đủ kho dữ liệu với khả năng mở rộng.
- Trích xuất insight giá trị từ dữ liệu thực tế.
- Hỗ trợ ra quyết định chiến lược trong Thương mại Điện tử.
