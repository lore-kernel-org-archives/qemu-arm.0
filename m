Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w66sm7455635wme.4.2016.11.09.06.58.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 06:58:10 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 2DA1F3E04AC;
	Wed,  9 Nov 2016 14:57:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v6 18/19] target-arm: don't generate WFE/YIELD calls for MTTCG
Date: Wed,  9 Nov 2016 14:57:47 +0000
Message-Id: <20161109145748.27282-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161109145748.27282-1-alex.bennee@linaro.org>
References: <20161109145748.27282-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EzxUGVb/ObJ9

The WFE and YIELD instructions are really only hints and in TCG's case
they were useful to move the scheduling on from one vCPU to the next. In
the parallel context (MTTCG) this just causes an unnecessary cpu_exit
and contention of the BQL.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/op_helper.c     |  7 +++++++
 target-arm/translate-a64.c |  8 ++++++--
 target-arm/translate.c     | 20 ++++++++++++++++----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 41beabc..3a36bf9 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -435,6 +435,13 @@ void HELPER(yield)(CPUARMState *env)
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
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index de48747..6e44838 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1341,10 +1341,14 @@ static void handle_hint(DisasContext *s, uint32_t insn,
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
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 0ad9070..9417e8e 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4368,20 +4368,32 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
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
2.10.1
