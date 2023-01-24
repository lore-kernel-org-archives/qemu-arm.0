Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g9-20020adff3c9000000b002bfb29d19e4sm1552773wrp.88.2023.01.24.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:01:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CCB241FFCE;
	Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH v2 26/35] cpu: free cpu->tb_jmp_cache with RCU
Date: Tue, 24 Jan 2023 18:01:18 +0000
Message-Id: <20230124180127.1881110-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 69rb8qfYtx6e

From: Emilio Cota <cota@braap.org>

Fixes the appended use-after-free. The root cause is that
during tb invalidation we use CPU_FOREACH, and therefore
to safely free a vCPU we must wait for an RCU grace period
to elapse.

$ x86_64-linux-user/qemu-x86_64 tests/tcg/x86_64-linux-user/munmap-pthread
=================================================================
==1800604==ERROR: AddressSanitizer: heap-use-after-free on address 0x62d0005f7418 at pc 0x5593da6704eb bp 0x7f4961a7ac70 sp 0x7f4961a7ac60
READ of size 8 at 0x62d0005f7418 thread T2
    #0 0x5593da6704ea in tb_jmp_cache_inval_tb ../accel/tcg/tb-maint.c:244
    #1 0x5593da6704ea in do_tb_phys_invalidate ../accel/tcg/tb-maint.c:290
    #2 0x5593da670631 in tb_phys_invalidate__locked ../accel/tcg/tb-maint.c:306
    #3 0x5593da670631 in tb_invalidate_phys_page_range__locked ../accel/tcg/tb-maint.c:542
    #4 0x5593da67106d in tb_invalidate_phys_range ../accel/tcg/tb-maint.c:614
    #5 0x5593da6a64d4 in target_munmap ../linux-user/mmap.c:766
    #6 0x5593da6dba05 in do_syscall1 ../linux-user/syscall.c:10105
    #7 0x5593da6f564c in do_syscall ../linux-user/syscall.c:13329
    #8 0x5593da49e80c in cpu_loop ../linux-user/x86_64/../i386/cpu_loop.c:233
    #9 0x5593da6be28c in clone_func ../linux-user/syscall.c:6633
    #10 0x7f496231cb42 in start_thread nptl/pthread_create.c:442
    #11 0x7f49623ae9ff  (/lib/x86_64-linux-gnu/libc.so.6+0x1269ff)

0x62d0005f7418 is located 28696 bytes inside of 32768-byte region [0x62d0005f0400,0x62d0005f8400)
freed by thread T148 here:
    #0 0x7f49627b6460 in __interceptor_free ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:52
    #1 0x5593da5ac057 in cpu_exec_unrealizefn ../cpu.c:180
    #2 0x5593da81f851  (/home/cota/src/qemu/build/qemu-x86_64+0x484851)

Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111151628.320011-2-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-jmp-cache.h |  1 +
 accel/tcg/cpu-exec.c     |  3 +--
 cpu.c                    | 11 ++++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index ff5ffc8fc2..b3f6e78835 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -18,6 +18,7 @@
  * a load_acquire/store_release to 'tb'.
  */
 struct CPUJumpCache {
+    struct rcu_head rcu;
     struct {
         TranslationBlock *tb;
 #if TARGET_TB_PCREL
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 04cd1f3092..25ec73ef9a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1064,13 +1064,12 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 /* undo the initializations in reverse order */
 void tcg_exec_unrealizefn(CPUState *cpu)
 {
-    qemu_plugin_vcpu_exit_hook(cpu);
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_free_notifier_list(cpu);
 #endif /* !CONFIG_USER_ONLY */
 
     tlb_destroy(cpu);
-    g_free(cpu->tb_jmp_cache);
+    g_free_rcu(cpu->tb_jmp_cache, rcu);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/cpu.c b/cpu.c
index 4a7d865427..21cf809614 100644
--- a/cpu.c
+++ b/cpu.c
@@ -176,11 +176,20 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
     }
 #endif
+
+    /* Call the plugin hook before clearing cpu->cpu_index in cpu_list_remove */
     if (tcg_enabled()) {
-        tcg_exec_unrealizefn(cpu);
+        qemu_plugin_vcpu_exit_hook(cpu);
     }
 
     cpu_list_remove(cpu);
+    /*
+     * Now that the vCPU has been removed from the RCU list, we can call
+     * tcg_exec_unrealizefn, which may free fields using call_rcu.
+     */
+    if (tcg_enabled()) {
+        tcg_exec_unrealizefn(cpu);
+    }
 }
 
 /*
-- 
2.34.1
