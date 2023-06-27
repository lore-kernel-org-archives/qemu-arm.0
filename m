Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm14308607wmq.4.2023.06.27.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:15:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3AAB01FFC6;
	Tue, 27 Jun 2023 17:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 28/36] gdbstub: clean-up vcont handling to avoid goto
Date: Tue, 27 Jun 2023 17:09:35 +0100
Message-Id: <20230627160943.2956928-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VOSwcVssNv2z

We can handle all the error exit cases by using g_autofree() for the
one thing that needs cleaning up on the exit.

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
