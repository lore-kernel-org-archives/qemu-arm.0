Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50580CCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cDB-0001EB-3m; Wed, 08 Oct 2025 18:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCr-0000b1-DZ
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCQ-0007O5-1Z
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-781db5068b8so254034b3a.0
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960790; x=1760565590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drSty9Fd0kDDShwUBu49hZpX2v+dbl9T54JaBEZWELs=;
 b=N3gH4dP4EADrETg9FOmNa2l6B5ako75mK6zgGu1xmTJN4IboJTlwtXJvcaZWfPXD+G
 ZRjVRwlHWupDGPNhtXvEqXd4CklLeMHv3/BCITJjqAvC5amAlp827Fif4cM0/1SQ/km5
 ITDuimjZS41yQswAnhvlOREc1NHdoDKwvc6eazhmTJ4+G2/brlZZ9khAhZR/wDWoZch5
 Fj1qvksd/dtK16FRQDxMBK9T3jPCCXpgb9JO1GFutvDeILjUkUYrVlK8J9tyqnvOU3xz
 KNmrvgM1Z/x4+QCUSvf4SI1Sepzpt4r6cUxbcIjW7GR47/T4RCrW3/93XiJlECp2Dxbu
 l3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960790; x=1760565590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drSty9Fd0kDDShwUBu49hZpX2v+dbl9T54JaBEZWELs=;
 b=jLi7Dmkx0BQJiwpQsKQ9CXLdBut/aMQBNOWvMRQPvhN2eED2q7s4Smt4pTqRNEEKB3
 NgcTKDJfZ9Zl+rJct/h2VZM8ZqD4ee7gqD/OJxN5B6T2cf3cETfSLrzvNF6SgUf4xG5k
 W30MaiX2Nycq8TNIdZbYF5F51Gn8lyicE0cWu6RC6968OS9lVmgC+cJadVI4nMtSm6W1
 /gyV/nvqG+OFZq14G7qc2DRdO/mfYh4SnU/t+zqDesduz3dxxKQlFNkPX4dQtGoFvSqL
 G0m3cs//e+Jxz7IjK7seqsh4Kbr/+XYQjt6hrzKmxQbQBUAN+Be9n1XEG9BQGQ7MsCVc
 IbZg==
X-Gm-Message-State: AOJu0YyrJqO9yXEEZaGsywnbzEDKzllxB6LWr1r3Pk1LixA79+8l85ho
 T5lPuTK/53S59PsET/q+SlwhjyOFDybalBY+yMaddTOyP+hcy0Vl639Xn4ke9ap4V6k=
X-Gm-Gg: ASbGnctrtsy5FIxzRYPOkioarjA50O+hcTDhiiduyfskNjyE3y0bQ23WtgVzLscF3yT
 g8gdWQu6+zdgSKBk5BAGQFxTxhuKcXzSiSYpozTiIHp37/G7iHv41ggwur0T4DigzLtasg5LlJq
 +r9zTiJGl+T7WVLcju8JSMNC+hg29W0dXKlF1VlhjUItgcdamrKA+FK5DbPMM17XwuKGExaHgKE
 wFng24u/u+fwML04A977DXIAAN4ZD3HfFzkdU2xpRaow2jMvzhC+gd5m6UxfAwiocaKh243IgsO
 nij1bjZ59EESSFhnXOKrlOG7tP8YzbVXW8ORIPtwUm2BcnBRUkFukITSvqT2pQ7PHBKr4AysFyk
 Jw+UexXetCsTqVf2v9PHZ86qKREWwWfOBMVa4C9qjUcVq4QjcAu0i02zy
X-Google-Smtp-Source: AGHT+IGAzCHjg1+/AMMxaRVEqx+e4PH270vFaxdjSh3A+c4tEv7/U3lB4gaI0BTbMuIDVApWw0pXCQ==
X-Received: by 2002:a05:6a00:886:b0:77f:449f:66b0 with SMTP id
 d2e1a72fcca58-793883dad54mr6441453b3a.32.1759960789970; 
 Wed, 08 Oct 2025 14:59:49 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 54/73] target/arm: Implement GCSSS2
Date: Wed,  8 Oct 2025 14:55:54 -0700
Message-ID: <20251008215613.300150-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
index 82ddf4e1dc..d58257be40 100644
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


