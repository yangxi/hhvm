find_package(Libpfm REQUIRED)
if (Libpfm_INCLUDE_DIR AND Libpfm_LIBRARY)
  IF(CMAKE_C_FLAGS MATCHES "-pg")
    # Turn -pg off
    STRING(REGEX REPLACE "-pg" "" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
  ENDIF(CMAKE_C_FLAGS MATCHES "-pg")

  IF(CMAKE_CXX_FLAGS MATCHES "-pg")
    # Turn -pg off
    STRING(REGEX REPLACE "-pg" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  ENDIF(CMAKE_CXX_FLAGS MATCHES "-pg")

  set(CXX_SOURCES)
  set(C_SOURCES)
  set(ASM_SOURCES)
  set(HEADER_SOURCES)
  set(IDL_SOURCES)
  set(IDL_DEFINES)
  set(PHP_SOURCES)

  # Pick up all files in the base ext/ folder unconditionally
  auto_sources(files "*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}")
  list(APPEND CXX_SOURCES ${files})
  auto_sources(files "*.c" "${CMAKE_CURRENT_SOURCE_DIR}")
  list(APPEND C_SOURCES ${files})
  auto_sources(files "*.S" "${CMAKE_CURRENT_SOURCE_DIR}")
  list(APPEND ASM_SOURCES ${files})
  auto_sources(files "*.h" "${CMAKE_CURRENT_SOURCE_DIR}")
  list(APPEND HEADER_SOURCES ${files})


  ADD_LIBRARY(hphp_runtime_shim STATIC
    ${CXX_SOURCES} ${C_SOURCES} ${ASM_SOURCES} ${HEADER_SOURCES})
  auto_source_group("hphp_runtime_shim" "${CMAKE_CURRENT_SOURCE_DIR}"
    ${ASM_SOURCES} ${C_SOURCES} ${CXX_SOURCES} ${HEADER_SOURCES})



  HHVM_PUBLIC_HEADERS(shim ${HEADER_SOURCES})
endif()