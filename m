Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp664489lfr;
        Fri, 16 Apr 2021 12:22:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwclFHAppu8yStpzTB6qBS1uuMwF/ZKuJwqhWCVETSucKz8I6YeN6dA6WsTlr2HWUJNBMqe
X-Received: by 2002:a02:95e3:: with SMTP id b90mr5574978jai.14.1618600977856;
        Fri, 16 Apr 2021 12:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600977; cv=none;
        d=google.com; s=arc-20160816;
        b=oYNeuE6zvhD0PlYGqT9WUM8L3Kv5yjhDEC6cYjwaF4ZBQnFyn3mb8IEnWWjGG5aLjs
         rZKP8ok63+cxUm0AixQchgc0PKU6pw1ezwCyJ1fBtcwG7AW3f4eDzJ77u5vvOYUXJJT2
         edQoalZdVtFraa5yNdGD3YYpSVVpLcKtcU2maF0zrAOXljxfOkuhYozdliEHb8AmXY7/
         Gp1OPsUUgZULhmRVz4bEgGcwXmGqSiHLlBRQEeMl7vmg/4FNzdHsrk2GwMC/N9+WsY2E
         pGkAsr44ZBvyWc4XRGc/8ZLibUFwglRRrxLB8cZ37CF1kQ4w4MFo09FWeXrRK66UyzPP
         ftMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3RCCb6g/8oqZVVFrzfzAA8xyWzyQtEiKHnjFMLf0Q3g=;
        b=d0tiSYvzHbYQfU8VHGNbe43bYhQE/WsUYsLJfMOObaKXXAzBRUiGZHL6IFn/mMrrUF
         ZNV+adhjG7DRl6tMxsLAPBAuKC+bSvgTDs/ATn1sS87Jm6vqPFCHiI+uTPzm+ESj1TtY
         WoNz2H60+/0+7+KHCJFUZaN8zGqnKjnDBlSsWCfZygR+3NZOQw8JdCAF1ow/zll65Joz
         coVnmigix6mEL7fwMrxLXjR12E9XmLxFSn9dv5CauURahm9+8mEBlzfXAGj2YcQQ7fLU
         kUANJF+spQ989Pb1e9k365VezhZt876sgeyR3/+yBeRJcXoIDQUOh8nBd9JBm2aIlmlA
         Xz5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YI2gHcmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si6746028ioe.38.2021.04.16.12.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YI2gHcmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXU3N-0000yf-6F
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThx-00042P-7I
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTha-0004TA-1P
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id r13so10725263pjf.2
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RCCb6g/8oqZVVFrzfzAA8xyWzyQtEiKHnjFMLf0Q3g=;
 b=YI2gHcmuO/DcWLVSy7GKxYtY9Y5P7rgi720e5JOgFvEvZ++VO0TlbRPUHlCxbazjt3
 NuVedm0okFwnjmMlIx69T8gmAqEIeHaoZrLSls+ReDiKw0r0Stru0ijNWnHPJbbFiSUJ
 PLhmR8ob+/OXWTwV9TaM1p7hJuPgqjU4nsQs/oOQ8zpXhuJ5Xp8CfoysxcM29X7V22i1
 Nz9S9ozJMlMn7ImeqdydKlTQUv20SgJXCw4u5rP3V8cQlz7OaFXArNmozLM5yJ2gdOEJ
 yXTcsEJtiQpAzfHmHiZ46YilMypxyKRMctwAlBFJ9wUZuozzisH9jlP2xxa0szlU5Cst
 gD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3RCCb6g/8oqZVVFrzfzAA8xyWzyQtEiKHnjFMLf0Q3g=;
 b=BykwkHqNBDrxFQhRKBj6MgU6IuYw3g89LsG7JLDDIndnIB/ji7iYfawqDtmTT0Y82I
 jxH4PXfSr01v1Tdn6bq8wxCl/xsKNhT9qDTw0MkLf8/t2nvyiWFGgfytr4ZHpLZYeATH
 au4mhMJmaEUtA8Dogm79NlyhzA12Sigw7nKdmKFOnnA2p7ZCxX7sjZd9kXbHVVH99uE/
 tHyl4FFSlY7AwmQJaCHbzWTOAovdHZUThdNc0HFeiuDh04uHVX79EyQl+5nCsOVS8vnm
 gporCMUmyuCdfz7gvQ0V5y+C/7ayL3myMZ6ck0dk+EfX/L5TcLD95pfu1v7EeRb6B0nW
 glqQ==
X-Gm-Message-State: AOAM532+bjqT8ux1pqDB/7HtsGek86IEMolYUtNv++WRET5ak6+HLhfq
 97clqqABo8x1PWmoY8s0SGm/hw==
