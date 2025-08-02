Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A91AC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:09:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLrL-0003IX-Gb; Sat, 02 Aug 2025 19:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnG-0004Rk-Ll
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:40 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnE-0005vy-E2
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:37 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso2675936fac.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177854; x=1754782654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHjAyHFO49Xnsrf4XYBbOWKhIj7dGvot2d9bfnaFFuQ=;
 b=fsbsQFxQlCuTgx7ql4nXivXeEXhxnXXDgx6w4lTmIDXgG921JGeJSFwYa+UkDzjZsx
 6nri7E6zzalb9VhpftvYJ8fGW998es25jVyVQf4ynlStEGj+krC/pd67/6oRodEBwa0o
 ThS0WdxsVzrJo9roNVA9rCxwtKEjuIxCrxiD6XHMeyECLq3bkpgvFowyQgJPUXalAplk
 wCH3kcY5SpBxrzB5TJt35hWV0QKCD4YDpJBJS9PEZ6ZAyDPlhQSBNLDFwkV51drOh9k7
 O3H9Ft8SP59xjzlXS2GEz6m1Alx5fitmzE/qZ+ErzIr+7pmaKuA1yekvO+8nRK5SqXN1
 BV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177854; x=1754782654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHjAyHFO49Xnsrf4XYBbOWKhIj7dGvot2d9bfnaFFuQ=;
 b=cXbLF2cxT/diU8b5vQMfmm9Fmuv2urhEZ0L+RcPFoK389NX4t/nZkTwMxRrhkgGw05
 dnC/jwi8DIVzmm74MK2g4I8hfnpqf2WuKevxUGOlILYrDrnYfivDe8r2nruLU2flA4Oo
 1rRW+dsTaEbyy0TrqDLeXBrRhPfrkDdSCCi06NOAkY/nysJgIkOx4nR/IALSOI5p9YcJ
 vIZrJa8DCBciOlUtk6yqq0malm/5IUYx8MteZ7uxnyD5tOGUzb+QixRIOSfY84c2/+Zl
 /As2cgTLhaalSSeHyEgYlf7IvV3iaibAWxdBi6e15kvXqRHUnAKR8FBS+37Td64Z74eC
 oNpg==
X-Gm-Message-State: AOJu0YynkrwL9dCKpdaJXfJtSp7c8RDHmZxhR5pbXDtUuBE3pJo4ZAi8
 19PuyJ0HG0olixUTzEn0SvSyS3lQV3RUZsh+AOOvInMVYdqlMssWxHcJ+2IwscD7BqA=
X-Gm-Gg: ASbGncu5DWxSuM9mMXES0i5M8h4qkcfwVpB4Hx1hzevjfU4bPEL+1I+g29pc04I1b5k
 2HO1g0+Ab40ds/dL/N/p4aE7losDk9TDbQr1Scr5IjRdHJx3NSrlNM/WAR0Doa15GpVZn2N/mXT
 CtEHIVEmrzX5d27wwXIdWwZcmUj6sdVZdc2iphOSzVqSjIMbsRV32z15xi2LAqzGzLyFx4siwL1
 N7fglSdf/ui6S2dC6DgjNM4A2ErvL/rGaNn8/WjSY2OtAKSkr6iHO4kq/z2CK1ypeLQiolJOny9
 dqbxPZKy8UXnTGCCYCTxBHaBEQOiLjMfrIdV3czsSiUuW90x1TOEDLwJPvpx4pZeiBr7AyI7FRT
 XRlt9m20mJ6L2su9Lb7sGgyF/daN3CNUYGH2LzDw3unQM92pIs2CL
X-Google-Smtp-Source: AGHT+IF6DdBYDKadFZwvjh9hfAMUww+WfpFdDzFVvLzL40PrhzE93bF0/DnfvmnJr2WZbf2weTYPcg==
X-Received: by 2002:a05:6870:e393:b0:2d4:ce45:6987 with SMTP id
 586e51a60fabf-30b67730912mr2401969fac.9.1754177854545; 
 Sat, 02 Aug 2025 16:37:34 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 57/85] target/arm: Implement GCSSTR, GCSSTTR
Date: Sun,  3 Aug 2025 09:29:25 +1000
Message-ID: <20250802232953.413294-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

Note that CreateAccDescGCS() does not enable tagchecked,
and Data Aborts from GCS instructions do not set iss.isv.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d803c10ac7..e0548f7180 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -139,6 +139,12 @@ static int core_user_mem_index(DisasContext *s, bool unpriv)
     return arm_to_core_mmu_idx(arm_user_mem_index(s, unpriv));
 }
 
+/* For a given translation regime, return the core mmu_idx for gcs access. */
+static int core_gcs_mem_index(ARMMMUIdx armidx)
+{
+    return arm_to_core_mmu_idx(regime_to_gcs(armidx));
+}
+
 static void set_btype_raw(int val)
 {
     tcg_gen_st_i32(tcg_constant_i32(val), tcg_env,
@@ -3902,6 +3908,42 @@ static bool trans_STLR_i(DisasContext *s, arg_ldapr_stlr_i *a)
     return true;
 }
 
+static bool trans_GCSSTR(DisasContext *s, arg_GCSSTR *a)
+{
+    ARMMMUIdx armidx;
+
+    if (!dc_isar_feature(aa64_gcs, s)) {
+        return false;
+    }
+
+    /*
+     * The pseudocode for GCSSTTR is
+     *
+     *   effective_el = AArch64.IsUnprivAccessPriv() ? PSTATE.EL : EL0;
+     *   if (effective_el == PSTATE.EL) CheckGCSSTREnabled();
+     *
+     * We have cached the result of IsUnprivAccessPriv in DisasContext,
+     * but since we need the result of arm_user_mem_index anyway, use
+     * the mmu_idx test as a proxy for the effective_el test.
+     */
+    armidx = arm_user_mem_index(s, a->unpriv);
+    if (armidx == s->mmu_idx && s->gcsstr_el != 0) {
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
+                              syn_gcs_gcsstr(a->rn, a->rt),
+                              s->gcsstr_el);
+        return true;
+    }
+
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_gen_qemu_st_i64(cpu_reg(s, a->rt),
+                        clean_data_tbi(s, cpu_reg_sp(s, a->rn)),
+                        core_gcs_mem_index(armidx),
+                        finalize_memop(s, MO_64 | MO_ALIGN));
+    return true;
+}
+
 static bool trans_LD_mult(DisasContext *s, arg_ldst_mult *a)
 {
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4315ed8dab..d034d96b37 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -554,6 +554,9 @@ LDAPR_i         10 011001 10 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext
 LDAPR_i         00 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=0
 LDAPR_i         01 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=1
 
+# GCSSTR, GCSSTTR
+GCSSTR          11011001 000 11111 000 unpriv:1 11 rn:5 rt:5
+
 # Load/store multiple structures
 # The 4-bit opcode in [15:12] encodes repeat count and structure elements
 &ldst_mult      rm rn rt sz q p rpt selem
-- 
2.43.0


