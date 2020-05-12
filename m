Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1324316lfb;
        Tue, 12 May 2020 09:48:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIUS72C6+laefTC0DzDL/lVv/Tic++XZaPwGLB3QhSADsSOyPuWp40JBgs6jNSaBJBmxEx
X-Received: by 2002:ae9:e712:: with SMTP id m18mr23282146qka.11.1589302113062;
        Tue, 12 May 2020 09:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589302113; cv=none;
        d=google.com; s=arc-20160816;
        b=0WlVD9a804QDrRJglmHbi/x4oJjzjKOJFd55bKKzf3ENQ2iw6Yo5EWYqNH13xBrzNQ
         U87DicgdPhoJsA9WvkV1T+oT1sdhHfv17dz4b2RA24WP27640VRAA6G+kt3dURRO8rut
         NEAm8Bh1z/x5euWo11CB3dPHwgMoFPAS8xArVsd5gUaG22mOvlvYDYkgCRn+xJvkcQLI
         uK7vc5umSGCPg7eTgrU1yXt6tI/2xD/rpT4gKvR4+6qjGdzPeZS2paYCJ5UkdZoZqM/D
         kCfKlb0OJbvNl7cwljYCS2WjSJY7JEpwlyY+xoRvUWx1CjNOxG5lqrI6SKznMY15tvr9
         YWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PpEsdABitILB0n477zrURAQAbSkegxBFrS84gleg/2g=;
        b=ENTj70/q0vfebDUZFaemux6jMztYPHRkQZUaDBmccudGB2vuYn2mOBIQ5uS2pqK3aR
         5y+P8kdToI/m8/syyg6g2IetCkrWZtqDhSTlCB3DUwh9ny3Ilz/yRulPwi9Jy+Udkk29
         WnftJFPimAQfvn+pzCFZeOeTkpWzqnsl7Uuy/ZfLcTfwUZK0WwRwCogolNxnqR7WCnax
         BAo8VP1QciHeSEiLs8Y26h6uGlABF9NDo+StRypjrkMI1l6byfecTBDoW8JaDe4j+Gx1
         Rr9NMjzlBMiJ2987qd1qHpNjlx7dATrjYRpq909pXYOOa+VvOylL2ALeeFvymzuhzGon
         BK8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCaxqqlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si5385493qvb.159.2020.05.12.09.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCaxqqlJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYY52-0001n2-Bu
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw7-0006U1-SJ
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw6-00067B-PA
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f134so10381712wmf.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpEsdABitILB0n477zrURAQAbSkegxBFrS84gleg/2g=;
 b=XCaxqqlJpeNtUuZhvdYnjmF9wr3CxEs9j2mndyw5MbFOfLj+ez3gZe3PeS2zzInC1X
 9aJkFKbbWpaRNBo8cL1pgc2Cuqp1oueYZ8JtYujVwyyBut2SHKC2IKPjWVvRsHeAbkcK
 IAJ+fk8VGpuJpMuanOlQKXcvE9A9N7UsSh9rQuu6e/MG70cWoU1bSAt2bfka2G3fdhZP
 uvN9fWzyz2iGaC1ydYjHjkE1mxqHErOGUlFijGLS9vMhEDvvzc1Y8MwOsVmkgxHzwJSA
 k304bfkU7xMR2rkrYIjzZL0KoTn+H8XhxuzR8GohPOZW+r/HVOLj3b/9k7lggIyUjBk4
 gOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpEsdABitILB0n477zrURAQAbSkegxBFrS84gleg/2g=;
 b=gdWtgt1XTBCVkb2j+ZWkI3npSp5xnQTEJvRw6Z2/LnX2nwl9fKDYtNlScBDcZM+hHc
 oZIj1PUeYUYpe2TU91MRMqdcsMwNP4Pc5cWeR5ALr1h5nWIT93BsPpNRyEHKsA0EfmRn
 mE5nQx4EzdePDGFTQLdlF9QJorfKhQ8p0fDNRh+Sc86K5fNfA5/htGpi47q/z8kxTxfl
 J8FWHUUTlsLGm610+7VMwBZhRvXS+piZTkVb7L0ToIS9IgtroLjF9K4MvI0tslchgofM
 8huAfadj5pf4DTPnRLJPN3OvDR25ifKSo4BkzpWHNv50+INrY4AG2ocBhOcUBUP83ytY
 zyUQ==
