bash ./sqitch add 1.create_table -n "Creation of necessary tables"
bash ./sqitch add 2.function_select -n "Creation of select function for category, plot, product and variety"
bash ./sqitch add 3.crud_category -n "crud function to the category table"
bash ./sqitch add 4.crud_plot -n "crud function for the plot table"
bash ./sqitch add 5.crud_product -n "crud function for the product table"
bash ./sqitch add 6.crud_variety -n "crud function for variety table"sqitch
bash ./sqitch add 7.product_in_plot -n "create link table between product and plot with view and functions"
bash ./sqitch add 8.delete_functions -n "adding functions delete to all tables"
bash ./sqitch add 9.update_view_product -n "Updating view product including varieties associated"
bash ./sqitch add 10.alter_table_product_variety -n "Alter column harvest_begin_at and harvest_end_at to integer for product and variety"
bash ./sqitch add 11.change_product_in_plot_view -n "Change the content of the view product in plot"
bash ./sqitch add 12.user_crud -n "create table and crud for user"
bash ./sqitch add 13.booking_crud -n "create table and crud for booking"
bash ./sqitch add 14.add_update_availability_product -n "Add a function which update only the availability of an existing product"
