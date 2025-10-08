Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A9BCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBh-00061o-A9; Wed, 08 Oct 2025 17:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cAk-0004Za-Cn
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:58:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9M-0006l8-QN
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:58:02 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-28e8c5d64d8so2864365ad.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960598; x=1760565398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=zYcVMHKO0nr/jQUN2AsIL5FNrgGEl9kv1q2hSGB/H88WIQaia/V0GLeYeOvIR3GcOT
 GbiS0tQWydWcJtacKyKDkjKDXMFfN7QBiblIeN0WZqu8bpzeCPQSW0bhp3qxe5mx8LB3
 JGDb6new5kGcaDMnKAstH2B76INcPF32c6zYZWw77sdore/h6fmqqLinuwRv3pXmGLT4
 mvYvWsC9iPoEyYg2oR3vLDMSRJG3g8r2dlD77hDhFyu/fwyurZNkHfOUJJMfDF20hkPF
 vdmaKGInWN2dUA1v/rLLeGQ2ALHiB65bEQNssZPfmtn4PRbsgXNQlZGJvemCSLOyr4QC
 67HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960598; x=1760565398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=HJyah3uEzQnZtA2D26FWw41zstOo5FGQzwg2e0qR/3kRdebAB7kutX7X1DGjO786F2
 WVS/J5FQVFJqrHFV/eOiLKCy6/I/e4PTKn5+bHL7Xtmdm0oBmPCWqILhvFaMAOpysvvR
 uS/D8X/nxUH+VWZrH7nROz27bV70ee8B/lDXLQvvh5dpPTf1c8EJ32GACK4KufSNbpa/
 zXjbZV5kGqBm+IiiIEQ7M7OL4afIFHDRExxOCwEDuEddvgW5SzomBV4p9FuUOh4lHsXW
 to/mv5WMeJq4Zig8plaGtvHd1zQ0+bvb65S+TrLbdyRxsCMkVVnBGAv+bjxIWHkSGCDG
 OAvw==
X-Gm-Message-State: AOJu0YzchIxS4BFTda9tgMoAU9SZfhffQP9ZHVdUU4RORvLlVnGOCXJn
 kddPaGnjmXPEKFU1nkTwtabjMN9t7bGJdS5rjVToOUZIY57jEOFFFp4tWPpDBGZsV4o=
X-Gm-Gg: ASbGnctMoFG+2KiHLC9n5UE8yamlGTGqeK0v9mNtrLydp8DWPDh/JygqbJJpifeceOR
 ATro6zrx6DQPmG0p/hQ+IlrCe/IOWCzgI8U62qQHnp6Qh7aGhqfvWTLmjZ6g6GatFjwvKcgy786
 vnZFbHLAZqZszTvDtGB4/wXPxWGCF2Udkpe2wN7CU4SpDtL5S7ZpzjkjELA8kasT2goZUQ8kYtS
 WzEtOaF0K/RxoI23+Jm/1UtxKMJr5qD4nBH2hgigH2+rai1WM30D2z02f2EkMyef8IhAPeVdIJv
 y17AaP1N9GZSqgg9JEaM21OXhCVH/3tLy9j1M7umXX2Y2rtvcTdAHaTEWc8Zw9Ycr/KXAeQ/hnM
 z0ocIsXqiygL/D7lJo4PK7B27n55em1gIxd95pbwjVbyLbgGMdXUa/V7w
X-Google-Smtp-Source: AGHT+IFNp323MT21XO0IoyeqNVm26rrx90X52pzFvdz0IPr/3c7M3vfwrS8lLHhR7bXD/fAwmBafyA==
X-Received: by 2002:a17:902:e785:b0:267:d2a9:eabb with SMTP id
 d9443c01a7336-2902739ad39mr62768875ad.25.1759960598326; 
 Wed, 08 Oct 2025 14:56:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 37/73] target/arm: Add syndrome data for EC_GCS
Date: Wed,  8 Oct 2025 14:55:37 -0700
Message-ID: <20251008215613.300150-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c48d3b8587..bff61f052c 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -63,6 +63,7 @@ enum arm_exception_class {
     EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
+    EC_GCS                    = 0x2d,
     EC_SERROR                 = 0x2f,
     EC_BREAKPOINT             = 0x30,
     EC_BREAKPOINT_SAME_EL     = 0x31,
@@ -83,6 +84,23 @@ typedef enum {
     SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
+typedef enum {
+    GCS_ET_DataCheck,
+    GCS_ET_EXLOCK,
+    GCS_ET_GCSSTR_GCSSTTR,
+} GCSExceptionType;
+
+typedef enum {
+    GCS_IT_RET_nPauth = 0,
+    GCS_IT_GCSPOPM = 1,
+    GCS_IT_RET_PauthA = 2,
+    GCS_IT_RET_PauthB = 3,
+    GCS_IT_GCSSS1 = 4,
+    GCS_IT_GCSSS2 = 5,
+    GCS_IT_GCSPOPCX = 8,
+    GCS_IT_GCSPOPX = 9,
+} GCSInstructionType;
+
 #define ARM_EL_EC_LENGTH 6
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
@@ -351,6 +369,23 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+}
+
+static inline uint32_t syn_gcs_exlock(void)
+{
+    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+}
+
+static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+}
+
 static inline uint32_t syn_serror(uint32_t extra)
 {
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
-- 
2.43.0


