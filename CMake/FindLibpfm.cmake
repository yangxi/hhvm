find_path(Libpfm_INCLUDE_DIR perfmon/pfmlib_perf_event.h)
find_library(Libpfm_LIBRARY NAMES pfm)

mark_as_advanced(Libpfm_INCLUDE_DIR Libpfm_LIBRARY)