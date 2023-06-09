class UserPassword < ApplicationRecord
  # Viewer can view Password
  # Editor can update password
  # Owner can edit, view, and share password
  ROLES = %w{viewer owner editor}
  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclucsion: { in: ROLES}
  attribute :role, defualt: :viewer

  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end

  private
  def owner?
    role == "owner"
  end

  def viewer?
    role == "viewer"
  end

  def editor?
    role == "editor "
  end


end
