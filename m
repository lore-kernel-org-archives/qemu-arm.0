Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x10sm2914366wrp.58.2019.12.11.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 09:11:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BF5051FFA3;
	Wed, 11 Dec 2019 17:05:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 18/20] tests/tcg/aarch64: add a gdbstub testcase for SVE registers
Date: Wed, 11 Dec 2019 17:05:18 +0000
Message-Id: <20191211170520.7747-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211170520.7747-1-alex.bennee@linaro.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4wr1MVnIj3oj

We don't plumb this in yet as there are complications involved with
binutils and cross-architectiure debugging but it is one step closer.

Example:

  ./tests/guest-debug/run-test.py \
    --qemu ./aarch64-linux-user/qemu-aarch64 \
    --qargs "-cpu max" \
    --bin ./tests/tcg/aarch64-linux-user/hello \
    --test ~/lsrc/qemu.git/tests/tcg/aarch64/gdbstub/test-sve.py \
    --gdb /home/alex/src/tools/binutils-gdb.git/install/bin/gdb

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/.gitignore                      |  1 +
 tests/tcg/aarch64/gdbstub/test-sve.py | 75 +++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py

diff --git a/tests/.gitignore b/tests/.gitignore
index f9c01708812..8cc428b58bb 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -10,6 +10,7 @@ qht-bench
 rcutorture
 test-*
 !test-*.c
+!test-*.py
 !docker/test-*
 test-qapi-commands.[ch]
 include/test-qapi-commands-sub-module.[ch]
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
new file mode 100644
index 00000000000..11bc96fc06d
--- /dev/null
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -0,0 +1,75 @@
+from __future__ import print_function
+#
+# Test the SVE registers are visable and changeable via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
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
+# Finally kill the inferior and exit gdb with a count of failures
+gdb.execute("kill")
+exit(failcount)
-- 
2.20.1
