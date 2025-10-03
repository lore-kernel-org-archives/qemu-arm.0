Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF7CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:17:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jMF-00006b-A5; Fri, 03 Oct 2025 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKz-0006SV-C3
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK2-0007jj-4t
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:57 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so2286847b3a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511506; x=1760116306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKVwHws2E81lmpOGsqQTC7D6uz/WlppkXXosqPtslDc=;
 b=wAGpOcYTM/n3rvpjmUm0PW5Lc5njZqoi51IsIXwfIry6pWEWhs6MxOiHJ2xD4BKpTd
 rzujfVOwqAkgpViJG/zuszMYHBfn3y4BVafSDQRAbzB8GjkvGNmthsNjtcQrdrwylmkn
 EGzTU5oS+ceoYE9l8wklp5dJtkkp16Gq+3aD7ieTa1zrxqRGN+KmD/J6xa49pw01ZMmF
 lxMgybUvQqIiu/rFl8NyumgK67LmGBTDZ2XcqIVbcJHlsXY5hyYuHeZSVNyM+AG6S3yH
 Dd+bZ9l2Mvn7uha4vN2unrk52l/UAt577dbMO/XbnxSmsphPQai4my/4FQMFToyktvcm
 ExVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511506; x=1760116306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKVwHws2E81lmpOGsqQTC7D6uz/WlppkXXosqPtslDc=;
 b=aM3h3gdciEa8Pd4U2QmadsnTUQF8bYE8Va//fuxozrApeQ8BzkBQqEzoHB+QnZReJt
 2eqXZwmFCPNvkzWn1NWllFoStMaX4ZFQXb0mGkXCGG5P3xNk/0Cj9m2mxcJzYnHy/rgz
 AkzIs2v7fK3trfzBjykh7MIi8+Yv2gbl4koJRrm4wZQ7v4488XjlxNZlDNpOkOy3gRYn
 ZBA7kQ8J2GOPRpq2IHqda/50FfCfuj/MvQ2h8Nb2gwApcrlISPnxMor7KHeB61yFI7VV
 ICRO1twcPdEWCyCNHuiYhf/f2RuLRynjJ74Tsc1gc35uUcxJw1zHURUyPByXMx5tZYXT
 OYdQ==
X-Gm-Message-State: AOJu0YyCS6yq2ivbNByEXW+X8qrNIND6bwuNzY2DwoHKq61P73NiEyaH
 kVYfxOa+aS/R2YDwp06J7WKoq972CMgSdiF+QcgdpmPlZe/rOzC4HXWYtE0SMPiUDDo=
X-Gm-Gg: ASbGncuQNB+PMF1Ow5gDLTmMuIt6/P35HqLcHYu5HO2uQNu5q4oeqWXLuKynBKwX0dZ
 aMPFrohE1II2WOl/8P0yXWN3RSepk3PNHleLFFY0F2PVmozUyyG3gg8bXIsh3eVFzS5YtNaHTdP
 N6fRF/R9P430nQfJvDnLrOg93hA2fnCoaaK9jahaw4eVWxoa0I6U0vkotHYculP6qDosvY5lQaY
 Sa339Yw+IJJ/qV0GDZuFGApPCoQEWpRO3edqqwAOvwjsrBgf1KaV1f6w/MUSX1q4DDmd4ac2l7O
 GXLeuyjVhA8qsZO/h41r5l69ZwTx4CxpeSYQBvxv87IyQ/LeG57gb99etTT084zzpkKrziTgHS7
 qaoxcSKosllgvbCRoQzwuEH81ygCtWLqw/t3cx8WQdmoq5CeH8yfZSk3k
X-Google-Smtp-Source: AGHT+IEc+dgvvu4jhGMltzx2DSohuAnsrUVkcO7ZFPUzFK3H7F6k6EgVGHlVgVp0wPWuQ85R04gNKg==
X-Received: by 2002:a05:6a20:3ca6:b0:251:43f5:caba with SMTP id
 adf61e73a8af0-32b62121a5bmr5379695637.53.1759511506130; 
 Fri, 03 Oct 2025 10:11:46 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 49/73] target/arm: Implement GCSPOPM
Date: Fri,  3 Oct 2025 10:07:36 -0700
Message-ID: <20251003170800.997167-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 24 ++++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d22ae383cd..81d8f0e32b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -49,6 +49,7 @@ enum {
     ARM_CP_DC_GZVA               = 0x0007,
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
+    ARM_CP_GCSPOPM               = 0x0009,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index cc5a0b86e4..15d383b2a4 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -100,6 +100,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 0,
       .access = PL0_W, .accessfn = access_gcspushm,
       .fgt = FGT_NGCSPUSHM_EL1, .type = ARM_CP_GCSPUSHM },
+    { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
+      .access = PL0_R, .type = ARM_CP_GCSPOPM },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4fb73f821b..6e088d638a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2521,6 +2521,24 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
+static void gen_gcspopm(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 value = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPM, rt));
+
+    /* The value at top-of-stack must have low 2 bits clear. */
+    tcg_gen_qemu_ld_i64(value, clean_data_tbi(s, gcspr), mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_TSTNE, value, 3, fail_label);
+
+    /* Complete the pop and return the value. */
+    tcg_gen_addi_i64(gcspr, gcspr, 8);
+    tcg_gen_mov_i64(cpu_reg(s, rt), value);
+}
+
 /*
  * Look up @key, returning the cpreg, which must exist.
  * Additionally, the new cpreg must also be accessible.
@@ -2832,6 +2850,12 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_add_gcs_record(s, cpu_reg(s, rt));
         }
         return;
+    case ARM_CP_GCSPOPM:
+        /* Note that X[rt] is unchanged if !GCSEnabled. */
+        if (s->gcs_en) {
+            gen_gcspopm(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


