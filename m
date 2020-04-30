Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o3sm901426wru.68.2020.04.30.12.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:01:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 61F981FF96;
	Thu, 30 Apr 2020 20:01:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 8/9] tests/tcg: add a multiarch linux-user gdb test
Date: Thu, 30 Apr 2020 20:01:21 +0100
Message-Id: <20200430190122.4592-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430190122.4592-1-alex.bennee@linaro.org>
References: <20200430190122.4592-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qiFTjOLwrg5E

When the gdbstub code was converted to the new API we missed a few
snafus in the various guests. Add a simple gdb test script which can
be used on all our linux-user guests to check for obvious failures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use EXTRA_RUNS to queue the tests so as not to break plugins
---
 tests/tcg/aarch64/Makefile.target   |  5 +-
 tests/tcg/cris/Makefile.target      |  1 +
 tests/tcg/multiarch/Makefile.target | 14 +++++
 tests/tcg/multiarch/gdbstub/sha1.py | 81 +++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/sha1.py

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d99b2a9ece..312f36cde5 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -54,9 +54,6 @@ sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-AARCH64_TESTS += gdbstub-sysregs gdbstub-sve-ioctls
-
-.PHONY: gdbstub-sysregs gdbstub-sve-ioctls
 run-gdbstub-sysregs: sysregs
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
@@ -70,6 +67,8 @@ run-gdbstub-sve-ioctls: sve-ioctls
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
 	"basic gdbstub SVE ZLEN support")
+
+EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
 
 endif
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index 24c7f2e761..e72d3cbdb2 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -23,6 +23,7 @@ CRIS_RUNS = $(patsubst %, run-%, $(CRIS_USABLE_TESTS))
 
 # override the list of tests, as we can't build the multiarch tests
 TESTS = $(CRIS_USABLE_TESTS)
+EXTRA_RUNS =
 VPATH = $(CRIS_SRC)
 
 AS	= $(CC) -x assembler-with-cpp
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 035b09c853..51fb75ecfd 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -42,5 +42,19 @@ run-test-mmap-%: test-mmap
 	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
 		"$< ($* byte pages) on $(TARGET_NAME)")
 
+ifneq ($(HAVE_GDB_BIN),)
+GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
+
+run-gdbstub-sha1: sha1
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
+	"basic gdbstub support")
+
+EXTRA_RUNS += run-gdbstub-sha1
+endif
+
+
 # Update TESTS
 TESTS += $(MULTIARCH_TESTS)
diff --git a/tests/tcg/multiarch/gdbstub/sha1.py b/tests/tcg/multiarch/gdbstub/sha1.py
new file mode 100644
index 0000000000..734553b98b
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/sha1.py
@@ -0,0 +1,81 @@
+from __future__ import print_function
+#
+# A very simple smoke test for debugging the SHA1 userspace test on
+# each target.
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+initial_vlen = 0
+failcount = 0
+
+def report(cond, msg):
+    "Report success/fail of test"
+    if cond:
+        print("PASS: %s" % (msg))
+    else:
+        print("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+def check_break(sym_name):
+    "Setup breakpoint, continue and check we stopped."
+    sym, ok = gdb.lookup_symbol(sym_name)
+    bp = gdb.Breakpoint(sym_name)
+
+    gdb.execute("c")
+
+    # hopefully we came back
+    end_pc = gdb.parse_and_eval('$pc')
+    report(bp.hit_count == 1,
+           "break @ %s (%s %d hits)" % (end_pc, sym.value(), bp.hit_count))
+
+    bp.delete()
+
+def run_test():
+    "Run through the tests one by one"
+
+    check_break("SHA1Init")
+
+    # check step and inspect values
+    gdb.execute("next")
+    val_ctx = gdb.parse_and_eval("context->state[0]")
+    exp_ctx = 0x67452301
+    report(int(val_ctx) == exp_ctx, "context->state[0] == %x" % exp_ctx);
+
+    gdb.execute("next")
+    val_ctx = gdb.parse_and_eval("context->state[1]")
+    exp_ctx = 0xEFCDAB89
+    report(int(val_ctx) == exp_ctx, "context->state[1] == %x" % exp_ctx);
+
+    # finally check we don't barf inspecting registers
+    gdb.execute("info registers")
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    arch = inferior.architecture()
+    print("ATTACHED: %s" % arch.name())
+except (gdb.error, AttributeError):
+    print("SKIPPING (not connected)", file=sys.stderr)
+    exit(0)
+
+try:
+    # These are not very useful in scripts
+    gdb.execute("set pagination off")
+    gdb.execute("set confirm off")
+
+    # Run the actual tests
+    run_test()
+except (gdb.error):
+    print ("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
-- 
2.20.1
