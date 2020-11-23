Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3393809lfb;
        Mon, 23 Nov 2020 00:14:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSzVSYCrlCbIIXWr3NIgLT+auXJpl6xLr86HUkKx8rcwcwcK/wvVpKtWwMQYEBdFV7prRQ
X-Received: by 2002:a25:680d:: with SMTP id d13mr40038033ybc.92.1606119295308;
        Mon, 23 Nov 2020 00:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606119295; cv=none;
        d=google.com; s=arc-20160816;
        b=QgKw2Oo7nmqJHL5wf9o4OdtSou7KbYhUPEWkH8WGOR1YuqCvVTm3D9Wo9nQboUs6Bq
         YR0EsfaC9Ht7nfUa50/doPLyjpucT0hsiBAPwNNx5BHyiC00OROYCzx2P/fA8304OEnM
         nLFJBBP+yW2FXtNk8KrBvXvP7G3o3doodp8WkCngQ4u6If5uY/dcR0qW58mjmLOgvIya
         /2SncLRvADYCLRjloXayGUeG+RmfIldttkcHt398RJ52MYQbF7F6sRQDb2gjgx4kjCNU
         uRZqBVG8/6MyV9TI+qhqg++ZWA9pcpKEdhzAQltmS1mpqa5kBanQeVBtrtk7X4Rearaj
         JW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3Bmnnok5x9mTVJmnbI4fp25pnVa9hPR5gd82pSMsetE=;
        b=ZnF70Z0a+qHApE2b+7gP5Af8E9rjLa1pCHfhSKNCIT04/Y2DnGs9+IZp8K0+1zCV1e
         nMkUMYTDdpOSzCVupkafXIbkvDKNGDAaxIvwJ5T9XbZ/M3cscYXiyeHJwUperQi5KUYd
         iLexRSPXfOjOSI/EkbjE88Mo+2wQ4NC3CmZzMsGV92YrWHKKeAsHcrW+Lml2UPWkHfA7
         EwF+fe1Lxwr/TNGKvFim2ocqjMa/wA2SvCbnQOtaQAz3k7FXVf345BHc+QxIBaTXPbuJ
         G6qkyZqqEo9fivpYfIjXKshwYLhbtExVTDX9bo+P+DY0eMwa1bgCXFpHkprJGBdEXYxK
         0Weg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r187si12550365ybr.321.2020.11.23.00.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6zu-00041Z-NV
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o7-0005oK-Tr; Mon, 23 Nov 2020 03:02:43 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54636
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o6-0004fc-8q; Mon, 23 Nov 2020 03:02:43 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 9A157604F4;
 Mon, 23 Nov 2020 09:02:39 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 10/17] target/arm: add ARMv8.4-SEL2 system registers
Date: Mon, 23 Nov 2020 10:02:30 +0200
Message-Id: <20201123080237.18465-10-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: lmqyiEuZ5TPe

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c436dd5161..c8288afb54 100644
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
index 318c7e5441..9683f5aadc 100644
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

