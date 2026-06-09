Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB83CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:37:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28v-0006Wu-Fj; Tue, 09 Jun 2026 15:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24x-0005hy-7W
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24s-0005XZ-G5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:37 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2c27fc587ebso11621525ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781033087; x=1781637887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZhUQtrZgH1sNCcu1zDpkvoAehYLcJxzUn96qi4Hts0=;
 b=Xp8JUk23s/+wTuSeRu4kpl/orQs/vRfkNmfeh+mx+JEbeQBsHXbOsCR3RTOqhobcpm
 lMknCfWVYI5JjQmXrldG10+VWOxAD9uSCIk8s3aTj4FS9ln808p6SGIVmfkPWFaxR2Db
 8SHExNHdCusXyWTRV+pBO1znp4WVrGGFX3pbdfkoez/zgzgb/r3h0HKxaddljDpqkF8f
 XqWek3hDp41V/0hpc6A+iuGufZMYQwGzT1r0qTUp4Lm47mK2gLdy50hG6AyePSeL0vso
 /ugrGu8g9f841iyNyoLsBzmOuoJZDeAR5WP83w1EvhQvUbbSTQRvtJSG0o2a5pav7g5p
 Jm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033087; x=1781637887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MZhUQtrZgH1sNCcu1zDpkvoAehYLcJxzUn96qi4Hts0=;
 b=UDOUIh3Odgh5kHMOSlbxEm/IIt8aPpDmSaac8XFlN1eSmJ8IV0eB66rOfacR3cC/yQ
 q1SWWg7N9KuiLiM5iZFhvxGE+RmItbK0B9LUTW0kGwPw1e8sBAbNbOaXHZ2/IP8bAv+n
 VPu0DcMIIDS5mqjvrIo9A9PyxDPRKzww8nNCwSEzIu7d/jPfP2JHHhc4MSaCOdur+IjY
 0wlqHn/kA7sCcOZ1AJSYlSMl6RP3pbdiQ9AtMm9dvuQ3qRWBY1Msq/rcoaPJBmh3oadb
 V4bcITsDUAfKbPDJKfxiaEVynMkFr0aRz81nRns9OXjxUwHSZKcdm12r9HlXCIxkDXwZ
 tuXg==
X-Gm-Message-State: AOJu0YwGQ2wifRHnaGfgr/Yxu32pTi11fTxiwEbX3vyUmFt4ixbCeeOa
 D0iMF1bA7VED8gILygkbrW/IsJQgqaujVFFOyeXPCcInPbwIdHbqdxyB3YWWesu897c=
X-Gm-Gg: Acq92OHJjLTkvflueTgFlulMaM5ouFx7er/eQ1s51PsDPFdQfJpm2wmbkDJV19XkLpA
 G8jWkqK8okbILpLCq6FS2/M9Bv3O5tNQ0s6IitI+t9YM59vmBVunrcXT2cKDs9ydhXK9gnH1iwE
 O2NGa9fZc8s6FAz32SUZBd0EejGYfD+m96Yvep38lrF/ajIihrq6zC/4AP6gp1SOA4YMh7z4bqm
 gWXTgB4k22WxeZ+gJ2+bd7flZVLLkPa5/TbyC6/8j/DV7p6OkfSKEDbzMg0wo6mMOUPpz2e9uwP
 B7YmJiYF/YcWXkf2LL8BMD/RSolPjfE1FUY+O3AhtE3jdhNYIVxaVeZqBZ1yDjwPaQ/LZifxDev
 vA9QyDiqlfM3oOtI/sfXYYCdeVdGhwXUd4hKSd1YNsFdGO14xCKbf//0GvlXrqLol8ThZxWGdGL
 UAMJW4kE8GT4af5v/jNqYDBInv1iSOs++zIoxVhIw=
X-Received: by 2002:a17:903:8ce:b0:2c0:cb0e:ac3a with SMTP id
 d9443c01a7336-2c1e7f91985mr244243175ad.23.1781033086405; 
 Tue, 09 Jun 2026 12:24:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa00b3sm212247045ad.32.2026.06.09.12.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:24:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 45/45] target/arm: Enable FEAT_F8F16MM for -cpu max
Date: Tue,  9 Jun 2026 12:21:09 -0700
Message-ID: <20260609192110.752384-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 7864765ba0..4887a3a7b7 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -172,6 +172,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
     GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
+    GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 15dafb9aee..15c1ece4b7 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1399,6 +1399,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM4, 1);    /* FEAT_F8F16MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index dcfb4f2073..64b2a87e1a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -67,6 +67,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F16MM (8-bit floating-point matrix multiply-accumulate to half-precision)
 - FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
-- 
2.43.0


