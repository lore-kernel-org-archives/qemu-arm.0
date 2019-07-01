Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653315wru;
        Mon, 1 Jul 2019 06:26:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlWC88xTzVwfWiPunrwZ4wDdDqCVQQvqZ3DolQrluRk8bsMtDF4Cs+KQ1+uSKwATdMcWiV
X-Received: by 2002:a0c:d295:: with SMTP id q21mr21405650qvh.245.1561987570986;
        Mon, 01 Jul 2019 06:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987570; cv=none;
        d=google.com; s=arc-20160816;
        b=LUu8+bM00mYh6dt9mwMMojjy7k5/RA0pKbvVR5Dlkoa8JOOd7F/59RmKSuM/JaEubG
         hf3tgzzl3nEaEqQKemOaLUdZOxMOQGam+QaDP5PSO4EJFQnyeXUVQgideSydvaK0CzpC
         8aiKqwOznKkshr2Wor5lWJ7/PSH1ZvxPPN8UtXrcEN6k4pCMiqmQqg+nFLmQiZLlEsq1
         goqmvvMjE/sGeVVIQhMaDM1EA1PWC9lcizehFKF6c4mTEaJyc/uj8l8pxSzYnHghYXiY
         N2pFpLO4ipmXKTbs98HiQZxwPQg+ulJECzYfLSAffVKR8hRo8x/i/fiG7dA1vwP6G/I2
         RXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=9/ezokJE+KnIimw71vXB/yFXCAPH/qnMfb63iWHRoj4=;
        b=Da2wRKxKfP+MS4ijIT1Bhk/PuzCZD6zGuGif6pD2TmCX1isGaTDfKCj4iIzH7xDMdv
         S6dEyc186bRr0uXqImmm9Rtipw5KeqNNulYE8o5sTyVrvsyIox153zgS+hqNjftOdgnz
         EWpC+dRE/kcZZ9XHkg7x3GF7Sb+oFYFJUYSAs2UsIVq/4rplCd6xYfv97UIC4efg3nWB
         /QtmI4/8JasBEN+wSrW3/ZE9N5oDNfb7HosGewrfEYRBi0+ohAAVmWItnQh4k1QBMPhK
         mKVaJUCZFR+idTkzFaIdEGI9Xb10dwpY0WYOM+l0BqO7XkRMxCHr+dZmNxrMO48HX91D
         eDyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n21si5123704qvc.217.2019.07.01.06.26.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47E0F3082B71;
	Mon,  1 Jul 2019 13:26:08 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FB4F6085B;
	Mon,  1 Jul 2019 13:26:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 10/27] target/arm: Move CPU state dumping routines to cpu.c
Date: Mon,  1 Jul 2019 15:24:59 +0200
Message-Id: <20190701132516.26392-11-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 13:26:08 +0000 (UTC)
X-TUID: dDUFVuJsSJuC

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.c           | 226 +++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h           |   2 -
 target/arm/translate-a64.c | 128 ---------------------
 target/arm/translate.c     |  88 ---------------
 target/arm/translate.h     |   5 -
 5 files changed, 226 insertions(+), 223 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 376db154f0..1f73631bac 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/qemu-print.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
