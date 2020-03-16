Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c4sm475531wml.7.2020.03.16.10.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:28:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AD1B21FFB1;
	Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 25/28] tests/tcg/aarch64: add test-sve-ioctl guest-debug test
Date: Mon, 16 Mar 2020 17:21:52 +0000
Message-Id: <20200316172155.971-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3nsdXZXVBlYN

This test exercises the gdbstub while runing the sve-iotcl test. I
haven't plubmed it into make system as we need a way of verifying if
gdb has the right support for SVE.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - interrogate ZCR_EL1 directly as no longer have vg
v5
  - plumb in
  - skip if fails to connect
v6
  - fix for vg
v7
  - change to vg size, also better trap failure in zreg access
---
 tests/tcg/aarch64/Makefile.target           | 11 ++-
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 82 +++++++++++++++++++++
 2 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index c879932ff6c..d99b2a9eced 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -54,15 +54,22 @@ sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-AARCH64_TESTS += gdbstub-sysregs
+AARCH64_TESTS += gdbstub-sysregs gdbstub-sve-ioctls
 
-.PHONY: gdbstub-sysregs
+.PHONY: gdbstub-sysregs gdbstub-sve-ioctls
 run-gdbstub-sysregs: sysregs
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve.py, \
 	"basic gdbstub SVE support")
+
+run-gdbstub-sve-ioctls: sve-ioctls
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
+	"basic gdbstub SVE ZLEN support")
 endif
 
 endif
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
new file mode 100644
index 00000000000..5824abe09ac
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -0,0 +1,82 @@
+from __future__ import print_function
+#
+# Test the SVE ZReg reports the right amount of data. It uses the
+# sve-ioctl test and examines the register data each time the
+# __sve_ld_done breakpoint is hit.
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
+        print ("PASS: %s" % (msg))
+    else:
+        print ("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+class TestBreakpoint(gdb.Breakpoint):
+    def __init__(self, sym_name="__sve_ld_done"):
+        super(TestBreakpoint, self).__init__(sym_name)
+        # self.sym, ok = gdb.lookup_symbol(sym_name)
+
+    def stop(self):
+        val_i = gdb.parse_and_eval('i')
+        global initial_vlen
+        try:
+            for i in range(0, int(val_i)):
+                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+                report(int(val_z) == i, "z0.b.u[%d] == %d" % (i, i))
+            for i in range(i + 1, initial_vlen):
+                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+                report(int(val_z) == 0, "z0.b.u[%d] == 0" % (i))
+        except gdb.error:
+            report(False, "checking zregs (out of range)")
+
+
+def run_test():
+    "Run through the tests one by one"
+
+    print ("Setup breakpoint")
+    bp = TestBreakpoint()
+
+    global initial_vlen
+    vg = gdb.parse_and_eval("$vg")
+    initial_vlen = int(vg) * 8
+
+    gdb.execute("c")
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    arch = inferior.architecture()
+    report(arch.name() == "aarch64", "connected to aarch64")
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
+except:
+    print ("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    import code
+    code.InteractiveConsole(locals=globals()).interact()
+    raise
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
-- 
2.20.1
