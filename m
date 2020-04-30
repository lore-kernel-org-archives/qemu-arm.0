Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2216856lfm;
        Thu, 30 Apr 2020 11:33:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrTEF8MuC23JBRU9TNhcM2n89a3LcvXrQUTnIfno8+/W+Jf+aClpTH9fgqL9VjLZlH6Oke
X-Received: by 2002:a37:508:: with SMTP id 8mr5077129qkf.265.1588271591006;
        Thu, 30 Apr 2020 11:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271591; cv=none;
        d=google.com; s=arc-20160816;
        b=dxe1H7M6YdPD/F6+Xt+9aC0qmM555ZiNPeKQ+GiIUKc1WsuceKQVs45kkGp9UM95X2
         mESTEtqdObAq24/tnK6H1uR9zy2+WPHKtRb9bP3opKq4fZtkevCf3QlVc3hApJqHTeOR
         XIcoX1WGO+hN6Wct9BCErBfCRyidJVmNABGAfgIWirWYatJjEFnTunrHnoRKifN0+zW/
         Aq7izMordtP2kVSlMDA19ZUW6TbGJkdUC0BaAZaUysQgs3CNfj9f3rSIc8WFNDDvejpo
         mW9gn9daI700ihVAQq8kiJfaFWCWfaRpy7thFh1pJz+4flg38WqFD98/duX1ABli/L0i
         KcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uShlUsC/z76KQv14R09xTWGtsptGuGstuNKNs/FRUag=;
        b=R1Kji6C+uTI/3DNY+uCWqrPTN5M8okwczWn9AcVkEkvrAwYbucksy+LGIZlBe+nVU9
         54qlNFhJPB/0kzLcgp0bL2QvH78OzxgJnyFVtMWW0qnkTbcCdw3h/PC8dWNuSNvWFGoM
         5H47hm33IW8+FutOwp2MCdMwrmYKtzRQe0BYbOZi5ruASO/AcQhU/HpEBQXIOqVWsJ56
         Vy8VZyruI1RT9RnMHid+CRhCwvKhH4T8xPsJY8m2P+re1SoMjR0WPX0rIAJkIUe0Ktfu
         yiMxqsGxpEpgixmQ4BjOxayRbLfXtiK/5xxzdbBQTF2VdJfBPhPesHuKJFVkrLtmddhX
         HvaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkXYyGcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x76si225223qkb.93.2020.04.30.11.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AkXYyGcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDzi-00048x-Ed
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDee-0002nF-B4
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe5-0001MX-3t
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:24 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDe4-0001Lb-IS
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:48 -0400
Received: by mail-wm1-x344.google.com with SMTP id g12so3074376wmh.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uShlUsC/z76KQv14R09xTWGtsptGuGstuNKNs/FRUag=;
 b=AkXYyGcc4XtG7kMQpj76prB8TF6AaTxJUdTXib5uyB8euWOSGeVfj+RBNUO55zf25R
 0cpbG1Xd/YLgdER3jCkM1m9jnVPSJAIhVPq/HV0Ng5pLnPokoSo4bhueYeSaZkwI//AG
 OWHyk45Cd6/dJ2onFerRB9taI8kroWrKMbXmwkM6Nt60C8QvI9fcRNNsBBTlQnbm2npr
 z46d7LEwlq72ytt/CAsXkrTdWsAXFzyHCD8eRiiQUPd5MQP/O8gdt6zfntDlENYRwBTH
 7oUb6oaprUMBc/aSpvAoxaI/mPU2UiQL1awUz8tywtK63E7kPuo/8n/JW2H/ZNNL2g2M
 zwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uShlUsC/z76KQv14R09xTWGtsptGuGstuNKNs/FRUag=;
 b=fIt2N5qP1qj41Urew1PdiWAw4GsN8gQ06casa418mL+Ptr3C2Tyt8Mqm4j/b0XRdVi
 S1DD9luMW+aivUtqK4lhM2uTee6Y6Soscwqc9nh0/pmB90VXgpRvg9X9UGldeH/WXixm
 mgMhNCdwpbm9NrC+zlWWtqzVYMCAAlBRH6BMVLcuEkIfq3H1Wj5eWS+iv0Fdl699+wPd
 VlWH+1YHdq7uW/NL8BjoK+72Zf5yBmJXv/47wUrUmEqsyDHVSHa/XnvyD+WBgSmkQQFh
 hvxoGMoAdxT9nZC2l06D9wtXeiUOuare5sF0jFxkOqejtvvPO5Q56BBbo7esoxI2+7Am
 4nQA==
