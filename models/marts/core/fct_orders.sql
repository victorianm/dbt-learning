with customers as (
    select * from {{ref('stg_customers') }}
),

orders as (
    select * from {{ref('stg_orders') }}
),

payments as (
    select * from {{ref('stg_payments')}}
),

final as (

    select
        orders.order_id,
        customers.customer_id,
        payments.amount
    from orders

    left join customers using (customer_id)
    left join payments using (order_id)

)
select * from final