Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A6ECA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:56:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhk-0008Cc-Gi; Mon, 22 Sep 2025 14:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfz-00054q-5g
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfP-00050T-0x
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:14 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-26a0a694ea8so29190705ad.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567213; x=1759172013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lV01EAejMZtOUVdGrh8FhpDGLA+CmMEq51hjadKy0iI=;
 b=ckPdObCBSVtwzn8RZIH7YYJrxr9fcO3+K5S3lZ305I9X5CFDwFIadQMYTN4p1Xlntt
 QqAJ2d5mCvQMC6wDmvUguQU375Gvan+loVsiyQQimO86P37uGFgBlagSFTp4cCua4MOO
 j5O7AmfI32pH9MUBVcIH8YEvxZIh8dY+2hxpeUez+3oIjFLUlEDlszTtp65wjqU2ugfC
 gJKRXtBQbufkE6QclKXMtxNSrOoDImLU3jzGHwtHOAVzBFT4yjx2ear0ZS5EH4OAY/5R
 ZqIACJ7VSTEtwTRf0jPGx8t+jj1jzHwkXDgZ7+bA0pMnZDrmMvIUr9jETE99QOXvdrRP
 C4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567213; x=1759172013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lV01EAejMZtOUVdGrh8FhpDGLA+CmMEq51hjadKy0iI=;
 b=Wr65Y+5DE9G3iFa2qT/9/03TQ/+HxXgTqCY20s4PCU4EoH8joWnl30ENZlDNz0hLEp
 xenJ5RkI1Uif+1W+NZ1ugYBT7hZgImzLapijvTqAvGewk4lGAtifvdbnTCvvKJmfCD1Z
 KsjKRr0CyfXIMqmvFwuYlctwY5B3t5EvaekC6YKzO9i7EhWNyzmpJr1g1DvaaMNnSk+6
 GIMr9Qd3+jmEcaHKAoS9KM9evrhmNZlV1fKGnxqU/xQfYbCr8rV7kQjkqmg99LY0Cfib
 G/XbUtogQZjW04bvdB+xQYPTxpQPERucLZazOsGLQbWxe238OrWZwG8SFq4FDxdkIXg2
 gGDA==
X-Gm-Message-State: AOJu0Ywa/fo5EIsV/4fw3c2GlJXKhjsHeM/vaDrrd/sIU/R3+SdaqPAm
 vhoQPLSC5RMRpR5jRB1tPC0I4O2uZetbBFyyGgGitAX5e9A8djBquxrsmFsPaFTYdUA=
X-Gm-Gg: ASbGncueD96UlQrzaeI7d9AfrvdNVt0sfd2utYONlfNwNnlGS9Gs4xYtWqcy0ccoH41
 I/O8cIsFzWEdk8W6FkPKkd5PB/b5FNyf1SW8439nR38lvwps9iyO9hAm7kgNzcrb/9s1IzQyYLx
 i4S4swbxvdWCBf1zIdblHYSHCEkUCrByzRzn/c5KmwvISq89e5A3IITDvxgtYMRGYP/E7Ph24JQ
 R9AzvqnhOHl8jIE0QSQ95se66NFlQLqk3EeaAlJNuWZrVraqQyATw5XmzOQatRf2Hzt4fKNpRBZ
 qnoz2M6UPUCSvfTly+z2hPhdcB7cdXRw0v2VQWSH94xvOPfBzsRS0nuom8XdpjpCjVupA8euUKa
 7cdx9dkNuENGlEGlm1ZmFXMcGKA7j
X-Google-Smtp-Source: AGHT+IEpDmEToQ1+L5xmeMw9xV9VsFid0A5cTQZvLbC6YIXZnYlEPMA9Gc5twiztSWeSRLZ0KyGY5Q==
X-Received: by 2002:a17:902:d487:b0:269:96ee:17d3 with SMTP id
 d9443c01a7336-269ba523685mr157701145ad.51.1758567213071; 
 Mon, 22 Sep 2025 11:53:33 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 61/76] target/arm: Load gcs record for RET
Date: Mon, 22 Sep 2025 11:49:09 -0700
Message-ID: <20250922184924.2754205-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 529c5bef0c..462c61032b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -444,6 +444,27 @@ static void gen_add_gcs_record(DisasContext *s, TCGv_i64 value)
     tcg_gen_mov_i64(gcspr, addr);
 }
 
+static void gen_load_check_gcs_record(DisasContext *s, TCGv_i64 target,
+                                      GCSInstructionType it, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 rec_va = tcg_temp_new_i64();
+
+    tcg_gen_qemu_ld_i64(rec_va, clean_data_tbi(s, gcspr), mmuidx, mop);
+
+    if (s->gcs_rvcen) {
+        TCGLabel *fail_label =
+            delay_exception(s, EXCP_UDEF, syn_gcs_data_check(it, rt));
+
+        tcg_gen_brcond_i64(TCG_COND_NE, rec_va, target, fail_label);
+    }
+
+    gen_a64_set_pc(s, rec_va);
+    tcg_gen_addi_i64(gcspr, gcspr, 8);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -1798,7 +1819,13 @@ static bool trans_BLR(DisasContext *s, arg_r *a)
 
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


