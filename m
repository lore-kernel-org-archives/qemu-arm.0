Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31C9CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:01:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhW-0007EJ-Ld; Mon, 22 Sep 2025 14:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfr-0004yv-Sy
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfI-0004za-0O
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:02 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso3455755a12.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567209; x=1759172009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9D+fehUgbWL+gWO3WeerFLaijU6kYDwf2dSp0estdI=;
 b=pio1LLdoWM8OqG3hxvjPpGD1z3ej9Rj7T+2KThH2I90FXHnWlhf/VhBghtuSH8vnq8
 W+YGvoZOjmMtRbhQEfHlM0pAzCW//t33l+5zNnxllQQTxqJ9e/jk6Cj4jQ8PWOFoa+4j
 KJxNJzPwq783YRhPmJ4intfSDc4WlKJuEszdHOoJy5o5lFoK/t+exvGZ3c/olP1bonzX
 4/C4T/18vXNl2kgkgwqxMmAXYSqltXi/v3Sf4zpQvikguuoAmfZkUFUSK6CYwSApzpeY
 fbxW0cdwZUu7XMutFU5Od2pX1u/bQNWOunSBiJjl/GM63TWPwh/a0XiNAvUjb0xRIXNi
 Xhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567209; x=1759172009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9D+fehUgbWL+gWO3WeerFLaijU6kYDwf2dSp0estdI=;
 b=IYkXVm/oeLPDLBXgxiOFmu/i6ElDIMV77GNuY8e/3IAb5Qdo4Q+Y/EzGH244G4txhO
 BTQsWeSmTXgNYW0y2UKCjj+uQCke4X05PVTjeTVWnGwQgbA/ymmslj9ec8qD43qOavg+
 fn6193wUFRnHS8sSILQzSITCVceuNlwbse+/DpO6zAm5f/dLdKwntSirOlX6aY5yIlGz
 9PtnDvB6vh6btufDOqc7QiZnUvViU2FjQq3Vos2qa3eL+tREI27w1cSI1ju/cuRdKfTO
 P/b2PvJwoxQRfy6jNrrJhvYJEI0XDsRafwgo2bc7rIyKZ1vZf3QSQ/Bi4ubTrAXeg2ky
 tLKQ==
X-Gm-Message-State: AOJu0YyvUV1YoBsH+r+bEHgmcOniGnVvWwCvirfBYtoJboPkP0+j2IMG
 a1Q+eTbUC5WGO2MTJMMA+XBuXo4WgB/iqA67PdHimVsUmPMVlAEhFG+cw02qsP6hEV4=
X-Gm-Gg: ASbGncsRDcO6oGUNnCtanqQPYypUQAdPP6sOL2l+F5zA0l4zFqtTMVi/zEY6DbAN0gf
 us5aL/PjCHdzHC8dALPPS1UU5iKO+MawXptK72FZMGj678bWJQI6hVZ/K8N3yd+UqF3UN3bofB0
 +AM14XBXlAQ78D/Eud2EkLYIASdHp4aSoCZSpnE7zcWedH7T9OGErpw2stg1VIySBpnayZUX5wF
 sO05+B0Q7SIKehsEgxRlgC+3RkvF9r2IFO7J9a9L++wlAUTEgGZ2bhQqeRnIdPk6oE5O8xT8Hqe
 M8AhAWSoxPlG3a1zf4ZAvuAES9pOmKfSzQr+ATgf62rLEQCQQRgKYyOlVchzZNTz22ICCYB6RS/
 l/G9wyi+BHbMWkQIRlFj4smXz9gFa
X-Google-Smtp-Source: AGHT+IHBhJq9LgTMKfvvEOZuuS+eirzR9Xj8AOaDe7roxLo/US/Sm70MW/WO5CJHenG5Bk6RfC2pUQ==
X-Received: by 2002:a17:903:19f0:b0:26b:3aab:f6b8 with SMTP id
 d9443c01a7336-26b3aabf9c6mr171634265ad.58.1758567208812; 
 Mon, 22 Sep 2025 11:53:28 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 57/76] target/arm: Implement GCSSS2
Date: Mon, 22 Sep 2025 11:49:05 -0700
Message-ID: <20250922184924.2754205-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index e7e7050880..732c07506d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -54,6 +54,7 @@ enum {
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
     ARM_CP_GCSSS1                = 0x000d,
+    ARM_CP_GCSSS2                = 0x000e,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index eda5c498d7..1ed52a211a 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -132,6 +132,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
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
index 54e7546c8f..dfa2a6d64c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2668,6 +2668,35 @@ static void gen_gcsss1(DisasContext *s, int rt)
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
 /*
  * Look up @key, returning the cpreg, which must exist.
  * Additionally, the new cpreg must also be accessible.
@@ -3014,6 +3043,11 @@ static void handle_sys(DisasContext *s, bool isread,
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


