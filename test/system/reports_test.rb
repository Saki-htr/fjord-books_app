# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:first_report)

    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index of reports' do
    visit reports_path
    assert_selector 'h1', text: '日報'
  end

  test 'show a report detail page' do
    visit "/reports/#{reports(:first_report).id}"
    assert_equal '初めての日報', @report.title
    assert_equal 'プログラミング楽しい', @report.content
  end

  test 'creating a Report' do
    visit reports_path
    click_on '新規作成'

    fill_in 'タイトル', with: '課題提出'
    fill_in '内容', with: 'lsコマンド難しい'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '課題提出'
    assert_text 'lsコマンド難しい'
  end

  test 'updating a Report' do
    visit reports_path
    click_on '編集'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text @report.title
  end

  test 'destroying a Report' do
    visit reports_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
