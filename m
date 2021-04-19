Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1499854lfb;
        Mon, 19 Apr 2021 13:48:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7+wXAWVbxScQ5h7f9jH/Rw3voMfEQeuM+r+/h1MrzNQJoN0KdYEh/WhBM2cX+oCA8xzw7
X-Received: by 2002:a92:ad07:: with SMTP id w7mr18830793ilh.98.1618865335785;
        Mon, 19 Apr 2021 13:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865335; cv=none;
        d=google.com; s=arc-20160816;
        b=R7DpVHZL0JnOBBC3rmcihhWZaDWIvVTO9pHOTsBIHfVUKF79Dfjgfb22P33Dk86zDY
         W0kd2o9CUf0JGibKBGy5AAyQRU7NbPB5bfQgeHmPJcxDsU4NKc2hNx9NsK6uw26Pk1cm
         ZBgzqyKqpFlZRiPMPSIxFnq4lLqcen2R0r/lyNNioFmC4BHsvA2lMGfouwB2U0u4ePzj
         osTeG6JqLVnVcQksZe0xrc1ylkdnK9eqsj6id3CMkPR44EDX03L536kYyfAQbfMmtJkR
         EnMnogCsGO6mc15KXPfrGikv4A9hIRfqDRBmyl2lSX46Zup0OcdivtEPJUg43mAg9vXO
         MaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Oh1qO2KUwgUkOK0Nb4wixyQnmsz7yfEm5+cSP3Pk7Zw=;
        b=a0uBykVi3+o/Opviy3DQkzr0YbjK+mfyq8DomjHlEP55l/BJMbo2oxZl2ep5gaE6nF
         Rm+r8qfCM4K2MR+1vItuxw6ib2J9lcIz8WhNz3itz1wwubTpBA7b4sYFuemw2CzeuFjp
         mHLCIvD1b2ag1bskpFd0vkGwyDeIsLdV7D6f8XOczle1Fp2QBdQinTUWhLX8Z9fddHI+
         /qe+3XXbnvEF/U4hijqTnCWKunVjEPrpW8Xz/sLZdg203VdNYwM5QC1jTjsIWGt/K0gI
         +jVG0ig2XG5eU9GDa8rhflcn8Jl4OlJdsWtOwfKkP/v7TdE77MBQwCBkYwDqqtzcWOH0
         T0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gW1eQkJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si189110iow.7.2021.04.19.13.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gW1eQkJR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYapD-0001nM-4K
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQp-0007qd-9b
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:43 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQm-0002hy-F6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:43 -0400
Received: by mail-qv1-xf33.google.com with SMTP id x27so17572941qvd.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oh1qO2KUwgUkOK0Nb4wixyQnmsz7yfEm5+cSP3Pk7Zw=;
 b=gW1eQkJRaA21l6IlgDqT3n7EmOnqUBXn8VRuQinNy4vOeCxp/8uh1+mp85D1sxXETM
 qTtKThqX+nY/GlnoDMZvi2v1inAC9QlkVV9uSznjaOuEWCvay5yvhpv47TWgbdCf7TW5
 +ExM040pCIluxruejoareVVxj3jFBUZU3Vs5SN2VnJIGPf3GOfHnUJvgTieK+CM0L8+g
 b06XLfrQNIh2NcsOfryyKuanVEBCYjxtfwFAMT5ej3hkmRlQchVxdhrKJrBVzlqmbJt8
 kpnGCNyTooaZTdHttD/BZnO1Ggov/NsHfGdhNExDjV0gJGjmPg3ZVMaYUBNJvXXkyjb/
 jkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oh1qO2KUwgUkOK0Nb4wixyQnmsz7yfEm5+cSP3Pk7Zw=;
 b=TxFjdFmY8cimNDn87LqET8Inr1DmZ33i6NafOHYuHTtfGUPLCPIYDKuygWWOhmYyZj
 D5sNjxlB8MvoNw4w8KUTZO4nFEaNjCQxwqnRCUmVFPPV1C9HQL2W55hc2oJxoNVJx8g8
 RSCcTBw8VJ9XZRx4MEO0BlVEfroIKMNR2Yz/QrFM04/d75oc1gWo9XkDsyYgt2coPdaL
 o0DDaDvJ8/2gWnVdbQZXpxR+s9A/ouVa0QQxRoZ5iB/UsCQn30lPm2PIvEa4WeldUfVY
 xYaKM/oT2iVCvoDoBqHA1qvceBOSQuPECjZZEWL53uM31Z5InqAWTvHCqGTSirzcwvRF
 yizA==
X-Gm-Message-State: AOAM530nzjW4X9+AWLrMh+jz9+QHAEUVzAB6N+cdGJCBBQmmtAKMmI82
 hHGhcunb8wJlcc4fiT7PTzlHE/d6WQrpUFrf
X-Received: by 2002:a0c:b348:: with SMTP id a8mr23368447qvf.7.1618863819254;
 Mon, 19 Apr 2021 13:23:39 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/31] target/arm: Enforce alignment for VLDn (all lanes)
Date: Mon, 19 Apr 2021 13:22:48 -0700
Message-Id: <20210419202257.161730-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hS1ZVnXg3RAd

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix alignment for n in {2, 4}.
---
 target/arm/translate.h          |  1 +
 target/arm/translate.c          | 15 +++++++++++++
 target/arm/translate-neon.c.inc | 37 +++++++++++++++++++++++++--------
 3 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 0c60b83b3d..ccf60c96d8 100644
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
index 4decb2610e..0cf6da7e79 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -908,6 +908,21 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
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
index 18d9042130..9c2b076027 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int size = a->size;
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
+    MemOp mop, align;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -532,18 +533,33 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         return false;
     }
 
+    align = 0;
     if (size == 3) {
         if (nregs != 4 || a->a == 0) {
             return false;
         }
         /* For VLD4 size == 3 a == 1 means 32 bits at 16 byte alignment */
-        size = 2;
-    }
-    if (nregs == 1 && a->a == 1 && size == 0) {
-        return false;
-    }
-    if (nregs == 3 && a->a == 1) {
-        return false;
+        size = MO_32;
+        align = MO_ALIGN_16;
+    } else if (a->a) {
+        switch (nregs) {
+        case 1:
+            if (size == 0) {
+                return false;
+            }
+            align = MO_ALIGN;
+            break;
+        case 2:
+            align = pow2_align(size + 1);
+            break;
+        case 3:
+            return false;
+        case 4:
+            align = pow2_align(size + 2);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 
     if (!vfp_access_check(s)) {
@@ -556,12 +572,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
      */
     stride = a->t ? 2 : 1;
     vec_size = nregs == 1 ? stride * 8 : 8;
-
+    mop = size | align;
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
@@ -577,6 +593,9 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         }
         tcg_gen_addi_i32(addr, addr, 1 << size);
         vd += stride;
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1

