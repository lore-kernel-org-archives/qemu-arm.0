Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D54C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:47:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLrZ-00043v-SB; Sat, 02 Aug 2025 19:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnr-0005Rn-Cr
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:15 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLno-0006Ew-N1
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:14 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-30b8c77361eso19281fac.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177891; x=1754782691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+2sYw5dexelP5iay1eLTthnTiCAulcagt8ELvDOM0c=;
 b=yKp4EJYYxt1AqhfE+6WxT4XWQ9/DZELLPgHyi2RC2X+l6mnuYgdlxHLNfZmAupG1Ho
 pz6yN0WUmsPZNIODZ9nq2vxiogcTWO0qLuF6e1EZOD5nQjxTP3sjpWCf+Ph/xxYwpbxP
 e7P1LIIC1YW+lfLqdS+oJB+WNaWtCUdI+bLih944Z0ggKL9zmHuAuq1o4IfGyjqwDd+C
 tChtcQsUo1rTDc8pn/8BrBxhO1OQX2a2bAggTIg921vBkx4rm82wVaZKcgt/hPwUgPHL
 AiWq1kulw9Ros2ACsqiJTer7d/pLw6gLPEjj3WaR6cKO3ZG/RBIViTymQWnjPWX91mWp
 PAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177891; x=1754782691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+2sYw5dexelP5iay1eLTthnTiCAulcagt8ELvDOM0c=;
 b=sxMzkIdzdT8p15zJpRFissbIujKTLZGE6kaSNkZngFPDflbPKKM4JI6IrYmVDs4VPJ
 OmvYOOVf26ybQ31MXqY8ddHS338N5uB3sU74xr9J4D9DyJ4u93QxDy5E0WKP9/uFbYVR
 jIHz6pr0T59wLO9X141g4EZdGFjyPYWtEvVi01S+0n7mM5Bd9hU5GnbQIxCtRBphTU5U
 ETC7UgeRoVuEJLvg+9khk0sJjwZzvSMeW4oMVtW2gtKiukimKC/KcdilK0TgRFJh/R5b
 oy24VA4BomYR8AqeH8GWRMUjg+pAPTKlXNfCrApNTDrFnaBhjoH5+dN1L/fiLfec9nD9
 ZpfQ==
X-Gm-Message-State: AOJu0YxAknbhbpNoF17loZD9W4EfMrBDXXidfTz3kllsN5o1t3TXIbpq
 vmKBckD939skgoDDlTBBd1RcP6dAGlIlYOMU3AbLx5Zm31mqkZSxU5RjUtEs5exyv8A4zK789Zt
 ik3NGZ5M=
X-Gm-Gg: ASbGncu0uK2eTDcsfyVEtzaN4BRI3AwJ57GDBhIAO0X5yFvIhbJ7lBAMek1OUWgFc/+
 bht9MzE6+tG5qpVcf6lfpj61lA/gvdCg3renpX0pRYUsPHOZumBZVkLliPypclaHz8TARnRMf1o
 rkRLToyPW5PzNurNg7/2BVSp+SiJOCoWmW4kOIXclfkGMjYdCxSBV3Ic5IhnC3NsjcbjyVRKmoE
 WWF0oFnV/sbCUx39ASe3EZ1Rutl/hnFIYy7Em1ydLuDp55d1sNhy2EVOAdDMHO6IxNpbOgbxsIj
 zcPwpHt86Fi1Qle+bGmI4AorH+Wskrbhg27AqcfGiY/Hm+x2sTqvceIfzpGTV8p/y62dXqxODcZ
 qD5I2ycO9dse09ojcmEjllBcdOrBm4HIJYjTZyzlqb4fdU1coAs54
X-Google-Smtp-Source: AGHT+IGf+tk+NWmDKKJvSHfK5DScXr4aIAs3qz3s1nNFum29R6VHILKB7zNHdrcwv3DGRjc1YC2jqw==
X-Received: by 2002:a05:6870:cb8f:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-30b67569de5mr2634804fac.7.1754177891472; 
 Sat, 02 Aug 2025 16:38:11 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 65/85] target/arm: Implement GCSSS2
Date: Sun,  3 Aug 2025 09:29:33 +1000
Message-ID: <20250802232953.413294-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
 target/arm/tcg/translate-a64.c | 37 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

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
index bdafc60786..558e223838 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -117,6 +117,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
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
index e4c7801740..88fe5ac4ef 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2661,6 +2661,38 @@ static void gen_gcsss1(DisasContext *s, int rt)
     tcg_gen_st_i64(new, tcg_env, sp_off);
 }
 
+static void gen_gcsss2(DisasContext *s, int rt)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 inptr = tcg_temp_new_i64();
+    TCGv_i64 outptr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS2, rt));
+
+    /* Validate that the new stack has an in-progress cap. */
+    tcg_gen_ld_i64(inptr, tcg_env, sp_off);
+    tcg_gen_qemu_ld_i64(outptr, inptr, mmuidx, mop);
+    tcg_gen_andi_i64(tmp, outptr, 7);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 5, fail_label);
+
+    /* Push a valid cap to the old stack. */
+    tcg_gen_andi_i64(outptr, outptr, ~7);
+    tcg_gen_addi_i64(outptr, outptr, -8);
+    tcg_gen_deposit_i64(tmp, outptr, tcg_constant_i64(1), 0, 12);
+    tcg_gen_qemu_st_i64(tmp, outptr, mmuidx, mop);
+
+    /* Pop the in-progress cap from the new stack. */
+    tcg_gen_addi_i64(inptr, inptr, 8);
+    tcg_gen_st_i64(inptr, tcg_env, sp_off);
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+
+    /* Return a pointer to the old stack cap. */
+    tcg_gen_mov_i64(cpu_reg(s, rt), outptr);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2977,6 +3009,11 @@ static void handle_sys(DisasContext *s, bool isread,
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


