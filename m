Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c124sm249927wma.10.2020.03.17.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 10:58:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A7D711FFAC;
	Tue, 17 Mar 2020 17:50:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 23/28] tests/tcg/aarch64: add a gdbstub testcase for SVE registers
Date: Tue, 17 Mar 2020 17:50:48 +0000
Message-Id: <20200317175053.5278-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317175053.5278-1-alex.bennee@linaro.org>
References: <20200317175053.5278-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Jh7X6CFkwlUj

A very simple test case which sets and reads SVE registers while
running a test case. We don't really need to compile a SVE binary for
this case but we will later so keep it simple for now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200316172155.971-24-alex.bennee@linaro.org>

diff --git a/tests/.gitignore b/tests/.gitignore
index 7306866f216..d03c037d772 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -10,6 +10,7 @@ qht-bench
 rcutorture
 test-*
 !test-*.c
+!test-*.py
 !docker/test-*
 test-qapi-commands.[ch]
 test-qapi-init-commands.[ch]
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index a25afc071cc..b61b53e4dd1 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -46,6 +46,21 @@ ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
 sysregs: CFLAGS+=-march=armv8.1-a+sve
+
+ifneq ($(HAVE_GDB_BIN),)
+GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
+
+AARCH64_TESTS += gdbstub-sysregs
+
+.PHONY: gdbstub-sysregs
+run-gdbstub-sysregs: sysregs
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve.py, \
+	"basic gdbstub SVE support")
+endif
+
 endif
 
 TESTS += $(AARCH64_TESTS)
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
new file mode 100644
index 00000000000..dbe7f2aa932
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -0,0 +1,84 @@
+from __future__ import print_function
+#
+# Test the SVE registers are visable and changeable via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+MAGIC = 0xDEADBEEF
+
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
+def run_test():
+    "Run through the tests one by one"
+
+    gdb.execute("info registers")
+    report(True, "info registers")
+
+    gdb.execute("info registers vector")
+    report(True, "info registers vector")
+
+    # Now all the zregs
+    frame = gdb.selected_frame()
+    for i in range(0, 32):
+        rname = "z%d" % (i)
+        zreg = frame.read_register(rname)
+        report(True, "Reading %s" % rname)
+        for j in range(0, 4):
+            cmd = "set $%s.q.u[%d] = 0x%x" % (rname, j, MAGIC)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+        for j in range(0, 4):
+            reg = "$%s.q.u[%d]" % (rname, j)
+            v = gdb.parse_and_eval(reg)
+            report(str(v.type) == "uint128_t", "size of %s" % (reg))
+        for j in range(0, 8):
+            cmd = "set $%s.d.u[%d] = 0x%x" % (rname, j, MAGIC)
+            gdb.execute(cmd)
+            report(True, "%s" % cmd)
+        for j in range(0, 8):
+            reg = "$%s.d.u[%d]" % (rname, j)
+            v = gdb.parse_and_eval(reg)
+            report(str(v.type) == "uint64_t", "size of %s" % (reg))
+            report(int(v) == MAGIC, "%s is 0x%x" % (reg, MAGIC))
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    if inferior.was_attached == False:
+        print("SKIPPING (failed to attach)", file=sys.stderr)
+        exit(0)
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
+
+print("All tests complete: %d failures" % failcount)
+
+exit(failcount)
-- 
2.20.1
