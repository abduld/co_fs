#pragma once

#include <filesystem>
#include <string>
#include <thread>

namespace co_fs {
inline auto open(const std::string &path) -> std::string {
  return path;
}
} // namespace co_fs