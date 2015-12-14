class MyModel < ActiveRecord::Base
  has_secure_token :my_token

  before_save :do_a_first_thing

  def do_a_first_thing
    logger.debug "FIRST THING DONE."
    throw :abort
    #return false
  end
end
