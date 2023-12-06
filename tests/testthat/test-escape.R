test_that("re_escape works", {
  expect_equal(
    re_escape(".^$|*+?{}[]()"),
    "\\.\\^\\$\\|\\*\\+\\?\\{\\}\\[\\]\\(\\)"
  )
  expect_equal(re_escape("\\"), "\\\\")
})
