class Item < ApplicationRecord
    # Default scope
    default_scope{where(deleted_at: nil)}
    # Scopes
    scope :items_without_soft_delete, -> {all}
    scope :recycle_bin, -> {unscoped.where.not(deleted_at: nil)}
    scope :all_items, -> {unscoped.all}
    validates :name, presence:true
    # Soft Delete
    def soft_delete
        update(deleted_at:  Time.current)
    end
    # Restore
    def restore
        update(deleted_at: nil)
    end
end