@@ -676,6 +677,231 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
+#ifdef TARGET_AARCH64
+
+static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint32_t psr = pstate_read(env);
+    int i;
+    int el = arm_current_el(env);
+    const char *ns_status;
+
+    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
+    for (i = 0; i < 32; i++) {
+        if (i == 31) {
+            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
+        } else {
+            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
+                         (i + 2) % 3 ? " " : "\n");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
+        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+    } else {
+        ns_status = "";
+    }
+    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+                 psr,
+                 psr & PSTATE_N ? 'N' : '-',
+                 psr & PSTATE_Z ? 'Z' : '-',
+                 psr & PSTATE_C ? 'C' : '-',
+                 psr & PSTATE_V ? 'V' : '-',
+                 ns_status,
+                 el,
+                 psr & PSTATE_SP ? 'h' : 't');
+
+    if (cpu_isar_feature(aa64_bti, cpu)) {
+        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+    }
+    if (!(flags & CPU_DUMP_FPU)) {
+        qemu_fprintf(f, "\n");
+        return;
+    }
+    if (fp_exception_el(env, el) != 0) {
+        qemu_fprintf(f, "    FPU disabled\n");
+        return;
+    }
+    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
+                 vfp_get_fpcr(env), vfp_get_fpsr(env));
+
+    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+        int j, zcr_len = sve_zcr_len_for_el(env, el);
+
+        for (i = 0; i <= FFR_PRED_NUM; i++) {
+            bool eol;
+            if (i == FFR_PRED_NUM) {
+                qemu_fprintf(f, "FFR=");
+                /* It's last, so end the line.  */
+                eol = true;
+            } else {
+                qemu_fprintf(f, "P%02d=", i);
+                switch (zcr_len) {
+                case 0:
+                    eol = i % 8 == 7;
+                    break;
+                case 1:
+                    eol = i % 6 == 5;
+                    break;
+                case 2:
+                case 3:
+                    eol = i % 3 == 2;
+                    break;
+                default:
+                    /* More than one quadword per predicate.  */
+                    eol = true;
+                    break;
+                }
+            }
+            for (j = zcr_len / 4; j >= 0; j--) {
+                int digits;
+                if (j * 4 + 4 <= zcr_len + 1) {
+                    digits = 16;
+                } else {
+                    digits = (zcr_len % 4 + 1) * 4;
+                }
+                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
+                             env->vfp.pregs[i].p[j],
+                             j ? ":" : eol ? "\n" : " ");
+            }
+        }
+
+        for (i = 0; i < 32; i++) {
+            if (zcr_len == 0) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                             i, env->vfp.zregs[i].d[1],
+                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
+            } else if (zcr_len == 1) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
+                             ":%016" PRIx64 ":%016" PRIx64 "\n",
+                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
+                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
+            } else {
+                for (j = zcr_len; j >= 0; j--) {
+                    bool odd = (zcr_len - j) % 2 != 0;
+                    if (j == zcr_len) {
+                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
+                    } else if (!odd) {
+                        if (j > 0) {
+                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
+                        } else {
+                            qemu_fprintf(f, "     [%x]=", j);
+                        }
+                    }
+                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
+                                 env->vfp.zregs[i].d[j * 2 + 1],
+                                 env->vfp.zregs[i].d[j * 2],
+                                 odd || j == 0 ? "\n" : ":");
+                }
+            }
+        }
+    } else {
+        for (i = 0; i < 32; i++) {
+            uint64_t *q = aa64_vfp_qreg(env, i);
+            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                         i, q[1], q[0], (i & 1 ? "\n" : " "));
+        }
+    }
+}
+
+#else
+
+static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    g_assert_not_reached();
+}
+
+#endif
+
+static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int i;
+
+    if (is_a64(env)) {
+        aarch64_cpu_dump_state(cs, f, flags);
+        return;
+    }
+
+    for (i = 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
+        if ((i % 4) == 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        uint32_t xpsr = xpsr_read(env);
+        const char *mode;
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            ns_status = env->v7m.secure ? "S " : "NS ";
+        }
+
+        if (xpsr & XPSR_EXCP) {
+            mode = "handler";
+        } else {
+            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
+                mode = "unpriv-thread";
+            } else {
+                mode = "priv-thread";
+            }
+        }
+
+        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
+                     xpsr,
+                     xpsr & XPSR_N ? 'N' : '-',
+                     xpsr & XPSR_Z ? 'Z' : '-',
+                     xpsr & XPSR_C ? 'C' : '-',
+                     xpsr & XPSR_V ? 'V' : '-',
+                     xpsr & XPSR_T ? 'T' : 'A',
+                     ns_status,
+                     mode);
+    } else {
+        uint32_t psr = cpsr_read(env);
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_EL3) &&
+            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
+            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+        }
+
+        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
+                     psr,
+                     psr & CPSR_N ? 'N' : '-',
+                     psr & CPSR_Z ? 'Z' : '-',
+                     psr & CPSR_C ? 'C' : '-',
+                     psr & CPSR_V ? 'V' : '-',
+                     psr & CPSR_T ? 'T' : 'A',
+                     ns_status,
+                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        int numvfpregs = 0;
+        if (arm_feature(env, ARM_FEATURE_VFP)) {
+            numvfpregs += 16;
+        }
+        if (arm_feature(env, ARM_FEATURE_VFP3)) {
+            numvfpregs += 16;
+        }
+        for (i = 0; i < numvfpregs; i++) {
+            uint64_t v = *aa32_vfp_dreg(env, i);
+            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
+                         i * 2, (uint32_t)v,
+                         i * 2 + 1, (uint32_t)(v >> 32),
+                         i, v);
+        }
+        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+    }
+}
+
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
 {
     uint32_t Aff1 = idx / clustersz;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f9da672be5..a9be18660f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -929,8 +929,6 @@ void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
-void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags);
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 97f4164fbb..d3231477a2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -27,7 +27,6 @@
 #include "translate.h"
 #include "internals.h"
 #include "qemu/host-utils.h"
