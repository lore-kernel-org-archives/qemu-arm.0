Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDABCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jL4-0006dH-KD; Fri, 03 Oct 2025 13:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIj-0002rF-0y
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:39 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGs-0006L0-65
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1837052a12.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511314; x=1760116114; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=zqhee6a4Jy/y835uPWE3T++7tqtaXqaAu4n0XXfESygQJV7LKa/Z2lAbf7+XL6ACQo
 qjmRmbGmnvjxljpnAzC4kbS5XdoatqM5h6PqV51IV3nJyr/rAWgnILg8HvJ386yekEss
 UZCW94D4flXxJJvNYoWYxwYGea0X40ov783dN/TAwWPI0be+FU+Ju8sfw/V6nc4eErVU
 r45dqR1cO7SfF3vUaPgrCoeRHWmv8gD20KuQs2Xxv/6ry17d4PhPXLEhXZTfigHfqcQc
 h1RBBnqb4vQgc+YlpzOE6b+43UYr2h7uCqLKkdUGJ/vCb/2EzfZDj/NuYr0+uAX+hSHP
 kjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511314; x=1760116114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=KCjGjb58mQJsK6+jquW0Xa46t7oNnRDX26g3qo6iCczBKjBkdCD2yXL0xtZcH61732
 HANgMxAxg5LGH4ZmIpSoGN6MYH/jF7MFa7h6jVIOspwDVHKNyBRgp6n0Uy6UwWQved52
 aSsUkJfu5mIlv/X6L3FAttiVMfZLQDhVn3i1zvOset490ZEOuzrXJMgdOGLRapOyqZvo
 Y/Ioux8QkEczPlRBu6bkx3nRyPnkDSioRZo2De92bBt89gn4c6/SruABWGSD2Vn4xagg
 T9La4//sNyAhOo7tOWzLrOHLpVSlcFhr99SeETJBbNKOFkUcLI4hSTQHj353SKnTd2Jl
 Orxg==
X-Gm-Message-State: AOJu0Yx+k9Jko7uzb8SFeApc1YTIKLRNbb0U5GagdtYhML5JAnsbXg8N
 uv5YhFrt87DP8E8sM8PlViYO2Cl0nguZhVGi6lLHwSGca23dI4O2/TJ3+IFnZLeII3VksnZd8Ex
 aU4zOc/c=
X-Gm-Gg: ASbGncumLJD0MRqmsHoWAQaoPoV0bADBkCdCcrTw044Fj7/aT9MyzTX1WLbT+DaDVz9
 GBr4qMqfQKOCDvGEspZa52KlMpzx1LxTo5GAsaC1+i1S5gtZ5cP9SVuDQBnI/ORxdmW6aOpDAnn
 FxW5u8NxHQvYRBzuhDHVhhj9y5GAw3N/Zd8RUQRfA57LZU57Pm4bv5RMxJCPC1R6Xtjr8FqJvky
 V/YN3rOtx5scF8lFWyc3mOjwq+Z/OM/NZPWiZcGA7ZX45y1v8ZDKXo9r+cjeXB5/GkOaasSjFj0
 YuY/KtprI+p/bRWmOpHtY3ha6b8/piss85REPPun4Uj80GclW1sDMffSqk5o+blvSsumeVq9l4e
 TpUt/J79Lk5/L+boSa8mRF0JTRvYKmm2ub0Wka+RbcJqpbwCgawRH2jPQ
X-Google-Smtp-Source: AGHT+IHHPH2eo+gn8HuZaXgjtZoE8TLzvEvIqr2eYVvLr1/WDAKMrqZAAjhXqKiEC/W1xyXyd/LAug==
X-Received: by 2002:a17:902:cf0b:b0:275:f156:965c with SMTP id
 d9443c01a7336-28e9a67c6f2mr43261225ad.52.1759511314077; 
 Fri, 03 Oct 2025 10:08:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 37/73] target/arm: Add syndrome data for EC_GCS
Date: Fri,  3 Oct 2025 10:07:24 -0700
Message-ID: <20251003170800.997167-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


