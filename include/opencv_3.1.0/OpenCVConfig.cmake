# ===================================================================================
#  The OpenCV CMake configuration file
#
#             ** File generated automatically, do not modify **
#
#  Usage from an external project:
#    In your CMakeLists.txt, add these lines:
#
#    FIND_PACKAGE(OpenCV REQUIRED)
#    TARGET_LINK_LIBRARIES(MY_TARGET_NAME ${OpenCV_LIBS})
#
#    Or you can search for specific OpenCV modules:
#
#    FIND_PACKAGE(OpenCV REQUIRED core imgcodecs)
#
#    If the module is found then OPENCV_<MODULE>_FOUND is set to TRUE.
#
#    This file will define the following variables:
#      - OpenCV_LIBS                     : The list of libraries to link against.
#      - OpenCV_LIB_DIR                  : The directory(es) where lib files are. Calling LINK_DIRECTORIES
#                                          with this path is NOT needed.
#      - OpenCV_INCLUDE_DIRS             : The OpenCV include directories.
#      - OpenCV_COMPUTE_CAPABILITIES     : The version of compute capability
#      - OpenCV_ANDROID_NATIVE_API_LEVEL : Minimum required level of Android API
#      - OpenCV_VERSION                  : The version of this OpenCV build. Example: "2.4.0"
#      - OpenCV_VERSION_MAJOR            : Major version part of OpenCV_VERSION. Example: "2"
#      - OpenCV_VERSION_MINOR            : Minor version part of OpenCV_VERSION. Example: "4"
#      - OpenCV_VERSION_PATCH            : Patch version part of OpenCV_VERSION. Example: "0"
#
#    Advanced variables:
#      - OpenCV_SHARED
#      - OpenCV_CONFIG_PATH
#      - OpenCV_LIB_COMPONENTS
#
# ===================================================================================
#
#    Windows pack specific options:
#      - OpenCV_STATIC
#      - OpenCV_CUDA

if(CMAKE_VERSION VERSION_GREATER 2.6)
  get_property(OpenCV_LANGUAGES GLOBAL PROPERTY ENABLED_LANGUAGES)
  if(NOT ";${OpenCV_LANGUAGES};" MATCHES ";CXX;")
    enable_language(CXX)
  endif()
endif()

set(OpenCV_STATIC OFF)

if(MSVC)
  if(CMAKE_CL_64)
    set(OpenCV_ARCH x64)
    set(OpenCV_TBB_ARCH intel64)
  elseif((CMAKE_GENERATOR MATCHES "ARM") OR ("${arch_hint}" STREQUAL "ARM") OR (CMAKE_VS_EFFECTIVE_PLATFORMS MATCHES "ARM|arm"))
    # see Modules/CmakeGenericSystem.cmake
    set(OpenCV_ARCH ARM)
  else()
    set(OpenCV_ARCH x86)
    set(OpenCV_TBB_ARCH ia32)
  endif()
  if(MSVC_VERSION EQUAL 1400)
    set(OpenCV_RUNTIME vc8)
  elseif(MSVC_VERSION EQUAL 1500)
    set(OpenCV_RUNTIME vc9)
  elseif(MSVC_VERSION EQUAL 1600)
    set(OpenCV_RUNTIME vc10)
  elseif(MSVC_VERSION EQUAL 1700)
    set(OpenCV_RUNTIME vc11)
  elseif(MSVC_VERSION EQUAL 1800)
    set(OpenCV_RUNTIME vc12)
  elseif(MSVC_VERSION EQUAL 1900)
    set(OpenCV_RUNTIME vc14)
  else()
    set(OpenCV_RUNTIME vc14)
  endif()
endif()

if(CMAKE_VERSION VERSION_GREATER 2.6.2)
  unset(OpenCV_CONFIG_PATH CACHE)
endif()

IF("${ZED_DIR}" STREQUAL "")
  set(ZED_DIR $ENV{ZED_SDK_ROOT_DIR})
ENDIF()

SET(OpenCV_INCLUDE_DIRS ${ZED_DIR}/dependencies/opencv_3.1.0/include)
SET(OpenCV_LIBRARY_DIRS ${ZED_DIR}/dependencies/opencv_3.1.0/x64/)
SET(OpenCV_LIBRARIES ${ZED_DIR}/dependencies/opencv_3.1.0/x64/opencv_world310.lib)

set(OpenCV_FOUND TRUE CACHE BOOL "" FORCE)
set(OPENCV_FOUND TRUE CACHE BOOL "" FORCE)