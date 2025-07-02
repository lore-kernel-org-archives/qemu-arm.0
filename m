Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3791218dye;
        Wed, 2 Jul 2025 05:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqasG2qstNed+q+A66CN0VAwRbOTAAhoVokCSnDjnUIp7gqw8TiiRSV3NjFB/nKfCWRGVnUihjeGaq6g==@linaro.org
X-Google-Smtp-Source: AGHT+IFQC3gwP/9oUXV44kDHnhEx3y+iWNPap/ATFk3RnnBqOKkzJON6lXxnyN/O9sz57gfLrx++
X-Received: by 2002:a05:622a:143:b0:4a6:f3f7:4c28 with SMTP id d75a77b69052e-4a97bd81c00mr28577861cf.17.1751461188973;
        Wed, 02 Jul 2025 05:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461188; cv=none;
        d=google.com; s=arc-20240605;
        b=lHOkCxqlwwNrkOdKMlp1Q75lvBH1Bs2TPHRr6IB1iFmjHRKa9RSMZQib1hfxEUKjP2
         6hM9RViOTZ0yODII6ElfqL05txVx8bnPQ/SBAdklmSCyfrRVE/UiPrcWSXW2131XF0xx
         13EKChsKt3Mp3BMSG+zgMAncwinBij+oDAOUC/J8vwUrrlxzookq4sR8O8AY8e8+kOJ+
         o82oZia12TGZPi4QT/17rFMKI0UH4yuLYD8A2KXTSQFs4O3zt45Yn+bQjKi9XhQHM++q
         k7uvrNAL0dZisiV0tmczcZq5T+P25OlAJkn2aZerrQygXHIe8lPkfimsiNIUyze8b5no
         FSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=41/UZQWqjWA9MKNou0GqzXgtIM88/+yUNLZL5X4BpEo=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=kCVQWus3BBp9MlIQQqsUPTugFsjJzu5pQvFP3eOwGYkSyB1aZSXhJp/1GGyeKFeR3n
         Rr9rLGX7DnRJLU6mvuxTzCfrB7tXfrVAk/nS+L2HvarHdY0NgGKkvvpy0S0v0MMuMkcm
         PZr/mcPHdFgBacID2h4/JNaKTyGx1zq80BwQrJQSVoZ1121QvWxXoGofn+8qP/JinlfO
         hBVA0OiugGj0bcCgILua8Wn2bt2NVR5X92v/+DrXp2RIIUafEsKRmiJaBknEMDyJWASb
         EjatVJfAW6ZeIfdqni6p8j+6wU8ibLaMdJ6BVl6OCFKXiiaP8cKPdwmtfCalrX0cxfpL
         WQng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIsEffjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a807945959si99247661cf.101.2025.07.02.05.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIsEffjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwnW-0000wQ-Qk; Wed, 02 Jul 2025 08:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjX-0004Ma-Ik
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:45 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjJ-00026u-An
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:38 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2eacb421554so1272142fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459902; x=1752064702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41/UZQWqjWA9MKNou0GqzXgtIM88/+yUNLZL5X4BpEo=;
 b=nIsEffjlTf49cahC6UZVcfs9K5iCu9M/yifjyP7UK4oJgRZmd9Y+9/50Q84ZPO+3kw
 189b5EB2H8tXLgD96G1eTasabQKaXFdWfx5/1rvZBsbZFevykzBtD6kVIh5B4IeDSOMW
 J3+z5Q8t7dQCjYkeH4XoEqOJGQ6mVVxqcbJq6qL8wxmTddjfFdUVN102R95EH2lWtF8J
 y8DeI8MaErENcvNO0XpwbmRknff3X5CfwNBAd6sWsPyhP7/iGurJrCiA1Re+oMO9aE1v
 GkFQ6qRUTfovez8v0G7nyBwCT1jC4ExPacCIqMEk5AVX+HIzV2BmIB45e2SUE75cizuZ
 mT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459902; x=1752064702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41/UZQWqjWA9MKNou0GqzXgtIM88/+yUNLZL5X4BpEo=;
 b=TJnyUHj3wClSm36e5mAfjr1TaPBDmuC+ond1mmN9gPiEI8pdgYnmDHev8FIXP0Gy0o
 w02DPG5fmQEnE+IZFxaz8uMhby/sLjgJVH2blM+y0pFf0alsZNy+zO558u+oGTjNdXjv
 E/33ubaft2BQGFCIS+AQdkBHlRZ/F6M9Pa3yn8R2hYBil3mSCPb0YbUUFn+WzddDuarn
 RFbZpoUqms4LLptTupSCBe5hO8rkgAU/MbmgrmbeqYexTOUqFOV636eQe2n9vx0ROZ/H
 lDsy+wiiH/DtAJVoK0l+fjwE5zlbyuMX9ioYan68Ze3zb6amTs50atwUSW1VaAt/21C7
 rWlA==
