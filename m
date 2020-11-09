Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3667353lfb;
        Mon, 9 Nov 2020 06:17:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcky2O0StA/xcPasVM9TFpUZRzq5cex7c4dIgQB4urHv4d105oviPZ81B8o+0N4Jf1nys0
X-Received: by 2002:ab0:7846:: with SMTP id y6mr6517718uaq.16.1604931437686;
        Mon, 09 Nov 2020 06:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931437; cv=none;
        d=google.com; s=arc-20160816;
        b=P66/8jRWn+ljNSJZR3b7PlBSQrwbGR6lmcNe+r1afReiVW/T0x/7dQcx385cXBUUC6
         o8X7Wt9Yh10y6hddwpoy2nnQmgHL4oKL3eLv0j+w0QK6MZAItW+xtg7vsZd3wWY0+IwB
         Is3kJ1Y0KVDPdooet9gArzghI9uDm8bafC2FXKiL4jyu/VlA+Y08VXfhqsgBvlEefKgW
         wNnLd6ibobVKz36cMSjA1ZQZpRqNjL7Uvnipz4IAeiaA5AeD0UpylMeG/IjIXcjpxxSG
         6AcZJVq9DQIYV7Gnsm+tIQn4SSIuMV2vAwCfzwYzWMnQb2JQhuFKSmDrwlM5a2DaZ5MH
         Ib8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cC4YoHm9a5sPxq3tqfQC2FuYVgUgE2OmKPL6qEnLqyo=;
        b=ri6oFe/z8efY11c553d0vRbQuxeyyEZEKd3XcVU4t2mAyaByOcw7mlxplk+ve1P6YH
         uPNfucDdxBjZQw4ImGjFeuhPaxkaqMUkHjW8TwrdlWBV7fEN5hpynoFRNjL0iGIuF/Ff
         dmsSsOIrTKH3NuA22gFJhkgFTP83eGFn1enPoEdZjSh95K4K8NznZ6uu72R/kMKEKHtz
         xAyc7Fr5+FMvbkj+TsFX2VNpkKF8VfL3eiXPalIhMkHnNpqCvKgqh3bhG7uDOON87zKK
         KzZpMStUIObOwGTsl3baMmr42GJyqb0iJ++ChQcY3tYOdPGrFOggjNSxSq/NhbsQuLxT
         n+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si102248uae.89.2020.11.09.06.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc7yu-0001NN-V5
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sj-0003Nj-3N; Mon, 09 Nov 2020 09:10:53 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60188
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sf-0002q5-Gb; Mon, 09 Nov 2020 09:10:52 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 5730D6038D;
 Mon,  9 Nov 2020 15:10:23 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 10/17] target/arm: add ARMv8.4-SEL2 system registers
Date: Mon,  9 Nov 2020 16:10:13 +0200
Message-Id: <20201109141020.27234-10-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: Gm3GOVorL6or

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c7f17fc099..7a03869d26 100644
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
index 3df007a5dc..2263715ba4 100644
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

