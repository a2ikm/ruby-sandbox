#!/usr/bin/env ruby

require File.expand_path("../vendor/natcmp", __FILE__)

def empty
  [:node, nil]
end

def empty?(tree)
  tree[1].nil?
end

def insert(new_key, new_value, tree)
  if empty?(tree)
    [:node, [new_key, new_value, empty, empty]]
  else
    key, value, smaller, larger = tree[1]
    case String.natcmp(new_key, key)
    when -1
      [:node, [key, value, insert(new_key, new_value, smaller), larger]]
    when 1
      [:node, [key, value, smaller, insert(new_key, new_value, larger)]]
    else
      [:node, [key, new_value, smaller, larger]]
    end
  end
end

def lookup(new_key, tree)
  if empty?(tree)
    nil
  else
    key, value, smaller, larger = tree[1]
    case String.natcmp(new_key, key)
    when -1
      lookup(new_key, smaller)
    when 1
      lookup(new_key, larger)
    else
      value
    end
  end
end

if $0 == __FILE__
  tree = empty
  tree = insert("Jim woodlang", "jim.woodland@gmail.com", tree)
  tree = insert("Mark Anderson", "i.am.a@hotmail.com", tree)
  tree = insert("Antia Bath", "abath@someuni.edu",
                       insert("Kevin Robert", "myfairy@yahoo.com",
                                     insert("Wilson Longbrow", "longwil@gmail.com", tree)))

  require "test/unit/assertions"
  include Test::Unit::Assertions
  assert_equal "abath@someuni.edu", lookup("Antia Bath", tree)
  assert_nil lookup("JacquesRequin", tree)
end
