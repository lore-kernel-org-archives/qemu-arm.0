Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600011ca00b0033b60bad2fcsm14828244wrx.113.2024.03.05.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 496475F9CB;
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
Subject: [PATCH 08/29] gdbstub: Call gdbserver_fork() both in parent and in child
Date: Tue,  5 Mar 2024 12:09:44 +0000
Message-Id: <20240305121005.3528075-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BXrx3JITTGRa

From: Ilya Leoshkevich <iii@linux.ibm.com>

The upcoming follow-fork-mode child support requires post-fork message
exchange between the parent and the child. Prepare gdbserver_fork() for
this purpose. Rename it to gdbserver_fork_end() to better reflect its
purpose.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240219141628.246823-8-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/user.h | 5 +++--
 bsd-user/main.c        | 3 ++-
 gdbstub/user.c         | 5 ++---
 linux-user/main.c      | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
index 3f9f45946e0..4c4e5c4c582 100644
--- a/include/gdbstub/user.h
+++ b/include/gdbstub/user.h
@@ -51,10 +51,11 @@ void gdb_signalled(CPUArchState *as, int sig);
 void gdbserver_fork_start(void);
 
 /**
- * gdbserver_fork() - disable gdb stub for child processes.
+ * gdbserver_fork_end() - inform gdb of the completed fork()
  * @cs: CPU
+ * @pid: 0 if in child process, -1 if fork failed, child process pid otherwise
  */
-void gdbserver_fork(CPUState *cs, pid_t pid);
+void gdbserver_fork_end(CPUState *cs, pid_t pid);
 
 /**
  * gdb_syscall_entry() - inform gdb of syscall entry and yield control to it
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0dbd1cf8801..3dc285e5b74 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -138,10 +138,11 @@ void fork_end(pid_t pid)
          */
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork(thread_cpu, pid);
+        gdbserver_fork_end(thread_cpu, pid);
     } else {
         mmap_fork_end(child);
         cpu_list_unlock();
+        gdbserver_fork_end(thread_cpu, pid);
         end_exclusive();
     }
 }
diff --git a/gdbstub/user.c b/gdbstub/user.c
index c61e1a0d1f6..866a25f9c06 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -374,10 +374,9 @@ static void disable_gdbstub(CPUState *thread_cpu)
     tb_flush(thread_cpu);
 }
 
-/* Disable gdb stub for child processes.  */
-void gdbserver_fork(CPUState *cpu, pid_t pid)
+void gdbserver_fork_end(CPUState *cpu, pid_t pid)
 {
-    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
+    if (pid != 0 || !gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
     }
     disable_gdbstub(cpu);
diff --git a/linux-user/main.c b/linux-user/main.c
index 70314e0ab6a..41caa77cb52 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -165,10 +165,10 @@ void fork_end(pid_t pid)
         }
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork(thread_cpu, pid);
     } else {
         cpu_list_unlock();
     }
+    gdbserver_fork_end(thread_cpu, pid);
     /*
      * qemu_init_cpu_list() reinitialized the child exclusive state, but we
      * also need to keep current_cpu consistent, so call end_exclusive() for
-- 
2.39.2
