Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a17sm13644131wrs.20.2020.12.18.03.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 03:27:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 117011FF90;
	Fri, 18 Dec 2020 11:27:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 4/9] gdbstub: implement a softmmu based test
Date: Fri, 18 Dec 2020 11:27:02 +0000
Message-Id: <20201218112707.28348-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6yIcD/+UmE2n

This adds a new tests that allows us to test softmmu only features
including watchpoints. To do achieve this we need to:

  - add _exit: labels to the boot codes
  - write a memory.py test case
  - plumb the test case into the build system
  - tweak the run_test script to:
    - re-direct output when asked
    - use socket based connection for all tests
    - add a small pause before connection

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py                 |  36 +++--
 tests/tcg/aarch64/Makefile.softmmu-target     |   1 +
 tests/tcg/aarch64/system/boot.S               |   1 +
 tests/tcg/i386/Makefile.softmmu-target        |   1 +
 tests/tcg/i386/system/boot.S                  |   2 +-
 tests/tcg/multiarch/gdbstub/memory.py         | 130 ++++++++++++++++++
 .../multiarch/system/Makefile.softmmu-target  |  19 ++-
 tests/tcg/x86_64/Makefile.softmmu-target      |   1 +
 tests/tcg/x86_64/system/boot.S                |   2 +-
 9 files changed, 181 insertions(+), 12 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/memory.py

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 0c4f5c3808..8b91ff95af 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -16,6 +16,7 @@ import subprocess
 import shutil
 import shlex
 import os
+from time import sleep
 from tempfile import TemporaryDirectory
 
 def get_args():
@@ -27,10 +28,21 @@ def get_args():
                         required=True)
     parser.add_argument("--test", help="GDB test script",
                         required=True)
-    parser.add_argument("--gdb", help="The gdb binary to use", default=None)
+    parser.add_argument("--gdb", help="The gdb binary to use",
+                        default=None)
+    parser.add_argument("--output", help="A file to redirect output to")
 
     return parser.parse_args()
 
+
+def log(output, msg):
+    if output:
+        output.write(msg + "\n")
+        output.flush()
+    else:
+        print(msg)
+
+
 if __name__ == '__main__':
     args = get_args()
 
@@ -42,18 +54,25 @@ if __name__ == '__main__':
     if not args.gdb:
         print("We need gdb to run the test")
         exit(-1)
+    if args.output:
+        output = open(args.output, "w")
+    else:
+        output = None
 
     socket_dir = TemporaryDirectory("qemu-gdbstub")
     socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
 
     # Launch QEMU with binary
     if "system" in args.qemu:
-        cmd = "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
+        cmd = "%s %s %s -gdb unix:path=%s,server" % (args.qemu,
+                                                     args.qargs,
+                                                     args.binary,
+                                                     socket_name)
     else:
         cmd = "%s %s -g %s %s" % (args.qemu, args.qargs, socket_name,
                                   args.binary)
 
-    print("QEMU CMD: %s" % (cmd))
+    log(output, "QEMU CMD: %s" % (cmd))
     inferior = subprocess.Popen(shlex.split(cmd))
 
     # Now launch gdb with our test and collect the result
@@ -63,16 +82,15 @@ if __name__ == '__main__':
     # disable prompts in case of crash
     gdb_cmd += " -ex 'set confirm off'"
     # connect to remote
-    if "system" in args.qemu:
-        gdb_cmd += " -ex 'target remote localhost:1234'"
-    else:
-        gdb_cmd += " -ex 'target remote %s'" % (socket_name)
+    gdb_cmd += " -ex 'target remote %s'" % (socket_name)
     # finally the test script itself
     gdb_cmd += " -x %s" % (args.test)
 
-    print("GDB CMD: %s" % (gdb_cmd))
 
-    result = subprocess.call(gdb_cmd, shell=True);
+    sleep(1)
+    log(output, "GDB CMD: %s" % (gdb_cmd))
+
+    result = subprocess.call(gdb_cmd, shell=True, stdout=output)
 
     # A negative result is the result of an internal gdb failure like
     # a crash. We force a return of 0 so we don't fail the test on
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 1057a8ac49..a7286ac295 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -15,6 +15,7 @@ CRT_PATH=$(AARCH64_SYSTEM_SRC)
 LINK_SCRIPT=$(AARCH64_SYSTEM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT)
 TESTS+=$(AARCH64_TESTS) $(MULTIARCH_TESTS)
+EXTRA_RUNS+=$(MULTIARCH_RUNS)
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index b14e94f332..e190b1efa6 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -197,6 +197,7 @@ __start:
 	bl	main
 
 	/* pass return value to sys exit */
