# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:onepiece)

    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index of books' do
    visit books_path
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_path
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: '分かりやすいです！'
    fill_in '著者', with: '五十嵐邦明'
    click_button '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text '分かりやすいです！'
    assert_text '五十嵐邦明'
  end

  test 'updating a Book' do
    visit books_path
    click_on '編集'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_on '更新する'

    assert_text '本が更新されました。'
  end

  test 'destroying a Book' do
    visit books_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
