# GLOB_RECURSE will allow you to find everything with extension in subdirs
file(GLOB sources *.cpp)
file(GLOB headers *.h)

add_executable(bamtools_test ${sources} ${headers})

target_link_libraries(bamtools_test ${ZLIB_LIBRARIES} ${CMAKE_CURRENT_SOURCE_DIR}/../bamtools/lib/libbamtools.a)
