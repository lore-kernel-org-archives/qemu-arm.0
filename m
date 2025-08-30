Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954FECA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usODp-0005Mh-K5; Sat, 30 Aug 2025 12:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQw-0007Km-7a
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQs-0004uj-20
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-248c676a2eeso19273895ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532837; x=1757137637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fffkORVnYV9vwb7ZzaoscxQOChXjanmw50YJNQj3i8k=;
 b=AZwpWRA2fEpeiAz86VNOcpg9Oqq2GbALP9W8nPW2on9JZFCLpIqWtlUorHrQq7CHfn
 eLKgQJVcL5lMw1xNpleSF0NerbXdVQ+fEa8M4HLtEL/LJpp0DQY+f/jmCsR6Ewy0cJdd
 R0lomMSUET/iLfnMt+v+wPwCrSnOHcczuVVojoohB9ByGhBliFV0s9jJaKtwUsAOC4+Z
 sBIFanoZuq+KLNSTrlYgwxR7m1q2jhy76LpuNpYy0oxMbYl0s9009W5BQaWhvfCowvpZ
 zw47Yv2MT1O9zakJTPvq2kwzcFMdW8Z8+I7D+gsiNhhAndj70N38batTQXfzuSMDf10A
 oOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532837; x=1757137637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fffkORVnYV9vwb7ZzaoscxQOChXjanmw50YJNQj3i8k=;
 b=DPN0EXVuL3suLwu9AN4wJFBYTYj2dYQRrjxRvs70L362/8NEEdED9B12xiEk1CfdK4
 NfqqBYIQ9jz5uFeFuGho+JOKcYDAmh1ORkOqyOffjl2SlEAs22m/gj8yA3WhI1hrXy7f
 zy/DDYUDhw+H2a9nmeUj1Bd3OhHyasjCqO0YXHtoJUMvKxNFeLmYSzo4xx0udeUkEkqr
 Oa8gvqn6M5gevQMBIUYTdQ33r99D9KpSS6aLmYbEc6OdcpNYckL11hENl5aQX9kv6/V9
 xzo/0xdPtJotKAgJVQkb9tSt6vKHvr92FduDGw6I40+b8XChzbW7LI/MdPptk01sAGq4
 3+Gg==
X-Gm-Message-State: AOJu0YyfSLrVsG9VtxsF86PEZrHoN0AaPf7j50NhaluqXeTFkCH0UFwm
 0G47pd34IkfUZyomiP2d5AotfGyxlA5/aEb4RLKzvzYrVriiX2u3IAUIEDk4M29Ct59eIY0vbMs
 b3tmBkKc=
X-Gm-Gg: ASbGnctbMn0VdvUAaJMd4ZRcf50rZPAOKMIKwkIxMIatjQvE2uKOzaZBY57nyFJk0Zr
 SCkCjJOl86ghmhJeh+0V3v7OvXtyM4BJVO4lsjMRM2bJD+pdpScjRBpHM5cf6EHoWQ/uIRZtEQ1
 ldJGcY0d83AuopnJR6SYgChLxRaFIbywSkBHVrD7mLfoLqlrTkLK8eO02Ja254eeelKHfRHUN9r
 nGw1XzrNAUD2bHdPar0ODGS+DcgrcFq39H4+UUa9qlvkDztS4/9fQNiu53HrTI79/LjPyEyOYaU
 x1FaoDvC8hcSIVNUKyGX/xsXhb+6ya1vvUoZcehyzjbGc9VsGuRHJ0BwKPnfTHvlgb8sHBW3LcH
 DzrypRcJwUc3YF/oflmaUIzxAMBNPwkESlGvKNLGav0nbzEjEHd8ltyybEg4k8hPN0EylH7xM/Q
 ==
X-Google-Smtp-Source: AGHT+IELHzHE3uV9dhyLVhlKwsisVPbxK5jP67qpallhzzbgIAIQrVgudEBhLQP27RXxs40uC983hA==
X-Received: by 2002:a17:902:db07:b0:248:f809:9322 with SMTP id
 d9443c01a7336-2494486e840mr19214275ad.12.1756532837519; 
 Fri, 29 Aug 2025 22:47:17 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 57/84] target/arm: Implement GCSSTR, GCSSTTR
Date: Sat, 30 Aug 2025 15:41:01 +1000
Message-ID: <20250830054128.448363-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index 1175d37c87..022a7c27e3 100644
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
@@ -3951,6 +3957,42 @@ static bool trans_STLR_i(DisasContext *s, arg_ldapr_stlr_i *a)
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
index 8283a9c83d..2ae73f443a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -571,6 +571,9 @@ LDAPR_i         10 011001 10 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext
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


