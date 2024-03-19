Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382592ejb;
        Tue, 19 Mar 2024 08:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpjmqJ8UgRCVzQK33nyxlmPeUXPFtoTQ0hjlWsHFlDHSOeUeeRk6HgCtJfrxSwD65eFuviE6k0+BI0+nFl8PJM4kauNumD
X-Google-Smtp-Source: AGHT+IGkjNGyENQUQJPC/fqwQljcAY0gyMlDnbpNBmTDTqEsrVoTuuvPvoq9HjFXYOZM1ipVOS7Q
X-Received: by 2002:ac8:5792:0:b0:430:d4cd:ebcd with SMTP id v18-20020ac85792000000b00430d4cdebcdmr3330760qta.35.1710863075071;
        Tue, 19 Mar 2024 08:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863075; cv=none;
        d=google.com; s=arc-20160816;
        b=obxQp7jENTjSTXpBfIFlqFM1g6oDqY4o6Y/YA8kLYppigfTfDkyr6kanSeAyxyqTX6
         lFDAZwWxELWV5qGYJS4YEtF59q0rSKWH0SxHLP+MJOC6k+rR3/HWP94ABzvdM/kpqdhN
         /RtYwUUUObN0l4FqGFppCV28mwpjzVUIyDuYBQL97dxPT7yqeyJ4Ee3yHnv+wtvc3SBO
         KqX+sfS8plMDRCbqgwthYuiutuTHx62vH8Dp/AwLjFKPP14iE+rdaPEjPL95+WGkKPBO
         /84/C7nXLS1v7O0bUimf7x/SIaeb2zbZHT8YeTbZ22eLSJghGxQAetpLMU/qcOcHP6sv
         hAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wt+1/nVbm4UwUNrHtwVfJccIMKB4kkx/gPc6B1UnmDE=;
        fh=x8f9G6n9VSTo2rDQkhzyXwfPIO7FaYyCaq5u+wdZr3g=;
        b=cBcI3qtJY1MoPVPXqaq/ujunfUXhLmGZANp3YUW4WWiU7ZqOnsYo74fWtgRjEXbcE9
         dFWkFB4hcACph5SGLhH9Cq8+cisk6hOVE1EbD3wdG54OFnn2XhDyrb7FbrqTZ1WSfRzj
         gZtS5olfIk0eP/QISWWCe+Je2TfSYPujMNxRq9X624D4E0qPkxydoBS/lCTxLdL2EOz3
         M+SfavKCAQSUaMgvdX6cN8iTnRS0d3cn6ncsqnXBLedp7f1BJ6BbT7JyZ/KJl+E2FgAp
         ka6+PN8/qmOXtIwSoQMvHqRgYsuTn40BL+/+QPoY5x2oDUCE3lDFHJI58ST1ffTD3p2Q
         Cmfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+xLodN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05622a015600b00430bb2747c5si8040794qtw.62.2024.03.19.08.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+xLodN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdB-0005n8-0n; Tue, 19 Mar 2024 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcy-0005Zi-UU
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:48 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcu-0004tQ-Of
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:47 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d687da75c4so7846291fa.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863023; x=1711467823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wt+1/nVbm4UwUNrHtwVfJccIMKB4kkx/gPc6B1UnmDE=;
 b=M+xLodN6o4YytlQ0BuvMaMGvZHAc4IcZDYBgEDDHXEFUS44nQZFSjkqpDYr4DHfcEs
 29EgGNGLkO6rvEpMO7dCBrx6OB5m8tyMBx7V+xvpvLPSDYIM7Ux171sNGs07EwFJDFMh
 Y2TI9jRMctvbh6VmepB/xOfm06Um/OYbDrsSlkvcJ2KMqOm8dUfcIe6K4TBSXYvnaoAm
 5dktWuUHwZsh58Ob4dmVSFoP8yrHVZD171OlK8FdoLbdZCL6DRT5/+BvzCybVm1Ubaxw
 T45xUKDv9fniInOmNzHQzWAqbR3lOLQ2G+BfVUh9FRU/XuA+CVdEPaaToMMxnQ7tv4I2
 3u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863023; x=1711467823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wt+1/nVbm4UwUNrHtwVfJccIMKB4kkx/gPc6B1UnmDE=;
 b=LiLtO/KvJ7U8fjhdQvbwUY6JdOwgqQsOafPuzT696MBJU3tvLv8DTJXVNgdylzsQU1
 gklxlnph7vPRPgbTA75KyirLhK+Yg2ZvvVblcdk5+zGx4BBGXOLB/O8jDoyTWTnxFOvA
 VSv7ixrFLPJQ+gw3+kC+QT0AKiVVTpg1CFFoGd8SA9XsTVpjZQruUgEFQCo8ULG1CHvI
 wYKc/1NZyy20l2LRhBYz1t/p34YUMPsTjMyZ2IG6fMO5d8G3/9EVq4d4ksKs1AJH+K8i
 +bspUOazRz3LZy91rLOl9tetHoKIz0k4ATwNVSPGGbpMMO85OCRYX/Z2O3y39mEPQLiE
 ICNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxRhF7kZgnFXglvfXXlRPvLtvdtYXzVnzLeeQyTEnR1MwkyZqUX+09LzgStuzJNjsKGS1SmZePbVefQ/jOOaOPlmV
X-Gm-Message-State: AOJu0YxEkx+bsORT+fFNBPAdSjryaN6wdm6uhJm4cO987nkFgEhkjhVM
 GCcwiQBfhuXHn8LWgAFHASxpw9O6tzUC97ru095lTwIKooL8R9ep0y0QVgKaVRQ=
X-Received: by 2002:a2e:6d02:0:b0:2d2:e44e:a5cc with SMTP id
 i2-20020a2e6d02000000b002d2e44ea5ccmr10123039ljc.46.1710863022845; 
 Tue, 19 Mar 2024 08:43:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 fm24-20020a05600c0c1800b00414650448a7sm2379716wmb.11.2024.03.19.08.43.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH-for-9.1 07/27] target/cris: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:36 +0100
Message-ID: <20240319154258.71206-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /LEohnpQTJGr

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/cpu.h | 12 ------------
 target/cris/cpu.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index dbd6fb05f0..6df53f49c4 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -273,16 +273,4 @@ enum {
 
 #include "exec/cpu-all.h"
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUCRISState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = env->dslot |
-            (env->pregs[PR_CCS] & (S_FLAG | P_FLAG | U_FLAG
-				     | X_FLAG | PFIX_FLAG));
-}
-
 #endif
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index eb4bddcb7e..8d0b92b96d 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -51,6 +51,15 @@ static void cris_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void cris_get_cpu_state(CPUCRISState *env, vaddr *pc,
+                               uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = env->dslot |
+        (env->pregs[PR_CCS] & (S_FLAG | P_FLAG | U_FLAG | X_FLAG | PFIX_FLAG));
+}
+
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -182,6 +191,7 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 static const TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
     .restore_state_to_opc = cris_restore_state_to_opc,
+    .get_cpu_state = cris_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
@@ -193,6 +203,7 @@ static const TCGCPUOps crisv10_tcg_ops = {
 static const TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
     .restore_state_to_opc = cris_restore_state_to_opc,
+    .get_cpu_state = cris_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
-- 
2.41.0

