Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w70sm19348380wrc.47.2017.02.09.09.09.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Feb 2017 09:09:04 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6EDF43E2D8B;
	Thu,  9 Feb 2017 17:09:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net
Cc: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	bamvor.zhangjian@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 21/24] target-arm: don't generate WFE/YIELD calls for MTTCG
Date: Thu,  9 Feb 2017 17:09:01 +0000
Message-Id: <20170209170904.5713-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170209170904.5713-1-alex.bennee@linaro.org>
References: <20170209170904.5713-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: edP2E77pJhfL

The WFE and YIELD instructions are really only hints and in TCG's case
they were useful to move the scheduling on from one vCPU to the next. In
the parallel context (MTTCG) this just causes an unnecessary cpu_exit
and contention of the BQL.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c     |  7 +++++++
 target/arm/translate-a64.c |  8 ++++++--
 target/arm/translate.c     | 20 ++++++++++++++++----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e1a883c595..abfa7cdd39 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -436,6 +436,13 @@ void HELPER(yield)(CPUARMState *env)
     ARMCPU *cpu = arm_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
 
+    /* When running in MTTCG we don't generate jumps to the yield and
+     * WFE helpers as it won't affect the scheduling of other vCPUs.
+     * If we wanted to more completely model WFE/SEV so we don't busy
+     * spin unnecessarily we would need to do something more involved.
+     */
+    g_assert(!parallel_cpus);
+
     /* This is a non-trappable hint instruction that generally indicates
      * that the guest is currently busy-looping. Yield control back to the
      * top level loop so that a more deserving VCPU has a chance to run.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d0352e2045..7e7131fe2f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1342,10 +1342,14 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         s->is_jmp = DISAS_WFI;
         return;
     case 1: /* YIELD */
-        s->is_jmp = DISAS_YIELD;
+        if (!parallel_cpus) {
+            s->is_jmp = DISAS_YIELD;
+        }
         return;
     case 2: /* WFE */
-        s->is_jmp = DISAS_WFE;
+        if (!parallel_cpus) {
+            s->is_jmp = DISAS_WFE;
+        }
         return;
     case 4: /* SEV */
     case 5: /* SEVL */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 493c627bcf..24faa7c60c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4345,20 +4345,32 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
     gen_rfe(s, pc, load_cpu_field(spsr));
 }
 
+/*
+ * For WFI we will halt the vCPU until an IRQ. For WFE and YIELD we
+ * only call the helper when running single threaded TCG code to ensure
+ * the next round-robin scheduled vCPU gets a crack. In MTTCG mode we
+ * just skip this instruction. Currently the SEV/SEVL instructions
+ * which are *one* of many ways to wake the CPU from WFE are not
+ * implemented so we can't sleep like WFI does.
+ */
 static void gen_nop_hint(DisasContext *s, int val)
 {
     switch (val) {
     case 1: /* yield */
-        gen_set_pc_im(s, s->pc);
-        s->is_jmp = DISAS_YIELD;
+        if (!parallel_cpus) {
+            gen_set_pc_im(s, s->pc);
+            s->is_jmp = DISAS_YIELD;
+        }
         break;
     case 3: /* wfi */
         gen_set_pc_im(s, s->pc);
         s->is_jmp = DISAS_WFI;
         break;
     case 2: /* wfe */
-        gen_set_pc_im(s, s->pc);
-        s->is_jmp = DISAS_WFE;
+        if (!parallel_cpus) {
+            gen_set_pc_im(s, s->pc);
+            s->is_jmp = DISAS_WFE;
+        }
         break;
     case 4: /* sev */
     case 5: /* sevl */
-- 
2.11.0
