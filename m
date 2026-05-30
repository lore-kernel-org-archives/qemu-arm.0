Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9C0CD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSub-00081X-G4; Sat, 30 May 2026 19:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSuZ-0007uw-Ge
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:16:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSuX-0000J0-MF
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:16:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36baec934b6so1152626a91.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182968; x=1780787768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/Tioi3dpsi0F/SXE2FE6voGg8/eCNvGNXOCYhrTQy8=;
 b=fjHRewbTzULSBHNvJKnSZvFopCvOjXnvkM/3qhBwgigBGYpFxcbvlW5O5iXyK6M1dt
 u8mCc44TaOfbOFScsBD/VhtqElo/079NVMWGRv86Fxh2xi5NylRCA3wSRm6B3hpB0fRb
 c9Ph4yfnGHElfnLfwUIVYRY6uc7nCuGiW2jXsTaUjwOKDkZBI5pvHCqYaMBnCJPGqU+I
 0RyYeW96I5uY2iVgXEo54UFbQxd5I7GOR3K0NdxdXjAqh1hLiiNE1hPcImHVgfsnCpNk
 tKUmD3rdAII3Jn3qASSusK7yivsJCJr2kD6T7DpnSrwPVWeuiFc6iAkzAjgg2nkk9Voj
 s2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182968; x=1780787768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z/Tioi3dpsi0F/SXE2FE6voGg8/eCNvGNXOCYhrTQy8=;
 b=VSTsEfiN+95LEyYKte47GYFu46Ewheiw9oK1zI1dYs8t/r4Bscqa2LrbSDhs95PyK4
 KSBOeerD6EDRMuYK7gnqmOCgykA68P8/lnVFJvfIudAvgF0+F0GNCYOFITJ4+5Q8FPST
 Zw7iXJNAtky/PxriMh7MaXiMaL15olYESrdVIvO1hbbq3HHNIw7J1uq7d19Q17dhr6tD
 8h8pGcbRe1XQMZVZdYIwTMoUsuhwF/7e9187JW0F8pEded8HlLn6S4/4P56G9tiu20In
 e9tG5aeThEl9RoaQbwnzmjmLgebjlz8BIT38RauZxr7ijDJetq8VFzEYukpvipr5EFtZ
 AFSA==
X-Gm-Message-State: AOJu0YzBkDpBoRQcVAm9DY2gjMmRKkEykfWpmnlHjACPXd2PHSwrs5/I
 Wu2YPdzAy+3dRI6pMvV9kRfRf+pQhR2qc7I7Ylc7d0VLJCtPOaEEvWOBUwvwPx0dGtM=
X-Gm-Gg: Acq92OGY72rUMQoROiXez3P8hU3d+y8uUT2vt97QTS3mDEEXA8Ul8jTXvlsGRKC6/Sv
 FJiJuGqPqm92XLuzxy/U+gncILhR2YgqYgvSp93mW8690vObs1a8klNVME4qzhuWIOYnPQEn92y
 6GFS15BpuGpRAyH3luk3lFX01vUd3conQkK6EXfuRzsIR6nW8AXDoJR2wyt873zEDFDS1Ky93oH
 S/UNGWTnZLCguL+Sqm0Kw6Hp6ieOa4Z+8rVt/pAL6tE5//pjJ2phXbtN69tGZNp6/Mf3OSD1ORb
 mTHBQ2TYRQiTKasTW1JcfNABafmZiZEY6Ap59kwW0W/ByfUsrqgpwXHHQu6Iz9zo3EVKy/IChNL
 5RzQ6XgE2CTh7p0eoA0t0u2My+iAahHF0sc9Ilv53BSN845am/UDsHuXH4o3qgwLuHQIsTytTRA
 +NzGPHzhtWzS02wGHA4o6994MHxZj0IFRzF4jJrr4=
X-Received: by 2002:a17:90b:3606:b0:36d:630a:c4e4 with SMTP id
 98e67ed59e1d1-36d630ac782mr1664470a91.3.1780182968027; 
 Sat, 30 May 2026 16:16:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc0c3d44fsm6370038a91.17.2026.05.30.16.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:16:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 41/41] target/arm: Enable FEAT_F8F16MM for -cpu max
Date: Sat, 30 May 2026 16:12:29 -0700
Message-ID: <20260530231229.400441-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


