Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDDCCA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXea-0004Gk-BA; Thu, 14 Aug 2025 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdM-0002r3-Lb
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdH-0005HN-A7
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:44 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f30so239853b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176677; x=1755781477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i64S7qZsCHHdPDpq8ksGAk8kRM2Uh0PJ6yALnXosnoY=;
 b=ux8zKGCdC7botG/+LPEPlBMU1lOaW4bMGOmlB8QmT5E2LOEc+1S3tiK9oixQsZQBWo
 9/hK1WLCl9gVk4jQ1xv2cRRcjbeMWqKipjbhyeDEcdY6axAYF91xME+Y8/kQp2JbZBc2
 gcaVfrmr63PUojYI83Lnt4or3Wx0JdvVvpvfZnsIj8Xlo6u2nT5BGferHSV64w+G3DsE
 OzUCnAyxT3RQEfb1GJD1VEXzUxruoo0WTjBXdcS8V4BzkaZE2IwhE3TqkKSz46xi+XCR
 76Bne//mkRxNDuzotWcsugojM0diT/qObWeo+/yEIgwLpUsJVLHKVbdID5yOp63COVDQ
 GJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176677; x=1755781477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i64S7qZsCHHdPDpq8ksGAk8kRM2Uh0PJ6yALnXosnoY=;
 b=FwYrMCgIV2c1AAs1z7rBrShmL4eSIDsPplWj6QjAmfvO43jGTKlu/Q2Zaj84lYa9PQ
 xuaAeqKWReLXpFkoX2F8744ypzgsMAXcRepNoHjIoxtemQvYaFRyAX7dgyqX9ugshBgo
 BI/YKhE8Jy4euJFDpe+i9C4NljcmGcB46KhooJ+n+3tfp7hE2i+UmFvs93BaYBU98f+s
 9rXoryKdP1ol4ImleUJHeZq63EQWFYeDq0QFac+I2O/hITP+pAFaifpdG8k18Xum934B
 qMrHNE/Z5/DmeaGmJhGRX7jEIlCAbdtE39Cp/55Um00IhhlBG9hIH3E/PIIPBj+QCbNo
 7W1g==
X-Gm-Message-State: AOJu0YyeXOdiUOoc3N/LonUS9keJaxZbdj4xxrbPH4f6Yr5FolrONh22
 IFDu4V1otpYiYgisQUqx8jBoqqDnq0Pj3vpX3gQlmuCvFR1u/TfcfZgpQg9/3rx7TUKyAZyLCJs
 w1NuFlrs=
X-Gm-Gg: ASbGncu1zO1v21AbhgdV//CAjIuAA9G0iyYeIi/48ZNQfwPl+j9RMADSS9covpIqNJi
 ngKBner3yEDG+0O8bfID3GIADSIHz9pSGTWc8wOAb1AS8HWVo/xJxOAQ+bn0gLVut3yFaofuOBn
 wcU4Gw7RNNE3RsHsoK0maKV+bFKH2tEGEsRiU6MmPhnrkW19ql6Yb1KmpPeswHzvciJQUiiYPHR
 NLctxUAQTLFUcmdNJamubhquCAIQeEbBWZNAQ4I7e43GvYoMXhMNhrN0/ovnND1jCHmVf9WmlKm
 vIGwwY8o+7pDpop0bOUMm+ZNp1cix988mq4pm69JtIcTylACaEjE2sTSNGf/DZ/kcqSdgaileIY
 t3uJgqRsG1jx6SNTymfcuFiHIPxEK+nSt1z2KEiPw9m7Q6lI=
X-Google-Smtp-Source: AGHT+IEplvwIcDhEOnC2JwWRLbhEbcTy1X4Jl+h1EEjLQEiv0+y/akf33iQks9+DV0FTlr0krhXgew==
X-Received: by 2002:a05:6a00:1746:b0:76b:fe65:71d2 with SMTP id
 d2e1a72fcca58-76e2f90907emr4062466b3a.10.1755176677389; 
 Thu, 14 Aug 2025 06:04:37 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 65/85] target/arm: Implement GCSSS2
Date: Thu, 14 Aug 2025 22:57:32 +1000
Message-ID: <20250814125752.164107-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ee8b870e17..1ee0bfd132 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -53,6 +53,7 @@ enum {
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
     ARM_CP_GCSSS1                = 0x000d,
+    ARM_CP_GCSSS2                = 0x000e,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 51fc8298af..b70bf47fc6 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -128,6 +128,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
       .access = PL0_W, .type = ARM_CP_GCSSS1 },
+    { .name = "GCSSS2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 3,
+      .access = PL0_R, .type = ARM_CP_GCSSS2 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d97d9bfcb7..70dec7d505 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2660,6 +2660,35 @@ static void gen_gcsss1(DisasContext *s, int rt)
     tcg_gen_andi_i64(gcspr, inptr, ~7);
 }
 
+static void gen_gcsss2(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 outptr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS2, rt));
+
+    /* Validate that the new stack has an in-progress cap. */
+    tcg_gen_qemu_ld_i64(outptr, gcspr, mmuidx, mop);
+    tcg_gen_andi_i64(tmp, outptr, 7);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 5, fail_label);
+
+    /* Push a valid cap to the old stack. */
+    tcg_gen_andi_i64(outptr, outptr, ~7);
+    tcg_gen_addi_i64(outptr, outptr, -8);
+    tcg_gen_deposit_i64(tmp, outptr, tcg_constant_i64(1), 0, 12);
+    tcg_gen_qemu_st_i64(tmp, outptr, mmuidx, mop);
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+
+    /* Pop the in-progress cap from the new stack. */
+    tcg_gen_addi_i64(gcspr, gcspr, 8);
+
+    /* Return a pointer to the old stack cap. */
+    tcg_gen_mov_i64(cpu_reg(s, rt), outptr);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2976,6 +3005,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcsss1(s, rt);
         }
         return;
+    case ARM_CP_GCSSS2:
+        if (s->gcs_en) {
+            gen_gcsss2(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


