require 'rails_helper'

describe Task do

  context 'test' do
    it 'ensures order' do
      words_list = [
        "bac",
        "aac",
        "aaa"
      ]

      actual_order = ["c", "b", "a"]

      order_arr = Task.get_alphabets(words_list)

      expect(order_arr).to eq(actual_order)
    end
  end

  context 'test' do
    it 'check wrong order' do
      words_list = [
        "bac",
        "aac",
        "aaa"
      ]

      actual_order = ["a", "c", "b"]

      order_arr = Task.get_alphabets(words_list)

      expect(order_arr).not_to eq(actual_order)
    end
  end
end
