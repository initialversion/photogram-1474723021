class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => true

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :recipient_id, :uniqueness => { :scope => [:sender_id], :message => "already requested" }

  validates :recipient_id, :presence => true

  validates :sender_id, :presence => true

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ 'pending', ' accepted', ' declined' ]  }

end