X-Gm-Message-State: AOJu0YxggpBzxb5L8XuaZsNtNNyYGJn5Mbc+sXt63DO5x4bhKmQ2buUo
 nTSBzS7iJyNqQcZUJ3TkkjZxt86oKNhM4kWE2kwDy/agk+09xE5fdMkpc9WPW5kM3PwbCOkO9A/
 5Bue2/1E=
X-Gm-Gg: ASbGncsA4bwz9f5TBDQBWE1XESzaa3he4dp7XLW46II9YpeRgdtvkpuye5G8LaicpMO
 uCCAHGRsFtOE+MZNLJ3nnp0xM8Mwh7uBlY/CdvS3d5sHlLBPki2CTUa++FtNSEoVq8dcEQ/TNOo
 6D3jkUs3V7tH2OqDOV2L3uDUxZL+aQPm1WQRF2Io3JUY+fqGCPWRE6NAMwpY4szL9o0UGjpULY5
 Y0RGQZpgR2bb4p7m9flD96jmFAeaWuoUeCbcHq70GunXmDy+qR3QRIeng6k2r77vXTRDL9X379E
 qD/xMgri75ywN6UHF1AR7cRLlj7Zti70toTqLKZMMS/M3aBoLrUTAKobcPtZ5kQ7nSqQyw==
X-Received: by 2002:a05:6870:8454:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-2f5a8d1f0d2mr2064538fac.7.1751459901842; 
 Wed, 02 Jul 2025 05:38:21 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 55/97] target/arm: Implement SME2 ZIP, UZP (two registers)
