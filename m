Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41064CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 21:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9M-0003vh-WF; Wed, 08 Oct 2025 17:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9M-0003vJ-2Z
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:44 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c91-0006co-9h
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso5219845ad.0
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960578; x=1760565378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOmykAHgNa3WEY/QflE4W9ZlUUYk2FsFplQhf4AR8Po=;
 b=YOl6EAI+U0Mw7IfQW2cFV6GzZecUs+ikyRswWKtQERxILkm3ZmdF0QoqsQeRHA0GBr
 L8/QLkxe1l+Z/QQtIsRLMiqQSHURCdspwBTkeC45kW0sVxzZCQMdYzSje6Dgt+Y4Sjj+
 1uMt64S66EMuwo70D2s2Og1ZYzcONEpr+pmEHHnNnW1Y16y+YkvcgedgEvZ1QHRqv5RA
 ANC7iQxtU+WcHvZB/ArYZo9iEqhAin2KmT7QyuGyHdBBSJ5hdb8KAIqP7kCPokl6jk0p
 8nTmhG+cshfDLOH6AoODmPWJkGSur2kBavyQRPBolHs4UtqwdXxOFfOmnxULWcpLke42
 aatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960578; x=1760565378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOmykAHgNa3WEY/QflE4W9ZlUUYk2FsFplQhf4AR8Po=;
 b=rMWHZuDkHzo4pTa2Mg4qL0WsGFVU+XckS7/L+o6X6Kx1L4GM78l/7v2qREzNVTgRB9
 I19SQoAtrUYsdN3Qg3iqa2i7/HdHUXOdbm5HHZIECfTYZTrFxBJzOfhXSnXgZWG8quLL
 jAbCxi6gRkg+pE1t4awfpKbPJFMdARPu+S62j1CcT/RJORqNDXsiBlmYcun/4n1R/Gmx
 3PtK+wKRD9ay62q3RBR0AEywfDK4x68SYtgiIIlXfCObWYOnQjagHWNlG6KsGMIIL9ue
 lyaRQgEA6o1YQFKsR+Kv91ixRz4WT6/7OUMB2qVVDsTpvpor2S3DVor1EZA7+3DDx+J+
 eITw==
X-Gm-Message-State: AOJu0Yx6wBQsCLp3PmIOwoG1Lg4TQ7GKiQLx2C5p9Q/kqGPDbCCegR7Z
 xjJsKkB3WdY/3SO+cl5YS7uyfvxe1g8DefFyptZ3ldtvfDp+NF7D8Cw0lDQZxSuRtk0Vn3sjAiD
 hMOn13HY=
X-Gm-Gg: ASbGnctNAnInnbep6jBsKty3U5+oO9TtLjM0/T+N9+tbyEVMJvmvJqmaHk8IGHp/2ze
 GlqoSSRHwNMNKPSU1WDY59+cj2f6SYs2IKyVopdpQ8zS7jwFkgLbLYxA8R0eIQyUJG99hPakGZC
 /qCOAota01WgUR+051kNaBF0JhZ8eoZg65LAONZzrZZTTtUwXKW/er7iBroJkFm6BHf0tOduR6y
 tHqMvLgZUZFSvkOTlla3dcvD3wD17w2N/i4H5bYiLeunD2sJBb0ojRCzYVMiiuTp9OrJFivXU8Q
 7MtgFDR8FvusG4MBMhb2X9k5jur9jHx/WR3yXJaam+MqOfIptCJ9cdtd9D3XGRkuChPt9Rjo0Dv
 snxFiBKcOPcIidJKC9q9fsVY0x8Wg9Zf4ggZFmAjqB7Ae5wlCreCPRs7T
X-Google-Smtp-Source: AGHT+IFIc1sMRWQ1DMGeLiD5H5uxjSFsVuPFglAK653ydnsFUyyjNZ+EJagFGxU1YzpTaBwMxV7asQ==
X-Received: by 2002:a17:903:1a06:b0:27d:6995:990d with SMTP id
 d9443c01a7336-29027f0cccamr57745065ad.19.1759960578033; 
 Wed, 08 Oct 2025 14:56:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 05/73] target/arm: Force HPD for stage2 translations
Date: Wed,  8 Oct 2025 14:55:05 -0700
Message-ID: <20251008215613.300150-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Stage2 translations do not have hierarchial permissions.
Setting HPD means we can eliminate an extra check against
regime_is_stage2.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c |  7 +++++--
 target/arm/ptw.c    | 24 +++++++++++++-----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20a189ef4f..b7bc27436f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9397,8 +9397,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         tsz = extract32(tcr, 0, 6);
         gran = tg0_to_gran_size(extract32(tcr, 14, 2));
         if (stage2) {
-            /* VTCR_EL2 */
-            hpd = false;
+            /*
+             * Stage2 does not have hierarchical permissions.
+             * Thus disabling them makes things easier during ptw.
+             */
+            hpd = true;
         } else {
             hpd = extract32(tcr, 24, 1);
         }
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e03657f309..2657023120 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1507,8 +1507,12 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
         }
         tsz = sextract32(tcr, 0, 4) + 8;
         select = 0;
-        hpd = false;
         epd = false;
+        /*
+         * Stage2 does not have hierarchical permissions.
+         * Thus disabling them makes things easier during ptw.
+         */
+        hpd = true;
     } else if (el == 2) {
         /* HTCR */
         tsz = extract32(tcr, 0, 3);
@@ -2014,16 +2018,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * except NSTable (which we have already handled).
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
-    if (!regime_is_stage2(mmu_idx)) {
-        if (!param.hpd) {
-            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
-            /*
-             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-             * means "force PL1 access only", which means forcing AP[1] to 0.
-             */
-            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
-            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
-        }
+    if (!param.hpd) {
+        attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+        /*
+         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+         * means "force PL1 access only", which means forcing AP[1] to 0.
+         */
+        attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+        attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
     }
 
     ap = extract32(attrs, 6, 2);
-- 
2.43.0


