Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DDEC56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:32:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1wK-0004mi-HS; Thu, 06 Aug 2026 13:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wI-0004lJ-S7
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:30 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wH-0001fw-89
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38fdeaed181so3023411a91.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037488; x=1786642288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1L0+rBxezIyKN6/2AHClvxFcunVGgHr8jfzeunPqo3I=;
 b=HVvrYuK1S1ZkS8V+gBOCGT3ye7toOhLZF440dM31C1ShjLEAoC5bOX3BFgeoCiP1nX
 /eo4gRRc4F/wbSlEGujpwFSskEBrRQGBlmSslukx7HoQ6hSy6ZWG5xygTW85X0E4Ip1E
 3C8+cG8L+KeopxfAfs6Wj9cclKmplUYEX8mMTI6Skx8W/sXFE2xwXlobUuFLsSft8q8x
 ZoVRrFPOUu/azuUUYxNnX6AmE13Sa9KeWNo/xaytrKP7PAknaTFbBn/sMTJwuw2i+4gM
 OqWG+iFzUQTZlxPjQq8uk+TMqY5MwxPulNvr60ryEPBgoy49RLCjq3ZbGlmG/1lGR+z7
 RBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037488; x=1786642288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1L0+rBxezIyKN6/2AHClvxFcunVGgHr8jfzeunPqo3I=;
 b=kM+9n/ECiHt6YHcUT6i1o+ZCBWrJTbB7HloFuLcapoZnEVlUEMex1khAU0Evhvocyo
 vV29yb8u1guRqm9VUZQeaNYIrMpXfIxA23+cIPoLMiCwaQcpOTbpyGryKS354yIf0TcN
 +BkNfQM+ZYU/lDcNxTxnT4y4/cynqytYYY1CS3+8RO+fbYzB1uRcfQPLHn3/TgfaL7c6
 dr7gxfCj7h3EfLvJrcJZatk/BLMPHbePVDjmSYbh4ki5WyZMBX3KDRsN7NHJLnneT6tR
 1GM7UJWIwAY48BiqnuwT0KZBXQsVi/zP6diWjfr/GUbh4xYXVoDyvV96HzCqJzJ3c5MT
 iREA==
X-Gm-Message-State: AOJu0YzLzFwSiDb5HJZx5Vtxghr0C12hjM8zTtCq8EYbxIPGovNfjQ4f
 UU+6wc4YmTvzhXI2HPF459ngZxC5vbm/OG3u9KsxVGVNTIAt7hExj7rMqI1Y916MZh4=
X-Gm-Gg: AR+sD11msZKU8QHYpjxtxElVkrD86/WXMdyWGoQCMY3GuYqC2tNs92K9v6yfsr1ve4x
 eEWqrPQf6WHHicNb6hie06/bnXeS5PoY0iYWgWE5P29fKHflpt4ATSgMOD5Km5wvGnIzZHjcBTF
 90M3bJ3F9quRQgl1k5kFsI3Ot1jIXQhBgSBkwL/64IL2TNoEFQVw0hk0QCD5fmDUfDwmxVjpRiV
 ay0E6evUaaotvJxG+Zbm2IrviewXKcx0exUan1fymyyGGXnNLPUEJeZaDPDxp2cVYy8km3EG3Wc
 O0LB7O2I4TOIvp/aD2KHm2rEyhcmrzS24uPUvQBEqT5xI+QYiMrVm/li91/FTnJ1J/yDyvgdr+r
 3QHQi4VjkZTjXDrW9/ERQ3JX4qFZ9OBleKT+82cgLey3hlVp1J7sgdTq0V2DBLhtZSa+aoxDI2y
 o8tvA+pVDYbU+TxnAGIqkILagGoHminzKrj+Kl0K5wygh/wOcAIQMrY04EesfzJkSR1zW/E6Ski
 nASJCgpH414nheBw9k1
X-Received: by 2002:a17:90b:4b84:b0:38e:8021:2ea9 with SMTP id
 98e67ed59e1d1-3903c5f6482mr15178690a91.19.1786037486581; 
 Thu, 06 Aug 2026 10:31:26 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085e4a2a5sm1983711a91.14.2026.08.06.10.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/6] target/arm: Enable writes to SCR_EL3.TID{3,5}
Date: Thu,  6 Aug 2026 10:31:19 -0700
Message-ID: <20260806173123.333423-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806173123.333423-1-richard.henderson@linaro.org>
References: <20260806173123.333423-1-richard.henderson@linaro.org>
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
 target/arm/cpu-features.h | 5 +++++
 target/arm/cpu.h          | 2 ++
 target/arm/helper.c       | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index d6f8b4d065..f0b354445f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1402,6 +1402,11 @@ static inline bool isar_feature_aa64_idst(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) != 0;
 }
 
+static inline bool isar_feature_aa64_idte3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) >= 2;
+}
+
 static inline bool isar_feature_aa64_half_evt(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, EVT) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a471b87aa5..41bfda65d4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1786,6 +1786,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_EASE              (1ULL << 19)
 #define SCR_NMEA              (1ULL << 20)
 #define SCR_FIEN              (1ULL << 21)
+#define SCR_TID3              (1ULL << 22)
+#define SCR_TID5              (1ULL << 23)
 #define SCR_ENSCXT            (1ULL << 25)
 #define SCR_ATA               (1ULL << 26)
 #define SCR_FGTEN             (1ULL << 27)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c88af981e2..8ab0075628 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -796,6 +796,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_rng_trap, cpu)) {
             valid_mask |= SCR_TRNDR;
         }
+        if (cpu_isar_feature(aa64_idte3, cpu)) {
+            valid_mask |= SCR_TID5 | SCR_TID3;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.43.0


