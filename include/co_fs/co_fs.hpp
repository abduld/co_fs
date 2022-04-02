#pragma once

#include <string>
#include <thread>
#include <filesystem>

namespace co_fs {
inline auto open(const std::string &path) -> std::string {
  return path;
}
} // namespace co_fs