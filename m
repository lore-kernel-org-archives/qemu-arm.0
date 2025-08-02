Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3400FC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:01:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLnl-0005Cb-M7; Sat, 02 Aug 2025 19:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmA-0002rh-M8
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:34 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLm7-0005iY-U2
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:29 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-73e88bc38bbso1152838a34.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177787; x=1754782587; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxHv4sVJA2ofapZZSOKB+oPZfBz6mz5HrOhjLCHq2Dk=;
 b=OU+X0TPRaRF4IzRhy4JGwpYtZf9TH3ll1da/JT8q1WFqmZfFcTTdyFpDYVCq2ur6NS
 a7GIQU9dtFdWqb3V9Jg/FjgYrpBZsEYbuvaAX3CNBwdhiIaLhcHZ5hD4RsvujGutBgGN
 oLYnuOkskN2mHlzuJ4WEun1NOUGuqkfU+lXux9lXt8bxUlmNDe6rrr8cP0vKyiH+JWoD
 aVt9QY4Cy3OMQ6WSaDLqsDZOBPgkNtl3367t5oNGorsOUsgDxvHNxbKJsGO0WutjhsBR
 TusZ9GtKTZ8oKdaJGWLV/GFK/iofzx4fQUmmaQw8uQIqglsRFnKSSlsztN/gKrQFp5uB
 8CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177787; x=1754782587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxHv4sVJA2ofapZZSOKB+oPZfBz6mz5HrOhjLCHq2Dk=;
 b=TPVMV2Orl7h0x400+sLduIP9xZ9pW2YteJz/f7QtdEYR/uoM1u5n7vZEg6k6K4G94T
 LfeR3CjFIH60cCK7OWTjdBSqo/a/FCNB6xhW7G/dD6scT/3CU3Yc9Pj0ZgPFQG517n74
 OeTzl0no2w+GcH0B3BwIgqX3aGgpvuFYHhm5iNdtmaFSOmWCWmGQlOykefq5xN4Ds0VR
 o1oUtN6zUCUJmaykhspiHJSigoFqeofdOaBRq1DoWlDHSoQTG0noX+fo24YFvDpbDWFf
 yTT08LS+f4f2bUCCAUR8nLKnNwpRbPstT/GwGYL0urd9Ol3uzNwNv3+w72kI+2/6xK+r
 t7mQ==
X-Gm-Message-State: AOJu0YyCxR0Go89hfBLvuiN5BOd7eZfYEMnye6qm7O2UXa2h6SvmPkUD
 SGwEtbfCHC1WsUJhVaqFQabEAVhORnc55CTF3ZJwxQe6Q4BOeE3zxESFM87cQz5oDd0=
X-Gm-Gg: ASbGncuaWMruSasjNeldZgEefjk+MQVjrVoXd51A7p+7JOX7mZL6xX1cG5XlSSRXBFZ
 +Hq2hmS/xufToneYDBsmMPkiKvy7b1Zu9vDkyTCjMS75QoUHNjzHivVlI296Gf97o4iYrGXyx9J
 ThNNNwE/q8ZLRzsaCL+BCHLw+3RkcsYhKMhENTHV+UriCqK/gZMhU9fq86C2d+VwWFTj+taD6NF
 F45jN62DrHguoj0Ua+NCxuW8dmFfzd5bDVDdYQfvK1PV8tRoGaw21+FU3Piu8DrjlxldwsEV4N0
 YAQoze8UAMug0qyCvJ0pRCwyMFXJFjOJNO6gD4vpNVvJ6RZbZvHTaUtiikRcl0QimBb6KIq7WoW
 xvA92G40t0FyFlkUlEMrVbGxMOU1tHemxOKuhSLCRTxhOjcWsS/Hd
X-Google-Smtp-Source: AGHT+IEowArKYJkLYQrzgta2QLOSAHklVrAs5fz7ZJnOhjNNduf4UbSlSUqz1OEP6Or29GwGcopEFA==
X-Received: by 2002:a05:6830:440c:b0:741:b12d:9837 with SMTP id
 46e09a7af769-741b12db2aamr258588a34.22.1754177786832; 
 Sat, 02 Aug 2025 16:36:26 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:36:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 42/85] target/arm: Convert regime_is_stage2 to table
Date: Sun,  3 Aug 2025 09:29:10 +1000
Message-ID: <20250802232953.413294-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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


