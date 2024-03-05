Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600011ca00b0033b60bad2fcsm14828243wrx.113.2024.03.05.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 314165F95B;
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
Subject: [PATCH 07/29] {linux,bsd}-user: Pass pid to gdbserver_fork()
Date: Tue,  5 Mar 2024 12:09:43 +0000
Message-Id: <20240305121005.3528075-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B7yRdJM8DTUW

From: Ilya Leoshkevich <iii@linux.ibm.com>

The upcoming follow-fork-mode child support requires knowing the child
pid. Pass it down.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240219141628.246823-7-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/user.h | 2 +-
 bsd-user/main.c        | 2 +-
 gdbstub/user.c         | 2 +-
 linux-user/main.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
index e33f8d9a9a6..3f9f45946e0 100644
--- a/include/gdbstub/user.h
+++ b/include/gdbstub/user.h
@@ -54,7 +54,7 @@ void gdbserver_fork_start(void);
  * gdbserver_fork() - disable gdb stub for child processes.
  * @cs: CPU
  */
-void gdbserver_fork(CPUState *cs);
+void gdbserver_fork(CPUState *cs, pid_t pid);
 
 /**
  * gdb_syscall_entry() - inform gdb of syscall entry and yield control to it
diff --git a/bsd-user/main.c b/bsd-user/main.c
index fca9b302043..0dbd1cf8801 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -138,7 +138,7 @@ void fork_end(pid_t pid)
          */
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork(thread_cpu);
+        gdbserver_fork(thread_cpu, pid);
     } else {
         mmap_fork_end(child);
         cpu_list_unlock();
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 536fb43b03e..c61e1a0d1f6 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -375,7 +375,7 @@ static void disable_gdbstub(CPUState *thread_cpu)
 }
 
 /* Disable gdb stub for child processes.  */
-void gdbserver_fork(CPUState *cpu)
+void gdbserver_fork(CPUState *cpu, pid_t pid)
 {
     if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return;
diff --git a/linux-user/main.c b/linux-user/main.c
index cab95f5b0aa..70314e0ab6a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -165,7 +165,7 @@ void fork_end(pid_t pid)
         }
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork(thread_cpu);
+        gdbserver_fork(thread_cpu, pid);
     } else {
         cpu_list_unlock();
     }
-- 
2.39.2
