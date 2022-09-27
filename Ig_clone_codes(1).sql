                        INSTAGRAM CLONE CHALLENGES CODES
 QUERY1:"Finding 5 Oldest Users to Reward them"
 SELECT * 
FROM users
ORDER BY created_at
LIMIT 5; 

QUERY2:"Find Most popular Day of registration to run an Advertisment Campaign"
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

QUERY3:"List of inactive users to mail them"
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

QUERY4:"Identify most popular photo by counting likes and user who post it"
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

QUERY5:"How many times does the average user post? "
SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
        FROM   users) AS avg; 

 QUERY6:"Top 5 Popular Hashtags#"
 SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

QUERY7:"Find users who have liked every single photo on the site"
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos);