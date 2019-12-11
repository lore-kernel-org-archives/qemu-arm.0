Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w13sm3138312wru.38.2019.12.11.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 09:11:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1D0D21FFA6;
	Wed, 11 Dec 2019 17:05:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 20/20] tests/tcg/aarch64: add test-sve-ioctl guest-debug test
Date: Wed, 11 Dec 2019 17:05:20 +0000
Message-Id: <20191211170520.7747-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211170520.7747-1-alex.bennee@linaro.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gX/c5Ab7OW6W

This test exercises the gdbstub while runing the sve-iotcl test. I
haven't plubmed it into make system as we need a way of verifying if
gdb has the right support for SVE.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 71 +++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py

diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
new file mode 100644
index 00000000000..2c8c21ca381
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -0,0 +1,71 @@
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
+        for i in range(0, int(val_i)):
+            val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+            report(int(val_z) == i, "z0.b.u[%d] == %d" % (i, i))
+        for i in range(i + 1, initial_vlen):
+            val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+            report(int(val_z) == 0, "z0.b.u[%d] == 0" % (i))
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
+    initial_vlen = int(vg) * 16
+
+    gdb.execute("c")
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
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
