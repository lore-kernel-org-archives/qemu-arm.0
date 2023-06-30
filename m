Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003fa95c466a1sm15232380wmi.5.2023.06.30.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 696FD1FFD5;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v4 30/38] gdbstub: clean-up vcont handling to avoid goto
Date: Fri, 30 Jun 2023 19:04:15 +0100
Message-Id: <20230630180423.558337-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 45JSckjyaBSJ

We can handle all the error exit cases by using g_autofree() for the
one thing that needs cleaning up on the exit.

Message-Id: <20230627160943.2956928-29-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/gdbstub.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9496d7b175..49143c7d83 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -573,7 +573,6 @@ static int gdb_handle_vcont(const char *p)
 {
     int res, signal = 0;
     char cur_action;
-    char *newstates;
     unsigned long tmp;
     uint32_t pid, tid;
     GDBProcess *process;
@@ -581,7 +580,7 @@ static int gdb_handle_vcont(const char *p)
     GDBThreadIdKind kind;
     unsigned int max_cpus = gdb_get_max_cpus();
     /* uninitialised CPUs stay 0 */
-    newstates = g_new0(char, max_cpus);
+    g_autofree char *newstates = g_new0(char, max_cpus);
 
     /* mark valid CPUs with 1 */
     CPU_FOREACH(cpu) {
@@ -597,8 +596,7 @@ static int gdb_handle_vcont(const char *p)
     res = 0;
     while (*p) {
         if (*p++ != ';') {
-            res = -ENOTSUP;
-            goto out;
+            return -ENOTSUP;
         }
 
         cur_action = *p++;
@@ -606,13 +604,12 @@ static int gdb_handle_vcont(const char *p)
             cur_action = qemu_tolower(cur_action);
             res = qemu_strtoul(p, &p, 16, &tmp);
             if (res) {
-                goto out;
+                return res;
             }
             signal = gdb_signal_to_target(tmp);
         } else if (cur_action != 'c' && cur_action != 's') {
             /* unknown/invalid/unsupported command */
-            res = -ENOTSUP;
-            goto out;
+            return -ENOTSUP;
         }
 
         if (*p == '\0' || *p == ';') {
@@ -625,14 +622,12 @@ static int gdb_handle_vcont(const char *p)
         } else if (*p++ == ':') {
             kind = read_thread_id(p, &p, &pid, &tid);
         } else {
-            res = -ENOTSUP;
-            goto out;
+            return -ENOTSUP;
         }
 
         switch (kind) {
         case GDB_READ_THREAD_ERR:
-            res = -EINVAL;
-            goto out;
+            return -EINVAL;
 
         case GDB_ALL_PROCESSES:
             cpu = gdb_first_attached_cpu();
@@ -649,8 +644,7 @@ static int gdb_handle_vcont(const char *p)
             process = gdb_get_process(pid);
 
             if (!process->attached) {
-                res = -EINVAL;
-                goto out;
+                return -EINVAL;
             }
 
             cpu = get_first_cpu_in_process(process);
@@ -668,8 +662,7 @@ static int gdb_handle_vcont(const char *p)
 
             /* invalid CPU/thread specified */
             if (!cpu) {
-                res = -EINVAL;
-                goto out;
+                return -EINVAL;
             }
 
             /* only use if no previous match occourred */
@@ -679,12 +672,9 @@ static int gdb_handle_vcont(const char *p)
             break;
         }
     }
+
     gdbserver_state.signal = signal;
     gdb_continue_partial(newstates);
-
-out:
-    g_free(newstates);
-
     return res;
 }
 
-- 
2.39.2
