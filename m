Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7885e032fsm155043666b.115.2025.02.07.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:31:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9520C60BD2;
	Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Kyle Evans <kevans@freebsd.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-rust@nongnu.org,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 13/17] user: Introduce host_interrupt_signal
Date: Fri,  7 Feb 2025 15:31:08 +0000
Message-Id: <20250207153112.3939799-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3gzSRGNde0ce

From: Ilya Leoshkevich <iii@linux.ibm.com>

Attaching to the gdbstub of a running process requires stopping its
threads. For threads that run on a CPU, cpu_exit() is enough, but the
only way to grab attention of a thread that is stuck in a long-running
syscall is to interrupt it with a signal.

Reserve a host realtime signal for this, just like it's already done
for TARGET_SIGABRT on Linux. This may reduce the number of available
guest realtime signals by one, but this is acceptable, since there are
quite a lot of them, and it's unlikely that there are apps that need
them all.

Set signal_pending for the safe_sycall machinery to prevent invoking
the syscall. This is a lie, since we don't queue a guest signal, but
process_pending_signals() can handle the absence of pending signals.
The syscall returns with QEMU_ERESTARTSYS errno, which arranges for
the automatic restart. This is important, because it helps avoiding
disturbing poorly written guests.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-5-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/user/signal.h |  2 ++
 bsd-user/signal.c     | 12 ++++++++++++
 linux-user/signal.c   | 25 ++++++++++++++++++++-----
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/user/signal.h b/include/user/signal.h
index 19b6b9e5dd..7fa33b05d9 100644
--- a/include/user/signal.h
+++ b/include/user/signal.h
@@ -20,4 +20,6 @@
  */
 int target_to_host_signal(int sig);
 
+extern int host_interrupt_signal;
+
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8c51f6ce65..ff2ccbbf60 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -51,6 +51,8 @@ static inline int sas_ss_flags(TaskState *ts, unsigned long sp)
         on_sig_stack(ts, sp) ? SS_ONSTACK : 0;
 }
 
+int host_interrupt_signal = SIGRTMAX;
+
 /*
  * The BSD ABIs use the same signal numbers across all the CPU architectures, so
  * (unlike Linux) these functions are just the identity mapping. This might not
@@ -491,6 +493,12 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     uintptr_t pc = 0;
     bool sync_sig = false;
 
+    if (host_sig == host_interrupt_signal) {
+        ts->signal_pending = 1;
+        cpu_exit(thread_cpu);
+        return;
+    }
+
     /*
      * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
      * handling wrt signal blocking and unwinding.
@@ -854,6 +862,9 @@ void signal_init(void)
 
     for (i = 1; i <= TARGET_NSIG; i++) {
         host_sig = target_to_host_signal(i);
+        if (host_sig == host_interrupt_signal) {
+            continue;
+        }
         sigaction(host_sig, NULL, &oact);
         if (oact.sa_sigaction == (void *)SIG_IGN) {
             sigact_table[i - 1]._sa_handler = TARGET_SIG_IGN;
@@ -872,6 +883,7 @@ void signal_init(void)
             sigaction(host_sig, &act, NULL);
         }
     }
+    sigaction(host_interrupt_signal, &act, NULL);
 }
 
 static void handle_pending_signal(CPUArchState *env, int sig,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index bffbef235c..81a98c6d02 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -517,6 +517,8 @@ static int core_dump_signal(int sig)
     }
 }
 
+int host_interrupt_signal;
+
 static void signal_table_init(const char *rtsig_map)
 {
     int hsig, tsig, count;
@@ -580,10 +582,10 @@ static void signal_table_init(const char *rtsig_map)
          * Attempts for configure "missing" signals via sigaction will be
          * silently ignored.
          *
-         * Reserve one signal for internal usage (see below).
+         * Reserve two signals for internal usage (see below).
          */
 
-        hsig = SIGRTMIN + 1;
+        hsig = SIGRTMIN + 2;
         for (tsig = TARGET_SIGRTMIN;
              hsig <= SIGRTMAX && tsig <= TARGET_NSIG;
              hsig++, tsig++) {
@@ -604,12 +606,17 @@ static void signal_table_init(const char *rtsig_map)
     host_to_target_signal_table[SIGABRT] = 0;
     for (hsig = SIGRTMIN; hsig <= SIGRTMAX; hsig++) {
         if (!host_to_target_signal_table[hsig]) {
-            host_to_target_signal_table[hsig] = TARGET_SIGABRT;
-            break;
+            if (host_interrupt_signal) {
+                host_to_target_signal_table[hsig] = TARGET_SIGABRT;
+                break;
+            } else {
+                host_interrupt_signal = hsig;
+            }
         }
     }
     if (hsig > SIGRTMAX) {
-        fprintf(stderr, "No rt signals left for SIGABRT mapping\n");
+        fprintf(stderr,
+                "No rt signals left for interrupt and SIGABRT mapping\n");
         exit(EXIT_FAILURE);
     }
 
@@ -689,6 +696,8 @@ void signal_init(const char *rtsig_map)
         }
         sigact_table[tsig - 1]._sa_handler = thand;
     }
+
+    sigaction(host_interrupt_signal, &act, NULL);
 }
 
 /* Force a synchronously taken signal. The kernel force_sig() function
@@ -1036,6 +1045,12 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     bool sync_sig = false;
     void *sigmask;
 
+    if (host_sig == host_interrupt_signal) {
+        ts->signal_pending = 1;
+        cpu_exit(thread_cpu);
+        return;
+    }
+
     /*
      * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
      * handling wrt signal blocking and unwinding.  Non-spoofed SIGILL,
-- 
2.39.5
