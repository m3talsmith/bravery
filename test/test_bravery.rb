require 'spec_helper'

class TestBravery < Test::Unit::TestCase

  def setup
    @test = Subject.new
  end

  def teardown
    @test = nil
  end

  def test_value_attribute
    assert_equal('Not Yet Set.', @test.value)
  end

  def test_default_state
    assert_equal(:first, @test.state)
  end

  def test_states_list
    assert_equal([:first, :second, :third], @test.states)
  end

  def test_goto_state
    @test.goto_state :first
    assert_equal('1', @test.value)
    assert_equal(:first, @test.state)
  end

  def test_set_state
    @test.set_state :third
    assert_equal('Not Yet Set.', @test.value)
    assert_equal(:third, @test.state)
  end

  def test_state_traversal
    @test.goto_state :second
    assert_equal('3', @test.value)
    assert_equal(:third, @test.state)
  end
end
