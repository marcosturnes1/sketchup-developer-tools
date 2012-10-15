# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Command object.
#
# This file was originally generated by ourdoc.rb, an internal tool we developed
# specifically for outputting support files (documentation, unit tests, etc.)
# from the standard, doxygen-style c++ comments that are embedded into the
# Ruby implementation files. You can find ourdoc.rb alongside these
# implementation files at:
#
# googleclient/sketchup/source/sketchup/ruby
#

require 'test/unit'

# TC_Command contains unit tests for the Command class.
#
# API Object::       Command
# C++ File::         rcommand.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# The Command class is the preferred class for adding tools to the menus and
# Ruby toolbars.
#
#
class TC_Command < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.new
  # @file                rcommand.cpp
  #
  # The new method is used to create a new command.
  #
  #
  # Args:
  # - menutext: The text that will appear for this command's menu item if
  # it appears on a menu.
  # - Code: that executes the command when the menu item or toolbar item
  # is selected.
  #
  # Returns:
  # - command: the new Command object
  #

  # Test the example code that we have in the API documentation.
  def test_new_api_example
    assert_nothing_raised do
     add_separator_to_menu("Draw")

     # Adds a Test submenu to the Draw menu where the Tester menu item appears
     testmenu = UI.menu("Draw").add_submenu("Test")

     # This menu item simply displays Hello World on the screen when clicked.
     cmd = UI::Command.new("Tester") { UI.messagebox("Hello World") }
     testmenu.add_item cmd
    end
  end

  # Test edgecases for values passed to this method.
  #def test_new_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_new_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_new_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.menu_text=
  # @file                rcommand.cpp
  #
  # The menu_text= method is used to set the menu item name for the
  # command.
  #
  #
  # Args:
  # - menuitem: A string representing the menu item for the command.
  #
  # Returns:
  # - command: a Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_menu_text_api_example
    assert_nothing_raised do
     add_separator_to_menu("Draw")
     # Adds a Test submenu to the Draw menu where the Tester menu item appears
     testmenu = UI.menu("Draw").add_submenu("Test")
     cmd = UI::Command.new("Tester") { UI.messagebox("Hello World") }
     cmd.menu_text = "New String"
     assert_equal("New String", cmd.menu_text,
                  'Failed in test_set_menu_text_api_example' )
     testmenu.add_item cmd
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_menu_text_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_menu_text_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_menu_text_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.large_icon=
  # @file                rcommand.cpp
  #
  # The large_icon= method is used to identify the icon file for the
  # command's large icon.
  #
  #
  # Args:
  # - path: The path to the large icon.
  #
  # Returns:
  # - command: the Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_large_icon_api_example
    assert_nothing_raised do
     toolbar = UI::Toolbar.new "Test"
     # This command displays Hello World on the screen when clicked
     cmd = UI::Command.new("Test") { UI.messagebox("Hello World") }
     cmd.small_icon = "ToolPencilSmall.png"
     cmd.large_icon = "ToolPencilLarge.png"
     toolbar = toolbar.add_item cmd
     toolbar.show
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_large_icon_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_large_icon_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_large_icon_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.status_bar_text=
  # @file                rcommand.cpp
  #
  # The status_bar_text= method is used to set the status bar text for the
  # command.
  #
  #
  # Args:
  # - text: The text that will appear on the status bar when the cursor is
  # over the command's menu item.
  #
  # Returns:
  # - command: the Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_status_bar_text_api_example
    assert_nothing_raised do
     toolbar = UI::Toolbar.new "Test"
     # This toolbar tool simply displays Hello World on the screen when clicked
     cmd = UI::Command.new("Tester") { UI.messagebox("Hello World") }
     cmd.small_icon = "ToolPencilSmall.png"
     cmd.large_icon = "ToolPencilLarge.png"
     status_text = $tStrings.GetString("Testing the toolbars class")
     cmd.status_bar_text = status_text
     assert_equal(status_text, cmd.status_bar_text,
                  'Failed in test_set_status_bar_text_api_example' )
     toolbar = toolbar.add_item cmd
     toolbar.show
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_status_bar_text_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_status_bar_text_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_status_bar_text_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.small_icon=
  # @file                rcommand.cpp
  #
  # The small_icon= method is used to identify the icon file for the
  # command's small icon.
  #
  #
  #
  # Args:
  # - path: A path to the small icon.
  #
  # Returns:
  # - command: the Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_small_icon_api_example
    assert_nothing_raised do
     toolbar = UI::Toolbar.new "Test"
     # This toolbar command displays Hello World on the screen when clicked.
     cmd = UI::Command.new("Tester") { UI.messagebox("Hello World") }
     cmd.small_icon = "ToolPencilSmall.png"
     assert_equal('ToolPencilSmall.png', cmd.small_icon,
                  'Failed in test_set_small_icon_api_example' )
     cmd.large_icon = "ToolPencilLarge.png"
     assert_equal('ToolPencilLarge.png', cmd.large_icon,
                  'Failed in test_set_small_icon_api_example' )
     toolbar = toolbar.add_item cmd
     toolbar.show
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_small_icon_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_small_icon_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_small_icon_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.set_validation_proc
  # @file                rcommand.cpp
  #
  # The set_validation_proc method is used to identify the command
  # validation procedure. This allows you to change whether the command is
  # enabled, checked, etc. based on the user state. For example, you might
  # want your command to be disabled unless the user has a current
  # selection.
  #
  # Your procedure should return either MF_ENABLED, MF_DISABLED,
  # MF_CHECKED, MF_UNCHECKED, or MF_GRAYED.
  #
  #
  # Args:
  # - : Undefined.
  #
  # Returns:
  # - command: a Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_validation_proc_api_example
    assert_nothing_raised do
     # Need example ruby code here.
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_validation_proc_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_validation_proc_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_validation_proc_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Command.tooltip=
  # @file                rcommand.cpp
  #
  # The tooltip= method is used to define a command item's tooltip text.
  # Tooltips will appear when the command is attached to a tool bar and the user
  # hovers their cursor over the icon.
  #
  #
  # Args:
  # - text: The text of the tooltip.
  #
  # Returns:
  # - command: the Command object
  #

  # Test the example code that we have in the API documentation.
  def test_set_tooltip_api_example
    toolbar = UI::Toolbar.new "Test"
    # This command displays Hello World on the screen when clicked
    cmd = UI::Command.new("Test") { UI.messagebox("Hello World") }
    assert_nothing_raised do
      cmd.tooltip = "Hello World Tool"
      assert_equal('Hello World Tool', cmd.tooltip,
                   'Failed in test_set_tooltip_api_example' )
    end
    toolbar = toolbar.add_item cmd
    toolbar.show
  end
end