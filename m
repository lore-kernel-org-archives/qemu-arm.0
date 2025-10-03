Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D609CCD183
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:11:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jIM-0002de-Jx; Fri, 03 Oct 2025 13:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jI9-0002Kv-1r
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGk-0006Iq-4H
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b4ee87cc81eso2276179a12.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511305; x=1760116105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKF95GX8K6UQPc+7dLjJ/vwGmksDSxb1988rF41Urv8=;
 b=J48DYCCyAApblPb2Q3wd0n66qeH7dPNIB4Ge0fZu9disWHhby52oSK7TvmLnGa99o/
 0+NLqbzPAkw3yRuzWQMlrlbikQlCu3w4E8Kok8yP/C+SIP07afdkAlV+CGT0F5YG4LI+
 +NqcUnf6AMxJXooeQvEkuGNvJF9iwrZdumdSX6ox+SiKAXjTJPxTPSrAqOFX6jUP4bOP
 sekPQrpvH0iYOeY8V9DYMqE461FFrffEUnB60AuJT8bDj+U7xGXP/Pfywq/DA8cCpNyY
 qV9v9bTXNxurx9hPyLISes9C63YsKuXGmNNciGSY5MXrQ0552Stf8lzwgVSftP82YFlN
 bMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511305; x=1760116105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKF95GX8K6UQPc+7dLjJ/vwGmksDSxb1988rF41Urv8=;
 b=KsfF52+M7ge08aIkJnF14n4s2eqGUOW8iAOzD3JoGVPsDi5T0Y0CzF11KF2oA88bpn
 TzYH2alsq5Ylh3l9RJYRGDW9lS0IJ9drk8KOHjGtozvjRuEZgQjYrknnpTw5CjNoZwtr
 sfJUfTRs1268o7qFC+qDblKTFizlICxh3r7QKT8tUvQMjM1OhK7QaGmGTBsVbczGAK1i
 4KfSBN8xAozvKKfyXVhcouawhkACM4IKE7Xx27dTZgfAtKC+kVzhilU/NIDxxUc3vj9W
 rS+Aidr4B7FRUM826ZPADW6MLkulTOc2+hhd5YgTeHPvWYYBdm0VhyCujm8gHK8Et5AM
 Rvjg==
X-Gm-Message-State: AOJu0Yx9U4bIF7+K/4a7T8X74kT7NKpvQes+QznX5jGGmleoly3nDScJ
 dWHjCTFUMGvqQWNnODohBsSwqwlBz9SwWP4rCfsBLBxBBsk3zeqtKDWgrbZp+PcKIKc=
X-Gm-Gg: ASbGncsuUFimWpnBLmaAb1tyyz6uubKZNdc6HtU3Ku2SzeNLfwhQjasbHTP2+X45V7E
 fWs7DUsFobgXTEF0cu4CZse77l1nxf+3UXNhucePEKerVv3j3cAiGTDyp1WZ0Pn8VDjGV8CFgEf
 lBxiaLl/OSedGvhsi9nmI82yKydLNZ3Ov8e2sMmNhGm2Z0SEXNdbTQLD12oc0La3TL+8cQ6EM23
 egBC/PZBs7he1bazGKwj+pIMFVHl9iaf/W0FoPEotdVB9vhPnacwDnlwqUMRDL3ae+KGwWUqpvD
 0pJ8D91iLBVB5fWeLtf4eD2Siuk+HTqmFqi5MAWX5lSDqMw4SRIEjoBW/66QWQMQiniI7V6NWd0
 o4bH/4eQJ8D1mnduIiX2Ab42n6Y9Fm3Ungo7MymZ2tgb9SmYFbehqQz8Y
X-Google-Smtp-Source: AGHT+IE4K7uHGkmGXPg3lUBtZWUdqvklkmDjnEcYLYcKRAKsB66TBgnrdFR7QAbG2lTezYO3sp0EHg==
X-Received: by 2002:a17:903:3203:b0:273:ab5f:a507 with SMTP id
 d9443c01a7336-28e9a5ecb03mr54658395ad.21.1759511305114; 
 Fri, 03 Oct 2025 10:08:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 26/73] target/arm: Convert regime_is_stage2 to table
Date: Fri,  3 Oct 2025 10:07:13 -0700
Message-ID: <20251003170800.997167-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index 92883b6c0e..591b509e68 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,11 +1027,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
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


