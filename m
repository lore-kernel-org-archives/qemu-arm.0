Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470BEC43602
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:42:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMLN-0007UX-9D; Thu, 02 Jul 2026 14:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLJ-0007Hv-TV
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLD-0005N0-IY
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so15145575e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017628; x=1783622428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xz5r4w7ToHLKCkQsWo8WUGV6TiUt2Z8kqneHCC7F/q8=;
 b=MR7K09D213Km9CXtzIGQ8qSArBxiI//wv3QNWhIMZmTjqdptXi3A4nK8G4Mv6fmpT3
 jCk1Sm4Ie4bxIJAAhQzZO6vprqDzC2gjdHUoh4gs06UZENG82SXIldigvFUK9rpUM8BR
 69ESU6404Bo8kUj9BREBc4g8DnzKrT/DBztxSU8rGTZdiPYxSvaQw6V9YhhB9ll7u58Q
 vKHAPwikGXvJaAmu6nqsKToptcLmsXUALfR9wgKjNxLtGHUt0QE+cHw98pZLl1OT/f1T
 bzqFH3nOi96i/Ujh3/r+5rLq2WlXNUikwLJK/nta/NX7nhJA7EQCys4WMuYQChdDx2uM
 Dhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017628; x=1783622428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xz5r4w7ToHLKCkQsWo8WUGV6TiUt2Z8kqneHCC7F/q8=;
 b=Jw9QwAHmPjmRA0GE3GR0x088uS13+lBNUS2vPHdcsx+WP7D2KGiWo37QFFydE7RPvA
 5pRkvCw6KrOEBagSsrAVCmpWxMf2TrG4TWaq3MALNXXuJH1LZYMtwRTOFsMC3+B9Xred
 a3INqx9x1UQz3pxNOcJwJ6Qk7J3GAr85hUEdvtSqJBKMhFEXUbNs7Bp4xEHivbj9Cemi
 IeeJbYGF24gVcLaTIfnGiMUx6V1JsHJej7CW6vCJoCb7e9KB5doB6fmQSZIrXbrn20gH
 g8rLGC6iP4z4Nz9RrH/HVzImmceJFJefNuNqhyhwtc4Sd4R06VEYiupDYyisPq1Z4LJw
 sWwA==
X-Gm-Message-State: AOJu0YzNK7+j1EkE8k6U4ueYOwa/fkL4JRo9HKXCJHtZyrE8RPGcnd++
 4kYqUn+wWrIb/YCW9wJ3Na0JMJzSiRJLPW2FsY47mJpYlg6GqO33JcMMfraDjKt7XVbjivU7+pH
 e0EXhNOHuNA==
X-Gm-Gg: AfdE7cmHYTV2k7BtR40o6DCi6VfVW94pUX70e1uaPABkN+Cip7Xx6wn0UgEnBcnCZAR
 S2cNr+9p1fLIyUl9eO2zTaAPGM8PL0TicxAEkQx3Jcelmo2GfvTtF7QbLIR01nBgdX9oMD27pa1
 fQ7ogqCTkVtlwPelogZKG7cEezO2pYWI+Z+PfCPG9RJYMnRPllwhUjOSgvX0qLVoD3kZrfvZNZc
 ttN8NkZLoIjJ0YtkhqHFImsBLL4pF9FPaOPneJ9BoPDMmmd5CIi8FlKuny5IZFl9WCCp3BX/3vs
 fpsVeX136qi/yPXplBBUaqQY64oga5fTiEg24Y4gLDOqlJDnpZl6VYZ5zszjVJtpArQOXA/BBlo
 C6WoOQYbzliI6kRm8JlGD7wvnVXvHaB9psRDUglYInMFewV/9TSzGwL9RIfBvWISZGzuK1tOOAp
 SZBHOVJfn5409zRQu8xw+MwE7GhDSZCHi+jsRTP6IZDYEcV5hvYjwzMNEaTUNXnjyj8JdDFMgSd
 N+eJkk0CL41xxdp1dt/vV0N0KW8yH6z
