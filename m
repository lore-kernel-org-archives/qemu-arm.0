Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2168035lfq;
        Fri, 18 Dec 2020 02:48:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPho4PNylTD/PAvZrChwyCaYW7pYzi/8uKzSKEkeazb2JEEotzKDG5lnuFfhzfW4jbzGfT
X-Received: by 2002:a25:3ac3:: with SMTP id h186mr4735350yba.155.1608288504952;
        Fri, 18 Dec 2020 02:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288504; cv=none;
        d=google.com; s=arc-20160816;
        b=AG4WOtwKuKm3aPCQB/D0ddmBfhl4sXZ7TJLnF27KFJJHTPyZ5wNSXDvyMBwbv4oRx/
         2KzSsFl5vj+5s5JERy6PnIsa5RDcCML6fMDDn0LIYLnKPMuhwz9Xs7Yi63UhrVOD/N9b
         5RYWWmPttugiL/uGgHSMjwH4dijXCYR3akhiKJVBt5AHjqLTnjSmcWxeU+Id4LKzKI9+
         bBTxn+lRLaB4x08ZM8J9uMQ3QJQgkFNjMOVxGB/eArTdtAwk5Hu/SkeujqpFl6Hda6AF
         LADs5sjqNleV6yePQPalZbW7THLWAnKAnHVzP0PxH8y5LqSMxFDjht7VnVDPTOHOICj2
         FySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=a9rsFUbT65vjgHaMM5GQSmCQNAgMwrPXAHTacEwL7b4=;
        b=tQ3Isttldul7hJY0aB9TWEPArRYdFtzlYCsqfpRW5ZqEUcUq3Y7wHLFl2G4GaIU1MM
         Eve/P3lGu7fYSe+ckUovWQ4HSQwT45ie0g7s4XLQ1jVs1NZk23P7c4tklRs1sTFE1Sux
         6XLpOm6JLhiLiK01fKH0B2ZdDQAfbV644CMfpfxw2PMdQzjAG5DpVaLCBR1VhjIM2MET
         /4n5mFpMWIct8buji8qdURVQatjAJwq6pC4UPzD8+ZQqDidHiGknKdhs5Ud1VGV85UAr
         TCnyFD/hXM1TSiMmGK3SH6HabMaVdoM5UfknaGHqwY4Nq+SBesNbR13Z2VP0ir9lB3pQ
         z+Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y197si8262039ybe.338.2020.12.18.02.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:48:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDJA-0001rD-B4
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9E-0006C3-1y; Fri, 18 Dec 2020 05:38:08 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55292
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9C-0003Km-1h; Fri, 18 Dec 2020 05:38:07 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 13CCA603C4;
 Fri, 18 Dec 2020 11:38:02 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 09/18] target/arm: add ARMv8.4-SEL2 system registers
Date: Fri, 18 Dec 2020 12:37:50 +0200
Message-Id: <20201218103759.19929-9-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qONMk3MCv9ZN

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  7 +++++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ec96784bba..f6b59cb56b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -168,6 +168,11 @@ typedef struct {
     uint32_t base_mask;
 } TCR;
 
+#define VTCR_NSW (1u << 29)
+#define VTCR_NSA (1u << 30)
+#define VSTCR_SW VTCR_NSW
+#define VSTCR_SA VTCR_NSA
+
 /* Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
@@ -323,9 +328,11 @@ typedef struct CPUARMState {
             uint64_t ttbr1_el[4];
         };
         uint64_t vttbr_el2; /* Virtualization Translation Table Base.  */
+        uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
         TCR tcr_el[4];
         TCR vtcr_el2; /* Virtualization Translation Control.  */
+        TCR vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
         uint32_t c2_insn; /* MPU instruction cacheable bits.  */
         union { /* MMU domain access control register
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e92408229b..32469abf92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5721,6 +5721,27 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 3 || arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_OK;
+    }
+    return CP_ACCESS_TRAP_UNCATEGORIZED;
+}
+
+static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
+    { .name = "VSTTBR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 0,
+      .access = PL2_RW, .accessfn = sel2_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.vsttbr_el2) },
+    { .name = "VSTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 2,
+      .access = PL2_RW, .accessfn = sel2_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
+    REGINFO_SENTINEL
+};
+
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -7733,6 +7754,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, el2_v8_cp_reginfo);
         }
+        if (cpu_isar_feature(aa64_sel2, cpu)) {
+            define_arm_cp_regs(cpu, el2_sec_cp_reginfo);
+        }
         /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
             ARMCPRegInfo rvbar = {
-- 
2.29.2

