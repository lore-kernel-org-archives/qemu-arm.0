Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3621173lfb;
        Mon, 13 Sep 2021 05:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylb8mbtutMiFSlUhLlC0C3tAgUiERmkJRq3ZUU0T9GXQWP7DhwbIFZaZKKyLsRFd0SnxRZ
X-Received: by 2002:a92:da85:: with SMTP id u5mr8214336iln.213.1631536091713;
        Mon, 13 Sep 2021 05:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631536091; cv=none;
        d=google.com; s=arc-20160816;
        b=jM4pwExmgDVmbJBsPb3yT0byNFkJ4dzFTBVX/jNm/v4QXOQ5jq0kBkZZjYtBrVET6/
         ulllkWTWHHnU+8qnHX2CESMDl3FeK3KoxLYH4mg3GKFxiexuUpNepH4bFrkIpn2Q1VQT
         +7HuuADijqOgNdVLcwUP9HZzjz3PW7HUmis881+cQaOgxxm/ieOzSrVaMYi3sEJYgVwo
         UF6cryZR83x8AMbt1JUnS5yortV/l4uHCjFcqPGGD9uObLMCPNSzHs7goll3rfvnnh0Q
         as6tbuDFzzh8cRWI3g/wVFZQA32C2AKUIBCdRP1ZZ4HSMnKgHp/fIupdQ8e9fDNQwHzr
         4PBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pKyJAMWNJyMiXr1mSBYteH/Q8Y3R4HXQ1ym51Uq5PPk=;
        b=Q3p7xsVHtqUWdNThM0twg9vWMgMkvTNOI+EyiNQx1efDXGHgMAjYAl5NoYpIha2pdL
         Rf9I5wmH75vW/NevRH6lnjbQVbY9y2LYBH54XM7XXnCQ1HDNlTRDYJvqaibgPzJa2Fkn
         gXIZPchDN/XGU6rkZAeswcs6g/PWWULspc3rkcFek4IfzPBlvUTM8fF7dBf4XHu2I7AV
         072tGhucx1U0ncjXNznU0N094GgBE5pv36yA7IjU0wybJNgGq1nG+fX7GfBNXLVubG4J
         Dp48MgcIb2NJ8lBBZD2zKnmiYdHgQ35q7juKzedTzPRM9DRmmnuPDy6nZwfWQZLzAzas
         zABQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si7613124iow.113.2021.09.13.05.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 05:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPl4F-00027j-16
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 08:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPkla-0002S7-Hy; Mon, 13 Sep 2021 08:08:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44104 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklX-0004lc-HK; Mon, 13 Sep 2021 08:08:54 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 8A67F608037D;
 Mon, 13 Sep 2021 14:08:49 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 09/10] hvf: arm: Add rudimentary PMC support
Date: Mon, 13 Sep 2021 14:08:41 +0200
Message-Id: <20210913120842.62116-10-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a7yLA7umoYLP

We can expose cycle counters on the PMU easily. To be as compatible as
possible, let's do so, but make sure we don't expose any other architectural
counters that we can not model yet.

This allows OSs to work that require PMU support.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 179 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index eea725e761..4704b84ad7 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -42,6 +42,18 @@
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
+#define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
+#define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
+#define SYSREG_PMCNTENCLR_EL0 SYSREG(3, 3, 9, 12, 2)
+#define SYSREG_PMINTENCLR_EL1 SYSREG(3, 0, 9, 14, 2)
+#define SYSREG_PMOVSCLR_EL0   SYSREG(3, 3, 9, 12, 3)
+#define SYSREG_PMSWINC_EL0    SYSREG(3, 3, 9, 12, 4)
+#define SYSREG_PMSELR_EL0     SYSREG(3, 3, 9, 12, 5)
+#define SYSREG_PMCEID0_EL0    SYSREG(3, 3, 9, 12, 6)
+#define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
+#define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
+#define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -723,6 +735,40 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
         val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
               gt_cntfrq_period_ns(arm_cpu);
         break;
