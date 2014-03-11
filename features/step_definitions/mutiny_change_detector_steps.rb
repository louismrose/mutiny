require "mutiny/change_detector/command_line"

When(/^I run the change detector between "(.*?)" and "(.*?)"$/) do |start_label, finish_label|
  @result = Mutiny::ChangeDetector::CommandLine.new(path: path, start_label: start_label, finish_label: finish_label).run
end

Then(/^(\d+) spec is impacted$/) do |expected_number|
  expect(@result.size).to eq(expected_number.to_i)
end

Then(/^the spec at "(.*?)" is impacted$/) do |expected_spec|
  expect(@result).to include(expected_spec)
end