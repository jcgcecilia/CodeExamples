cmake_minimum_required(VERSION 2.8.11)

project(testproject)


# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
include_directories(${CMAKE_CURRENT_BINARY_DIR})
set(CMAKE_AUTOMOC ON)

set(QT_CMAKE /usr/local/Qt/5.8/gcc_64/lib/cmake)
set(QT_MODULES Widgets Core)

foreach(qtmodule ${QT_MODULES})
  set(Qt5${qtmodule}_DIR ${QT_CMAKE}/Qt5${qtmodule}) 
  find_package(Qt5${qtmodule} REQUIRED)      
endforeach(qtmodule)

#set(Qt5Core_DIR ${QT_CMAKE}/Qt5Core)



# Find the QtWidgets library
#find_package(Qt5Widgets REQUIRED)
#find_package(Qt5Core REQUIRED)

#find_package(Protobuf REQUIRED)
#include_directories(${PROTOBUF_INCLUDE_DIRS})
#protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS proto/foo.proto)
#add_library(bar SHARED ${PROTO_SRCS} ${PROTO_HDRS})
#target_link_libraries(bar ${Protobuf_LIBRARIES})

#include_directories(${Qt5Widgets_INCLUDES})

#add_definitions(${Qt5Widgets_DEFINITIONS})

#set(CMAKE_CXX_FLAGS "${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")

# Tell CMake to create the helloworld executable
add_executable(helloworld src/main.cpp src/TestObjectClass.cpp)

# Use the Widgets module from Qt 5.
#target_link_libraries(helloworld Qt5::Widgets)
#target_link_libraries(helloworld ${Qt5Widgets_LIBRARIES})
#qt5_use_modules(helloworld Widgets)

foreach(qtmodule ${QT_MODULES})
  qt5_use_modules(helloworld ${qtmodule})   
endforeach(qtmodule)
