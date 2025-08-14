Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11AFCA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:09:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXcH-0001Up-VP; Thu, 14 Aug 2025 09:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcE-0001NF-1I
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXc6-00053A-UI
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-32326793a85so840606a91.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176604; x=1755781404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIH4ns6evSuoDle8SRNEFdzHb/qidDpm/3DmttrGIbU=;
 b=nzYltbE/Y08OOrRCNWNG14YaM4sCmMzwKLiksn9Rj4opSBgUF/bsuaxs6ntUH3wH8b
 qV7htzlECKVP//tmOmsmmrbtyUtw9Azj9uPqtz7CLVnxPG4oYMt0er/b/KL9kzoyREF3
 iXpxH0OSgNl3lKjZV00ayse4bqsWJLLxUHeCxbzWe+rwkoHzsbOwZbqQ2KaFBlic/Vka
 0K6nvL23Hap1GeqPMUAJoPhFzUu0G64zlt0+L6HdJnntlB7nyOyaGgUxFrdnrIXKBCWW
 cc7gqm4ITZL4C10DNILbKmIw/EaoiphRcimGYDa7ksdjDaeiReTUB4tm5e/yKiZsdpyq
 zkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176604; x=1755781404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIH4ns6evSuoDle8SRNEFdzHb/qidDpm/3DmttrGIbU=;
 b=C7xSOrE+wcs335nYMCQV0A3KSXnFvauunqZZzQf+e5cXM3CJUpqv6YkW9D8p4jAmle
 8CDKJxz+sXKWf7od4UCn5s5Er49LWN7B/bxqVOcyxxFrvlQEwzOGvOT8HP1wKvEo39iK
 mF/x1jF5Mt50kLT0vu4W/ix9TrvD1uc3idIrw6T0vNe1r6upXYoTQzisYwMLsGiDUfLn
 +Gp7uHyCbazu+AwgSqGdyZlcDcwr9ITk9KfgTC3BSPHzs7MWs+BcvkKzxR/Ijp1oHq+g
 3RCvyBxpyhIzQNztE1arIlNrfoIsoA2p3F+UNosI74/zV3QSu6GHye1zYvA8uRCRNrF5
 OkbQ==
X-Gm-Message-State: AOJu0YxmWJI8/uvJqfkHAmHN/WUXBHxoFAo8X2ut0hvt/k/HVoYkP7Lu
 7yYZY4sBlOkyktMoOdGtZvu4jM/Ncq5vKODqjZLT4v1fKyYWNOA3L4RY41KNHpo8Cno=
X-Gm-Gg: ASbGncvrAe18FwU+56ELD88FJ+c3vl6LhooZx7gN55kFtE09Z2dQcQw2XxCvRDU5DJg
 zNgo5vYLJdDuyKRNMAl9CAX35nsMrKxeV0zI414+ZphVj9F0rRkIm/lsGudyej+348IjbT9KqKD
 umuBCFL4pN8m7QvXbCg474/n/mzXtv4N3nGnT7Ok3ciZGvEQTrnbaE9sYCmfu+9hBV6G11FhzGW
 0j43Pqy5JxXUxE2UtRkJ+TAVJnEIGGhqFZQjyKddWxlRg/rkk/UlC63lE6kL0wrYKvkkINYHXTk
 38w2XO0H7vDO6GfWaqJOjanL52m49DjXkMkJMgL427bENe1MMsxqloqMIGsOaW1IeyuI+4hUAqE
 pWibsvgwcxzR0QtBpFxKhgrSi2QBfyMyrXF6Q72tVB0inYLU=
X-Google-Smtp-Source: AGHT+IGu+Lg15H0v+ZfanwZeO5dTaRzYe+6X7f8+0yF9/RL7ArxQcTNL293XNGrYqJBqKGqE0nFrIw==
X-Received: by 2002:a17:90b:6cd:b0:315:c77b:37d6 with SMTP id
 98e67ed59e1d1-32327b48f6cmr4659662a91.23.1755176604246; 
 Thu, 14 Aug 2025 06:03:24 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 42/85] target/arm: Convert regime_is_stage2 to table
Date: Thu, 14 Aug 2025 22:57:09 +1000
Message-ID: <20250814125752.164107-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

This wasn't using a switch, but two comparisons.
Convert it to arm_mmuidx_table for consistency.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 5 -----
 target/arm/mmuidx-internal.h | 8 ++++++++
 target/arm/mmuidx.c          | 5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4f99ec69f8..805f4a1876 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1029,11 +1029,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
-{
-    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
-}
-
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index 55fba4aae2..1d948aa6f4 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -19,6 +19,7 @@ FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
 FIELD(MMUIDXINFO, USER, 8, 1)
 FIELD(MMUIDXINFO, STAGE1, 9, 1)
+FIELD(MMUIDXINFO, STAGE2, 10, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -84,4 +85,11 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE1);
 }
 
+/* Return true if this mmu index is stage 2 of a 2-stage translation. */
+static inline bool regime_is_stage2(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE2);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index c5b43a5932..61a682e655 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -14,6 +14,7 @@
 #define PAN    R_MMUIDXINFO_PAN_MASK
 #define USER   R_MMUIDXINFO_USER_MASK
 #define S1     R_MMUIDXINFO_STAGE1_MASK
+#define S2     R_MMUIDXINFO_STAGE2_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
@@ -33,8 +34,8 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_E30_0]           = EL(0) | REL(3),
     [ARMMMUIdx_E30_3_PAN]       = EL(3) | REL(3) | PAN,
 
-    [ARMMMUIdx_Stage2_S]        = REL(2),
-    [ARMMMUIdx_Stage2]          = REL(2),
+    [ARMMMUIdx_Stage2_S]        = REL(2) | S2,
+    [ARMMMUIdx_Stage2]          = REL(2) | S2,
 
     [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | S1 | USER,
     [ARMMMUIdx_Stage1_E1]       = REL(1) | R2 | S1,
-- 
2.43.0


