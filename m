Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1266957lfk;
        Sun, 17 Apr 2022 10:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEtLyUz+xkjdDmTSSGD0VSGLNwo5rvg6LyAUqza6S4l6/rwSX9gBq9Wd6DlIWKhCRQ86Dl
X-Received: by 2002:a05:622a:48d:b0:2e1:d4ff:3179 with SMTP id p13-20020a05622a048d00b002e1d4ff3179mr4957026qtx.442.1650217842443;
        Sun, 17 Apr 2022 10:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650217842; cv=none;
        d=google.com; s=arc-20160816;
        b=q0egzBj6zNwgVgpaK5LyjnQCUXcUT5YpBN6+Z8xCXjzWOdumjTuvVzNuaTnNv9PSxu
         KJX2v70AsehAFbU2ieEwSHvdndicFcL7QOgLt3nDitClshB1NWdwcf85Uk2I1LHiHDlN
         kvbo+RaTWMb7EfuhC4Fd5ppiJW71GT8f0TCAhM5RZSBPhQbfkJvUdxjPHUAwcOUCo1iP
         ALnw102ZjedZYYLtIio8+0SPKjP0kccAcSRHLsjj8SGOhjAwEoxmhEaX4ce3oPcgSTRA
         zWRcrQm6DPF0tvCD7ZXbgPX7UR3XrsASOrTd1Vw1AQJrD6KBtIHVksy95J10Cwt2NG8Y
         hFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4B9pthiRLfIf40OZcpcAQf7C9gNufiID5iESdzNE71c=;
        b=wu64vsGV0DtzgBlGaf5VCTlMW8vNINBRNbi7EvUkoIcCVXufXYFQIq/e6Uh+XaavAx
         IwfTgCpVGC0bi+/M0xyezb9eq9xrDyZjMfaChxfh5F67tAB3CN1W+uR/hsvlJn1n802I
         5fPni1Z7x1fFKTn4/cJm4fFBKO96bIavfOG3doAW9pXRTaMtQkRFTViuJ5PgbooANkVJ
         x8Pv47gar+pNTr7KQo4G/gxo/ifcfSkHCx6iv+BiAwAfxhGsM7niTlSpW1a/7a7LlJNd
         b4kxo8Z4bbMNEzuAJdFa2qyROzx6/bOBnE/7GS25/FmE05jIdilfaT8nNx/aNrHRsfi2
         RbqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJE4sumE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020ac85cc2000000b002e1fbf3bf02si302943qta.243.2022.04.17.10.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJE4sumE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng92n-0007GD-Vc
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wv-0000eZ-Oq
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wu-0003GS-4Q
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:37 -0400
Received: by mail-pl1-x629.google.com with SMTP id 12so10722113pll.12
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4B9pthiRLfIf40OZcpcAQf7C9gNufiID5iESdzNE71c=;
 b=VJE4sumENvnXSWQR9VW72B1CEU54og69sdChfbuItGbFzvfIOztws4fgfB1zp4r4nQ
 XI+74VB7pbvHnvY8uJed8/jkGhoc60Cf9SDU78fbLT/sTmrt0Pep0oBsE/kq4T8MK/BK
 5PSbxELnwExO1ZrXwK+IhQhR77hk49TZJ+71la3YzVclPnfgwSu2ZQIvIOJlOFMwc4ii
 Ie6lN77wz3MVkLWmasezY7Fwp6bjbegJ7apvIPPNL+ikj9OPowiGVNr2DfZSIUNzUPoM
 Ar3VSGdgNelzCAp5KxnAXwFw6bMMk7YznGqGqBn+lGqNKtpPvXtC9Y4br30BFhs8AYPz
 2nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4B9pthiRLfIf40OZcpcAQf7C9gNufiID5iESdzNE71c=;
 b=50471hCi/Ypws0ePNPk7CXUF+HC3NJo5F/7xU+tSs2j9CmHnxg2iBPwEVekHvVXBqk
 hqGxg4M/OytSiSEq61QPXAooXyvYwQoK4irrccvPaX/rSFak25IZf2oSxFcSP/BGuQhd
 ltVSqZb2Kb0t6Sn/N8hdkhSkdoyt8nElvPN0ewSzL9/BttvixyzG+aCE6tKBkfN7RSS4
 fFrd9FDue6DjfgUqnbYZpDLaEbb+xZ7J4TduA6I80sTnMCTrj7nj80r+7yKptn9T/fKj
 qb+n9zRkmF5LyUly8Cj1qdPuHo/6GJ3Lbl27QPZygjgVy9xr2MRdmG2FeNbbDbItDFhq
 xsEg==
X-Gm-Message-State: AOAM531U7koMGXZknjoJrCIQCkvmzfFgO/LZ2eXyn5G8jq0GYemp/lt+
 6wN6HuglgDW+MoAeSyk92HONdA==
X-Received: by 2002:a17:90a:634b:b0:1ca:6c7e:7952 with SMTP id
 v11-20020a17090a634b00b001ca6c7e7952mr14230125pjs.54.1650217474868; 
 Sun, 17 Apr 2022 10:44:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/60] target/arm: Change CPUArchState.aarch64 to bool
Date: Sun, 17 Apr 2022 10:43:32 -0700
Message-Id: <20220417174426.711829-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: baRr09khC+Gw

Bool is a more appropriate type for this value.
Adjust the assignments to use true/false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        | 2 +-
 target/arm/cpu.c        | 2 +-
 target/arm/helper-a64.c | 4 ++--
 target/arm/helper.c     | 2 +-
 target/arm/hvf/hvf.c    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9ae9c935a2..a61a52e2f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -258,7 +258,7 @@ typedef struct CPUArchState {
      *  all other bits are stored in their correct places in env->pstate
      */
     uint32_t pstate;
-    uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
+    bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
     CPUARMTBFlags hflags;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..30e0d16ad4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -189,7 +189,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         /* 64 bit CPUs always start in 64 bit mode */
-        env->aarch64 = 1;
+        env->aarch64 = true;
 #if defined(CONFIG_USER_ONLY)
         env->pstate = PSTATE_MODE_EL0t;
         /* Userspace expects access to DC ZVA, CTL_EL0 and the cache ops */
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 7cf953b1e6..77a8502b6b 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -952,7 +952,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     qemu_mutex_unlock_iothread();
 
     if (!return_to_aa64) {
-        env->aarch64 = 0;
+        env->aarch64 = false;
         /* We do a raw CPSR write because aarch64_sync_64_to_32()
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
@@ -975,7 +975,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     } else {
         int tbii;
 
-        env->aarch64 = 1;
+        env->aarch64 = true;
         spsr &= aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d14650615..47fe790854 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10182,7 +10182,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
-    env->aarch64 = 1;
+    env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
     helper_rebuild_hflags_a64(env, new_el);
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8c34f86792..11176ef252 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -565,7 +565,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     hv_return_t ret;
     int i;
 
-    env->aarch64 = 1;
+    env->aarch64 = true;
     asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
 
     /* Allocate enough space for our sysreg sync */
-- 
2.25.1

