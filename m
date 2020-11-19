Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp757545lfb;
        Thu, 19 Nov 2020 14:07:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGsBzIOHCMO+2Rk3eHyw/Zvgl67Nedk4IP50t+JXNpNmziXXHcJt9IAYvTS47B/bhBm0zm
X-Received: by 2002:a25:888a:: with SMTP id d10mr16546189ybl.406.1605823676257;
        Thu, 19 Nov 2020 14:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823676; cv=none;
        d=google.com; s=arc-20160816;
        b=p/V0nynHInd2bWRnJUh5ld5CbpTrZHR7oYZ72ZvcoRhv52qWN977yJaN/Gbme48AlM
         EvGLvc4A5r2UopiLDWYo7AZfrvyDBV9t15l3p/kngQh3VySazzokrzwCFmpYL9PbYgTw
         vlNqdtr3lRJsE8oKtAo9VQ9z++ajho5IoZmj0m3WWeVpbEX5GCnFLk96uyuO5QaYxze6
         6lY7UGHVoYFIOBTUSc2baspPREfmIhoYaJT3si1h4JOZ6uHDiOu19tzdEEmaxZnAMt8h
         7+OCP+asqjVlk4TWIV5WcY/eQVh17Cwe3rE0cw6ckSiA24hV04vzXFEpBSvk+WhwGd/+
         91rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
        b=iD+iU3wIZW6YFYkbMgjcs8cf+aWItfKAJNEp5WfuwlI6Qg84WxJhoZ6hYSEYkuiK7j
         Q72nIPprdum/q5X8+s+FJb5E71DtGSawhk9MTwagGnWd3xQHeaYRCUQUBqckQ5KxtvxP
         UqeUb6T5Z3m5S7i5p8MbWrwFzl8DUxYppgWIJh1cnwLwireu25Ekcv8+5tSuF633JyPb
         SvKoPoIMizPvzffYs5awomaIv5ZapVCvUBMZfBc1hWdPG3ki3cfVIxkWzmDsZoiEE/b3
         9Qveq7Y+kPQ4jlIpKrCjXcdQjOg1MkIQEbgIcrEFEjKrWQcYpg7OqIZ8lcNmmw9SV3p/
         RCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgQliZ57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h137si885028ybg.295.2020.11.19.14.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgQliZ57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs5r-0006Rb-Il
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvN-0001E3-31
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:05 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvB-0004HS-SO
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:04 -0500
Received: by mail-wr1-x444.google.com with SMTP id p1so7954812wrf.12
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=PgQliZ57diIrQv1+baj8vSQMq1u1jLzyk6HTxbSrZ3Ch0G5i0r2wy1aLn9bUXeSSBv
 EUOHeyNTHUU26GDUIXFaA9cmPmFjuOLPVY2xhv7ynqMV7+1cB1lR7BEwNvWthWmNLs22
 dPruNGawe4FrL1tcWPgn48t6KjSsncEPbCupV0bcQWTgr5j1erLwCsGJzIH4E8MAnKKD
 m5vJgJCirRksrDtsrR3AYvgnzoThzdb7o/vkR2BXL5+uVSweHAEVJmYfFg5DWQWHBdYA
 PBafRt7YUhzeuygRWEMukJt5LgqiTPAuaUwIkuOmdf6SgzPeaXw3GpS20QpgZho6CWG4
 Q46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=toKvjmSr6LunDbDGYlrZ/Xbpvu8fy2RMoicAimRtFSO7kqd2EBDkTjixTgIEQIzp++
 BGmFEI4UODBDVwoV4rHFaLjfyEdkP1/++Zp0Qi0a58+R/UgYZBuS81GRSLTF5EQX52Zb
 ymgMjH++ZeurZUXQh9TWL5G3j0XFcAf+NACViiHr9QgCfEi9DDtQoWQh6qtLuTOUjczA
 o+GlxhnQZ2izSL14ZT+I4tLq1t4ASg6QBz3A8XkoC1I5Qt9KP4FdEbbIB/6FTcEdKwx3
 /v8sY0LDrPEBVX8gKFZip9mpeGvGNEnjkSQzN34MapskarG0ogpkMmhJMFT4YBIh+gAr
 kZgA==
X-Gm-Message-State: AOAM531HVGFe5eyaEVO2lXe3Pb/WVA8ZbRYI4PtukQASFJiyTNIydB4Q
 YfRfJrbVqOS6O7k2kkpAWg4FjWX7A/KXiQ==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr12696594wri.314.1605823011812; 
 Thu, 19 Nov 2020 13:56:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] target/arm: Implement Cortex-M55 model
Date: Thu, 19 Nov 2020 21:56:17 +0000
Message-Id: <20201119215617.29887-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ux+lLzq7083o

Now that we have implemented all the features needed by the v8.1M
architecture, we can add the model of the Cortex-M55.  This is the
configuration without MVE support; we'll add MVE later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0013e25412f..98544db2df3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -401,6 +401,46 @@ static void cortex_m33_initfn(Object *obj)
     cpu->ctr = 0x8000c000;
 }
 
+static void cortex_m55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr = 0x410fd221; /* r0p1 */
+    cpu->revidr = 0;
+    cpu->pmsav7_dregion = 16;
+    cpu->sau_sregion = 8;
+    /*
+     * These are the MVFR* values for the FPU, no MVE configuration;
+     * we will update them later when we implement MVE
+     */
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr2 = 0x00000040;
+    cpu->isar.id_pfr0 = 0x20000030;
+    cpu->isar.id_pfr1 = 0x00000230;
+    cpu->isar.id_dfr0 = 0x10200000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00111040;
+    cpu->isar.id_mmfr1 = 0x00000000;
+    cpu->isar.id_mmfr2 = 0x01000000;
+    cpu->isar.id_mmfr3 = 0x00000011;
+    cpu->isar.id_isar0 = 0x01103110;
+    cpu->isar.id_isar1 = 0x02212000;
+    cpu->isar.id_isar2 = 0x20232232;
+    cpu->isar.id_isar3 = 0x01111131;
+    cpu->isar.id_isar4 = 0x01310132;
+    cpu->isar.id_isar5 = 0x00000000;
+    cpu->isar.id_isar6 = 0x00000000;
+    cpu->clidr = 0x00000000; /* caches not implemented */
+    cpu->ctr = 0x8303c003;
+}
+
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
     /* Dummy the TCM region regs for the moment */
     { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
@@ -655,6 +695,8 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
+                             .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
-- 
2.20.1