-#include "qemu/qemu-print.h"
 
 #include "hw/semihosting/semihost.h"
 #include "exec/gen-icount.h"
@@ -152,133 +151,6 @@ static void set_btype(DisasContext *s, int val)
     s->btype = -1;
 }
 
-void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t psr = pstate_read(env);
-    int i;
-    int el = arm_current_el(env);
-    const char *ns_status;
-
-    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
-    for (i = 0; i < 32; i++) {
-        if (i == 31) {
-            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
-        } else {
-            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
-                         (i + 2) % 3 ? " " : "\n");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
-        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-    } else {
-        ns_status = "";
-    }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
-                 psr,
-                 psr & PSTATE_N ? 'N' : '-',
-                 psr & PSTATE_Z ? 'Z' : '-',
-                 psr & PSTATE_C ? 'C' : '-',
-                 psr & PSTATE_V ? 'V' : '-',
-                 ns_status,
-                 el,
-                 psr & PSTATE_SP ? 'h' : 't');
-
-    if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
-    }
-    if (!(flags & CPU_DUMP_FPU)) {
-        qemu_fprintf(f, "\n");
-        return;
-    }
-    if (fp_exception_el(env, el) != 0) {
-        qemu_fprintf(f, "    FPU disabled\n");
-        return;
-    }
-    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
-                 vfp_get_fpcr(env), vfp_get_fpsr(env));
-
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
-
-        for (i = 0; i <= FFR_PRED_NUM; i++) {
-            bool eol;
-            if (i == FFR_PRED_NUM) {
-                qemu_fprintf(f, "FFR=");
-                /* It's last, so end the line.  */
-                eol = true;
-            } else {
-                qemu_fprintf(f, "P%02d=", i);
-                switch (zcr_len) {
-                case 0:
-                    eol = i % 8 == 7;
-                    break;
-                case 1:
-                    eol = i % 6 == 5;
-                    break;
-                case 2:
-                case 3:
-                    eol = i % 3 == 2;
-                    break;
-                default:
-                    /* More than one quadword per predicate.  */
-                    eol = true;
-                    break;
-                }
-            }
-            for (j = zcr_len / 4; j >= 0; j--) {
-                int digits;
-                if (j * 4 + 4 <= zcr_len + 1) {
-                    digits = 16;
-                } else {
-                    digits = (zcr_len % 4 + 1) * 4;
-                }
-                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
-                             env->vfp.pregs[i].p[j],
-                             j ? ":" : eol ? "\n" : " ");
-            }
-        }
-
-        for (i = 0; i < 32; i++) {
-            if (zcr_len == 0) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                             i, env->vfp.zregs[i].d[1],
-                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
-            } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
-            } else {
-                for (j = zcr_len; j >= 0; j--) {
-                    bool odd = (zcr_len - j) % 2 != 0;
-                    if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
-                    } else if (!odd) {
-                        if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
-                        } else {
-                            qemu_fprintf(f, "     [%x]=", j);
-                        }
-                    }
-                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
-                                 env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
-                }
-            }
-        }
-    } else {
-        for (i = 0; i < 32; i++) {
-            uint64_t *q = aa64_vfp_qreg(env, i);
-            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                         i, q[1], q[0], (i & 1 ? "\n" : " "));
-        }
-    }
-}
-
 void gen_a64_set_pc_im(uint64_t val)
 {
     tcg_gen_movi_i64(cpu_pc, val);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c6bdf026b4..a5d7723423 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -28,7 +28,6 @@
 #include "tcg-op-gvec.h"
 #include "qemu/log.h"
 #include "qemu/bitops.h"
-#include "qemu/qemu-print.h"
 #include "arm_ldst.h"
 #include "hw/semihosting/semihost.h"
 
@@ -12342,93 +12341,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     translator_loop(ops, &dc.base, cpu, tb, max_insns);
 }
 
