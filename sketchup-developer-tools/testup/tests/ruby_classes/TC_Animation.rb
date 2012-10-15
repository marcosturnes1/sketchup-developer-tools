# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Animation object.
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

# TC_Animation contains unit tests for the Animation class.
#
# API Object::       Animation
# C++ File::         rubyanimation.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# The Animation interface is implemented to create animations inside SketchUp.
# At any given time, a single animation can be active on a View. To make your
# own, build a Ruby class that contains the methods described below:
#
#     # This is an example of a simple animation that floats the camera up to
#     # a z position of 200". The only required method for an animation is
#     # nextFrame. It is called whenever you need to show the next frame of
#     # the animation. If nextFrame returns false, the animation will stop.
#     class FloatUpAnimation
#       def nextFrame(view)
#         new_eye = view.camera.eye
#         new_eye.z = new_eye.z + 1.0
#         view.camera.set(new_eye, view.camera.target, view.camera.up)
#         view.show_frame
#         return new_eye.z < 500.0
#       end
#     end
#
#     # This adds an item to the Camera menu to activate our custom animation.
#     UI.menu("Camera").add_item("Run Float Up Animation") {
#       Sketchup.active_model.active_view.animation = FloatUpAnimation.new
#     }
#
# Animation objects are activated by using the animation= method on a View
# object. To stop an animation set the view's aniamtion object to nil, like so:
#
#     Sketchup.active_model.active_view.animation = nil
#
#
class TC_Animation < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    # You are not allowed to declare a class inside another class, so
    # we must eval our setup code instead.
    eval <<-END_OF_BLOCK
     # This is an example of a simple animation that moves the camera eye up
     # by one inch. Useful for testing.
     class MoveUpAnimation

       def initialize(frames_to_play = 1)
         @play_state = "NOT STARTED"
         @frames_to_play = frames_to_play
         @frames = 0
       end

       def play_state
          @play_state
       end
       
       def nextFrame(view)
         @play_state = "PLAYING"
         new_eye = view.camera.eye
         new_eye.z = new_eye.z + 1.0
         view.camera.set(new_eye, view.camera.target, view.camera.up)
         view.show_frame

         # Play only five frames at a time.
         @frames = @frames + 1
         return @frames < 5
       end

       def stop
         @play_state = "STOPPED"
       end
     end
    END_OF_BLOCK
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Animation.pause
  # @file                rubyanimation.cpp
  #
  # The pause method is invoked by SketchUp when the animation is paused.
  #
  # This method is optional (you do not need to implement this method
  # unless you want to perform some specialized function when the
  # animation is paused). You cannot call this method in your code
  # explicitly and expect an animation to pause, only certain SketchUp
  # events cause the method to be called.
  #
  # Note: the user interface for pausing and resuming animations isn't
  # integrated with the Ruby API in the current version, so this method is
  # probably not useful to you.
  #
  #
  # Args:
  #
  # Returns:
  # - : nil
  #

  # Test the example code that we have in the API documentation.
  # Note: There is no way to activate a pause via the API, so there is
  # no extra set of unit tests that we can do that I can think of
  # - ScottLininger.
  def test_pause_api_example
    assert_nothing_raised do
     def pause
       # Insert handler code for whatever you need to do when it is paused.
     end
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Animation.stop
  # @file                rubyanimation.cpp
  #
  # The stop method is invoked by SketchUp when the animation is stopped.
  #
  # This method is optional (you do not need to implement this method
  # unless you want to perform some specialized function when the
  # animation is stopped). You cannot call this method in your code
  # explicitly and expect an animation to stop, only certain SketchUp
  # events cause the method to be called.
  #
  # Perhaps the most common way for this method to be called is when your
  # ruby code sets the view.animation to nil. See the class comments for
  # an example of this.
  #
  #
  # Args:
  #
  # Returns:
  # - : nil
  #

  # Test the example code that we have in the API documentation.
  def test_stop_api_example
    assert_nothing_raised do
     def stop
       # Insert your handler code for cleaning up after your animation.
     end
    end
  end

  # Test that stop is called when an animation is stopped by the API
  # by setting the view.animation = nil
  def test_stop_is_called_on_manual_stop
    myAnimation = MoveUpAnimation.new(5)
    Sketchup.active_model.active_view.animation = myAnimation
    Sketchup.active_model.active_view.animation = nil

    # This play_state will only be "STOPPED" if the stop method was
    # successfully called.
    play_state = myAnimation.play_state
    assert_equal('STOPPED', play_state,
                 'The stop method was not called as expected.' )
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Animation.resume
  # @file                rubyanimation.cpp
  #
  # The resume method is invoked by SketchUp when the animation is resumed
  # after being paused.
  #
  # This method is optional (you do not need to implement this method
  # unless you want to perform some specialized function when the
  # animation is resumed). You cannot call this method in your code
  # explicitly and expect an animation to stop, only certain SketchUp
  # events cause the method to be called.
  #
  # Note: the user interface for pausing and resuming animations isn't
  # integrated with the Ruby API in the current version, so this method is
  # probably not useful to you.
  #
  #
  # Args:
  #
  # Returns:
  # - : nil
  #

  # Note: There is no way to activate a pause or resumt via the API, so there is
  # no extra set of unit tests that we can do that I can think of
  # - ScottLininger.

  # Test the example code that we have in the API documentation.
  def test_resume_api_example
    assert_nothing_raised do
     def resume
       # Insert your handler code for whatever you need to do as you resume.
     end
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Animation.nextFrame
  # @file                rubyanimation.cpp
  #
  # The nextFrame method is invoked by SketchUp to tell the animation to
  # display its next frame. This method should set up the camera and then
  # call the show_frame method on the View.
  #
  # The nextFrame method is the only required method of the Animation
  # interface that you must implement.
  #
  #
  # Args:
  # - view: The view for the animation.
  #
  # Returns:
  # - continue: true if you want the animation to continue
  # on to the next frame, false if you want the animation
  # to stop after this frame.
  #

  # TODO(scottlininger): I'd like to add a test here to ensure that the 
  # animation actually runs, but I can't figure out how to do a wait()
  # inside a unit test. Need to loop back on this.

  # Test the example code that we have in the API documentation.
  def test_nextframe_api_example
    assert_nothing_raised do
     def nextFrame(view)
       # Insert your handler code for updating the camera or other entities.
       view.show_frame
       return true
     end
    end
  end


end