X-Gm-Message-State: AGi0PuawEu0B5Krr8b6DZk0K4Doc9oExvlCMeapjwoyXOiVaS4ZBbVMq
 0szXm6uLyUsC3eEytBIXMHLcRtRdi9Vo1Q==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr4494231wma.91.1588270246167; 
 Thu, 30 Apr 2020 11:10:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/36] target/arm: Convert Neon VPMIN/VPMAX/VPADD float
 3-reg-same insns to decodetree
Date: Thu, 30 Apr 2020 19:09:59 +0100
Message-Id: <20200430181003.21682-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::344
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
X-TUID: x8y2AK1JQffc

Convert the Neon float VPMIN, VPMAX and VPADD 3-reg-same insns to
decodetree. These are the only remaining 'pairwise' operations,
so we can delete the pairwise-specific bits of the old decoder's
for-each-element loop now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 63 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 63 +++++----------------------------
 target/arm/neon-dp.decode       |  5 +++
 3 files changed, 76 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 6a27b7673c2..30832309924 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1375,3 +1375,66 @@ static bool do_3same_fp(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
 DO_3S_FP(VADD, gen_helper_vfp_adds)
 DO_3S_FP(VSUB, gen_helper_vfp_subs)
 DO_3S_FP(VABD, gen_helper_neon_abd_f32)
+
+static bool do_3same_fp_pair(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
+{
+    /* FP operations handled pairwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2, tmp3;
+    TCGv_ptr fpstatus;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    assert(a->q == 0); /* enforced by decode patterns */
+
+    /*
+     * Note that we have to be careful not to clobber the source operands
+     * in the "vm == vd" case by storing the result of the first pass too
+     * early. Since Q is 0 there are always just two passes, so instead
+     * of a complicated loop over each pass we just unroll.
+     */
+    fpstatus = get_fpstatus_ptr(1);
+    tmp = neon_load_reg(a->vn, 0);
+    tmp2 = neon_load_reg(a->vn, 1);
+    fn(tmp, tmp, tmp2, fpstatus);
+    tcg_temp_free_i32(tmp2);
+
+    tmp3 = neon_load_reg(a->vm, 0);
+    tmp2 = neon_load_reg(a->vm, 1);
+    fn(tmp3, tmp3, tmp2, fpstatus);
+    tcg_temp_free_i32(tmp2);
+    tcg_temp_free_ptr(fpstatus);
+
+    neon_store_reg(a->vd, 0, tmp);
+    neon_store_reg(a->vd, 1, tmp3);
+    return true;
+}
+
+/*
+ * For all the functions using this macro, size == 1 means fp16,
+ * which is an architecture extension we don't implement yet.
+ */
+#define DO_3S_FP_PAIR(INSN,FUNC)                                    \
+    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a) \
+    {                                                               \
+        if (a->size != 0) {                                         \
+            /* TODO fp16 support */                                 \
+            return false;                                           \
+        }                                                           \
+        return do_3same_fp_pair(s, a, FUNC);                        \
+    }
+
+DO_3S_FP_PAIR(VPADD, gen_helper_vfp_adds)
+DO_3S_FP_PAIR(VPMAX, gen_helper_vfp_maxs)
+DO_3S_FP_PAIR(VPMIN, gen_helper_vfp_mins)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c944cbf20af..5ae982ee253 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4700,7 +4700,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int shift;
     int pass;
     int count;
-    int pairwise;
     int u;
     int vec_size;
     uint32_t imm;
@@ -4785,6 +4784,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VPMIN:
         case NEON_3R_VPADD_VQRDMLAH:
         case NEON_3R_VQDMULH_VQRDMULH:
+        case NEON_3R_FLOAT_ARITH:
             /* Already handled by decodetree */
             return 1;
         }