-void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    int i;
-
-    if (is_a64(env)) {
-        aarch64_cpu_dump_state(cs, f, flags);
-        return;
-    }
-
-    for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
-        if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        uint32_t xpsr = xpsr_read(env);
-        const char *mode;
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            ns_status = env->v7m.secure ? "S " : "NS ";
-        }
-
-        if (xpsr & XPSR_EXCP) {
-            mode = "handler";
-        } else {
-            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
-                mode = "unpriv-thread";
-            } else {
-                mode = "priv-thread";
-            }
-        }
-
-        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
-                     xpsr,
-                     xpsr & XPSR_N ? 'N' : '-',
-                     xpsr & XPSR_Z ? 'Z' : '-',
-                     xpsr & XPSR_C ? 'C' : '-',
-                     xpsr & XPSR_V ? 'V' : '-',
-                     xpsr & XPSR_T ? 'T' : 'A',
-                     ns_status,
-                     mode);
-    } else {
-        uint32_t psr = cpsr_read(env);
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_EL3) &&
-            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
-            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-        }
-
-        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
-                     psr,
-                     psr & CPSR_N ? 'N' : '-',
-                     psr & CPSR_Z ? 'Z' : '-',
-                     psr & CPSR_C ? 'C' : '-',
-                     psr & CPSR_V ? 'V' : '-',
-                     psr & CPSR_T ? 'T' : 'A',
-                     ns_status,
-                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        int numvfpregs = 0;
-        if (arm_feature(env, ARM_FEATURE_VFP)) {
-            numvfpregs += 16;
-        }
-        if (arm_feature(env, ARM_FEATURE_VFP3)) {
-            numvfpregs += 16;
-        }
-        for (i = 0; i < numvfpregs; i++) {
-            uint64_t v = *aa32_vfp_dreg(env, i);
-            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
-                         i * 2, (uint32_t)v,
-                         i * 2 + 1, (uint32_t)(v >> 32),
-                         i, v);
-        }
-        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
-    }
-}
-
 void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index bc1617809d..a20f6e2056 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -169,7 +169,6 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
 void gen_a64_set_pc_im(uint64_t val);
-void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 extern const TranslatorOps aarch64_translator_ops;
 #else
 static inline void a64_translate_init(void)
@@ -179,10 +178,6 @@ static inline void a64_translate_init(void)
 static inline void gen_a64_set_pc_im(uint64_t val)
 {
 }
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-}
 #endif
 
 void arm_test_cc(DisasCompare *cmp, int cc);
-- 
2.20.1
