Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5206CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyC-0005tR-IK; Sat, 30 Aug 2025 11:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQg-0007GH-03
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQe-0004sf-1k
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-24a1274cfb1so1042765ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532827; x=1757137627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xtnxT94KMGz92qj0rHCZHgfy98zANUVCadhNE7Sddw=;
 b=uDUpwLFsDUMZzWuf009db4ygGeqIiipP4SnLbmwN2vzgfqShLhHphn6ZS6PO4NmdJo
 R+uJaoWlkHnNiG8bE1f1X7ITQCvTH1KkOGqslgiBaC0ZpDIn+aFLttABZt7TchdkvpY+
 7nzYB5kMUXHA5WjCY/ApeuAO1H6b4Eq67eKxrbTY4n0yE7ebi+tCQWlXW1sReeBblw9o
 B8UurcBfSO09d1fL5BNeR1NMeHx590qLcuUFTnzaViVjNK67gUB+Pir57EqRLf+JhDkY
 fIP4/WvOP5Sd9VXaaDmcWSQp0q8NC1xkAQAU4pLI/XLIXTEyGUag0ZoiPtIIQD2Bxf5E
 BDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532827; x=1757137627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xtnxT94KMGz92qj0rHCZHgfy98zANUVCadhNE7Sddw=;
 b=j+zx19EE5bSTq5h2F4tXnwYI1Dbac8K45PiBbha+s2j0pALvZreofjpkO/xot494uc
 beRP72216Tinvhe/v5tKujwxwQXvjov6kkAwVyCXSAyFRKP9zS/fm6P35o96YdjOJMxZ
 2Qj8SFdmAqi59j2v2GIc2/qKSEtSo0MHCYL4lCNPMKAkfa002BtPirKJweq/ubBLAGW9
 kQbUBSZBpBQqr9mSfCwVYt/b60wE5Y/MFYKzt1IzcEQqDC0KRkgfpB00MEN5PhjWpwot
 Aw+GysGLZpSTTNA8XZBnNxXW0I3SYTJRXyo6zdLMIoY/jUbewvcsIrL8N5kefbjvPh/5
 3fWw==
X-Gm-Message-State: AOJu0YxQjkHN6hLAEL+By5aOREMhzrVkvveT9RNKxzRHJyl3TbUtwzOt
 Ay9NnvM1d4yn+kPbvEKnP+iyQ6+INYDRSk3BzN+a1TDJ6US/mBL5s4kEXtqS/Z+yQAQ=
X-Gm-Gg: ASbGncvc4B/0Nnhm91QhSlw931lwEmFCYEZFma0v733WwSzZQd4gkqAf2o5padjeRQZ
 cNDweR31jM+Au2Z5NaRzeNiTWUVHWOEbgfyClzUJTjFaelFFAtBIaVepz8cYSWQKuBl5lkDgq6r
 yyd7nDgmOz39CrmqJ6S2uzKGZaV3zVhecG9Ew+DNL8IVqCaWCLCdBJcjcwKrl+Pzb9v2WxMg6PB
 YJrTtvZmytx5afh6Ggp0hgPk+yyN5RnMlbA+CzUtoGD6GB9Jl9NRlanwIS+eKqYPFQwNsiFPWdu
 88p/7gaEXp+T7fkpPEdnGQMui9/4AMdgx1JHxLCBkQr4DP3QuqdrcoyV6WeAnPWhFoUeADUEstC
 h8LXVugfbxoLdnucqm7rSZs1ePYXEOQk/5HrFsItIj9/BtgPFaDLSW2/FdkOe5zk=
X-Google-Smtp-Source: AGHT+IFrH+pIfDK8BbO+bGnPeFXgi3/fLiEg1GosYQoBaDCl62++b/5gZ80lqqeEDn0VMnblooMynQ==
X-Received: by 2002:a17:902:eb83:b0:248:70b9:c70b with SMTP id
 d9443c01a7336-24944b1fbb2mr13565705ad.55.1756532826597; 
 Fri, 29 Aug 2025 22:47:06 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 53/84] target/arm: Split {arm,core}_user_mem_index
Date: Sat, 30 Aug 2025 15:40:57 +1000
Message-ID: <20250830054128.448363-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Separate current to unpriv and arm to core mmu conversions
into two separate functions.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8c73f54e9a..ca1633540f 100644
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
@@ -4476,7 +4482,7 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
         return false;
     }
 
-    memidx = get_a64_user_mem_index(s, a->unpriv);
+    memidx = core_user_mem_index(s, a->unpriv);
 
     /*
      * We pass option_a == true, matching our implementation;
@@ -4530,8 +4536,8 @@ static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
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


