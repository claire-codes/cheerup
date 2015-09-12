require 'spec_helper'

describe Cheerup do
  let(:cheer) { Cheerup::Cli.new }
  before(:each) do
    allow_any_instance_of(Array).to receive(:sample).and_return('Howdy ho')
  end

  it 'has a version number' do
    # Keeping this one in as it's my sanity check that the tests are working!
    expect(Cheerup::VERSION).not_to be nil
  end

  it 'double checks that stubbing Array::sample works' do
    allow_any_instance_of(Array).to receive(:sample).and_return('Eat my shorts')

    expect(STDOUT).to receive(:puts).with('Eat my shorts bob')
    expect(cheer).to receive(:system).with('say "Eat my shorts bob"')
    cheer.up 'bob'
  end

  it 'executes "say" and prints to command line happy path' do
    expect(STDOUT).to receive(:puts).with('Howdy ho bob')
    expect(cheer).to receive(:system).with('say "Howdy ho bob"')
    cheer.up 'bob'
  end

  it 'can handle running without a name argument' do
    expect(STDOUT).to receive(:puts).with('Howdy ho')
    expect(cheer).to receive(:system).with('say "Howdy ho"')
    cheer.up
  end

  it 'can handle names with spaces as long as they\'re quoted' do
    expect(STDOUT).to receive(:puts).with('Howdy ho amy parker dennis')
    expect(cheer).to receive(:system).with('say "Howdy ho amy parker dennis"')
    cheer.up 'amy parker dennis'
  end

  it 'can\'t handle more than one arg' do
    expect { cheer.up 'mary', 'ann' }.to raise_error(ArgumentError)
  end

  it 'still prints if you\'re not on osx but doesn\'t say anything' do
    allow(cheer). to receive(:osx?).and_return(false)
    expect(STDOUT).to receive(:puts).with('Howdy ho brenda')

    expect(cheer).not_to receive(:system).with('say Howdy ho brenda')
    cheer.up 'brenda'
  end
end
