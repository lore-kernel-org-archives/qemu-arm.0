Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD89C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:47:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpf-0000e9-K8; Sat, 02 Aug 2025 19:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmw-0003eA-7l
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:18 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmu-0005qJ-EV
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:17 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2edec6c5511so1714948fac.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177835; x=1754782635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPINWJ4nV+k9v7TwnsVQ/3E97hW4E8lZ7vTBhJUQGXg=;
 b=fsZFQ9bIaigcSSUZeH6XfDA9+d8REqpMU5wTIDg4y9XXmWGlnHtGqnqoa+NaibUmcY
 BQljaH2QWWCnv6NjtVx6Dpo5lXDbgSFcx3X/z/gBgJQSHxlMqh10r0JvglX20KpGDkPa
 MpCXhaFCwO9VJpagHP+4TnkDPoaUNvdzt+tksDHKctVsWWdgz68Nc3i2CjWCftCew5qv
 MmqFPuTpP2vv1EdODxpcBunAPBoEzvYJqk1vUa7ngQdhdcsfexjyf67G79U8pDWN8hW3
 Yv9jwx/WXLrdU9IEjp6et6RB54yp+qr3kOW3yvSaiRPxY5xq53TREcIxRtNQMsHlgx42
 EQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177835; x=1754782635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPINWJ4nV+k9v7TwnsVQ/3E97hW4E8lZ7vTBhJUQGXg=;
 b=sm1xvMyywVsrPuB7IRa4I01I8yDJkLFkTIOrBOvrdTxIZBmW5YruuCx3vXv//KesHC
 XL6WVubYqKpeduSquZsvS5vT0K6vf15q/mQv9Q+ro7l3TsAXWB0xp3z8cVpbvEJ4j0B5
 bLJkvLXX11/RulJ4HsrEIHeENd/jXfrEiZ70EOCm8ZJWwQbFS+h5pMzBqCnsRuOJPPtK
 PWfxn5o58aDmAbtMdNrREELmTwDdpI/xSUXyxiEwxOC5j0B0tjMD0Z0vcDBFM+qW4RDQ
 JSiaLDGqWzlnEY0xtreh0Zj7IyHJZh2ftSlkCCEAASZuDuRQfrSN/zoy7/BjRH9wX2hw
 52fQ==
X-Gm-Message-State: AOJu0YyOeZ+iUNUbAovI69e83DRY6DO/kceV+AMLf+Xt88KHb5kFZFlX
 iGhieZ2odOZDl407rYcizV3jl5cTRkeXA82XsWW0a+ZnIasm7s5lilXF0mA8PcL3/64=
X-Gm-Gg: ASbGncvdGOg8Y5hYFiYciGse1oBRxTAD+ZmNlVDZjfA/2eiy+ekTt//ym5JYWM6mjmj
 RgrZqcqarb5nMCzm5pLHO4V1DakCOjuVnW76WbFwuaIKF+2XYoUOmYJB6rfOhXTmNJP2j2fFq1v
 HFA+/I3PiuRu1LVcmuRqpcFZtRsaRamGsRWRkuarQq7K9MCLgLMc8uMKAB5CoCsih2hAqLUbloK
 5LjiMahfkeoEvfHQG5g9SwquKq+W8tRGMatfpDNsVYvfcdYX0mhr/tuYzpsbJR3ILG3WIw7rKah
 PoQuJXvi3nLdA2kAwhyq+4QsyY1V3Be7Uw04kOBZPn0aGNnpRytkDZw6rD1a0cvGEJ94vxLELtr
 isly9aJCwKNv9xB5ij+ia1RGrI7YM2sqbDMumuKra80TxRiQ8s/7C
X-Google-Smtp-Source: AGHT+IFKBO01QSsPJmGFPI6hp9qf4npZLHfLYe4dXDFxd5CVvvKIooEMSseNUlwPPfwkk9z9pzwLvw==
X-Received: by 2002:a05:6870:b027:b0:307:b2c9:9f99 with SMTP id
 586e51a60fabf-30b679b882fmr2247296fac.39.1754177835233; 
 Sat, 02 Aug 2025 16:37:15 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 53/85] target/arm: Split {arm,core}_user_mem_index
Date: Sun,  3 Aug 2025 09:29:21 +1000
Message-ID: <20250802232953.413294-54-richard.henderson@linaro.org>
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

Separate current to unpriv and arm to core mmu conversions
into two separate functions.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 34d22cac8a..eaeafdf138 100644
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
+static ARMMMUIdx arm_user_mem_index(DisasContext *s, bool unpriv)
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
+static int core_user_mem_index(DisasContext *s, bool unpriv)
+{
+    return arm_to_core_mmu_idx(arm_user_mem_index(s, unpriv));
 }
 
 static void set_btype_raw(int val)
@@ -3539,7 +3545,7 @@ static void op_addr_ldst_imm_pre(DisasContext *s, arg_ldst_imm *a,
     if (!a->p) {
         tcg_gen_addi_i64(*dirty_addr, *dirty_addr, offset);
     }
-    memidx = get_a64_user_mem_index(s, a->unpriv);
+    memidx = core_user_mem_index(s, a->unpriv);
     *clean_addr = gen_mte_check1_mmuidx(s, *dirty_addr, is_store,
                                         a->w || a->rn != 31,
                                         mop, a->unpriv, memidx);
@@ -3560,7 +3566,7 @@ static bool trans_STR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = get_a64_user_mem_index(s, a->unpriv);
+    int memidx = core_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, true, mop);
@@ -3578,7 +3584,7 @@ static bool trans_LDR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = get_a64_user_mem_index(s, a->unpriv);
+    int memidx = core_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, false, mop);
@@ -4427,7 +4433,7 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
         return false;
     }
 
-    memidx = get_a64_user_mem_index(s, a->unpriv);
+    memidx = core_user_mem_index(s, a->unpriv);
 
     /*
      * We pass option_a == true, matching our implementation;
@@ -4481,8 +4487,8 @@ static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
         return false;
     }
 
-    rmemidx = get_a64_user_mem_index(s, runpriv);
-    wmemidx = get_a64_user_mem_index(s, wunpriv);
+    rmemidx = core_user_mem_index(s, runpriv);
+    wmemidx = core_user_mem_index(s, wunpriv);
 
     /*
      * We pass option_a == true, matching our implementation;
-- 
2.43.0