@@ -4793,16 +4793,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             /* 64-bit element instructions: handled by decodetree */
             return 1;
         }
-        pairwise = 0;
         switch (op) {
-        case NEON_3R_FLOAT_ARITH:
-            pairwise = (u && size < 2); /* if VPADD (float) */
-            if (!pairwise) {
-                return 1; /* handled by decodetree */
-            }
-            break;
         case NEON_3R_FLOAT_MINMAX:
-            pairwise = u; /* if VPMIN/VPMAX (float) */
+            if (u) {
+                return 1; /* VPMIN/VPMAX handled by decodetree */
+            }
             break;
         case NEON_3R_FLOAT_CMP:
             if (!u && size) {
@@ -4830,41 +4825,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             break;
         }
 
-        if (pairwise && q) {
-            /* All the pairwise insns UNDEF if Q is set */
-            return 1;
-        }
-
         for (pass = 0; pass < (q ? 4 : 2); pass++) {
 
-        if (pairwise) {
-            /* Pairwise.  */
-            if (pass < 1) {
-                tmp = neon_load_reg(rn, 0);
-                tmp2 = neon_load_reg(rn, 1);
-            } else {
-                tmp = neon_load_reg(rm, 0);
-                tmp2 = neon_load_reg(rm, 1);
-            }
-        } else {
-            /* Elementwise.  */
-            tmp = neon_load_reg(rn, pass);
-            tmp2 = neon_load_reg(rm, pass);
-        }
+        /* Elementwise.  */
+        tmp = neon_load_reg(rn, pass);
+        tmp2 = neon_load_reg(rm, pass);
         switch (op) {
-        case NEON_3R_FLOAT_ARITH: /* Floating point arithmetic. */
-        {
-            TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-            switch ((u << 2) | size) {
-            case 4: /* VPADD */
-                gen_helper_vfp_adds(tmp, tmp, tmp2, fpstatus);
-                break;
-            default:
-                abort();
-            }
-            tcg_temp_free_ptr(fpstatus);
-            break;
-        }
         case NEON_3R_FLOAT_MULTIPLY:
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
@@ -4955,22 +4921,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         tcg_temp_free_i32(tmp2);
 
-        /* Save the result.  For elementwise operations we can put it
-           straight into the destination register.  For pairwise operations
-           we have to be careful to avoid clobbering the source operands.  */
-        if (pairwise && rd == rm) {
-            neon_store_scratch(pass, tmp);
-        } else {
-            neon_store_reg(rd, pass, tmp);
-        }
+        neon_store_reg(rd, pass, tmp);
 
         } /* for pass */
-        if (pairwise && rd == rm) {
-            for (pass = 0; pass < (q ? 4 : 2); pass++) {
-                tmp = neon_load_scratch(pass);
-                neon_store_reg(rd, pass, tmp);
-            }
-        }
         /* End of 3 register same size operations.  */
     } else if (insn & (1 << 4)) {
         if ((insn & 0x00380080) != 0) {
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 9d6a17d6f04..378c2dd5105 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -48,6 +48,8 @@
 # For FP insns the high bit of 'size' is used as part of opcode decode
 @3same_fp        .... ... . . . . size:1 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
+@3same_fp_q0     .... ... . . . . size:1 .... .... .... . 0 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp q=0
 
 VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
 VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
@@ -161,4 +163,7 @@ VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
 
 VADD_fp_3s       1111 001 0 0 . 0 . .... .... 1101 ... 0 .... @3same_fp
 VSUB_fp_3s       1111 001 0 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VPADD_fp_3s      1111 001 1 0 . 0 . .... .... 1101 ... 0 .... @3same_fp_q0
 VABD_fp_3s       1111 001 1 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VPMAX_fp_3s      1111 001 1 0 . 0 . .... .... 1111 ... 0 .... @3same_fp_q0
+VPMIN_fp_3s      1111 001 1 0 . 1 . .... .... 1111 ... 0 .... @3same_fp_q0
-- 
2.20.1