Date: Wed,  2 Jul 2025 06:33:28 -0600
Message-ID: <20250702123410.761208-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xgwsgHQxnUvk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 12 +++++++
 target/arm/tcg/sme_helper.c    | 62 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 40 ++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 12 +++++++
 4 files changed, 126 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 97428bcd6b..06b95da3c3 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -255,6 +255,18 @@ DEF_HELPER_FLAGS_3(sme2_uunpk4_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uunpk4_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uunpk4_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme2_zip2_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_zip2_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_zip2_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_zip2_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_zip2_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_uzp2_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uzp2_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uzp2_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uzp2_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uzp2_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sme2_zip4_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_zip4_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_zip4_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 987880e310..7a869f6b9c 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1926,6 +1926,37 @@ void HELPER(sme2_ucvtf)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define ZIP2(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    ARMVectorReg scratch[2];                                    \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t pairs = oprsz / (sizeof(TYPE) * 2);                  \
+    TYPE *n = vn, *m = vm;                                      \
+    if (vd <= vn && vn < vd + 2 * sizeof(ARMVectorReg)) {       \
+        n = memcpy(&scratch[0], vn, oprsz);                     \
+    }                                                           \
+    if (vd <= vm && vm < vd + 2 * sizeof(ARMVectorReg)) {       \
+        m = memcpy(&scratch[1], vm, oprsz);                     \
+    }                                                           \
+    for (size_t r = 0; r < 2; ++r) {                            \
+        TYPE *d = vd + r * sizeof(ARMVectorReg);                \
+        size_t base = r * pairs;                                \
+        for (size_t p = 0; p < pairs; ++p) {                    \
+            d[H(2 * p + 0)] = n[base + H(p)];                   \
+            d[H(2 * p + 1)] = m[base + H(p)];                   \
+        }                                                       \
+    }                                                           \
+}
+
+ZIP2(sme2_zip2_b, uint8_t, H1)
+ZIP2(sme2_zip2_h, uint16_t, H2)
+ZIP2(sme2_zip2_s, uint32_t, H4)
+ZIP2(sme2_zip2_d, uint64_t, )
+ZIP2(sme2_zip2_q, Int128, )
+
+#undef ZIP2
+
 #define ZIP4(NAME, TYPE, H)                                     \
 void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
 {                                                               \
@@ -1960,6 +1991,37 @@ ZIP4(sme2_zip4_q, Int128, )
 
 #undef ZIP4
 
+#define UZP2(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    ARMVectorReg scratch[2];                                    \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t pairs = oprsz / (sizeof(TYPE) * 2);                  \
+    TYPE *d0 = vd, *d1 = vd + sizeof(ARMVectorReg);             \
+    if (vd <= vn && vn < vd + 2 * sizeof(ARMVectorReg)) {       \
+        vn = memcpy(&scratch[0], vn, oprsz);                    \
+    }                                                           \
+    if (vd <= vm && vm < vd + 2 * sizeof(ARMVectorReg)) {       \
+        vm = memcpy(&scratch[1], vm, oprsz);                    \
+    }                                                           \
+    for (size_t r = 0; r < 2; ++r) {                            \
+        TYPE *s = r ? vm : vn;                                  \
+        size_t base = r * pairs;                                \
+        for (size_t p = 0; p < pairs; ++p) {                    \
+            d0[base + H(p)] = s[H(2 * p + 0)];                  \
+            d1[base + H(p)] = s[H(2 * p + 1)];                  \
+        }                                                       \
+    }                                                           \
+}
+
+UZP2(sme2_uzp2_b, uint8_t, H1)
+UZP2(sme2_uzp2_h, uint16_t, H2)
+UZP2(sme2_uzp2_s, uint32_t, H4)
+UZP2(sme2_uzp2_d, uint64_t, )
+UZP2(sme2_uzp2_q, Int128, )
+
+#undef UZP2
+
 #define UZP4(NAME, TYPE, H)                                     \
 void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
 {                                                               \
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d413efd20e..d52ccf2ac5 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1507,3 +1507,43 @@ TRANS_FEAT(UQRSHRN_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshrn_sb)
 TRANS_FEAT(UQRSHRN_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshrn_dh)
 TRANS_FEAT(SQRSHRUN_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrun_sb)
 TRANS_FEAT(SQRSHRUN_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrun_dh)
+
+static bool do_zipuzp_2(DisasContext *s, arg_zzz_e *a,
+                        gen_helper_gvec_3 * const fn[5])
+{
+    int bytes_per_op = 2 << a->esz;
+
+    /* MO_128 can fail the size test. */
+    if (s->max_svl < bytes_per_op) {
+        unallocated_encoding(s);
+    } else if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        if (svl < bytes_per_op) {
+            unallocated_encoding(s);
+        } else {
+            tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->zd),
+                               vec_full_reg_offset(s, a->zn),
+                               vec_full_reg_offset(s, a->zm),
+                               svl, svl, 0, fn[a->esz]);
+        }
+    }
+    return true;
+}
+
+static gen_helper_gvec_3 * const zip2_fns[] = {
+    gen_helper_sme2_zip2_b,
+    gen_helper_sme2_zip2_h,
+    gen_helper_sme2_zip2_s,
+    gen_helper_sme2_zip2_d,
+    gen_helper_sme2_zip2_q,
+};
+TRANS_FEAT(ZIP_2, aa64_sme2, do_zipuzp_2, a, zip2_fns)
+
+static gen_helper_gvec_3 * const uzp2_fns[] = {
+    gen_helper_sme2_uzp2_b,
+    gen_helper_sme2_uzp2_h,
+    gen_helper_sme2_uzp2_s,
+    gen_helper_sme2_uzp2_d,
+    gen_helper_sme2_uzp2_q,
+};
+TRANS_FEAT(UZP_2, aa64_sme2, do_zipuzp_2, a, uzp2_fns)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 05d513efba..c1f73d9f63 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -848,3 +848,15 @@ UQRSHRN_sb      11000001 011 ..... 110111 ...01 .....       @rshr_sb
 UQRSHRN_dh      11000001 1.1 ..... 110111 ...01 .....       @rshr_dh
 SQRSHRUN_sb     11000001 011 ..... 110111 ...10 .....       @rshr_sb
 SQRSHRUN_dh     11000001 1.1 ..... 110111 ...10 .....       @rshr_dh
+
+&zzz_e          zd zn zm esz
+
+ZIP_2           11000001 esz:2 1 zm:5 110100 zn:5 .... 0    \
+                &zzz_e zd=%zd_ax2
+ZIP_2           11000001 00    1 zm:5 110101 zn:5 .... 0    \
+                &zzz_e zd=%zd_ax2 esz=4
+
+UZP_2           11000001 esz:2 1 zm:5 110100 zn:5 .... 1    \
+                &zzz_e zd=%zd_ax2
+UZP_2           11000001 00    1 zm:5 110101 zn:5 .... 1    \
+                &zzz_e zd=%zd_ax2 esz=4
-- 
2.43.0

