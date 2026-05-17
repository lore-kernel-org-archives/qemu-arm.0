Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51190CD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSw-0001Kh-IS; Sat, 16 May 2026 20:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS7-0006zV-S2
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS3-0006pp-Gy
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:54 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c80167f56cdso351192a12.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978030; x=1779582830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=QdPtkVlrc7puKAqTg3IkZIFyN3+GQ7HlZJNUuISC+jW2cGoIL12/BWm86FHOgDZKFD
 AzfJcpqLmryBchQVJhQvEXbAP1AGSitvhRU61p+egNF8tOEd5dIrC/ZQHva8EtyU5J3x
 PQa0Z9WCgV2eBWZf5cKq645hngOt6GjsAyeOQfZRD7KkMHsQchF6mwbf+LFkD+4AunmW
 G4Co7CbXKr1O0lyB3uIOPzjfdSJ+6hfFDo0u32ZXqQcgO0ZzJwwUNyBHwGxKnXsMOMlX
 T7kiDvrpA+fdgK1ze5jFelKyFqx1hKswN3E37qLYcaKE2vSKG/xzzVu8fck+ckS0bot9
 tWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978030; x=1779582830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=jmU6wPEVCOXIm60cdDooItneq2COo96vHzpl82jlaMAdiNOMIuXrfWq4IhylKiYZWA
 ciaUR2G3XdIfSRZJecfrwjBtcfDtrEOmIJxgCSJctTFeO0eKRz2o+j2Ndy7ycb9U7OGd
 EflZlpqxTnGh4bIBIr8eUUifON9wqwCYDaVtdKb+E7XyzO9i7gYQsBtC61oDYJNomODb
 nfzrA5D/XYotZYYLO3GyHmmsqmgwMJFZMPOQUWgLjUmqeljpW0+mONuG3VF3NoPlqVnS
 mUMNevIHKLXpeFCGf2ZNYGvY9ppVA7j4LXSL+6tAUdPyiOlAQOzsllba4BjsiIwWsZ4A
 tLhA==
X-Gm-Message-State: AOJu0YzsjmSKehROG4mvs9y03fn/MGqt9pJof7qst6GTqH7X64l63sOa
 QjsYpado1S/VZ1kw1nzxe/gSK8eY4fC+2mB3pUyzi2aKMROAe/yHk1Rdu/WLxYBQ9I2jYIJNmjf
 5JGeW
X-Gm-Gg: Acq92OGRJQFgBdWi0wFL/hf+jT2qenaC7XJLs0CrQjcA64tUtY7D8D0kDXhkWnmTimS
 Guc33ckoxJozfaW+ZedqzWUTADk55jdJOphlu/1p5B0ivP+fP7nAqAPOAb0fyET6Lgdi2i1SjRC
 jlxM/+xeF5gQ1L7lPJAQ39mGJDcZHawvfbqv7e16RCD4EBD2tbFoZFcGYTRRzGO0YUqa2zMRB6q
 567X3rgUujd9+RG4IwrX4MufPa1RiMOXclLhrzPvQ3UFiSMdJevYP/MHFfrqiG4NaOA5YXuTOzw
 uvlGct3M5YUqhV9cLwX2ECvvCzy8c+5pLXeQkLji/xR6yrpMSBysdLQ+f7j08K3v8UiKo7/uq8J
 pjDKuSBqqbi0+unomQUI0f2ohEpofbA5FxPHP+oGaUu3rZ7OrZm7YmQtNQ4aNqmJdAPyjLV9PVI
 l/jN1Tgbrk3iabitY0CUQAxKDbDVDN
X-Received: by 2002:a05:6a21:3294:b0:3a2:d79c:415d with SMTP id
 adf61e73a8af0-3b22ebbf030mr11725403637.30.1778978030092; 
 Sat, 16 May 2026 17:33:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 49/63] target/arm: Enable FEAT_FP8FMA,
 FEAT_SSVE_FP8FMA for -cpu max
Date: Sat, 16 May 2026 17:29:48 -0700
Message-ID: <20260517003002.321430-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 90214a355a..93cd7ee1a6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
@@ -1395,6 +1396,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0dd6b554a0..a6b48f9c60 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
@@ -159,6 +160,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