X-Gm-Message-State: AGi0PuZvSYt0htKeKr3dimcmm+9BDkQuB+3rEp+WbeusVH5eV8gZmm3b
 fGaxPZfdIztpOt5RpAGAA5pTVQwASiBgqA==
X-Received: by 2002:a7b:c046:: with SMTP id u6mr8336567wmc.57.1589301556894;
 Tue, 12 May 2020 09:39:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] target/arm: Convert Neon VQSHL, VRSHL,
 VQRSHL 3-reg-same insns to decodetree
Date: Tue, 12 May 2020 17:38:54 +0100
Message-Id: <20200512163904.10918-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pu39EIDCzKt

Convert the VQSHL, VRSHL and VQRSHL insns in the 3-reg-same
group to decodetree. We have already implemented the size==0b11
case of these insns; this commit handles the remaining sizes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 47 +++++++++++++++++++++++----------
 target/arm/translate-neon.inc.c | 43 ++++++++++++++++++++++++++++++
 target/arm/translate.c          | 22 +++------------
 3 files changed, 79 insertions(+), 33 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 353cb1f4992..e0da5a39fc2 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -74,14 +74,6 @@ VCGE_S_3s        1111 001 0 0 . .. .... .... 0011 . . . 1 .... @3same
 VCGE_U_3s        1111 001 1 0 . .. .... .... 0011 . . . 1 .... @3same
 
 # The shift operations are of the form Vd = Vm << Vn.
-# By reversing the names of the fields here, we can use standard expanders.
-@3same_rev       .... ... . . . size:2 .... .... .... . q:1 . . .... \
-                 &3same vn=%vm_dp vm=%vn_dp vd=%vd_dp
-
-VSHL_S_3s        1111 001 0 0 . .. .... .... 0100 . . . 0 .... @3same_rev
-VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
-
-# Insns operating on 64-bit elements (size!=0b11 handled elsewhere)
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
 # with the Vm and Vn fields in their usual places, but in the
@@ -92,15 +84,42 @@ VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 # function code (where we would otherwise need to manually swap
 # the operands over to call Neon helper functions that are shared
 # with AArch64 which does not have this odd reversed-operand situation).
+@3same_rev       .... ... . . . size:2 .... .... .... . q:1 . . .... \
+                 &3same vn=%vm_dp vm=%vn_dp vd=%vd_dp
+
+VSHL_S_3s        1111 001 0 0 . .. .... .... 0100 . . . 0 .... @3same_rev
+VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
+
+# Insns operating on 64-bit elements (size!=0b11 handled elsewhere)
+# The _rev suffix indicates that Vn and Vm are reversed (as explained
+# by the comment for the @3same_rev format).
 @3same_64_rev    .... ... . . . 11 .... .... .... . q:1 . . .... \
                  &3same vm=%vn_dp vn=%vm_dp vd=%vd_dp size=3
 
-VQSHL_S64_3s     1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
-VQSHL_U64_3s     1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
-VRSHL_S64_3s     1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
-VRSHL_U64_3s     1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
-VQRSHL_S64_3s    1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
-VQRSHL_U64_3s    1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
+{
+  VQSHL_S64_3s   1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
+  VQSHL_S_3s     1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_rev
+}
+{
+  VQSHL_U64_3s   1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
+  VQSHL_U_3s     1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_rev
+}
+{
+  VRSHL_S64_3s   1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
+  VRSHL_S_3s     1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_rev
+}
+{
+  VRSHL_U64_3s   1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_64_rev
+  VRSHL_U_3s     1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_rev
+}
+{
+  VQRSHL_S64_3s  1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
+  VQRSHL_S_3s    1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_rev
+}
+{
+  VQRSHL_U64_3s  1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
+  VQRSHL_U_3s    1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_rev
+}
 
 VMAX_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 0 .... @3same
 VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index e9da47171c6..7097c18f334 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -875,9 +875,52 @@ DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
         return do_3same(s, a, gen_##INSN##_3s);                         \
     }
 
