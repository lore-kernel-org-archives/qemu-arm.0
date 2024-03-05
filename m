Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d58ea000000b0033d4cf751b2sm14731989wrd.33.2024.03.05.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B6EA15F9DA;
	Tue,  5 Mar 2024 12:10:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brad Smith <brad@comstyle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Brian Cain <bcain@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Beraldo Leal <bleal@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Warner Losh <imp@bsdimp.com>,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 13/29] tests/tcg: Add two follow-fork-mode tests
Date: Tue,  5 Mar 2024 12:09:49 +0000
Message-Id: <20240305121005.3528075-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MHddJOa0Le5X

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add follow-fork-mode child and and follow-fork-mode parent tests.
Check for the obvious pitfalls, such as lingering breakpoints,
catchpoints, and single-step mode.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240219141628.246823-13-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/follow-fork-mode.c        | 56 +++++++++++++++++++
 tests/tcg/multiarch/Makefile.target           | 17 +++++-
 .../gdbstub/follow-fork-mode-child.py         | 40 +++++++++++++
 .../gdbstub/follow-fork-mode-parent.py        | 16 ++++++
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/multiarch/follow-fork-mode.c
 create mode 100644 tests/tcg/multiarch/gdbstub/follow-fork-mode-child.py
 create mode 100644 tests/tcg/multiarch/gdbstub/follow-fork-mode-parent.py

diff --git a/tests/tcg/multiarch/follow-fork-mode.c b/tests/tcg/multiarch/follow-fork-mode.c
new file mode 100644
index 00000000000..cb6b032b388
--- /dev/null
+++ b/tests/tcg/multiarch/follow-fork-mode.c
@@ -0,0 +1,56 @@
+/*
+ * Test GDB's follow-fork-mode.
+ *
+ * fork() a chain of processes.
+ * Parents sends one byte to their children, and children return their
+ * position in the chain, in order to prove that they survived GDB's fork()
+ * handling.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+void break_after_fork(void)
+{
+}
+
+int main(void)
+{
+    int depth = 42, err, i, fd[2], status;
+    pid_t child, pid;
+    ssize_t n;
+    char b;
+
+    for (i = 0; i < depth; i++) {
+        err = pipe(fd);
+        assert(err == 0);
+        child = fork();
+        break_after_fork();
+        assert(child != -1);
+        if (child == 0) {
+            close(fd[1]);
+
+            n = read(fd[0], &b, 1);
+            close(fd[0]);
+            assert(n == 1);
+            assert(b == (char)i);
+        } else {
+            close(fd[0]);
+
+            b = (char)i;
+            n = write(fd[1], &b, 1);
+            close(fd[1]);
+            assert(n == 1);
+
+            pid = waitpid(child, &status, 0);
+            assert(pid == child);
+            assert(WIFEXITED(status));
+            return WEXITSTATUS(status) - 1;
+        }
+    }
+
+    return depth;
+}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index f11f3b084d7..979a0dd1bc2 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -106,6 +106,20 @@ run-gdbstub-catch-syscalls: catch-syscalls
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/catch-syscalls.py, \
 	hitting a syscall catchpoint)
 
+run-gdbstub-follow-fork-mode-child: follow-fork-mode
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/follow-fork-mode-child.py, \
+	following children on fork)
+
+run-gdbstub-follow-fork-mode-parent: follow-fork-mode
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/follow-fork-mode-parent.py, \
+	following parents on fork)
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
@@ -113,7 +127,8 @@ endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
 	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
 	      run-gdbstub-registers run-gdbstub-prot-none \
-	      run-gdbstub-catch-syscalls
+	      run-gdbstub-catch-syscalls run-gdbstub-follow-fork-mode-child \
+	      run-gdbstub-follow-fork-mode-parent
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/follow-fork-mode-child.py b/tests/tcg/multiarch/gdbstub/follow-fork-mode-child.py
new file mode 100644
index 00000000000..72a6e440c08
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/follow-fork-mode-child.py
@@ -0,0 +1,40 @@
+"""Test GDB's follow-fork-mode child.
+
+SPDX-License-Identifier: GPL-2.0-or-later
+"""
+from test_gdbstub import main, report
+
+
+def run_test():
+    """Run through the tests one by one"""
+    gdb.execute("set follow-fork-mode child")
+    # Check that the parent breakpoints are unset.
+    gdb.execute("break break_after_fork")
+    # Check that the parent syscall catchpoints are unset.
+    # Skip this check on the architectures that don't have them.
+    have_fork_syscall = False
+    for fork_syscall in ("fork", "clone", "clone2", "clone3"):
+        try:
+            gdb.execute("catch syscall {}".format(fork_syscall))
+        except gdb.error:
+            pass
+        else:
+            have_fork_syscall = True
+    gdb.execute("continue")
+    for i in range(42):
+        if have_fork_syscall:
+            # syscall entry.
+            if i % 2 == 0:
+                # Check that the parent single-stepping is turned off.
+                gdb.execute("si")
+            else:
+                gdb.execute("continue")
+            # syscall exit.
+            gdb.execute("continue")
+        # break_after_fork()
+        gdb.execute("continue")
+    exitcode = int(gdb.parse_and_eval("$_exitcode"))
+    report(exitcode == 42, "{} == 42".format(exitcode))
+
+
+main(run_test)
diff --git a/tests/tcg/multiarch/gdbstub/follow-fork-mode-parent.py b/tests/tcg/multiarch/gdbstub/follow-fork-mode-parent.py
new file mode 100644
index 00000000000..5c2fe722088
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/follow-fork-mode-parent.py
@@ -0,0 +1,16 @@
+"""Test GDB's follow-fork-mode parent.
+
+SPDX-License-Identifier: GPL-2.0-or-later
+"""
+from test_gdbstub import main, report
+
+
+def run_test():
+    """Run through the tests one by one"""
+    gdb.execute("set follow-fork-mode parent")
+    gdb.execute("continue")
+    exitcode = int(gdb.parse_and_eval("$_exitcode"))
+    report(exitcode == 0, "{} == 0".format(exitcode))
+
+
+main(run_test)
-- 
2.39.2
