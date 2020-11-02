Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3821456lfa;
        Mon, 2 Nov 2020 02:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOnxTqvc8cAXcRoF5hi+372bKBsHrsxE6RKWx6QXOl//4Dd1jl5iO+flBZ6ziQ+8uHQqOp
X-Received: by 2002:a25:514:: with SMTP id 20mr19361615ybf.484.1604314745925;
        Mon, 02 Nov 2020 02:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604314745; cv=none;
        d=google.com; s=arc-20160816;
        b=nrLHMYds8sUjtOvS31bMTIBQWVVAbYeSfED1GBU6htclYrKV2UwUnfic04DlWk0xck
         bUCXr6avCn+CNuebpK9g6ObBvIvvzz0Xs6KoouvCsDSaK933cBMwiHRI2A/hbXjk98qF
         a9tFJkyPVCjtQrzPhwx/2Woc8JLW+UyRAZB6q1XTH5rPTAhpGoXFu66eMPAMafy9foQX
         sLJ58Y3Xb5xoqnZXeBQGAivazs54L7eseF5cmdo1dVq72k//fys41ht1sTTpc3SbSEpQ
         XSWut6SH5KZ8Rcqnwl+/nSzWWfTY2G5Rl04Ogqz5q4p5vsv7TP+I8p/nOeFshBlkwHjs
         oRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZeXEwjEcBH0af4V5hR+QvMqHSQxmnav3JXX47hbzFhY=;
        b=gohRqaUEVXM1U7LgnlwU+Z4i6rWh8CGqz/BENoyQL80Q0ZBjK/Y+GrpJyMtHifPJO5
         8vCEMDj/TYId9Fwuf/m1/19G1RUIwK3ga5UepHnnlWpzX0IhyonoNYtnDgTOAnmkOkBx
         rfQ0GixCtobEVHFdZ9FZwfWIU+LPaJMPAJKzeOEpS7UKnMuXhcQIbeIZaoRTgR98JNX6
         2VHMz85cckOevTYJZtND3972ET3ZQ7PXW7bNNwTXxkE6te4rgZCgI0Y/MUbt9iGoagSd
         nuNrjjODWLPwuGQFe8kJ/u1p7greXavDM3xGZKj3899Ox0WGsJF1fX48W2YuYlIh6aeN
         u2vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si14734711ybl.445.2020.11.02.02.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXYG-0008R1-RE
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXQ-0007UX-A7; Mon, 02 Nov 2020 05:58:12 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39564
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXO-0006lm-KZ; Mon, 02 Nov 2020 05:58:11 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7F51560362;
 Mon,  2 Nov 2020 11:58:04 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 09/14] target/arm: add ARMv8.4-SEL2 system registers
Date: Mon,  2 Nov 2020 12:57:57 +0200
Message-Id: <20201102105802.39332-9-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/1OfziEthSi

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3fbb70e273..c047b17a81 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -323,9 +323,11 @@ typedef struct CPUARMState {
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
index eeae3ecff2..4c86e4f57c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5724,6 +5724,27 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
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
@@ -7745,6 +7766,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.29.1

