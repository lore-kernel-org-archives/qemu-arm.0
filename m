Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i7-v6sm5743780wrs.55.2018.11.09.07.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:21 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 756133E0593;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 5/7] tests/guest-debug: don't use symbol resolution for PC checks
Date: Fri,  9 Nov 2018 15:21:17 +0000
Message-Id: <20181109152119.9242-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n2/eQjlYv+qk

It turns out symbol resolution isn't enough as modern kernels are
often padded with check code at the start of functions. GDB seems to
put the breakpoint at the first non-check instruction which causes
comparisons with the symbol resolution to fail.

For normal breakpoints we can detect the hit just by checking
hit_count instead. For hardware breakpoints we fish the breakpoint
address out of what gdb.execute() reported it was set at.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/test-gdbstub.py | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-gdbstub.py
index c7e3986a24..3de174b74b 100644
--- a/tests/guest-debug/test-gdbstub.py
+++ b/tests/guest-debug/test-gdbstub.py
@@ -6,9 +6,10 @@ from __future__ import print_function
 # gdb ${KERNEL}.vmlinux -x ${QEMU_SRC}/tests/guest-debug/test-gdbstub.py
 
 import gdb
+import re
 
 failcount = 0
-
+addr_match = re.compile("(0x[0-9a-f]{4,16})")
 
 def report(cond, msg):
     "Report success/fail of test"
@@ -37,26 +38,30 @@ def check_break(sym_name):
     gdb.execute("c")
 
     # hopefully we came back
-    end_pc = gdb.parse_and_eval('$pc')
-    print ("%s == %s %d" % (end_pc, sym.value(), bp.hit_count))
+    hit = bp.hit_count
     bp.delete()
 
-    # can we test we hit bp?
-    return end_pc == sym.value()
+    # did we hit bp?
+    return hit > 0
 
 
 # We need to do hbreak manually as the python interface doesn't export it
+# As the resolution of sym_name might not exactly match where the
+# breakpoint actually ends up we need to fish it out from result of
+# gdb.execute.
 def check_hbreak(sym_name):
     "Setup hardware breakpoint, continue and check we stopped."
-    sym, ok = gdb.lookup_symbol(sym_name)
-    gdb.execute("hbreak %s" % (sym_name))
+    result = gdb.execute("hbreak %s" % (sym_name), to_string=True)
+    addr_txt = addr_match.search(result).group()
+    addr = int(addr_txt, 16)
+
     gdb.execute("c")
 
     # hopefully we came back
     end_pc = gdb.parse_and_eval('$pc')
-    print ("%s == %s" % (end_pc, sym.value()))
+    print ("%s == %s" % (end_pc, addr))
 
-    if end_pc == sym.value():
+    if end_pc == addr:
         gdb.execute("d 1")
         return True
     else:
-- 
2.17.1
