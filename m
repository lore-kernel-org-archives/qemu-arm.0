Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c13-20020a7bc00d000000b003f735ba7736sm19916239wmb.46.2023.06.30.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EE3751FFDC;
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
	Alexander Bulekov <alxndr@bu.edu>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 35/38] gdbstub: Report the actual qemu-user pid
Date: Fri, 30 Jun 2023 19:04:20 +0100
Message-Id: <20230630180423.558337-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t698CWXKcC3s

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently qemu-user reports pid 1 to GDB. Resolve the TODO and report
the actual PID. Using getpid() relies on the assumption that there is
only one GDBProcess. Add an assertion to make sure that future changes
don't break it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230621203627.1808446-6-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ce3e4a2671..697dd4bbad 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -202,13 +202,16 @@ void gdb_memtox(GString *buf, const char *mem, int len)
 
 static uint32_t gdb_get_cpu_pid(CPUState *cpu)
 {
-    /* TODO: In user mode, we should use the task state PID */
+#ifdef CONFIG_USER_ONLY
+    return getpid();
+#else
     if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
         /* Return the default process' PID */
         int index = gdbserver_state.process_num - 1;
         return gdbserver_state.processes[index].pid;
     }
     return cpu->cluster_index + 1;
+#endif
 }
 
 GDBProcess *gdb_get_process(uint32_t pid)
@@ -2137,19 +2140,25 @@ void gdb_read_byte(uint8_t ch)
 void gdb_create_default_process(GDBState *s)
 {
     GDBProcess *process;
-    int max_pid = 0;
+    int pid;
 
+#ifdef CONFIG_USER_ONLY
+    assert(gdbserver_state.process_num == 0);
+    pid = getpid();
+#else
     if (gdbserver_state.process_num) {
-        max_pid = s->processes[s->process_num - 1].pid;
+        pid = s->processes[s->process_num - 1].pid;
+    } else {
+        pid = 0;
     }
+    /* We need an available PID slot for this process */
+    assert(pid < UINT32_MAX);
+    pid++;
+#endif
 
     s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
     process = &s->processes[s->process_num - 1];
-
-    /* We need an available PID slot for this process */
-    assert(max_pid < UINT32_MAX);
-
-    process->pid = max_pid + 1;
+    process->pid = pid;
     process->attached = false;
     process->target_xml[0] = '\0';
 }
-- 
2.39.2
