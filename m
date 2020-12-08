Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4240066lfb;
        Tue, 8 Dec 2020 10:11:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxstqXgPQ4qReqXUySVMjIVCuqHghyUPnQ8+u4AQYL9sKZN+bI2yJ2LmuO7VfClkleosD2V
X-Received: by 2002:a25:1383:: with SMTP id 125mr29505925ybt.32.1607451083793;
        Tue, 08 Dec 2020 10:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451083; cv=none;
        d=google.com; s=arc-20160816;
        b=ztuDvpcpU1XeXcCwzjjMGKnBIVtwwrFfvtKvod56ku7s01dAAtKGwWUSWzicF8x2Kg
         Bi72ZDhINGsm7y/8CNG+oT+spbQocuXLKrRAenDcc27CADPAl5L3tzu8qoLFAbcvbjTH
         6WQPfgUGiZz/SkDW4vw7dT2r3sGXjI/e9oKJi93Qt5MoFuRXiFFVgxYbQAaKDPNasZ6P
         SDn1+2otgW6/SxuxyTGzXRWAi9PMCe6ovJ+ESyDW2zI+blR6p4ng1Prfk1C58JFWRSXY
         t/eZ96FHup//YjN3IVH7SHAG8oZOkSlgBVKnSBiQRVVvgoKgTxOWwfR9ZBnQ+WAfjcJl
         x0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cNC0T7rNjPLMZzj0tvfPEhRFtAoFlS8LhMxO6R/0Cws=;
        b=YZa6l/vbNtobNMV+wtEbTHvuRIfUj/qFirB5K0cCh/BR03xirGXuDkRzfnxu8ay54N
         Q35KWChDzTDqRw1U8oGb8lwLMZjNrrS2znui2mPswUqgJtKmawA/Y/JGglJtaEg5C9se
         aN/O69dykGcNwXoNDZ/Cz8A0dkT5/PC+yZfictvjO1/qDiNWMUf4UeY2GhzUw2zzXeEH
         q0e8QDumufr17yhwVJ7pDRtCzU2iUWL+Se1mBctb0ksYXL6bEccjM5n5m8kJaNrC46qV
         /G/aWHkUgfsq5ktCm8i+x09LnwvD7s2V90zGUvmUYrDCi2GctaXrN37KNE8Z4XSwtn91
         M9Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F6Lsk1+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si15379150ybm.31.2020.12.08.10.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:11:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F6Lsk1+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhSN-000073-5z
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ8-0007uh-Lh
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:50 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ5-0006Op-PI
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:50 -0500
Received: by mail-ot1-x343.google.com with SMTP id d8so8705696otq.6
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNC0T7rNjPLMZzj0tvfPEhRFtAoFlS8LhMxO6R/0Cws=;
 b=F6Lsk1+l8Jol8vQAIWR1r1vsSCKU8+NN3l8pc1Tmf3PLGceCmWXBEQH/LoSPG/089Q
 fjaTem7G7sMf+TxU2Wzd17YLrrE3dOT/pDhlMm1fgAFLYe1UxODOZ3HAK0kt37RX1aIP
 sJTGIXvIv2pMdRViRAcBTEfFy0YCV81j4ssKrJ5Fz5mLVpMPm8M9UU7ymUWVEFFG3jSW
 kfOoS5gpu5zkC0O4xD2Zg3nXwMTEP7NEKWMUJzySl6kYzWTVYCSKdz9YzzfXUJIl7nQv
 z3Df2/MyRa0iVOGYIjwCT81AO/CPfE0/BpbVVnPQMsOr05gSWwSzKm3CXgevSqqiEUji
 SM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNC0T7rNjPLMZzj0tvfPEhRFtAoFlS8LhMxO6R/0Cws=;
 b=SYOXYW5C8fUaVokiweY83NBj1JECJNds/YQGBwL1T4s52jKb+FHioXy/ewDonkrSlK
 0CnxQ1IEccBFWx6xnN3CFmntgxQ2xKiSSUIR9+qS8O11fcmNxyJ43a1gkE5QN0ye2OEa
 yv1i8NjvzEKdy8ugcJSUOe8wUh1hSMWmoLmvbcNO1xSy3PPZ1qs1WKZXfJ7O9dAqUUg2
 t4dlXbXmGw13/z5ui64vxVr6oeBnob8ryx34PXSJKnuMfLTYrxeFArl1R9MugLMHVNn0
 v4TT1g1+5eNhaa3sUwDlZj7fOqfsyQLodQj5OsWkhOCp6hK+YXzBQ2b/CI6D+CvQtTgI
 FeMg==
X-Gm-Message-State: AOAM533zNxpBEJ6Z3E0S0liaR94N8micNQGkVT3oaNVtEfUDDkFbj5bq
 T3r1+RJeCX97qv+UDM2QpmwuSQ==
X-Received: by 2002:a9d:550a:: with SMTP id l10mr17371770oth.357.1607450506679; 
 Tue, 08 Dec 2020 10:01:46 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
Date: Tue,  8 Dec 2020 12:01:09 -0600
Message-Id: <20201208180118.157911-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5s1nFVuZfb4x

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  1 +
 target/arm/translate.c          | 15 +++++++++++++++
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 22a4b15d45..c1ec661afb 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -204,6 +204,7 @@ void arm_test_cc(DisasCompare *cmp, int cc);
 void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
+MemOp pow2_align(unsigned i);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c7e01ea73a..7455118ff5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -875,6 +875,21 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
+MemOp pow2_align(unsigned i)
+{
+    static const MemOp mop_align[] = {
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
+        /*
+         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
+         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
+         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
+         */
+        MO_ALIGN_16
+    };
+    g_assert(i < ARRAY_SIZE(mop_align));
+    return mop_align[i];
+}
+
 /*
  * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 7cb89b18e0..4dab01ae18 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -429,7 +429,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, align, endian;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -473,20 +473,36 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
+
+    /* Enforce alignment requested by the instruction */
+    if (a->align) {
+        align = pow2_align(a->align + 2); /* 4 ** a->align */
+    } else {
+        align = s->align_mem ? MO_ALIGN : 0;
+    }
+
     /*
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (interleave == 1 && endian == MO_LE) {
+        /* Retain any natural alignment. */
+        if (align == MO_ALIGN) {
+            align = pow2_align(size);
+        }
         size = 3;
     }
+
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    mop = endian | size | align;
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,15 +510,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1

