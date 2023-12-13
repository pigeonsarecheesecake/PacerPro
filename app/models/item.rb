class Item < ApplicationRecord
    default_scope{where(deleted_at: nil)}
    scope :items_without_soft_delete, -> {all}
    scope :recycle_bin, -> {unscoped.where.not(deleted_at: nil)}
    scope :all_items, -> {unscoped.all}

    validates :name, presence:true
end
