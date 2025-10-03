Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889FBCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jLT-0007Gl-2c; Fri, 03 Oct 2025 13:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKC-0004xo-Im
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:12 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jJq-0007gY-P8
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:07 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so2381735b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511499; x=1760116299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZunbW8zrXRCzDcEAaVX1Pev0CRMsCYpGOAhWGA2DZnI=;
 b=Psp5f8Hjls1moJeN0e9CEpe19DhCHprlKDsVB3UPRYjWy3t+VbEhRk+W37rTZ2Y/S5
 FAk+9qOs78HBjbMSLa6FtfGxX0QBJA1cADuhrDCjxamICSqDPbfCcqqjsJuJIzt9YkBh
 2oTUhpzv55QkjyKEiX5CAZzoyLwTaDYM4Y2lzHAlP1A6E33CrUixtUYXHocyHIKW4geH
 QNeA/6Zr2HNMqbKmkkbFcU6RP6n4LBCyH2eKNp8JEADRy6nZqKreXMUqSsCGFDh3AWGA
 mntvm/fxeMdkW6Z+rgIftAci5LYT3srLI/y+ujIiZ5dXVH+fRDJYQT/max9vNYunx+VU
 KDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511499; x=1760116299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZunbW8zrXRCzDcEAaVX1Pev0CRMsCYpGOAhWGA2DZnI=;
 b=vDXlwmGlp4kt7fPY/PpY23kXTOi+ybD3s/LNM5fKilEM42lJHuj5rDKc2cnot5PqRN
 bWQDeJDKz1Y02RjdLQ0nE8k99QVhIHgwCmMco7W9pq/9zFhXsgnw8Rw1V8wPwXJI55wy
 gN4WPY2IPWRXj8jXnOxSsLeK/DaMoCN/MUWCHKOK5ntFLsyNkG3r/4pX7EROW0H4QXjO
 QGGwDjQ6+ftLMN//Egu0f8zgM5S7dAJO9akxHT/US8709F/nxBhgutKXiesAFICrPHE1
 bzgMCY9ysxdw09u4W4MJBRh+bUqOtaQsT/jwOm+ry/nPubzrxHlM5kGYQmyaTHnhwB5U
 bNdg==
X-Gm-Message-State: AOJu0YzZ0cS8Kx+9sd0uNFkueN1vZVwZ8PsVKOmDLr++3uiaAqj+bNwu
 OvpDmOzUC+DORIZUXfu0gv5bhn7NWN2/MasP8PIdJzLu0JvnmneSWX0HbG0DGG1VO2gvNvUsbYo
 tucHKHIE=
X-Gm-Gg: ASbGncsHZafKPG7/lMmvEtE7TGhl+frDk+QhzR+pCJW6QDKTEEzjqG3191DYz8cOlLK
 Cj4IDjE/do39Cho7fYu81vF4aBogxr/oesWTjbH2XX75ZR5CHLxAXCl3b5FerHuptydRmMecK6E
 SqILwYCy+D139dfp4BOOQ9LH/sNKpIGP0hC4najsv90YJFoZXGCaIlnItRWe4jpWP3mZlUNqF+i
 3iL53TRkWN/sr1PAvlAwUtMnOdfl8Kpzgrelh6Bk77RAITO9XLm9Iau9v+AlMhrmB1n0kJ2cu0U
 A3jSXme6ZLs4a+FHqX54YlZXY4L6igNRuSUR4rR47DaBtuoom3wvuTvZSCvohoaQBZlwgz1Vda/
 twt2/4XEbmgLIByUX+4yaAudn1jCtHe9Tmo6zJ+WWGTLgRLs/DOdR4VfA
X-Google-Smtp-Source: AGHT+IGGz61qRD/yrZ0dz7KCVtSu6tDmSI+274aOVYci/eNB20Plk+DpdHJiSg4XKURLJYqLDqY1lA==
X-Received: by 2002:a05:6a00:23cb:b0:784:3dd9:1f15 with SMTP id
 d2e1a72fcca58-78c98dc68f0mr4273401b3a.20.1759511498984; 
 Fri, 03 Oct 2025 10:11:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 42/73] target/arm: Split {full,core}_a64_user_mem_index
Date: Fri,  3 Oct 2025 10:07:29 -0700
Message-ID: <20251003170800.997167-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 43c9bfef93..1337e16a96 100644
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


