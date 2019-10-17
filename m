Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp438102wrm;
        Wed, 16 Oct 2019 21:46:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzv0g3jPx2myHO/s1zLyzqLgBZfCoHioiWWLsfMDVKsNxiMOhx2YrDc3FxnjLwuJv+JIg0D
X-Received: by 2002:aa7:d955:: with SMTP id l21mr1709257eds.179.1571287610501;
        Wed, 16 Oct 2019 21:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571287610; cv=none;
        d=google.com; s=arc-20160816;
        b=pYWQFwyRsJVdZSY4+OHD18FsOUsSW3vjtiIbDAT9q1rfvTMKWaREuhujHLjt4iK5+6
         mOTbE+z/Cx+nmUDcxDCfLWRR+u9OruJU5xQ7LG9p0Ap6nCJ//FdswzW7tV3kR80Va2kA
         V6mAlVWmuif3YdBv6u1M2VEyeSa2giwUFrucUsb+kinbbMbqtjWjWWO/PpNZOzRHfXnS
         BwpRm0FPw9jBiqKKK1jt4yUNgeecZXyTNPB1QlIuDVV+5SALX2bPr6TEqAXFsgf/RiCg
         ABmnPFkRp/dyZbAxoUoK4Jl+jTJRBWbx/15KxbUOZAxofOiQUr07VI/V6aztJMrWM4IE
         wCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=lVdQH6nYOq21p9N9yfgGgZSVSK8ODl+pJ+gy2hM81M4=;
        b=ShbP0HaU2p7IqZe2+F+BK3dRwcJU+TaH4uYjaJUXG3W3IgN31jr43IRg7Bixx+9YYT
         OulBjgq7nQDFWgynVT/03QKPE+EAg+JeMT0HE3TFJgaDv7PffOsOIs/29mWfX0f681sS
         hjeT8lFL1Iek29k80i4ktCD5JCe2IJprLGwMYXgz7Y5oFaS9mnnxR8IUPLWQEYjhf6vz
         hMTJbvr5lSySGhvMCsz1PwDhHrodyho4GViMzyOSDG1+Bi1YS74f+1gB/KDJwcDUH3RK
         qxZThaG0bIVqDGWgZL1Ubb7sLvGYj9xUhOXcHzQ4wPm18SL6PlTc4not3mH7j84hW9HE
         zyCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adSbWHGe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f41si778691edf.113.2019.10.16.21.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 21:46:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adSbWHGe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKxgX-0001qB-EO
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 00:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxcY-00079g-Do
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxcW-00026G-V2
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:42:42 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKxcW-00025p-OM
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:42:40 -0400
Received: by mail-pf1-x444.google.com with SMTP id v4so787905pff.6
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lVdQH6nYOq21p9N9yfgGgZSVSK8ODl+pJ+gy2hM81M4=;
 b=adSbWHGemM8aJJEiPLQ40FnnACAWUN8v2PEOpbkkNKFAgEByCo3t4x8+0+bqROQm0R
 +ypMcdNhFlAByqSvxbaSRuGdl8Yo4bp6hPi8JkQc0n45vY+vUm1bhnyHOOM4Devz5M6f
 vbzxM0ZoSZH0YttovbpqIq9V7W+AHhrgcM3dSYBmapEPPM+76uNpNHOjEAGjBfZYWklO
 CMjNYaLa+Gr9FcHkiXsbifaSWEok11G06/vwj5Mw8l9MR8ca3xVZzS2fjIiLls0tNFjq
 s89ckvsp8Wa9kIU+hRo3oQnyGfdfC9YgU16aB1xR6q0tLZfsqm5uk3PuWKWdtqEwBFyK
 U+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lVdQH6nYOq21p9N9yfgGgZSVSK8ODl+pJ+gy2hM81M4=;
 b=mkrXsSJ8mRgtGBxsSgThoGtpoEHlOCu1Qg0BJ/2zExh5OZQFEVcca8suLO5GNiY+K8
 sF4ZWNHAejiegntjHb3onjP8sZXu7G83B/YSlzImKhbPVoZSZRajU/IGHy5XBMhm2piv
 J/32E7R08ar4mfBMffye6xbcl6/5wWHJa5GcXvkGV+BSnPK8cEFL3GGOkzeRqRqZGWh6
 O4cHMg+U+rPk158p/oIVuJW6wg5wfRUwjXWB8wOPwNTCp0XOI0AM0PQtFKgpYT9ow7/j
 y6xaAgSlWGisyH1zrvZBGs9Jp8j4Fp9nIm1jX3mp6tp08qgla9lKd2IX4LM79Zhm2t2V
 7ZDA==
X-Gm-Message-State: APjAAAVt9RwuYU1u9ZNJkVXf0emqckNYw18564WVQx5v6kzk5OGlFbFQ
 XvLrCdo3JPR/vN4IsyVF4ICBx9c5G2M=
X-Received: by 2002:a63:931a:: with SMTP id b26mr1864485pge.217.1571287359211; 
 Wed, 16 Oct 2019 21:42:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n15sm718923pjt.13.2019.10.16.21.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 21:42:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Convert PMULL.64 to gvec
Date: Wed, 16 Oct 2019 21:42:31 -0700
Message-Id: <20191017044232.27601-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017044232.27601-1-richard.henderson@linaro.org>
References: <20191017044232.27601-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Muh7HCaBDOab

The gvec form will be needed for implementing SVE2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  4 +---
 target/arm/neon_helper.c   | 30 ------------------------------
 target/arm/translate-a64.c | 28 +++-------------------------
 target/arm/translate.c     | 16 ++--------------
 target/arm/vec_helper.c    | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 72 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 800446e537..d954399b7e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -555,9 +555,6 @@ DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_2(dc_zva, void, env, i64)
 
-DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
 DEF_HELPER_FLAGS_5(gvec_qrdmlah_s16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s16, TCG_CALL_NO_RWG,
@@ -689,6 +686,7 @@ DEF_HELPER_FLAGS_4(gvec_ushl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ushl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_pmul_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_pmull_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
index 9e7a9a1ac5..6a107da0e1 100644
--- a/target/arm/neon_helper.c
+++ b/target/arm/neon_helper.c
@@ -2152,33 +2152,3 @@ void HELPER(neon_zip16)(void *vd, void *vm)
     rm[0] = m0;
     rd[0] = d0;
 }
-
-/* Helper function for 64 bit polynomial multiply case:
- * perform PolynomialMult(op1, op2) and return either the top or
- * bottom half of the 128 bit result.
- */
-uint64_t HELPER(neon_pmull_64_lo)(uint64_t op1, uint64_t op2)
-{
-    int bitnum;
-    uint64_t res = 0;
-
-    for (bitnum = 0; bitnum < 64; bitnum++) {
-        if (op1 & (1ULL << bitnum)) {
-            res ^= op2 << bitnum;
-        }
-    }
-    return res;
-}
-uint64_t HELPER(neon_pmull_64_hi)(uint64_t op1, uint64_t op2)
-{
-    int bitnum;
-    uint64_t res = 0;
-
-    /* bit 0 of op1 can't influence the high 64 bits at all */
-    for (bitnum = 1; bitnum < 64; bitnum++) {
-        if (op1 & (1ULL << bitnum)) {
-            res ^= op2 >> (64 - bitnum);
-        }
-    }
-    return res;
-}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 04e25cfe06..12588d18df 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10598,30 +10598,6 @@ static void handle_3rd_narrowing(DisasContext *s, int is_q, int is_u, int size,
     clear_vec_high(s, is_q, rd);
 }
 
-static void handle_pmull_64(DisasContext *s, int is_q, int rd, int rn, int rm)
-{
-    /* PMULL of 64 x 64 -> 128 is an odd special case because it
-     * is the only three-reg-diff instruction which produces a
-     * 128-bit wide result from a single operation. However since
-     * it's possible to calculate the two halves more or less
-     * separately we just use two helper calls.
-     */
-    TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-    TCGv_i64 tcg_op2 = tcg_temp_new_i64();
-    TCGv_i64 tcg_res = tcg_temp_new_i64();
-
-    read_vec_element(s, tcg_op1, rn, is_q, MO_64);
-    read_vec_element(s, tcg_op2, rm, is_q, MO_64);
-    gen_helper_neon_pmull_64_lo(tcg_res, tcg_op1, tcg_op2);
-    write_vec_element(s, tcg_res, rd, 0, MO_64);
-    gen_helper_neon_pmull_64_hi(tcg_res, tcg_op1, tcg_op2);
-    write_vec_element(s, tcg_res, rd, 1, MO_64);
-
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_res);
-}
-
 /* AdvSIMD three different
  *   31  30  29 28       24 23  22  21 20  16 15    12 11 10 9    5 4    0
  * +---+---+---+-----------+------+---+------+--------+-----+------+------+
@@ -10686,7 +10662,9 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
             if (!fp_access_check(s)) {
                 return;
             }
-            handle_pmull_64(s, is_q, rd, rn, rm);
+            /* The Q field specifies lo/hi half input for this insn.  */
+            gen_gvec_op3_ool(s, true, rd, rn, rm, is_q,
+                             gen_helper_gvec_pmull_q);
             return;
         }
         goto is_widening;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b66a2f6b71..4e34249672 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5877,23 +5877,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                  * outside the loop below as it only performs a single pass.
                  */
                 if (op == 14 && size == 2) {
-                    TCGv_i64 tcg_rn, tcg_rm, tcg_rd;
-
                     if (!dc_isar_feature(aa32_pmull, s)) {
                         return 1;
                     }
-                    tcg_rn = tcg_temp_new_i64();
-                    tcg_rm = tcg_temp_new_i64();
-                    tcg_rd = tcg_temp_new_i64();
-                    neon_load_reg64(tcg_rn, rn);
-                    neon_load_reg64(tcg_rm, rm);
-                    gen_helper_neon_pmull_64_lo(tcg_rd, tcg_rn, tcg_rm);
-                    neon_store_reg64(tcg_rd, rd);
-                    gen_helper_neon_pmull_64_hi(tcg_rd, tcg_rn, tcg_rm);
-                    neon_store_reg64(tcg_rd, rd + 1);
-                    tcg_temp_free_i64(tcg_rn);
-                    tcg_temp_free_i64(tcg_rm);
-                    tcg_temp_free_i64(tcg_rd);
+                    tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, 16, 16,
+                                       0, gen_helper_gvec_pmull_q);
                     return 0;
                 }
 
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index d401282c6f..5c1074374e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1164,3 +1164,36 @@ void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+/*
+ * 64x64->128 polynomial multiply.
+ * Because of the lanes are not accessed in strict columns,
+ * this probably cannot be turned into a generic helper.
+ */
+void HELPER(gvec_pmull_q)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t hi = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        uint64_t nn = n[i + hi];
+        uint64_t mm = m[i + hi];
+        uint64_t rhi = 0;
+        uint64_t rlo = 0;
+
+        /* Bit 0 can only influence the low 64-bit result.  */
+        if (nn & 1) {
+            rlo = mm;
+        }
+
+        for (j = 1; j < 64; ++j) {
+            uint64_t mask = -((nn >> j) & 1);
+            rlo ^= (mm << j) & mask;
+            rhi ^= (mm >> (64 - j)) & mask;
+        }
+        d[i] = rlo;
+        d[i + 1] = rhi;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.17.1

