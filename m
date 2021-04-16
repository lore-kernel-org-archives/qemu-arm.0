Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp661068lfr;
        Fri, 16 Apr 2021 12:18:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT2qwlSUA+CtdyU1cVHNj9veAptOSKqqp3e2ikYYLpB8vlEel7u0XZpLuE2mFdjI7DGL5t
X-Received: by 2002:a05:6e02:1c28:: with SMTP id m8mr8487176ilh.244.1618600682659;
        Fri, 16 Apr 2021 12:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600682; cv=none;
        d=google.com; s=arc-20160816;
        b=PBAuOWTWvxmBTFR0nJ0RUfykT+kF1r9+zC/aQXEUMKMbcN3wlF6g1TKMP8XRA8X9jO
         tvLLy05Adl4matkZ0+CPNk7ifI1ViX4SglBaDL2giscExKXmLgzN/E91z8ZczLN+pdFI
         gJ0EWItRioCkP2kT8shqFboSDEvpQ5pi4DOw4LX2LV/nQt0204L2zdEsv5hBZnK/5VCq
         SL5l/n5mdS04XU7cih/QK9T9gQDgIRtZ6mxLT6jCRrLBtubN86bQkyTszr4yQVQ25HXm
         A9RpiP302cy6XuG+yn2xkHkesHuFhfEah0GHHSiW6xCoSs+Js+HKzTtYJny+i8RxZYe6
         re3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k4GoMuhnLHA2vh1yco9VQy1DoNTZgPa1ywK70BmOAqY=;
        b=GydayE3fHK8tZMzA06S1CDElGC46cNuvI+mr8TrXrQf4PE69EFz7NTTy1SfgJo5oOL
         5miZCtVgEUa7CVNLSMk8kEJibA/AIXb0s3jAlhd+dErWb2MpvnH9aXURde/x7oW8tC81
         5uAaz4Xe70sE4goBUVKjn7Zq3FdIYkjGZyGdZ0u/XHUHcTFH9e44FWFg2Tou1R3MRcnV
         vi+OsBqazEXfJGiDwUFY8h8itkV9mMWVGMbxjLn4IcgcgFoS7nmZX4lBmZC3ls3J2Tu0
         ZnA8bI76nH3G3WWM9lbP/TujtTsLpgGZLMtCTD2D+/ryQNdbkspWv6X+PUSKyrnHa8pu
         JPBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GnzWIBTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si6909054ili.98.2021.04.16.12.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GnzWIBTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTyb-0001Qa-V2
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThi-0003im-Sy
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThP-0004J4-3O
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:34 -0400
Received: by mail-pf1-x433.google.com with SMTP id m11so18947938pfc.11
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4GoMuhnLHA2vh1yco9VQy1DoNTZgPa1ywK70BmOAqY=;
 b=GnzWIBTWXqAzByjbNPgKQLnXeZu6PbtAWI69mugXofwcu0Wb8joJE3pjSqslecNGaq
 B9Kz5Ianwgf3GcK7gOFbB9WiehrsaZ2YCKK9LWPelUvBZVhxGFnWTbmrpUJxP8zs1y4c
 YBV5UXpQXOgcbXe/7P2xP1jEHZ6ZSeqAFOfkLhJK+GouL664GaEmS5EHyZpXxcBtMxLi
 KcoMnbV0rwczM2r+s4Nbo+6s+uX7jXJ+4o2tfXj3L2+WhwfyRXGF6RUxboHBQUh0K6ny
 AaJH1Thu9hRXCa5pVD+V9c+wGbrMqXSMbg6Eo7u/c/3vt8yVNooeBN5CzsluYxGEjQZM
 F/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4GoMuhnLHA2vh1yco9VQy1DoNTZgPa1ywK70BmOAqY=;
 b=Kxvx8gUoC/RD9aTtM8OS6DI9qdMp1VzbiZSqjIl6WH+OYb9O8JnQldky83+7SLiJ92
 S94RVA3AOzKT5cWp3kFJCSEcxYHByBhOIZsSkLZRkZLmSVjnaQVSY6mmEMb8bGNo6x9I
 6M501VxgCAi2OMa2OucU/bY82Xdpko24qPvKVKfmQ0qMtxqRMpr84nUAFhWCAxUWq9D+
 RaGMhvQj1AbAhAwgeFtK/9jJQtZhFNjLw4ZyyInnYW4FkN6rhGqcw7IEvjaMjauGN93r
 7zRYedW414scY0YASxvQHsLJMaOG9ZPqVGcFS24eRGTseTYp88Q2Lh/2ULLq1lLE3IiC
 HWaw==
