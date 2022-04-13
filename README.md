# Poject Name
Vendo-demo-api

# Problem Statement
This task shouldn’t take more than 4-5 hours to complete. The goal is not to have a fully implemented solution, Work-in-progress is more than enough! We just want to see how would you approach this challenge.

Working with 3rd party systems and APIs would be a big chunk of your work at Vendo


The main objective of this task is to create a simple Ruby SDK for Vendo API.

API documentation is available at: https://developers.getvendo.com/reference/api-getting-started
Access to the docs is password protected: #+u5<)ehSkJV9Z/<


SDK should support
- Authentication - https://developers.getvendo.com/reference/authentication this should support both success and failure scenarios
- Create a new Cart - https://developers.getvendo.com/reference/create-cart
-Fetching a Cart - https://developers.getvendo.com/reference/get-cart With line items/products this should support both success and failure scenarios, eg. wrong token, etc
- Adding an Item to the Cart - https://developers.getvendo.com/reference/add-item
 this should support both success and failure scenarios, eg. wrong variant ID etc
- Changing quantity - https://developers.getvendo.com/reference/set-quantity this should support both success and failure scenarios eg. insufficient quantity
- Removing item - https://developers.getvendo.com/reference/remove-line-item
- Applying a coupon code - https://developers.getvendo.com/reference/apply-coupon-code (valid code is: “test”) - this should support both success and failure scenarios
- This can be a stand-alone ruby library or code embedded into a rails project, whatever is easier/faster to set it up for you
- You can test against demo.getvendo.com
- After finishing your work please push it to GitHub, great git history of changes is an indicator of good software craftsmanship
- Please share access to the repo with “damianlegawiec” user for review
- Please include an automatic test suite written in rspec, you can use https://github.com/vcr/vcr to record API calls
- Please include code to handle usual failures such as timeouts
------------



### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)

------------

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* `ruby 2.6.5`
* `rails 6.1.5`

### Installation

1. Clone the repo and cd into it
```sh
git clone https://github.com/salmanali23/vendo-demo-api.git
cd vendo-demo-api
```
2. Install the gems
`bundle install`
3. Start the server
`rails s`
4. Run test suits
`rspec`

### Notes
Fetch Cart API wasn't working for me, I've shared with with mike as well over the email