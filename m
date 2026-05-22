Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802D7CD5BB9
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY3D-00037n-UH; Fri, 22 May 2026 18:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1Y-0006tW-KU
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:23 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1V-0002yX-Nm
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:20 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b4583f0a1aso53731205ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487627; x=1780092427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/BHVbECGtWD4DzHCzhYB2agsFfNWuyph85yygpzdM98=;
 b=eSNlw6nSJ8Vr4Q2G/8OVcmhCu8ap3Yi+r9u822BIskGs1QbTRh69dwfCgAcgCSijV6
 /3932qhx0L1LitmSQqcRK910d/itxQtwJi3PF99TL4W/pK0WfTQE8JURgHyQ1breScXt
 cwrel/4uhPAFCDBcc4k4ue/Zw5YhhMPcZKaQNOMnOV+/xLXFEWZXDWBEmU7yz1nfkBhJ
 WJaSHs64lAqEwERaXjYPPmGqWpZlJKDH9KfVPzhqGAu8Lb0SF1nl+U2fVxfaRTB36v7C
 uuyWdAqYvhoEkw6FNAWium7ttw4yltLLcAETFmYVuifpSKKIYHe6WcvVTBpL/VSVJ1zK
 Y3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487627; x=1780092427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/BHVbECGtWD4DzHCzhYB2agsFfNWuyph85yygpzdM98=;
 b=eZtnHYMYlChdZBNBygY3h316r8fD+P8hNJcUNLkdQP1EEgZ0ra+E6s4GtzR0SLkX3p
 Wm7UuzJcNTQXspjJHtwWb35mn5q7b2Ic52GdfNdJV3MtgIkDuziD+ZQXIck3AX2LGDLL
 ga7zS45jHxPhj/OtTgvNhtsUTT8g9mOsEbpkevGzn3MfB+8m1Kk9OQZ0a3FIQ1eDhyD7
 +Gka8CxE7y1coS5L9W8OCkrNWuCHZj/AZXO5OlqQnDsq8w4ZcjtWBTiI71/gEidbMR3U
 /8pFzFWjtty48vDBSpaF0q31nMLdRyf9veyFxMTncSJKzdlfQ4FiQkzdTYsyZz+vNEMQ
 TgnA==
X-Gm-Message-State: AOJu0YwpZ84+LVsZbw5ySlOijFa6vd6bACa6AX+MEK1v5g3xojN1s5jc
 gbo2FLU8mvg0obDyas5+qWLcYJLfTUhfkO9bBdXi+GPLbKmvw4s2rUUgL/cAKt5wsMU=
X-Gm-Gg: Acq92OEumq8p1k3tU28HPRU4oW9HDG/McH/vIhSdPbDRO9WJzOPuNU34xc4WhNaMce+
 41bV9dcB3/SA4GCzKHtMoWN9/7z+5lxxTPen/Q4ffT8usn13f2hy24U8mBhasuiXxf7O7pq+qBk
 UhMWWsHKZpcsHhLJvApUbyipkKngmuXQLxYugHWKpFScMchItl2JJEH6rR4sZnAAQSgJUI3TgbB
 1/88LuqOTz3rlEtK/NmHl4tJ5qYNahoMWTTMrinIVqEFBpTfIpzLsxkT5Vt6QDnhQHRgokpyCNI
 9elEoKbYJSdHU0s1JkChHWsHQWbCLEjlHJz4jOdUEJZB7Yaf8rsqYhb/g49OlIpM7fh3KIaH5dH
 NCdlYAis5p0lXkPO2/WtbaB6SOkwBM3UcfCYMsFwV1aiW77XNrnjvezDvhdCNzrUYchAP4idgFJ
 ukaVIhlSBjrghai+D1bbfrCDY8okY1
X-Received: by 2002:a17:903:2388:b0:2b4:5cb8:99eb with SMTP id
 d9443c01a7336-2beb07e9e15mr58671185ad.27.1779487626980; 
 Fri, 22 May 2026 15:07:06 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:07:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 64/64] target/arm: Enable FEAT_F8F16MM for -cpu max
Date: Fri, 22 May 2026 15:03:06 -0700
Message-ID: <20260522220306.235200-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index 160a6c7769..c086eff927 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -171,6 +171,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
     GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
+    GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 7a47af9f5a..492f70fc8d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1398,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM4, 1);    /* FEAT_F8F16MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0091b8d337..5974e9ebef 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F16MM (8-bit floating-point matrix multiply-accumulate to half-precision)
 - FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
-- 
2.43.0