X-Gm-Message-State: AOAM530DJI/QlmUknaEgUA18vMY1IuVdHozU82si4vb0HdFf5NH5TTNy
 KinNhBxjkGvcXsYQZVOSDifnAA==
X-Received: by 2002:a62:1409:0:b029:25a:4158:1c9 with SMTP id
 9-20020a6214090000b029025a415801c9mr3457417pfu.61.1618599609920; 
 Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/30] target/arm: Adjust gen_aa32_{ld,
 st}_i32 for align+endianness
Date: Fri, 16 Apr 2021 11:59:39 -0700
Message-Id: <20210416185959.1520974-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: 5KyCnvbmEniS

Create a finalize_memop function that computes alignment and
endianness and returns the final MemOp for the operation.

Split out gen_aa32_{ld,st}_internal_i32 which bypasses any special
handling of endianness or alignment.  Adjust gen_aa32_{ld,st}_i32
so that s->be_data is not added by the callers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  24 ++++++++
 target/arm/translate.c          | 100 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc |   9 +--
 3 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index b185c14a03..0c60b83b3d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -459,4 +459,28 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     return statusptr;
 }
 
+/**
+ * finalize_memop:
+ * @s: DisasContext
+ * @opc: size+sign+align of the memory operation
+ *
+ * Build the complete MemOp for a memory operation, including alignment
+ * and endianness.
+ *
+ * If (op & MO_AMASK) then the operation already contains the required
+ * alignment, e.g. for AccType_ATOMIC.  Otherwise, this an optionally
+ * unaligned operation, e.g. for AccType_NORMAL.
+ *
+ * In the latter case, there are configuration bits that require alignment,
+ * and this is applied here.  Note that there is no way to indicate that
+ * no alignment should ever be enforced; this must be handled manually.
+ */
+static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
+{
+    if (s->align_mem && !(opc & MO_AMASK)) {
+        opc |= MO_ALIGN;
+    }
+    return opc | s->be_data;
+}
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 51897a5113..5e6c40022f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -908,7 +908,8 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
-/* Abstractions of "generate code to do a guest load/store for
+/*
+ * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
  * extended if we're a 64 bit core) and  data is also
  * 32 bits unless specifically doing a 64 bit access.
@@ -916,7 +917,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
  * that the address argument is TCGv_i32 rather than TCGv.
  */
 
-static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
+static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 {
     TCGv addr = tcg_temp_new();
     tcg_gen_extu_i32_tl(addr, a32);
@@ -928,47 +929,51 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
     return addr;
 }
 
+/*
+ * Internal routines are used for NEON cases where the endianness
+ * and/or alignment has already been taken into account and manipulated.
+ */
+static void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+    tcg_gen_qemu_ld_i32(val, addr, index, opc);
+    tcg_temp_free(addr);
+}
+
+static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+    tcg_gen_qemu_st_i32(val, addr, index, opc);
+    tcg_temp_free(addr);
+}
+
 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
-    TCGv addr;
-
-    if (s->align_mem) {
-        opc |= MO_ALIGN;
-    }
-
-    addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_ld_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
+    gen_aa32_ld_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
 static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
-    TCGv addr;
+    gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
+}
 
-    if (s->align_mem) {
-        opc |= MO_ALIGN;
+#define DO_GEN_LD(SUFF, OPC)                                            \
+    static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_ld_i32(s, val, a32, index, OPC);                       \
     }
 
-    addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_st_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
-}
-
-#define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
-#define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}
+#define DO_GEN_ST(SUFF, OPC)                                            \
+    static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_st_i32(s, val, a32, index, OPC);                       \
+    }
 
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
 {
@@ -6456,7 +6461,7 @@ static bool op_load_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6477,7 +6482,7 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6500,13 +6505,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6529,13 +6534,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6600,7 +6605,7 @@ static bool op_load_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
 
     /*
@@ -6621,7 +6626,7 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
     tcg_temp_free_i32(tmp);
 
@@ -6637,13 +6642,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6676,13 +6681,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
@@ -6908,7 +6913,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7064,7 +7069,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
@@ -8248,8 +8253,7 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     addr = load_reg(s, a->rn);
     tcg_gen_add_i32(addr, addr, tmp);
 
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                    half ? MO_UW | s->be_data : MO_UB);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
     tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 0e5828744b..c82aa1412e 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -559,8 +559,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                        s->be_data | size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
@@ -650,13 +649,11 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
      */
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), a->size);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), a->size);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
-- 
2.25.1