+_exit:
 	mov    x1, x0
 	ldr    x0, =0x20026 /* ADP_Stopped_ApplicationExit */
 	stp    x0, x1, [sp, #-16]!
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 1c8790eecd..5266f2335a 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -19,6 +19,7 @@ CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 TESTS+=$(MULTIARCH_TESTS)
+EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
diff --git a/tests/tcg/i386/system/boot.S b/tests/tcg/i386/system/boot.S
index 90aa174908..794c2cb0ad 100644
--- a/tests/tcg/i386/system/boot.S
+++ b/tests/tcg/i386/system/boot.S
@@ -76,7 +76,7 @@ _start:
          */
         call main
 
-        /* output any non-zero result in eax to isa-debug-exit device */
+_exit:	/* output any non-zero result in eax to isa-debug-exit device */
         test %al, %al
         jz 1f
         out %ax, $0xf4
diff --git a/tests/tcg/multiarch/gdbstub/memory.py b/tests/tcg/multiarch/gdbstub/memory.py
new file mode 100644
index 0000000000..67864ad902
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/memory.py
@@ -0,0 +1,130 @@
+from __future__ import print_function
+#
+# Test some of the softmmu debug features with the multiarch memory
+# test. It is a port of the original vmlinux focused test case but
+# using the "memory" test instead.
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+failcount = 0
+
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
+
+def check_step():
+    "Step an instruction, check it moved."
+    start_pc = gdb.parse_and_eval('$pc')
+    gdb.execute("si")
+    end_pc = gdb.parse_and_eval('$pc')
+
+    return not (start_pc == end_pc)
+
+
+#
+# Currently it's hard to create a hbreak with the pure python API and
+# manually matching PC to symbol address is a bit flaky thanks to
+# function prologues. However internally QEMU's gdbstub treats them
+# the same as normal breakpoints so it will do for now.
+#
+def check_break(sym_name):
+    "Setup breakpoint, continue and check we stopped."
+    sym, ok = gdb.lookup_symbol(sym_name)
+    bp = gdb.Breakpoint(sym_name, gdb.BP_BREAKPOINT)
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
+
+def do_one_watch(sym, wtype, text):
+
+    wp = gdb.Breakpoint(sym, gdb.BP_WATCHPOINT, wtype)
+    gdb.execute("c")
+    report_str = "%s for %s" % (text, sym)
+
+    if wp.hit_count > 0:
+        report(True, report_str)
+        wp.delete()
+    else:
+        report(False, report_str)
+
+
+def check_watches(sym_name):
+    "Watch a symbol for any access."
+
+    # Should hit for any read
+    do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
+
+    # Again should hit for reads
+    do_one_watch(sym_name, gdb.WP_READ, "rwatch")
+
+    # Finally when it is written
+    do_one_watch(sym_name, gdb.WP_WRITE, "watch")
+
+
+def run_test():
+    "Run through the tests one by one"
+
+    print("Checking we can step the first few instructions")
+    step_ok = 0
+    for i in range(3):
+        if check_step():
+            step_ok += 1
+
+    report(step_ok == 3, "single step in boot code")
+
+    # If we get here we have missed some of the other breakpoints.
+    print("Setup catch-all for _exit")
+    cbp = gdb.Breakpoint("_exit", gdb.BP_BREAKPOINT)
+
+    check_break("main")
+    check_watches("test_data[128]")
+
+    report(cbp.hit_count == 0, "didn't reach backstop")
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
+if gdb.parse_and_eval('$pc') == 0:
+    print("SKIP: PC not set")
+    exit(0)
+
+try:
+    # These are not very useful in scripts
+    gdb.execute("set pagination off")
+
+    # Run the actual tests
+    run_test()
+except (gdb.error):
+    print("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+# Finally kill the inferior and exit gdb with a count of failures
+gdb.execute("kill")
+exit(failcount)
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index db4bbeda44..4657f6e4cf 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -7,8 +7,25 @@
 # complications of building.
 #
 
-MULTIARCH_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/multiarch/system
+MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
+MULTIARCH_SYSTEM_SRC=$(MULTIARCH_SRC)/system
 VPATH+=$(MULTIARCH_SYSTEM_SRC)
 
 MULTIARCH_TEST_SRCS=$(wildcard $(MULTIARCH_SYSTEM_SRC)/*.c)
 MULTIARCH_TESTS = $(patsubst $(MULTIARCH_SYSTEM_SRC)/%.c, %, $(MULTIARCH_TEST_SRCS))
+
+ifneq ($(HAVE_GDB_BIN),)
+GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
+
+run-gdbstub-memory: memory
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) \
+		--output $<.gdb.out \
+		--qargs \
+		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
+	"softmmu gdbstub support")
+
+MULTIARCH_RUNS += run-gdbstub-memory
+endif
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index df252e761c..1bd763f2e6 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -19,6 +19,7 @@ CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 TESTS+=$(MULTIARCH_TESTS)
+EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
index 73b19a2bda..f8a2fcc839 100644
--- a/tests/tcg/x86_64/system/boot.S
+++ b/tests/tcg/x86_64/system/boot.S
@@ -124,7 +124,7 @@ _start:
         /* don't worry about stack frame, assume everthing is garbage when we return */
 	call main
 
-        /* output any non-zero result in eax to isa-debug-exit device */
+_exit:	/* output any non-zero result in eax to isa-debug-exit device */
         test %al, %al
         jz 1f
         out %ax, $0xf4
-- 
2.20.1