X-Received: by 2002:a17:90b:2305:: with SMTP id
 mt5mr11480353pjb.198.1618599624553; 
 Fri, 16 Apr 2021 12:00:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/30] target/arm: Use finalize_memop for aa64 gpr
 load/store
Date: Fri, 16 Apr 2021 11:59:53 -0700
Message-Id: <20210416185959.1520974-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VxRFyZ6x1n6m

In the case of gpr load, merge the size and is_signed arguments;
otherwise, simply convert size to memop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 78 ++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 92a62b1a75..f2995d2b74 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -886,19 +886,19 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
  * Store from GPR register to memory.
  */
 static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
-                             TCGv_i64 tcg_addr, int size, int memidx,
+                             TCGv_i64 tcg_addr, MemOp memop, int memidx,
                              bool iss_valid,
                              unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    g_assert(size <= 3);
-    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
+    memop = finalize_memop(s, memop);
+    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, memop);
 
     if (iss_valid) {
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
+                                      (memop & MO_SIZE),
                                       false,
                                       iss_srt,
                                       iss_sf,
@@ -909,37 +909,28 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
-                      TCGv_i64 tcg_addr, int size,
+                      TCGv_i64 tcg_addr, MemOp memop,
                       bool iss_valid,
                       unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
+    do_gpr_st_memidx(s, source, tcg_addr, memop, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
 /*
  * Load from memory to GPR register
  */
-static void do_gpr_ld_memidx(DisasContext *s,
-                             TCGv_i64 dest, TCGv_i64 tcg_addr,
-                             int size, bool is_signed,
-                             bool extend, int memidx,
+static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                             MemOp memop, bool extend, int memidx,
                              bool iss_valid, unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    MemOp memop = s->be_data + size;
-
-    g_assert(size <= 3);
-
-    if (is_signed) {
-        memop += MO_SIGN;
-    }
-
+    memop = finalize_memop(s, memop);
     tcg_gen_qemu_ld_i64(dest, tcg_addr, memidx, memop);
 
-    if (extend && is_signed) {
-        g_assert(size < 3);
+    if (extend && (memop & MO_SIGN)) {
+        g_assert((memop & MO_SIZE) <= MO_32);
         tcg_gen_ext32u_i64(dest, dest);
     }
 
@@ -947,8 +938,8 @@ static void do_gpr_ld_memidx(DisasContext *s,
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
-                                      is_signed,
+                                      (memop & MO_SIZE),
+                                      (memop & MO_SIGN) != 0,
                                       iss_srt,
                                       iss_sf,
                                       iss_ar,
@@ -957,14 +948,12 @@ static void do_gpr_ld_memidx(DisasContext *s,
     }
 }
 
-static void do_gpr_ld(DisasContext *s,
-                      TCGv_i64 dest, TCGv_i64 tcg_addr,
-                      int size, bool is_signed, bool extend,
+static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                      MemOp memop, bool extend,
                       bool iss_valid, unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_ld_memidx(s, dest, tcg_addr, size, is_signed, extend,
-                     get_mem_index(s),
+    do_gpr_ld_memidx(s, dest, tcg_addr, memop, extend, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
@@ -2717,7 +2706,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -2830,8 +2819,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
 
-        do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, false,
-                  true, rt, iss_sf, false);
+        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                  false, true, rt, iss_sf, false);
     }
     tcg_temp_free_i64(clean_addr);
 }
@@ -2989,11 +2978,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
             /* Do not modify tcg_rt before recognizing any exception
              * from the second load.
              */
-            do_gpr_ld(s, tmp, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tmp, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
             tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_ld(s, tcg_rt2, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tcg_rt2, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
 
             tcg_gen_mov_i64(tcg_rt, tmp);
             tcg_temp_free_i64(tmp);
@@ -3124,8 +3113,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
             do_gpr_st_memidx(s, tcg_rt, clean_addr, size, memidx,
                              iss_valid, rt, iss_sf, false);
         } else {
-            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size,
-                             is_signed, is_extended, memidx,
+            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                             is_extended, memidx,
                              iss_valid, rt, iss_sf, false);
         }
     }
@@ -3229,9 +3218,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size,
-                      is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3314,8 +3302,8 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3402,7 +3390,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
          * full load-acquire (we only need "load-acquire processor consistent"),
          * but we choose to implement them as full LDAQ.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false,
                   true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -3475,7 +3463,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
                                 is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
-    do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
+    do_gpr_ld(s, tcg_rt, clean_addr, size,
               /* extend */ false, /* iss_valid */ !is_wback,
               /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
 
@@ -3560,8 +3548,8 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
          * Load-AcquirePC semantics; we implement as the slightly more
          * restrictive Load-Acquire.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, is_signed, extend,
-                  true, rt, iss_sf, true);
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size + is_signed * MO_SIGN,
+                  extend, true, rt, iss_sf, true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
 }
-- 
2.25.1