+/*
+ * Some helper functions need to be passed the cpu_env. In order
+ * to use those with the gvec APIs like tcg_gen_gvec_3() we need
+ * to create wrapper functions whose prototype is a NeonGenTwoOpFn()
+ * and which call a NeonGenTwoOpEnvFn().
+ */
+#define WRAP_ENV_FN(WRAPNAME, FUNC)                                     \
+    static void WRAPNAME(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m)            \
+    {                                                                   \
+        FUNC(d, cpu_env, n, m);                                         \
+    }
+
+#define DO_3SAME_32_ENV(INSN, FUNC)                                     \
+    WRAP_ENV_FN(gen_##INSN##_tramp8, gen_helper_neon_##FUNC##8);        \
+    WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##16);      \
+    WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##32);      \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        static const GVecGen3 ops[4] = {                                \
+            { .fni4 = gen_##INSN##_tramp8 },                            \
+            { .fni4 = gen_##INSN##_tramp16 },                           \
+            { .fni4 = gen_##INSN##_tramp32 },                           \
+            { 0 },                                                      \
+        };                                                              \
+        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &ops[vece]); \
+    }                                                                   \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same(s, a, gen_##INSN##_3s);                         \
+    }
+
 DO_3SAME_32(VHADD_S, hadd_s)
 DO_3SAME_32(VHADD_U, hadd_u)
 DO_3SAME_32(VHSUB_S, hsub_s)
 DO_3SAME_32(VHSUB_U, hsub_u)
 DO_3SAME_32(VRHADD_S, rhadd_s)
 DO_3SAME_32(VRHADD_U, rhadd_u)
+DO_3SAME_32(VRSHL_S, rshl_s)
+DO_3SAME_32(VRSHL_U, rshl_u)
+
+DO_3SAME_32_ENV(VQSHL_S, qshl_s)
+DO_3SAME_32_ENV(VQSHL_U, qshl_u)
+DO_3SAME_32_ENV(VQRSHL_S, qrshl_s)
+DO_3SAME_32_ENV(VQRSHL_U, qrshl_u)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ebb899d846e..3aabb18720b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5439,6 +5439,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VHSUB:
         case NEON_3R_VABD:
         case NEON_3R_VABA:
+        case NEON_3R_VQSHL:
+        case NEON_3R_VRSHL:
+        case NEON_3R_VQRSHL:
             /* Already handled by decodetree */
             return 1;
         }
@@ -5449,17 +5452,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         pairwise = 0;
         switch (op) {
-        case NEON_3R_VQSHL:
-        case NEON_3R_VRSHL:
-        case NEON_3R_VQRSHL:
-            {
-                int rtmp;
-                /* Shift instruction operands are reversed.  */
-                rtmp = rn;
-                rn = rm;
-                rm = rtmp;
-            }
-            break;
         case NEON_3R_VPADD_VQRDMLAH:
         case NEON_3R_VPMAX:
         case NEON_3R_VPMIN:
@@ -5519,14 +5511,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VQSHL:
-            GEN_NEON_INTEGER_OP_ENV(qshl);
-            break;
-        case NEON_3R_VRSHL:
-            GEN_NEON_INTEGER_OP(rshl);
-            break;
-        case NEON_3R_VQRSHL:
-            GEN_NEON_INTEGER_OP_ENV(qrshl);
             break;
         case NEON_3R_VPMAX:
             GEN_NEON_INTEGER_OP(pmax);
-- 
2.20.1

