Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ja4-20020a05600c556400b003ebff290a40sm1701125wmb.21.2023.03.10.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3CAE61FFBF;
	Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 10:31:19 +0000
Message-Id: <20230310103123.2118519-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oN6J93AFiVsA

From: Richard Henderson <richard.henderson@linaro.org>

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230301024737.1210851-2-richard.henderson@linaro.org>
[AJB: use plugin_gen_disable_mem_helpers()]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/cpu-exec.c        | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..e5847e9731 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/plugin-gen.h"
 
 bool tcg_allowed;
 
@@ -65,6 +66,8 @@ void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
     cpu->can_do_io = 1;
+    /* Undo any setting in generated code. */
+    plugin_gen_disable_mem_helpers();
     siglongjmp(cpu->jmp_env, 1);
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..e8a48dbd93 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -39,6 +39,7 @@
 #include "exec/replay-core.h"
 #include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
+#include "exec/plugin-gen.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
@@ -459,6 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
+    plugin_gen_disable_mem_helpers();
     /*
      * TODO: Delay swapping back to the read-write region of the TB
      * until we actually need to modify the TB.  The read-only copy,
@@ -526,7 +528,6 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1004,7 +1005,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
-- 
2.39.2
