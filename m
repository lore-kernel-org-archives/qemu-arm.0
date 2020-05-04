Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp494516lfb;
        Mon, 4 May 2020 07:21:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypLs44nMrUg605ak8rkVXM0bVifOF0qprxafeay1qjz+C3XEJxdwoWPFm6zECSxq7GWenJgO
X-Received: by 2002:ae9:ea0a:: with SMTP id f10mr10902387qkg.272.1588602103881;
        Mon, 04 May 2020 07:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588602103; cv=none;
        d=google.com; s=arc-20160816;
        b=nbY+KlorHQ2cR9HY2wUsmM29ttP2vSSGgOE75YxWZZT2iGIngabgfGYmyO5z1azpMz
         Kx2S3tBcX59oj+69TYSBHOo/ZiYEZudhdH7wWWk0llxHAoONgCm+oSlSLEJDIfpcLD8v
         i8rgp44voBFT2pjfneUARbQGSrrvCF8JIENh5dGqlfwRUAlaK3Bhw0GshiXrLHLwqgBf
         SsQIbo0hVpeLywmjoJVLQd8gCrHTWvUXXjRlgzrnNa/OHsCUtMYK7r02c/vVfFR+wCwT
         ZwF/P9cISmVKtno5E51/7iFVGmqknPEndVxG8k7wl0xPKJsZVq5GDeVajeWOqzyF0C6e
         bY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
        b=U6WLWorHIuxOj/HWyVZhEuGqkEV9Edg/JiIrxeptnNqbNkA6ptvQLWvRsBq8tCHDbz
         9Gr4LsvlmLKubG65FwkFcTu9z1turwGabZiGvSesR1ytmxIB1TuxVifRIIR9kpFsY0Xz
         ffz2gZLrMwjcA6/bFOE4cFPBIsBYMqciBbW4GD0KC1Av6Pr1s5gQ5+QZR+TKbyOq1e0v
         qpbW5Co434Ea3xCAM/HT76r+kNJbWjEU1Ilq6eGFXiVt77ltpK5Uq7fZ5mlcGdViaCaS
         2mdXdQefOq0+gKi4MLmJ9ZsH4ZUWRMs8SkkAaw5SbA3lSHIObtqg5cY4OsjOcpmPiHR1
         qdZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O7R5+EzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id d3si6345676qtk.109.2020.05.04.07.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 07:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O7R5+EzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVbyZ-0001jX-37
	for alex.bennee@linaro.org; Mon, 04 May 2020 10:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVbyO-0001hv-DA; Mon, 04 May 2020 10:21:32 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVbyN-00039e-KO; Mon, 04 May 2020 10:21:32 -0400
Received: by mail-lf1-x141.google.com with SMTP id a9so4499080lfb.8;
 Mon, 04 May 2020 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
 b=O7R5+EzHI7/ZxweVNZcHBLLER6nbyukao6ZKvVm4yYCWJAjXMQsA8npcogXPSF7JXs
 IqzdOSAFeNSlcb1oa2D40v17WahUapRWS0qnI1ZvrjfNZHZ3Ob3EFvwgrhy8PcWIu1s7
 AkE8Ubw5ZTbSkAzsFq+SlPEccyoiltYM1SrdjdoNP35ExkxUkAai/uvzk9IwfbBR9uVP
 qa/7/aX+sb0S30t5LRMmoF0RvopdvJMBFxOESZWi5tc6mMuL4hWX6DoGiez4nUYby4Kd
 WGpHWZQoRanVypZbe+dWinI+u4jAy6lsKeMGZ7bWd/1+ZJ5WmMAtTEQl/xdpmpIywrhd
 dWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+s9RocNcIFxp3NrHvqCZUbCbQZq5W1Nleeta/NdFEs=;
 b=fR2IirK8VkDbj6htOkD0qdom0/WApUYW3sYYoSNGRyC333Ha4f6nUeIIOojyyiNtgI
 ZmCuuvRBMt2+wsWDY88qNKo7CFVvcTLTV1TkTLyZajsGLf5UJ9nBWjVg0vdmBNnSmeGo
 gTym1Yro+paYCuUJPwozqWLf9j4Xrd6fbl9nKwxMJ0xUIoY1CQ7+jJeythiNfdh2YBzF
 MDLzSKBwTkWTKM4nW7OO/j89mlaOZVcTK1EOPi84nKZQ3CrQDFw0K9mIFXUJhqK3cFsQ
 jovXFzuPfZ0+ctsj2VD8PeAEUYR/sKWndN+Lhw+l5PFJfQLC1l4b5Okojhz3/1dVURAF
 OQZQ==
X-Gm-Message-State: AGi0PuYoWnn2XYtTcmKe+3QVOYqjGMdGXgGCtxkB66NyGeay3P+5iWcE
 BAM7rR6rf7ON4POpkCZ4p0LfV/ifXB4=
X-Received: by 2002:a19:ee19:: with SMTP id g25mr8072963lfb.124.1588602089242; 
 Mon, 04 May 2020 07:21:29 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c10sm9726871lfc.7.2020.05.04.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:21:28 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] target/arm: Drop access_el3_aa32ns()
Date: Mon,  4 May 2020 16:21:25 +0200
Message-Id: <20200504142125.31180-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504142125.31180-1-edgar.iglesias@gmail.com>
References: <20200504142125.31180-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, edgar.iglesias@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AiRxFQBB2atI

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Calling access_el3_aa32ns() works for AArch32 only cores
but it does not handle 32-bit EL2 on top of 64-bit EL3
for mixed 32/64-bit cores.

Merge access_el3_aa32ns_aa64any() into access_el3_aa32ns()
and only use the latter.

Fixes: 68e9c2fe65 ("target-arm: Add VTCR_EL2")
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dfefb9b3d9..7d21bf1cc7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -502,35 +502,19 @@ void init_cpreg_list(ARMCPU *cpu)
 }
 
 /*
- * Some registers are not accessible if EL3.NS=0 and EL3 is using AArch32 but
- * they are accessible when EL3 is using AArch64 regardless of EL3.NS.
- *
- * access_el3_aa32ns: Used to check AArch32 register views.
- * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
+ * Some registers are not accessible from AArch32 EL3 if SCR.NS == 0.
  */
 static CPAccessResult access_el3_aa32ns(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
 {
-    bool secure = arm_is_secure_below_el3(env);
-
-    assert(!arm_el_is_aa64(env, 3));
-    if (secure) {
+    if (!is_a64(env) && arm_current_el(env) == 3 &&
+        arm_is_secure_below_el3(env)) {
         return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
-                                                const ARMCPRegInfo *ri,
-                                                bool isread)
-{
-    if (!arm_el_is_aa64(env, 3)) {
-        return access_el3_aa32ns(env, ri, isread);
-    }
-    return CP_ACCESS_OK;
-}
-
 /* Some secure-only AArch32 registers trap to EL3 if used from
  * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
  * Note that an access from Secure EL1 can only happen if EL3 is AArch64.
@@ -5236,7 +5220,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
@@ -5284,7 +5268,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+      .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
@@ -7626,12 +7610,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo vpidr_regs[] = {
                 { .name = "VPIDR_EL2", .state = ARM_CP_STATE_BOTH,
                   .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_CONST, .resetvalue = cpu->midr,
                   .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
                 { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_BOTH,
                   .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
+                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_NO_RAW,
                   .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
                 REGINFO_SENTINEL
-- 
2.20.1

