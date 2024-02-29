# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'yoga_poses/new', type: :view do
  it 'has a title' do
    render

    expect(rendered).to have_selector 'h1', text: 'New Yoga Pose'
  end

  it 'contains a field for name' do
    render

    expect(rendered).to have_field 'Name'
  end

  it 'contains a field for sanskrit' do
    render

    expect(rendered).to have_field 'Sanskrit'
  end

  it 'contains a field for part of body' do
    render

    expect(rendered).to have_field 'Part of body'
  end

  it 'has a submit button' do
    assign(:yoga_pose, YogaPose.new)
    assign(:yoga, YogaPose.new)
    assign(:pose, YogaPose.new)

    render

    expect(rendered).to have_css 'input[type=submit][value="Create Yoga pose"]'
  end

  it 'has a cancel button' do
    render

    expect(rendered).to have_link href: '/yoga_poses'
  end
end
