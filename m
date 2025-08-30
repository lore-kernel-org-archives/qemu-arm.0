Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B9ECA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyG-0005xo-Ry; Sat, 30 Aug 2025 11:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERB-0007OW-UR
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER9-0004yk-UE
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b4d4881897cso855402a12.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532858; x=1757137658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTDxsYCgOOY4AQ9WMuAsrWuHfULMfhqIx78Righ9ppA=;
 b=I5mOjV3FYRkpcLPc7m6fHjURVpBlsWqBL8YgmBi7RIHhJQOhsQqW/MEdGPSUB9xXkm
 tRqO9xIXhmVJfBxCbl0BZff51fUTMgj1PpyaVcCJH6MtJHcdg5hGnI8AHaiy6gmfdsl1
 CgAjVYvbQZdvHSqN97zyuuedSwj9h/oOoddYeb0wpnC+Xib4hOey3rzlfTbCPFQlvtwQ
 +IED2vNC46IFZqG+D2DaOfMQ+ATxH+ZxdEyZYy8uNRyaMsLqgHmcVjqaLGMKkhnvy/Ku
 UPJOgf8LPatfp/4u6oEtQ7zTAVF5PwbQxZ+thMO62GuwM27I7xArUgkYY/q/Ukj3YTfq
 rGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532858; x=1757137658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTDxsYCgOOY4AQ9WMuAsrWuHfULMfhqIx78Righ9ppA=;
 b=sJrjgarnDm8sbu58qcNKBkLG+f7sdN20v8qpCShHyAGe4Y5VF2bJ7hFH9Kvfys5S/A
 INDOGlaS8//aNSRqXL1R8YvrZaKHlRhqfXCqGc5qXTfGoZ128AGweNESYBPgLs6tf362
 9pR+geCRAqo+k3R2l1TyXv89ESeVTFJ7P3slhvayd3vawZi8awczdLpRkQ0BaG60w4Fp
 OyH54oC1j86s8FGgOKc4hRp/hFQtgCaiUhp2mFwUwwamwZLb20EsILy3IbiSNaogXH+f
 3vFS5szXg7SAdU39ZVks5vJzpG/kuzsic6UIEPljEwxWwE4q4FZpV9jrDyCgnM5hvk51
 DxQQ==
X-Gm-Message-State: AOJu0Ywk7u5mG/CxpiIfzJ9VitzTKDQIgl8I9EGYqWd+YWCBbZBsO6FE
 Dvypk0uUumn+bUOtAxmorQHJUEOmw8wt146GHV+sU+0OTiVt34hLxT183c9mEw4QU3HhBeGM6k/
 80FdwlNY=
X-Gm-Gg: ASbGncuHzEpG60ugd3N2yd9kx8S9/OjEfqBvG8apAtaRKg1PKqAr9Ul8/UWW+2FdTDz
 kPyUAkm5Qvac9xqNZOyzt9mC7R2x4m5dfn6uP8zUBVVgExBJLhQdb7oROtmuLh5/m/2//seMf0U
 u4RsXEwFSOUrPsKYQ0uq97vnDzFCQe+TpEtJ4cZaU/UUNTvlnMm+JqAwZYH4YxJEE9zDHt2Z+TC
 oOuayTLHw5E2l+mZPIpS7WzULeYiqraOnR2Iorqduxxo3uQFkm5KMO6JkaHq1OIkTBAiuPAPbx6
 EBkRRjVP7DkVjyHOgkT0ezzzElQJGBVe9657acejmnkCBmMlVAzsGojQUgl8CMZUZ47dtYF7mqz
 kFEtHLZB0enkQT2bUCu1RVoxWnQtchEh4IrzZEFu8nbqDR70ayM7YWMLeP2PFwatt4q97cCbVpQ
 ==
X-Google-Smtp-Source: AGHT+IGgtSILQQye5u6qfrHsW0PqBufvMgQVP8vFh1guA1yltmwCc3+ERwp8A0EEIAyH8XsmqHNebQ==
X-Received: by 2002:a17:902:f64c:b0:248:fc2d:3a2a with SMTP id
 d9443c01a7336-24944b6cf13mr14527625ad.56.1756532855967; 
 Fri, 29 Aug 2025 22:47:35 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 64/84] target/arm: Implement GCSSS1
Date: Sat, 30 Aug 2025 15:41:08 +1000
Message-ID: <20250830054128.448363-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 392a0a264f..ee8b870e17 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -52,6 +52,7 @@ enum {
     ARM_CP_GCSPUSHX              = 0x000a,
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
+    ARM_CP_GCSSS1                = 0x000d,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 3236f607f3..51fc8298af 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -125,6 +125,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
       .access = PL0_R, .type = ARM_CP_GCSPOPM },
+    { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
+      .access = PL0_W, .type = ARM_CP_GCSSS1 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 193c199a2e..e0ce2bd0a3 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2635,6 +2635,31 @@ static void gen_gcspopx(DisasContext *s)
     tcg_gen_addi_i64(gcspr, addr, 8);
 }
 
+static void gen_gcsss1(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 inptr = cpu_reg(s, rt);
+    TCGv_i64 cmp = tcg_temp_new_i64();
+    TCGv_i64 new = tcg_temp_new_i64();
+    TCGv_i64 old = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS1, rt));
+
+    /* Compute the valid cap entry that the new stack must have. */
+    tcg_gen_deposit_i64(cmp, inptr, tcg_constant_i64(1), 0, 12);
+    /* Compute the in-progress cap entry for the old stack. */
+    tcg_gen_deposit_i64(new, gcspr, tcg_constant_i64(5), 0, 3);
+
+    /* Swap the valid cap the with the in-progress cap. */
+    tcg_gen_atomic_cmpxchg_i64(old, inptr, cmp, new, mmuidx, mop);
+    tcg_gen_brcond_i64(TCG_COND_NE, old, cmp, fail_label);
+
+    /* The new stack had a valid cap: change gcspr. */
+    tcg_gen_andi_i64(gcspr, inptr, ~7);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2946,6 +2971,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspopx(s);
         }
         return;
+    case ARM_CP_GCSSS1:
+        if (s->gcs_en) {
+            gen_gcsss1(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


