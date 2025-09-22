Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C23CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:58:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lfn-0004sX-Fc; Mon, 22 Sep 2025 14:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfK-0003lQ-M0
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:35 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf7-0004ww-Et
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:34 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2698384978dso40275545ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567197; x=1759171997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWIuoMSiqJF4N4o+nZ0K+Ku+FE0azEDKcujW4yFEPEA=;
 b=u6CLfyD1pPdkC9zQ3VzVGrl3xfihIdDcnR1Yg21fnQ2z81zdjmO+CMA6HS614B8SFG
 M7NJeeoHzyJOuQU282zBQnXXD8tWoRBExOzGVPHecYz9usI8krJeGzUGvxuS4EuGuzco
 bWmym+odK0ccrxkjEPgkGF0dyaFCxtQy6tpq1ofCQ89oSK6vAy3wLhnUr/r+6Xy51Muv
 7mxc1Qdy/maAbpNGlvH1RSOgmE2fPm1VSw8e6+P2CydnaawckdHsP2GZnAyxHMkQKs7A
 +MrAK2MjVfI5fEHxdJA+VberUc1h466U2VVZgLN4fSS50iL2pi4l3gCRRV4QV7h8gnzC
 BlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567197; x=1759171997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWIuoMSiqJF4N4o+nZ0K+Ku+FE0azEDKcujW4yFEPEA=;
 b=nlXEGGbJOAFLKY7YtwZ+KjxugpSyEsIuiFcvGOQvrj48tlCq1N9KbOcB8robGEf+gc
 yGYWUQ5DQXGzV277hPFsUOQRc+1QMJ2YqymzMELNZwKZc3MFCStFH19dLhAR3n9KTt9i
 BvzvqJ+DMyBdTSRmW/39L/TeYFIH4AKYib9FcXU7bHQWCMNGtHk8lwMoU6VObKA92bwl
 hf8DJIWNwCRwTaJN0JJJsczRNKHsL5i21SQM4i9wtYHvxZu5K/7p5cz68j4V91N9L8a2
 6QupyfVwpHwVmnaH6FrPMnUlnV7w/EEYCc45K5qDpA46wVGfZU0E/9d1fMTMx9oqIRKf
 TyZw==
X-Gm-Message-State: AOJu0Yx+RSRGTMK6akQUYZiKqgILS9GPF56pi5C3ri06MlbuT6ZBpOI7
 NmxDMGXP4P6eS5hZ9poOyMIe4CYetbZ28HX+CIBsdzByByRNSVxL+Ov+xBxzBMdkUOo=
X-Gm-Gg: ASbGncs0DPQyoEuEnM6SXaELFoTJELuY6jdPlbmBBGkDY68ARr7wis2KzMz+mnuIBTq
 ySe6ML1mzvgBsevO6VvPdhAh+wpd4VMn81x79DAdkSxYBvokobzCUYlkzVfSau3NOzAemTRsSOv
 ipDbsMjjI63CjRb7VtMC9+uw1Deg6KgovpqzIS0wUXNukIyc5xgkEUxUr7u2AU85swt5laaOYNH
 ZUTslrHQcfOynWhhSW+XsRmPHlJYYQWcKBf0FeUgiTqoTdMGEuWV0loksUokaNjo6s+mDFzHyGc
 T2FO1He0ux4KmO6X9cQpgc3v0DdGPboKU7UopVFOrwm+IQZN/BkuS6nuZUXDy7nPaFSRTV/tmjn
 PlpN/EGDa/a2UEcWKMSrldOAzUJ7G
X-Google-Smtp-Source: AGHT+IHQ8yqIpuAQK5OfMvs330q4027hPqWVvFRYu9qRAIabFv8sgYFsak3FJwKKkqmaWnpbwYalFA==
X-Received: by 2002:a17:903:1b0b:b0:267:a942:788c with SMTP id
 d9443c01a7336-269ba3fa0afmr206941515ad.1.1758567197368; 
 Mon, 22 Sep 2025 11:53:17 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 45/76] target/arm: Split {full,core}_a64_user_mem_index
Date: Mon, 22 Sep 2025 11:48:53 -0700
Message-ID: <20250922184924.2754205-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Separate get_a64_user_mem_index into two separate functions, one which
returns the full ARMMMUIdx and one which returns the core mmu_idx.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ce5d597c93..f0331830b5 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -93,7 +93,7 @@ void a64_translate_init(void)
 }
 
 /*
- * Return the core mmu_idx to use for A64 load/store insns which
+ * Return the full arm mmu_idx to use for A64 load/store insns which
  * have a "unprivileged load/store" variant. Those insns access
  * EL0 if executed from an EL which has control over EL0 (usually
  * EL1) but behave like normal loads and stores if executed from
@@ -103,7 +103,7 @@ void a64_translate_init(void)
  *           normal encoding (in which case we will return the same
  *           thing as get_mem_index().
  */
-static int get_a64_user_mem_index(DisasContext *s, bool unpriv)
+static ARMMMUIdx full_a64_user_mem_index(DisasContext *s, bool unpriv)
 {
     /*
      * If AccType_UNPRIV is not used, the insn uses AccType_NORMAL,
@@ -130,7 +130,13 @@ static int get_a64_user_mem_index(DisasContext *s, bool unpriv)
             g_assert_not_reached();
         }
     }
-    return arm_to_core_mmu_idx(useridx);
+    return useridx;
+}
+
+/* Return the core mmu_idx per above. */
+static int core_a64_user_mem_index(DisasContext *s, bool unpriv)
+{
+    return arm_to_core_mmu_idx(full_a64_user_mem_index(s, unpriv));
 }
 
 static void set_btype_raw(int val)
@@ -3577,7 +3583,7 @@ static void op_addr_ldst_imm_pre(DisasContext *s, arg_ldst_imm *a,
     if (!a->p) {
         tcg_gen_addi_i64(*dirty_addr, *dirty_addr, offset);
     }
-    memidx = get_a64_user_mem_index(s, a->unpriv);
+    memidx = core_a64_user_mem_index(s, a->unpriv);
     *clean_addr = gen_mte_check1_mmuidx(s, *dirty_addr, is_store,
                                         a->w || a->rn != 31,
                                         mop, a->unpriv, memidx);
@@ -3598,7 +3604,7 @@ static bool trans_STR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = get_a64_user_mem_index(s, a->unpriv);
+    int memidx = core_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, true, mop);
@@ -3616,7 +3622,7 @@ static bool trans_LDR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = get_a64_user_mem_index(s, a->unpriv);
+    int memidx = core_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, false, mop);
@@ -4514,7 +4520,7 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
         return false;
     }
 
-    memidx = get_a64_user_mem_index(s, a->unpriv);
+    memidx = core_a64_user_mem_index(s, a->unpriv);
 
     /*
      * We pass option_a == true, matching our implementation;
@@ -4568,8 +4574,8 @@ static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
         return false;
     }
 
-    rmemidx = get_a64_user_mem_index(s, runpriv);
-    wmemidx = get_a64_user_mem_index(s, wunpriv);
+    rmemidx = core_a64_user_mem_index(s, runpriv);
+    wmemidx = core_a64_user_mem_index(s, wunpriv);
 
     /*
      * We pass option_a == true, matching our implementation;
-- 
2.43.0


