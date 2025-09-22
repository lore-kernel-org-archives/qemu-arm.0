Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43E1CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:00:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lj4-0001wM-4l; Mon, 22 Sep 2025 14:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lg3-0005AN-P9
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfQ-00050I-0R
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-271067d66fbso23380215ad.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567212; x=1759172012; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+vOWjqjVhjZBnSwWBDevzrEa0tx9HH7KqcxFqdDEmU=;
 b=uW6B2o/CM2+IaJLevJfESwJNpiXLH4j+jdbcAn/igTAgZaIClYYWl1MeL6h3F6NIOQ
 g2CX5T9OBpMrCRy6jdQr5L0wznXZ0YblRCTLDGDKnrgYvmxvgAWAe/KKinDcHkkPD0uz
 RS6K5ZflFGk94pmKDqki4ppOvsxy/GDj9elgnBysED0vxIjP9oLjSM8UQyTvS3J58Iy7
 takEQmp7kE5PfUu+Qg3teWG1dReTB2OQS/uIyfkCNWFerdssqsIPDaeqVI9lbdzVAFYW
 qsLAYOB50x95uRWe45tV0Fn8eWyjAYDT2inBKEbo11gQhIjGzm9dc5E7pvbDX3QSnuhe
 xYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567212; x=1759172012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+vOWjqjVhjZBnSwWBDevzrEa0tx9HH7KqcxFqdDEmU=;
 b=S+TNALJrs4LTWMoihJrqX4ZbNGKerTViSQ5GgdtXNfXw/vbg80MyazxqvRH11ABrhH
 cMvP3a+E0M3+SO0TjJV/4LCbeuMiuF2ac6RsftfjS2ZyGcJANEkPMdhbsvINVkxHqaKD
 VA+twctb5fUWmggId2sLbhyxztCGL+NLLPr23MdCgC3X6alXsQbvwcxYN8Gs173mawe6
 NQulGc1rG1isV1GY80aZAqBnHICFOq+U8vk8K02U4ruJD8clw8EtDVxjyoza2mkpjvJy
 bBR13guDbGyg+2QQw7L63zPusFeOLWptHEzjQCckHWgBx9dLgeZkKNUeCJWFxvx8tLqG
 Ne5g==
X-Gm-Message-State: AOJu0YyPTB7uJYlYo+Cl3/aCj/IHAwuNAmXO2eZOa8SboQEg9W2fD7DF
 o4eRYH8GKmIj6HSqKooDi35iiWOZquqAPUjfreJ6AS44GoKibt4OUEsfvvqIkaxfS+s=
X-Gm-Gg: ASbGnctgltOxBCPkHA+93SIGbdjtBEmai8vbQ3nhZQO8kB3bTwBec5C3M2E0Vq2gg3o
 LnReSbv0MXuyyhVMdqJdC1rsPireZTfKdqe6rQPRgtYjPWsDO7mpUbqwWMeDeXwbTg42CSXOGKJ
 u5MbXB+GHP3oaGcINaUTfEE282CgJD99VyTYvVahTo63yjPc54F+3TB2jWy37CBxeoobz7Vcv7q
 9v+uc3bS1ryqYaYgtC7pNq7vPD9DM+ZNsISUPYCE85duaUdwQe5MDkGMpy1S6d/qU+evLKB0gcw
 vH4IrNgVSVW2VJU8gpqDTLYbTAi5QugDg92PVmJNqomqhkZB74eu+WlPL2CBbI8b0duYO5P2S+6
 WVkx8YZjzOhln77Rhb8FL2faku2pL
X-Google-Smtp-Source: AGHT+IGNEaenhRPjkiWefT5VawfX6fEyYedFzSnEHNie8boIk99AOG8zaI5Gu0fNV5rh/WxUwvDupQ==
X-Received: by 2002:a17:903:246:b0:269:a8a8:4029 with SMTP id
 d9443c01a7336-269ba3ea13bmr199516385ad.5.1758567211882; 
 Mon, 22 Sep 2025 11:53:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 60/76] target/arm: Add gcs record for BLR with PAuth
Date: Mon, 22 Sep 2025 11:49:08 -0700
Message-ID: <20250922184924.2754205-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 79fc7b8c3d..529c5bef0c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1842,21 +1842,21 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
 
 static bool trans_BLRAZ(DisasContext *s, arg_braz *a)
 {
-    TCGv_i64 dst, lr;
+    TCGv_i64 dst, link;
 
     if (!dc_isar_feature(aa64_pauth, s)) {
         return false;
     }
-
     dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
-    lr = cpu_reg(s, 30);
-    if (dst == lr) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_mov_i64(tmp, dst);
-        dst = tmp;
+
+    link = tcg_temp_new_i64();
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
     }
-    gen_pc_plus_diff(s, lr, curr_insn_len(s));
     gen_a64_set_pc(s, dst);
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
     return true;
@@ -1892,20 +1892,21 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
 
 static bool trans_BLRA(DisasContext *s, arg_bra *a)
 {
-    TCGv_i64 dst, lr;
+    TCGv_i64 dst, link;
 
     if (!dc_isar_feature(aa64_pauth, s)) {
         return false;
     }
     dst = auth_branch_target(s, cpu_reg(s, a->rn), cpu_reg_sp(s, a->rm), !a->m);
-    lr = cpu_reg(s, 30);
-    if (dst == lr) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_mov_i64(tmp, dst);
-        dst = tmp;
+
+    link = tcg_temp_new_i64();
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
     }
-    gen_pc_plus_diff(s, lr, curr_insn_len(s));
     gen_a64_set_pc(s, dst);
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
     return true;
-- 
2.43.0


