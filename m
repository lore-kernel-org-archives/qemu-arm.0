Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E6CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lgC-0005QI-IU; Mon, 22 Sep 2025 14:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfY-000458-Ij
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfD-0004yQ-Eh
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso4423115a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567204; x=1759172004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KT3njcGs3vlqxz+Aow0s8BlO+cvKAJjqrO8q+9uXab8=;
 b=DDgZh9wrDbwWFozu/+amIkiUQw7D+zpuO0mpBwPmXJMIWJyMehxXILD4YAGn27UG7s
 v73nriBqgQ5tXia2aYmIUipnU74OQpTE/ATNx4lbRjWmUBlgbu9A7n1BYAmLZhTDd5e5
 AeyBobKM1CNP/RYNPKVFZEHgnPuZ1SfbgaJWgtnJEic3gK9SUNKhg+8ijXVbrr/JPsWk
 5sHNmIBwWPbA8yCsJ3mOM9sMVziHvZo6Giw94gsHANS/0oPVjkJFy43gGPt+pVqk//rB
 YJS5fGeCqS+2XKaqa1wvNqnc/EI255B/j3lKYv31cKXYR4xCsdmdl1tQhO3AvmNErkLQ
 HKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567204; x=1759172004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KT3njcGs3vlqxz+Aow0s8BlO+cvKAJjqrO8q+9uXab8=;
 b=wHbyuV4vmZFaIQn6mlkACoQ8CMzBWgUCpHIyGBt54Y6tojuOl1rP/MjI1DO4jjDl9C
 numdWVu7VGULkElUVCSxXu7bGwDLcFxGZ3qQBG7TDYzhT2+TwM7up4fqTEOL7AP/puxl
 9rurf6AsB1Bl5W6BuZVipu3D30s0zib8UR235XbA2Ka/KYxIj5VXXoQpeBk1HV9sqnpq
 W9qlkOfzjVmjFzsF9pSmma2uVh46fiK64wxmdTkDCP060JTa1g65yDxPboZ8jHrAUHon
 hLJYg8P4SimVIO+Ay+RIg8iHtM4rLOWbihvYrobOoLvjgYJdO+2ALBJoT1cBoqTu5Qvf
 7jlg==
X-Gm-Message-State: AOJu0YzTR/4BPC3EyBW/evin8lsAxZ7qWqe37hsA2Y9hgxHGR5lRRhp2
 gx0aOUqIraR0FmXMdbK3orNHsRnmiuGjQffzx0KPJgRa4pa+TqS4BZWf5pV4KP2ASLVSi0dxJyI
 kUJBy
X-Gm-Gg: ASbGncugw5nyypDl01KMfnKec0QOD0oF2XUrqAri3XnGEWKV1yWrigZeN6Hh6QuaUUQ
 jTAZSl3SbqsGeXJv3G2Q34Tcr5TRcd9Nk8r5ruUHZg3rEWdSzKl+FoWalKvb99O+bPO/VUqA9+a
 R5ZmiLXfht+ZEeUlOBqpLeNzSF90safuDICDQ39xMmVF2FCnNPOhQEQwZWvEOvSsKaw8+GAd0ax
 g6rQ1xQ1xbcILj/GlOZGTdLh4GPFRBuDCgiok2L/DtHaQt3oNypk8TzbyPWT4x3AyUrxImFZZx9
 g4inmqpIsFJ8C9IlIYt0W0w6ChUXfDRRC0gihyFxz0KjzSw6x9bZst19kEmvtFG1y6ZgE4c3pKx
 CzP1ru+9iPY18CrsdkxRr3vo3S76e
X-Google-Smtp-Source: AGHT+IHj8n8IItN0eTMc7vp39f1NJ0fYhpL3F7oia4f6F21zcFsXwWHfljHADvwuyM0xrZpybIogxQ==
X-Received: by 2002:a17:903:b48:b0:24b:e55:334 with SMTP id
 d9443c01a7336-269ba3ec96cmr146371725ad.8.1758567203575; 
 Mon, 22 Sep 2025 11:53:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 52/76] target/arm: Implement GCSPOPM
Date: Mon, 22 Sep 2025 11:49:00 -0700
Message-ID: <20250922184924.2754205-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index e2af10c075..c52b02b003 100644
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


