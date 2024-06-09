/* Phase 3 - Data Analysis */
/* Team # 3 */

/* Participating member names: Jaime Fastino, Julianne Rando, Nicole Romangsuriat */
/* Team Leader Name: Nicole Romangsuriat */

/* SQL to Create Question 1 Query */ 
/* Place SQL below */

Select home_neighborhood as "Home Neighborhood", count(home_id) as "Number of Homes" 
from home
where home_neighborhood in ('Harvard Square', 'Central Square')
group by home_neighborhood;

/* SQL to Create Question 2 Query */
/* Place SQL below */

select h.home_id as "Home ID", ha.home_zipcode as "Zip Code",
avg((s.price_per_night*s.minimum_nights)+s.cleaning_fee) as "Rental Cost"
from home h, homeaddress ha, stay s
where h.home_id = ha.home_id
and ha.home_id = s.home_id
and s.cleaning_fee is not null
group by h.home_id,ha.home_zipcode
having ha.home_zipcode = '02140'
order by h.home_id;

/* SQL to Create Question 3 Query */
/* Place SQL below */

select count(distinct(H.home_id)) as Number_of_homes
    from home H, homeavailability A
    where H.home_id = A.home_id 
    and H.home_type in 'House'
    and to_char(date_home_available, 'MON-RRRR') = 'JUL-2020';

/* SQL to Create Question 4 Query */
/* Place SQL below */

Select host.host_id as "Host ID", host.hosting_since_date as "Hosting Since Date", home.home_neighborhood as "Home Neighborhood"
from host, home
where home.host_id = host.host_id
and home.home_neighborhood in ('Cambridge', 'Central Square')
group by host.host_id, host.hosting_since_date, home.home_neighborhood
order by host.host_id;

/* SQL to Create Question 5 Query */
/* Place SQL below */

select h.home_id as "Home ID",ha.date_home_available as
"Availability Date",h.home_neighborhood as "Home Neighborhood"
from home h,homeavailability ha
where h.home_id =ha.home_id
and to_char(ha.date_home_available,'RRRR-MON') = '2020-MAY'
and h.home_neighborhood = 'Harvard Square';

/* SQL to Create Question 6 Query */
/* Place SQL below */

 select R.home_id as "Home ID", S.review_score_rating as "Review Score Rating", H.home_type as "Home Type"
        from review R, reviewscore S, home H 
        where R.review_id = S.review_id
        and R.home_id = H.home_id
        and S.review_score_rating <= 80
        group by R.home_id,S.review_score_rating, H.home_type 
        order by S.review_score_rating DESC;
        
/* SQL to Create Question 7 Query */
/* Place SQL below */

Select g.guest_id as "Guest ID", g.guest_name as "Guest Name", r.review_comments as "Review Comments"
from guest g, review r
where g.guest_id = r.guest_id
and r.review_comments like ('%nice%')
and r.review_comments like ('%Nice%');

/* SQL to Create Question 8 Query */
/* Place SQL below */

select h.home_id as "Home ID", hs.number_accomodate 
as "Capacity",h.home_neighborhood as "Home Neighborhood"
from home h, homespecs hs
where hs.number_accomodate > 4
and h.home_type = 'Condominium'
and h.home_neighborhood is not null;

/* SQL to Create Question 9 Query */
/* Place SQL below */

select A.home_zipcode as "Zip Code", sum((S.price_per_night * S.minimum_nights)) as "Lost Revenue", H.home_neighborhood as "Neighborhood",
    'Any value in the neighborhood column that is null is grouped together' as "Explanation"
        from homeaddress A, stay S, home H
        where H.home_id = A.home_id
        and S.home_id = H.home_id
        and H.home_id in 
        (select home_id from homeavailability
    where home_available in 'false')
        and A.home_zipcode in '02140'
        group by H.home_neighborhood, A.home_zipcode;

/* SQL to Create Question 10 Query */
/* Place SQL below */

Select home.home_type as "Home Type", (stay.price_per_night * stay.minimum_nights) as "Potential Revenue"
from home, stay, homeavailability
where home.home_id = stay.home_id
and home.home_id = homeavailability.home_id
and to_char(date_home_available, 'MON-RRRR') = 'APR-2020'
group by home.home_type, (stay.price_per_night * stay.minimum_nights);

/* End of Script */
