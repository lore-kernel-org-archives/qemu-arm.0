Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB1FCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:32:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleZ-0000LU-HF; Wed, 20 May 2026 14:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcL-0004JE-2R
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:06 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcC-00026t-Ut
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ba17c8cfacso49400105ad.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301554; x=1779906354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfvM4tnhG/6BVEOEoQSi0TAhQsUGcLPgZYrpPCn+HNY=;
 b=zNTtTz0ZxF0z5TiZy0NLJS+5gRq/bWnGg/GmNQPxSMb1+5+LXGYnyd/l/6dFCVIJ7x
 kSwzD+ChZrPMvPV6bImhE7W5wSPVM5vByiLmUvO22aocEXzFTw0EO6G8CoPaXxVsxdL3
 iSJxANi351M/YNvNdOZspNfS+/RVH2v1H09/tY5y1X2JWUrBC/YHvjc0TeFn8YzWx+Hp
 bgEtmwwq0KqLRtuGa0sS4raTM6D3yGan1NdPc/Cd3vL/ZVDjsOatnxpZbbTkAHPp0RSv
 0az/Sw/9IADTltnM2EPcIjCCMJcqys2xW1reBpU5OpGqpzC6ZVMeeshdMFpiLNiWDKC3
 blsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301554; x=1779906354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WfvM4tnhG/6BVEOEoQSi0TAhQsUGcLPgZYrpPCn+HNY=;
 b=P/hCKN/7I6l5SYWLjJv4SDGe1htx5W1WaHPZ0H8DZY9IyS4QyrNILMiKYWfVSSu2E7
 7/KXWbvsiV6l386C5HFcllDqLMsvnWqf/vS1GGGFRqjzIwGgwjtpuRJjm4pTL96lbJ77
 Typz+PTi7Thy6DzUs4AWlFi9wvjPl8cD7XcnrqxvpCC6YuidEeuMJL9xiNgcFF1YhtGP
 CRFwIjXnWSef19gHiwuMdfQZC+2a5wtZ2I+3n+jn7yBO70MdYXaWzYeb0OtJAWwqjDij
 5+gCXpdSG4eXIFBpsjFUUFdADbw1yXTNtjYgNZcHxFWtqExIAYUKe0xYDvGy+g4XIXH0
 AQ5Q==
X-Gm-Message-State: AOJu0YypLIU9z7UMWnAaHxZPY3el9Kg98PpLVErMIndr62YCdM63VzVd
 geLQ2rrYMvahIPUke01Ux3Z5j22odTxrYOX/LURI15ZosCI4JCkYQKR+oakoev+KbH7DyzzH7WZ
 pe0O59uE=
X-Gm-Gg: Acq92OEOzIAUcJnh040HNVKPKoT7TB9u5r3tmlJrQ5prd9qZbFNprgUj6QvZR3SMs5J
 5eOOLDj7JMxOj4JgCmFKvhkepMBuXdarfayzbd+XJGW6ljYKXSfK4BcVo0eNT6691otl+gZuGS6
 wvSZy3BBbmRyUq+Ch1YT9HXrw1DwOBNYatft8yfTodD6Hnx6LDNIYqkBZc72oD9wwIYT3BvNWmC
 ipxAbJ5fhTe6k6rI8DmwjTLB1VzNxm4VHfkyBhNLnHUEDEZQTPD6oS8+rtYLF21cj1xHzZH1dDG
 y1F7KRJ3c0XkElTKFiPBKbNZotbxHSP38LKIXeSriRhNO5/iUSqxJNZug8jUvKS0gqhCmaU/bxj
 AnEd7gAMwc2Ig/xnT5coi3Kdn9C2EiNJwj9F/e73HW1PxFEw8TO1om2pDUDLnpEvtnn4lPrCmht
 AI0YCvg/qoO0XOw0HUr4pF59TcOeXn
X-Received: by 2002:a17:902:d501:b0:2bd:412:21fb with SMTP id
 d9443c01a7336-2bd7e7fa11amr282700025ad.8.1779301553833; 
 Wed, 20 May 2026 11:25:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 53/64] target/arm: Enable FEAT_FP8DOT4,
 FEAT_SSVE_FP8DOT4 for -cpu max
Date: Wed, 20 May 2026 11:22:02 -0700
Message-ID: <20260520182213.872945-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93cd7ee1a6..6dec7e045d 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
@@ -1396,6 +1397,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a6b48f9c60..bee4e36dc6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
@@ -160,6 +161,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
-- 
2.43.0


