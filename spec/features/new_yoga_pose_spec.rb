# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates yoga pose', type: :feature do
  let(:new_yoga_pose_path) { '/yoga_poses/new' }
  let(:yoga_poses_path) { '/yoga_poses' }

  scenario 'with correct attributes' do # , js: true do
    visit '/'
    click_link href: new_yoga_pose_path

    expect(page).to have_current_path(new_yoga_pose_path)
    # page.save_screenshot('after_new.png')

    fill_in 'Name', with: 'Lotus'
    fill_in 'Sanskrit', with: 'Padmasana'
    fill_in 'Part of body', with: 'Hips'

    find('input[type=submit]').click
    # click_button 'Create Yoga pose'

    expect(page).to have_current_path(yoga_poses_path)
    # page.save_screenshot('after_create.png')

    click_link 'Lotus'

    expect(page).to have_current_path(yoga_pose_path(YogaPose.last))
    # page.save_screenshot('show.png')

    expect(page).to have_text(/Padmasana/)
    expect(page).to have_text(/Hips/)
  end

  scenario 'with invalid attributes' do # , js: true do
    visit '/'
    click_link href: new_yoga_pose_path

    fill_in 'Sanskrit', with: 'Padmasana'
    fill_in 'Part of body', with: 'Hips'

    find('input[type=submit]').click

    expect(page).to have_selector 'form'
    # page.save_screenshot('after_new_error.png')

    fill_in 'Name', with: 'Lotus'

    find('input[type=submit]').click
    expect(page).to have_selector 'td', text: 'Lotus'
  end
end
