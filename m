Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i15sm13505563wmf.21.2017.02.06.07.36.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Feb 2017 07:36:17 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 500413E2A40;
	Mon,  6 Feb 2017 15:31:15 +0000 (GMT)
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
Subject: [PATCH v10 22/23] target-arm: ensure all cross vCPUs TLB flushes complete
Date: Mon,  6 Feb 2017 15:31:12 +0000
Message-Id: <20170206153113.27729-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170206153113.27729-1-alex.bennee@linaro.org>
References: <20170206153113.27729-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IfOoBBH+7F5m

Previously flushes on other vCPUs would only get serviced when they
exited their TranslationBlocks. While this isn't overly problematic it
violates the semantics of TLB flush from the point of view of source
vCPU.

To solve this we call the cputlb *_all_cpus_synced() functions to do
the flushes which ensures all flushes are completed by the time the
vCPU next schedules its own work. As the TLB instructions are modelled
as CP writes the TB ends at this point meaning cpu->exit_request will
be checked before the next instruction is executed.

Deferring the work until the architectural sync point is a possible
future optimisation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
v8
  - fixup merge for bitmap based API
  - fixup new _synced API
v9
  - fixup merge conflicts
v10
  - remove the ARM_CP_EXIT_PC flag from vCPU TLB flushes
  - re-word the commit
---
 target/arm/helper.c | 165 ++++++++++++++++++++++------------------------------
 1 file changed, 69 insertions(+), 96 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 599eca872a..d27ac38401 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -536,41 +536,33 @@ static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush(other_cs);
-    }
+    tlb_flush_all_cpus_synced(cs);
 }
 
 static void tlbiasid_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush(other_cs);
-    }
+    tlb_flush_all_cpus_synced(cs);
 }
 
 static void tlbimva_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
-    }
+    tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
 }
 
 static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
-    }
+    tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
 }
 
 static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -587,14 +579,12 @@ static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_by_mmuidx(other_cs,
-                            (1 << ARMMMUIdx_S12NSE1) |
-                            (1 << ARMMMUIdx_S12NSE0) |
-                            (1 << ARMMMUIdx_S2NS));
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                        (1 << ARMMMUIdx_S12NSE1) |
+                                        (1 << ARMMMUIdx_S12NSE0) |
+                                        (1 << ARMMMUIdx_S2NS));
 }
 
 static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -621,7 +611,7 @@ static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t pageaddr;
 
     if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
@@ -630,9 +620,8 @@ static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     pageaddr = sextract64(value << 12, 0, 40);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S2NS));
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                             (1 << ARMMMUIdx_S2NS));
 }
 
 static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -646,11 +635,9 @@ static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E2));
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E2));
 }
 
 static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -665,12 +652,11 @@ static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E2));
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                             (1 << ARMMMUIdx_S1E2));
 }
 
 static const ARMCPRegInfo cp_reginfo[] = {
@@ -2861,8 +2847,7 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
 static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-    ARMCPU *cpu = arm_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = ENV_GET_CPU(env);
 
     if (arm_is_secure_below_el3(env)) {
         tlb_flush_by_mmuidx(cs,
@@ -2878,19 +2863,17 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
+    CPUState *cs = ENV_GET_CPU(env);
     bool sec = arm_is_secure_below_el3(env);
-    CPUState *other_cs;
 
-    CPU_FOREACH(other_cs) {
-        if (sec) {
-            tlb_flush_by_mmuidx(other_cs,
-                                (1 << ARMMMUIdx_S1SE1) |
-                                (1 << ARMMMUIdx_S1SE0));
-        } else {
-            tlb_flush_by_mmuidx(other_cs,
-                                (1 << ARMMMUIdx_S12NSE1) |
-                                (1 << ARMMMUIdx_S12NSE0));
-        }
+    if (sec) {
+        tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                            (1 << ARMMMUIdx_S1SE1) |
+                                            (1 << ARMMMUIdx_S1SE0));
+    } else {
+        tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                            (1 << ARMMMUIdx_S12NSE1) |
+                                            (1 << ARMMMUIdx_S12NSE0));
     }
 }
 
@@ -2947,46 +2930,40 @@ static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * stage 2 translations, whereas most other scopes only invalidate
      * stage 1 translations.
      */
+    CPUState *cs = ENV_GET_CPU(env);
     bool sec = arm_is_secure_below_el3(env);
     bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
-    CPUState *other_cs;
-
-    CPU_FOREACH(other_cs) {
-        if (sec) {
-            tlb_flush_by_mmuidx(other_cs,
-                                (1 << ARMMMUIdx_S1SE1) |
-                                (1 << ARMMMUIdx_S1SE0));
-        } else if (has_el2) {
-            tlb_flush_by_mmuidx(other_cs,
-                                (1 << ARMMMUIdx_S12NSE1) |
-                                (1 << ARMMMUIdx_S12NSE0) |
-                                (1 << ARMMMUIdx_S2NS));
-        } else {
-            tlb_flush_by_mmuidx(other_cs,
-                                (1 << ARMMMUIdx_S12NSE1) |
-                                (1 << ARMMMUIdx_S12NSE0));
-        }
+
+    if (sec) {
+        tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                            (1 << ARMMMUIdx_S1SE1) |
+                                            (1 << ARMMMUIdx_S1SE0));
+    } else if (has_el2) {
+        tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                            (1 << ARMMMUIdx_S12NSE1) |
+                                            (1 << ARMMMUIdx_S12NSE0) |
+                                            (1 << ARMMMUIdx_S2NS));
+    } else {
+          tlb_flush_by_mmuidx_all_cpus_synced(cs,
+                                              (1 << ARMMMUIdx_S12NSE1) |
+                                              (1 << ARMMMUIdx_S12NSE0));
     }
 }
 
 static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E2));
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E2));
 }
 
 static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E3));
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E3));
 }
 
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3043,43 +3020,40 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = CPU(cpu);
     bool sec = arm_is_secure_below_el3(env);
-    CPUState *other_cs;
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    CPU_FOREACH(other_cs) {
-        if (sec) {
-            tlb_flush_page_by_mmuidx(other_cs, pageaddr,
-                                     (1 << ARMMMUIdx_S1SE1) |
-                                     (1 << ARMMMUIdx_S1SE0));
-        } else {
-            tlb_flush_page_by_mmuidx(other_cs, pageaddr,
-                                     (1 << ARMMMUIdx_S12NSE1) |
-                                     (1 << ARMMMUIdx_S12NSE0));
-        }
+    if (sec) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                 (1 << ARMMMUIdx_S1SE1) |
+                                                 (1 << ARMMMUIdx_S1SE0));
+    } else {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                 (1 << ARMMMUIdx_S12NSE1) |
+                                                 (1 << ARMMMUIdx_S12NSE0));
     }
 }
 
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E2));
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                             (1 << ARMMMUIdx_S1E2));
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E3));
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                             (1 << ARMMMUIdx_S1E3));
 }
 
 static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3107,7 +3081,7 @@ static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
-    CPUState *other_cs;
+    CPUState *cs = ENV_GET_CPU(env);
     uint64_t pageaddr;
 
     if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
@@ -3116,9 +3090,8 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     pageaddr = sextract64(value << 12, 0, 48);
 
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S2NS));
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                             (1 << ARMMMUIdx_S2NS));
 }
 
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.11.0
