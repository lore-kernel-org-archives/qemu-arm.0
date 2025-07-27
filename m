Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC0C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwQx-0007PD-EO; Sun, 27 Jul 2025 04:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPg-0003HN-Lv
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:20 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPe-0004qf-AF
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:20 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso31849565ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603637; x=1754208437; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPGoJwnTczFq0hUhh1/WUbQmW5Q+b6Pxb6X8smLgfxY=;
 b=U3rhdrPCLMbBLMWVo8dqfGUYl4Y51srOqTZ6cyln0Es5AYrSDqaxbAzVzmGdqLlhxP
 JHVp9L1XtmjN9IcSqbSOsffxpPUBFZu+TK+OUvhxSNoBDGH9X4H8PB3zZq7utIxURS68
 /kV1UpbWKLL6i2mAx2NYMxpgri4A+c8uTZxfZmHfzjL7SehRb8CZo+I4UwP58HMxC4vu
 mlbdsenEC5axepsaZMhbwY6Z7CZc3ouRIpy4ApANcZCG2fvRdDmjaNrqvgLD2f8BgahF
 B3scs5p2S+D99hY/udBdeJim8hhAjldHx/meOh0P0EncDCkIPCkZFrKrQTcDVLzpJTRA
 nAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603637; x=1754208437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPGoJwnTczFq0hUhh1/WUbQmW5Q+b6Pxb6X8smLgfxY=;
 b=e79DQRgYX5n/Sl744a3w4oesvooEX76I6xLnVR6rBvEULjmrg2V6LWDYUHzVvHEgM4
 7ON3RjDibHtXR9QNeVKUrmD3oyHsQal6fsENLuUzOqMnK6RKxbONWD7t2sLROPPCslVF
 lR67qh4fpZH4Naa70UrYHM7LAdCgfT8tcIiQz85JSV4c7DgXUVYuY9/t4cZRH+tRIXQV
 DKeHe6ahwkmzuaeLyzLHcytoK1FgLVE7lICGjx5dRz256zZ+nTUNjS6aZv/3wtpssLTA
 zR8xQK5QUueWi2gWROTChqSQ6OsHifnYjjkg2oJ1G2Cx+V6QAK+VlJB6mdU5XC9jv4Aj
 90ug==
X-Gm-Message-State: AOJu0YwlL1oFEQEyf8dfNCr7tTTMZpeyA0eEb4MDxZ1GTsR2NOAh4RnH
 T8e4FO0uappDyzLh39/GNyHLhdKgQAPYoYsa02DbaUkyTGY45Q1GrKexAkO6r3keDEGQFTbA2oy
 FTL7p
X-Gm-Gg: ASbGnct5aVpH4yB/t65DmB3A0Iu79jE9HMVOauJfGCb+PXaSOCi3jh4/QBxUXiY4TWm
 6DWx+Def5mtD2mwy5tD0gS+vmsTM5kRARqJFjZpETFjMKC3a98xvdOX3yiD02GtnYAlUvzeFgs4
 HYl1YIk0ydp9Ja/Wcz7D8QbOro17JgqboNioIR12KHEUgE3WRGuck1ExOeyG+CjZa23GoTnbrIc
 SYy9riauJCKLWzASjOj7NugpB0yMR1oKmqup5OzyxP9YlXv9BQ7vDlX3NZllhCoOobitXdiXqCB
 CYM4Oz0wx/GQDBNdpJ435MzygL3Us9j3VS8R3mvMJ9UTwDk9b3VEU6/B/Rn9Hv2rajnhoMW8dV4
 mwvSM0Gr8dDQ5gBsJzoKdPsRraFTo7G0+aujShFmKNTsmPZYMeyTg5UM9fV5dPVxouJUwE/aKNq
 ZZpgYyn2X8Ro8ulJH/0P7I
X-Google-Smtp-Source: AGHT+IEIRxYBJ603W4TXnAniQq+VBI0GlTfV2fO9AdN3n0NroZYOkJSO6Z4zjh9Q726DB8SpdfMkAQ==
X-Received: by 2002:a17:902:ccc4:b0:238:d19:864b with SMTP id
 d9443c01a7336-23fb3165b37mr111857895ad.41.1753603636952; 
 Sun, 27 Jul 2025 01:07:16 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 66/82] target/arm: Load gcs record for RET
Date: Sat, 26 Jul 2025 22:02:38 -1000
Message-ID: <20250727080254.83840-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
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
 target/arm/tcg/translate-a64.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a945fd3b33..49e17548c1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -433,6 +433,30 @@ static void gen_add_gcs_record(DisasContext *s, TCGv_i64 value)
     tcg_gen_st_i64(addr, tcg_env, sp_off);
 }
 
+static void gen_load_check_gcs_record(DisasContext *s, TCGv_i64 target,
+                                      GCSInstructionType it, int rt)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 rec_va = tcg_temp_new_i64();
+
+    tcg_gen_ld_i64(addr, tcg_env, sp_off);
+    tcg_gen_qemu_ld_i64(rec_va, clean_data_tbi(s, addr), mmuidx, mop);
+
+    if (s->gcs_rvcen) {
+        TCGLabel *fail_label =
+            delay_exception(s, EXCP_UDEF, syn_gcs_data_check(it, rt));
+
+        tcg_gen_brcond_i64(TCG_COND_NE, rec_va, target, fail_label);
+    }
+
+    gen_a64_set_pc(s, rec_va);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_st_i64(addr, tcg_env, sp_off);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -1787,7 +1811,13 @@ static bool trans_BLR(DisasContext *s, arg_r *a)
 
 static bool trans_RET(DisasContext *s, arg_r *a)
 {
-    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    TCGv_i64 target = cpu_reg(s, a->rn);
+
+    if (s->gcs_en) {
+        gen_load_check_gcs_record(s, target, GCS_IT_RET_nPauth, a->rn);
+    } else {
+        gen_a64_set_pc(s, target);
+    }
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
-- 
2.43.0


