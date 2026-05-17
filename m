Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F1CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPT1-00023F-LA; Sat, 16 May 2026 20:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSG-0007At-Dg
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:10 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-0006s7-5l
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b4583f0a1aso6047345ad.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978038; x=1779582838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=a9humv7LESoOpXIl5z2qIw0PtYod8EAfulMqGU0XD7LxjPdB5sQ8y8LRilrQ2ebWyt
 cTYsLZRQyaSUtsfoKLt3pykwfENp0PiNwBg596C1fy9JMxNIzseVb4jPixxjlKr11wuq
 e8SOUJSXXVi80gf5OIhM//uqzXF5hWY1jEKo1GzY9yXL/o8ESx9xehIj7dgKkh6jtCPE
 y/BSq/i3ZIkixmq6fwXg8KTX5bJCLACHtSDDu69ppC7ept72iVH4GgcV8r7/lfwUvsf7
 43Rn2ozz0k56knSnVt2ZbLXTi6wgwktz7ie/1KYnD2pJzGQk0qI8SGteiIHOdqd9eulM
 eBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978038; x=1779582838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=CCYso1mICdjoXwtGLFMbzTvSM2Bcf/rW9e1Xlq/OvzHUvmwxfZPFyekvnWJoCv0aep
 bVnWzHWuCm36SYyE1yVgWJ5BUEok55eR9ePGb0rXeh+7sNTE1YiQHPg9X71Yyp1EZ5jw
 Ewm05uyVh22Fre0VmDMjP2fKniQGZ1lgFvvjPeWeWPFEb8gJ/heRIdf3/y0q2yNkoZR8
 TIl/pSMbqCRfF4u5jzOZcP/IsUSmFGbQaT19srg/Kfku9jjhgRgrSet7n9l/+nFcQ0vh
 AgFO7te0W5YqmW5Ipzdo1umAn+rLvoVrFIfAel4w0eQGYrMKIePV/FK2PeVlSTy4LFjv
 XQqQ==
X-Gm-Message-State: AOJu0Yx/TRqbjJWgFEOeS4gPMfgKztzcghSNmulNEJASmB/vUuset9eV
 Znloml8KJ766+wlz0BKFpr3NK49A9LlA/NiL3tTIoAZDOnu7NZZqh76J0XmfYI/l1Ns=
X-Gm-Gg: Acq92OEqPZ2ZN+xtNXNiOsJuGILeIoi09vHKtDU0Tf9kABPOUM+FWj6opaa7LX4AuV0
 HsTsEe+WbL5QUke8L0BC5q9+XzVEPhfo2SsFDmn2wjLL4tbrccUjU8tCSgKNray6lqyXxaswHls
 umdpeyFvFQAemM0OS2qsppgZijW/9ZaUaGX3+Q/msqG88mERaMUyWUE1TA0+w7MHHuKqZ+6g/nL
 rpiGVAWTxm2y8Bf6AACdxbqoIm0/UvnKLQ0hLuBPYazy3BMlI37IZkTiO33xaaenzTjaT1/nekU
 5VNkWb8lqlL7LLV6lr9Oc930JsbHIPzkSejOEy5ugL/O5hnq0AsWsylQZmmp19PH91TyBLfSKWZ
 ML5DqIMVy2I+CiqtGvPBXYTeXws5PgYWBSH3XEF+SN3UZhI055hvrFFmnGmrEGzhqTxyQHI2kh9
 QAfyciD84eDnZYeTt0GhlwL61MdosP
X-Received: by 2002:a05:6a20:158b:b0:3a2:dc51:458 with SMTP id
 adf61e73a8af0-3b22ee25589mr10906165637.41.1778978038493; 
 Sat, 16 May 2026 17:33:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 58/63] target/arm: Enable FEAT_F8F32MM for -cpu max
Date: Sat, 16 May 2026 17:29:57 -0700
Message-ID: <20260517003002.321430-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a43b6367a4..7a47af9f5a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1398,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 875716d18f..83967da12d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
-- 
2.43.0