+    case SYSREG_PMCR_EL0:
+        val = env->cp15.c9_pmcr;
+        break;
+    case SYSREG_PMCCNTR_EL0:
+        pmu_op_start(env);
+        val = env->cp15.c15_ccnt;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMCNTENCLR_EL0:
+        val = env->cp15.c9_pmcnten;
+        break;
+    case SYSREG_PMOVSCLR_EL0:
+        val = env->cp15.c9_pmovsr;
+        break;
+    case SYSREG_PMSELR_EL0:
+        val = env->cp15.c9_pmselr;
+        break;
+    case SYSREG_PMINTENCLR_EL1:
+        val = env->cp15.c9_pminten;
+        break;
+    case SYSREG_PMCCFILTR_EL0:
+        val = env->cp15.pmccfiltr_el0;
+        break;
+    case SYSREG_PMCNTENSET_EL0:
+        val = env->cp15.c9_pmcnten;
+        break;
+    case SYSREG_PMUSERENR_EL0:
+        val = env->cp15.c9_pmuserenr;
+        break;
+    case SYSREG_PMCEID0_EL0:
+    case SYSREG_PMCEID1_EL0:
+        /* We can't really count anything yet, declare all events invalid */
+        val = 0;
+        break;
     case SYSREG_OSLSR_EL1:
         val = env->cp15.oslsr_el1;
         break;
@@ -753,6 +799,82 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     return 0;
 }
 
+static void pmu_update_irq(CPUARMState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    qemu_set_irq(cpu->pmu_interrupt, (env->cp15.c9_pmcr & PMCRE) &&
+            (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
+}
+
+static bool pmu_event_supported(uint16_t number)
+{
+    return false;
+}
+
+/* Returns true if the counter (pass 31 for PMCCNTR) should count events using
+ * the current EL, security state, and register configuration.
+ */
+static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
+{
+    uint64_t filter;
+    bool enabled, filtered = true;
+    int el = arm_current_el(env);
+
+    enabled = (env->cp15.c9_pmcr & PMCRE) &&
+              (env->cp15.c9_pmcnten & (1 << counter));
+
+    if (counter == 31) {
+        filter = env->cp15.pmccfiltr_el0;
+    } else {
+        filter = env->cp15.c14_pmevtyper[counter];
+    }
+
+    if (el == 0) {
+        filtered = filter & PMXEVTYPER_U;
+    } else if (el == 1) {
+        filtered = filter & PMXEVTYPER_P;
+    }
+
+    if (counter != 31) {
+        /*
+         * If not checking PMCCNTR, ensure the counter is setup to an event we
+         * support
+         */
+        uint16_t event = filter & PMXEVTYPER_EVTCOUNT;
+        if (!pmu_event_supported(event)) {
+            return false;
+        }
+    }
+
+    return enabled && !filtered;
+}
+
+static void pmswinc_write(CPUARMState *env, uint64_t value)
+{
+    unsigned int i;
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
+            /*
+             * Detect if this write causes an overflow since we can't predict
+             * PMSWINC overflows like we can for other events
+             */
+            uint32_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
+
+            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & INT32_MIN) {
+                env->cp15.c9_pmovsr |= (1 << i);
+                pmu_update_irq(env);
+            }
+
+            env->cp15.c14_pmevcntr[i] = new_pmswinc;
+        }
+    }
+}
+
 static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -767,6 +889,63 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
                            val);
 
     switch (reg) {
+    case SYSREG_PMCCNTR_EL0:
+        pmu_op_start(env);
+        env->cp15.c15_ccnt = val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMCR_EL0:
+        pmu_op_start(env);
+
+        if (val & PMCRC) {
+            /* The counter has been reset */
+            env->cp15.c15_ccnt = 0;
+        }
+
+        if (val & PMCRP) {
+            unsigned int i;
+            for (i = 0; i < pmu_num_counters(env); i++) {
+                env->cp15.c14_pmevcntr[i] = 0;
+            }
+        }
+
+        env->cp15.c9_pmcr &= ~PMCR_WRITEABLE_MASK;
+        env->cp15.c9_pmcr |= (val & PMCR_WRITEABLE_MASK);
+
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMUSERENR_EL0:
+        env->cp15.c9_pmuserenr = val & 0xf;
+        break;
+    case SYSREG_PMCNTENSET_EL0:
+        env->cp15.c9_pmcnten |= (val & pmu_counter_mask(env));
+        break;
+    case SYSREG_PMCNTENCLR_EL0:
+        env->cp15.c9_pmcnten &= ~(val & pmu_counter_mask(env));
+        break;
+    case SYSREG_PMINTENCLR_EL1:
+        pmu_op_start(env);
+        env->cp15.c9_pminten |= val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMOVSCLR_EL0:
+        pmu_op_start(env);
+        env->cp15.c9_pmovsr &= ~val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMSWINC_EL0:
+        pmu_op_start(env);
+        pmswinc_write(env, val);
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMSELR_EL0:
+        env->cp15.c9_pmselr = val & 0x1f;
+        break;
+    case SYSREG_PMCCFILTR_EL0:
+        pmu_op_start(env);
+        env->cp15.pmccfiltr_el0 = val & PMCCFILTR_EL0;
+        pmu_op_finish(env);
+        break;
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         break;
-- 
2.30.1 (Apple Git-130)

