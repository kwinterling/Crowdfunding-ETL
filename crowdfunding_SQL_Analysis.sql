-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT backers_count, campaign.cf_id
    FROM campaign
    WHERE outcome = 'live'
    ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT campaign.cf_id, COUNT(backer_id) AS backer_counts
    FROM backers INNER JOIN campaign
        ON backers.cf_id = campaign.cf_id
    WHERE outcome = 'live'
    GROUP BY campaign.cf_id
	ORDER BY backer_counts DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT first_name, last_name, email, (campaign.goal - campaign.pledged) AS "Remaining Goal Amount"
    INTO email_contacts_remaining_goal_amount
    FROM contacts INNER JOIN campaign
        ON contacts.contact_id = campaign.contact_id
    WHERE campaign.outcome = 'live'
    ORDER BY "Remaining Goal Amount" DESC;

-- Check the table
-- Table matches image

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT email, first_name, last_name, campaign.cf_id AS cf_id, company_name, description, end_date, (campaign.goal - campaign.pledged) AS "Left of Goal"
	INTO email_backers_remaining_goal_amount
    FROM backers INNER JOIN campaign
        ON backers.cf_id = campaign.cf_id
   WHERE campaign.outcome = 'live'
    ORDER BY email DESC;

-- Check the table
-- The example table is not ordered as described in the requirements.

