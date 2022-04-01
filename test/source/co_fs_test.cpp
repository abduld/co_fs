#include "co_fs/co_fs.hpp"

auto main() -> int
{
  auto result = name();
  return result == "co_fs" ? 0 : 1;
}
