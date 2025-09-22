Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D8CAC5AA
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:58:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lgq-0006jI-Aw; Mon, 22 Sep 2025 14:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lff-0004hd-St
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfG-0004yp-Qy
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-268107d8662so50271185ad.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567205; x=1759172005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QyGSBtDt/qdLtu6eEffMpzz9yijul6ARqOZAVPBfMMo=;
 b=jpleQRElbu7wspTOxSOhfnGJgrlXPIcdkfA14M0nf2EqIDWE+HxndIP04OlzbtP5eu
 UuJ63Z/Ywubs1bFfefW4U/gOwzs3jVTTu1kjfL9bGxgb1tgMXuxx7NUZLwPidr941u8/
 lNf+XekLiX2ofYPFBmypppLE1olE+4lGGAH5LzhuRYMTlTAUsdOc0hpU2b+1irbmkYHv
 JQV0zuCVmkg1Mvp9qNj/JYkE/eziKAhP7D4DLVL+JuSLHdNcm604qgarLPrtraCEI/Gd
 Js+cypvZbn5Q+pj4opyIkkHNsKRiNHRiZTu5uC2XkKVqq/dambtWfWjV5+xjejlefmNJ
 X/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567205; x=1759172005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QyGSBtDt/qdLtu6eEffMpzz9yijul6ARqOZAVPBfMMo=;
 b=JRX9B0cHpsi5IHcuq38EM7B+FeH5Z1WIXTABMF/9h5YkvotHt9tmWjsX/GZHeALmaM
 opOmLmxkPYuFw7dqq55dZT29l2UTspro8tNcMVSOwnPgFnDjia+J94hgi6RZeuP6Wsjj
 Mk2mKC6TN1S2A6mqPxA91+mQ1tQYqsoTWz4XIF0LT0h41vZLj3cASqv3CnWLgUHhEpld
 A1p3vtrY6oArBSg468i5S46Z0WY+nj6mBbTpKfYQStmXZy78i0IUlk1jK4Jz8X5KrN8S
 5Q2gu111jxAl+7+ckrrpTqOD/tTZIGOx6TM4QVrJkowg4ai6SupXY4oRflb2UXNPkHNe
 U6Gw==
X-Gm-Message-State: AOJu0YwvJ5jX1z/3cyaSmcevMw2UGVsePRdMtWArYLsRJn7hMZ8d8Ng4
 BeINUk6Zab136cRT52uRSgOw3o5j7Nu+5ZA8kfc3E7xaLLUy0bLU2Dad/8qb9Xsnyvk=
X-Gm-Gg: ASbGncvK4jQfdACZ1peeZYD+uHSkz66MUCAWPPjFI308Inob14SPP3kQx9qgPSFduLc
 iGOBgERWNqcAKSqvHYPVSQolfDQeaH06agGBO5MVfND//aT0+jCqNXkMNrOqysDZnu4jajxAl4C
 tP3RzHtTyrMILQezPgeiTK5oiK9iaCdFrm24Nw0ge1RoVJYjFSmA3t6c8TG+yJSH+s5bal6Namf
 NwyWmK9KxY4D5Vt+w7feJpNtnsdHSBbYXczSD6WxVD4mN3tMTQYLPiEzkvZZcNU9f0huRQn0edM
 hFcIgCFnEzlWlByiRIbhKa0ctr5YpK1sWY23xJsusysm354c8MqtnWYa8BmFYOrEqBJW8ugblL0
 2yWOBFEQkrh4Cwh9g8sYSAwDNHmO1
X-Google-Smtp-Source: AGHT+IFXmwOU7IOzEX3sH0O58U3wfiEe62J54tNcSMYVqazDPNrJv/s9kenDsHXUTIt1M0GkShBpuA==
X-Received: by 2002:a17:903:19eb:b0:276:9863:44da with SMTP id
 d9443c01a7336-276986347dbmr66180185ad.8.1758567205625; 
 Mon, 22 Sep 2025 11:53:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 54/76] target/arm: Implement GCSPOPX
Date: Mon, 22 Sep 2025 11:49:02 -0700
Message-ID: <20250922184924.2754205-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 909916b7fd..ccf45fd136 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -51,6 +51,7 @@ enum {
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
     ARM_CP_GCSPUSHX              = 0x000a,
+    ARM_CP_GCSPOPX               = 0x000b,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index e6c7025d02..5b5b895a09 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -120,6 +120,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
       .type = ARM_CP_GCSPUSHX },
+    { .name = "GCSPOPX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 6,
+      .access = PL1_W, .type = ARM_CP_GCSPOPX },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6fe6a77b34..c1852e2c5d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2568,6 +2568,33 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPX, 31));
+
+    /* The value at top-of-stack must be an exception token. */
+    tcg_gen_qemu_ld_i64(tmp, gcspr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 0b1001, fail_label);
+
+    /*
+     * The other three values in the exception return record
+     * are ignored, but are loaded anyway to raise faults.
+     */
+    tcg_gen_addi_i64(addr, gcspr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(gcspr, addr, 8);
+}
+
 /*
  * Look up @key, returning the cpreg, which must exist.
  * Additionally, the new cpreg must also be accessible.
@@ -2893,6 +2920,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspushx(s);
         }
         return;
+    case ARM_CP_GCSPOPX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspopx(s);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


