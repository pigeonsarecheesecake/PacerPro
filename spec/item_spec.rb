require "rails_helper"
RSpec.describe Item, type: :model do
    describe 'Soft delete' do
      let(:item) { Item.create(name:"Item", deleted_at:nil) }
  
      it 'soft deletes the item' do
        item.soft_delete
        # deleted_at should not be nil after soft deletion
        expect(item.deleted_at).not_to be_nil
        # check if item is excluded from normal queries by expecting it to not be found
        expect(Item.find_by(id: item.id)).to be_nil
      end

      it 'restores the item' do
        item.soft_delete
        item.restore
        # deleted_at should be nil after restorartion
        expect(item.deleted_at).to be_nil
        # check if item is included from normal queries by expecting it to be found
        expect(Item.find_by(id: item.id)).not_to be_nil
      end
    end
  end