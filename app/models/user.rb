class User < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :posted_photos,
             :class_name => "Photo",
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :timeline,
             :through => :follows,
             :source => :posted_photos

  has_many   :liked_photos,
             :through => :likes,
             :source => :likes

  has_many   :followers,
             :through => :recipient,
             :source => :sender

  has_many   :follows,
             :through => :sent_friend_requests,
             :source => :received_friend_requests

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

end