X-Received: by 2002:a05:600c:6d9a:b0:493:bfad:9d99 with SMTP id
 5b1f17b1804b1-493c2b4bfaemr66707435e9.13.1783017628247; 
 Thu, 02 Jul 2026 11:40:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/11] target/arm: Add new feature ARM_FEATURE_NO_NEON_TRAPS
Date: Thu,  2 Jul 2026 19:40:16 +0100
Message-ID: <20260702184019.3431139-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The traps configurable via CPACR.ASEDIS and HCPTR.TASE that trap only
Neon instructions are unfortunately IMPDEF about whether they are
implemented or not, and there is no ID register field that identifies
whether they are present.  In practice, they are present on every
implementation I have checked except for the Cortex-A8 (which was the
first CPU with Neon).

Add a new feature ARM_FEATURE_NO_NEON_TRAPS which we set on the
Cortex-A8, and make the CPACR.ASEDIS and HCPTR.TASE bits RAZ/WI
unless the CPU has ARM_FEATURE_NEON and not
ARM_FEATURE_NO_NEON_TRAPS.

The negative sense of the feature bit is a little awkward, but
this lets us set it only on the single odd-one-out CPU rather
than having to set it on every other CPU we implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h              |  6 ++++++
 target/arm/helper.c           | 17 +++++++++++++++--
 target/arm/tcg/cpu32-system.c |  2 ++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31a5567c95..9985f661f8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2171,6 +2171,12 @@ enum arm_features {
      * CPU types added in future.
      */
     ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
+    /*
+     * ARM_FEATURE_NO_NEON_TRAPS should be set if the CPU does *not*
+     * implement the CPACR.ASEDIS and HCPTR.TASE bits for trapping
+     * Neon but not VFP. This seems to be true only for Cortex-A8.
+     */
+    ARM_FEATURE_NO_NEON_TRAPS,
 };
 
 static inline int arm_feature(const CPUARMState *env, int feature)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 342d05e4d8..8ff7aa9c87 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -570,14 +570,20 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
          */
         if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
             /* VFP coprocessor: cp10 & cp11 [23:20] */
-            mask |= R_CPACR_ASEDIS_MASK |
-                    R_CPACR_D32DIS_MASK |
+            mask |= R_CPACR_D32DIS_MASK |
                     R_CPACR_CP11_MASK |
                     R_CPACR_CP10_MASK;
 
             if (!arm_feature(env, ARM_FEATURE_NEON)) {
                 /* ASEDIS [31] bit is RAO/WI */
                 value |= R_CPACR_ASEDIS_MASK;
+                mask |= R_CPACR_ASEDIS_MASK;
+            } else if (!arm_feature(env, ARM_FEATURE_NO_NEON_TRAPS)) {
+                /*
+                 * bit is present unless CPU doesn't implement ASEDIS
+                 * (in which case it is RAZ/WI; this is the Cortex-A8)
+                 */
+                mask |= R_CPACR_ASEDIS_MASK;
             }
 
             /*
@@ -4101,6 +4107,13 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
 static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    if (arm_feature(env, ARM_FEATURE_NO_NEON_TRAPS)) {
+        /*
+         * If CPU doesn't implement HCPTR.TASE it's RAZ/WI.  Note that
+         * NSACR.NSASEDIS being 1 overrides this.
+         */
+        value &= ~R_HCPTR_TASE_MASK;
+    }
     /*
      * For A-profile AArch32 EL3, if NSACR.CP10
      * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
diff --git a/target/arm/tcg/cpu32-system.c b/target/arm/tcg/cpu32-system.c
index 6e98390089..b7aebd05d0 100644
--- a/target/arm/tcg/cpu32-system.c
+++ b/target/arm/tcg/cpu32-system.c
@@ -245,6 +245,8 @@ static void cortex_a8_initfn(Object *obj)
     cpu->dtb_compatible = "arm,cortex-a8";
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
+    /* The Cortex-A8 doesn't have CPACR.ASEDIS and HCPTR.TASE */
+    set_feature(&cpu->env, ARM_FEATURE_NO_NEON_TRAPS);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
-- 
2.43.0


