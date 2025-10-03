Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C9CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jO9-00021J-JD; Fri, 03 Oct 2025 13:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLH-0006mz-DP
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK5-0007nA-4l
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:11 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7841da939deso2509158b3a.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511514; x=1760116314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1JpGP0BQWN7RXZ3yq+jOGIXDfS/M6HeM3al8dI5nEQ=;
 b=drDzNyvdS+LWLXMOw8kAVaUEUUE4c+VLtVe9IcmqCJO3BYm1IMQvbhe23EjpTJVexj
 DZnbe6ontTpbFdvLvVMsPA66piWfUYRu6Yds/yK5IyRR3s/dmY0WnDdcohuJBgDhMfmL
 eluCRYZHLI/HktjoadNoImUep25xun9vEI9T3/4mDb3EPefiWqT4lmInbS4I3epsKEQa
 ZDyNrdEmKKJF/TYkl/SOGJsc+nlNZVnOWJ4cbjq64CvK5Xa9JVljnkK4oXVNXX1eTMiU
 XxCtMb2xVyetbhsVh7BnCK1DGiulafUJMjrki5XOpaFt0TsMf+QgdHpxH15Ce2Zogu0Q
 bdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511514; x=1760116314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1JpGP0BQWN7RXZ3yq+jOGIXDfS/M6HeM3al8dI5nEQ=;
 b=TLOZku8ACYFYCfoaGVlOUZqT4M2TDDI1W0FiifluNXEEYRr5sSIs0KWCzYJ1JgDClp
 dcHdzEbCbMPMPK/+7WBP9/JNXJTJL79XK6TxCSmWIH7IrCNo45a4kYTrTBA2zTPMNyKO
 Iys9r2j97pV1VVmSU+KNVV4HvEgsrL1qkQNptKpzNXGS6W/giFK5dYm9KSKkDRlxZxdj
 BEmhyJ79qMhS9SLcLElRETPnEpgs4L1RfoZSMHEuM/fHXQbJkJBQZ9+eDcYphI6vxdR5
 tVlDiFDtWwgNemgL7jv+e3vG18wWpbmKtMjv4QsEg+wnAkPNiFCLsl2inEhQOiS5sH2I
 vP1g==
X-Gm-Message-State: AOJu0YzWkZblAeBuZWtZnc970Zm+9W4X9ykFv0oVWVzJe/l04rFO+Gn2
 GyXPgQOZUkVSEoX2xOiikC8ciUyVsPVy7PBu85wRt+lO/3xRdnm/NCIGUr+YqAGd4r4=
X-Gm-Gg: ASbGncvWHd6e3pe2/+LRM1t8Fy/O/7aUOrMXmpbbzVqPqrgY/WZ3p1L1cOTJE5fqN+o
 2O/Q3xzwUQJ0O2ndoDKYzMvJdTLjUC8KQIpqT8hSwaeR7Mxjga/nOKc1WWougLJd8O06p1TOo8+
 awvOV7PBXduA5phDKMNp4h8ZgMEzQUxMUxmnT5ZGegTYVmLPSjeJthcznaHdnU90lrfZHK7zLoM
 Sil5ejA9uXO/Tx6iwAb74bl93ibat9MHB/BkpLSZlwC/ZQQbxlY0o9OXxnBaieKZvXB0MFpvQg5
 g44L1HOkBczCT0fVLCtkftXqsYWdasUTbALhIox1HYdhvO4t+JXz1lmV5aunkX2SGGveKnTHOh9
 sVBj4+iyh+wmKY4nATyuP/ipKCbqpo6q7BO5OrEuIAnN8oeeDP7wiC/05
X-Google-Smtp-Source: AGHT+IHn/M01Xi+Jzpp7JsS8hrA+ywh4oSGcZEB1Q7DD2SbZqkorhXLSEJTCLGhe0F8/j5UvaVpSLg==
X-Received: by 2002:a05:6a00:2eaa:b0:782:2f62:7059 with SMTP id
 d2e1a72fcca58-78c98cc35dcmr4606125b3a.22.1759511513997; 
 Fri, 03 Oct 2025 10:11:53 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 58/73] target/arm: Load gcs record for RET
Date: Fri,  3 Oct 2025 10:07:45 -0700
Message-ID: <20251003170800.997167-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 271c2c6084..6e51a0f6f2 100644
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


