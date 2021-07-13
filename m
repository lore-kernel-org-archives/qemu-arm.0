Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp603706lfc;
        Tue, 13 Jul 2021 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRt6wjtOJhfPhgnmJjNVMHVN6A6bJbm/pCNvPA1N/SFGKuwhKCZ80QFlfNY7sSy6eZqxQN
X-Received: by 2002:a05:6102:675:: with SMTP id z21mr6256585vsf.48.1626184142587;
        Tue, 13 Jul 2021 06:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184142; cv=none;
        d=google.com; s=arc-20160816;
        b=R2nbK8abWoC3wwOWfuSdHwD0FVdcxNHwFPoID6gVbMsmVjQANqlfDrsV7uGRAP1gYJ
         ZKQAW9A7FUSNHkVYSUHpqjjQssNZypchkJ9uNhFLxfQ/12QnvxBrJ7pal9wIVZgBIRQl
         zuXbdquNEwo8u8gBweriIs1OSXSZbAIQqQZ+59QwlZtHnUD/JqaYEd1ViPUxzifuwMdX
         vtEk/cLlvDEmd0/3Zpuwupn/T3odqgtiOdm+wfeBFFcz/hkqBtvU+mne+UCYRBDKZ5FD
         7yhklFLkGz/fF05oWuUEcZO4fsZn1NxIBgumPbHJRyjHPAksjoOU6Qb6dTKz9hkZAcyf
         pxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hZ3VuhusV6EaIsCvrlgReeFP12hFhuCL2InmlZcVOMk=;
        b=fJhZrPvv5qkdBxnpt6fdU3STog9TEaTinauc/PlSoBXRRKqJFOLN8eW+DtSwI4QoaG
         SGhP1j69F46+PRHezWgCkYvNt1ur1GvP4U3lcAXd2EOU0hSlK48syKVlohM/Ea/Ok57X
         2uFEENKrbheyW+a6YfvgVmvVPNBjglQ391/bKXPe2QdhZhDWBZSEhIZliXJzYG/SizIM
         gI8nUsB2aN6p9vU9Cg3MLAdBgrj85+ggMjTpn9QqI4Z34smpRBn9rlu3HIaS+thvW6xE
         y5oDViei6mljJnzd/c3EK5AGVNYAc+XYkgwkOPP9mKBO/nAbZck9f8lBeL0M6euG0PJY
         M3Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPld11kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si1831600vsl.294.2021.07.13.06.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPld11kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3ImT-0004be-PA
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibb-0008WA-W5
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbV-0003gc-7K
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id v5so30525592wrt.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hZ3VuhusV6EaIsCvrlgReeFP12hFhuCL2InmlZcVOMk=;
 b=cPld11kjrtMLpKH7GFgjQy1CZmzdy+P3axgM0IwBwKhPW1y8/wgkWkHegr2iuGCKzZ
 ERqUhyRKQozBAp1q55LAvEHd1a8nowAanrt6ttOaMD0pDaIr4+1KnzNXvketmfLd221f
 o+V2CN+yALHL1HQnVwIfGF1cvIiNYYsiDOc1CJIcz9nECKFSxeFeMEpVZ6Xgf3SMb0B3
 vCzYyqjva3YZ6AT5+1wV3mdQHQM5psl20+JLPoRhJQ+ECXEn4/dapCQ4a8mGO0A2506S
 wTlJtLN01rUlr5kv4dGwPNGTdrg3cnhT6hTyWBLxxryxu+tH4ftqSBYdmRaR5ZmZzFqS
 bfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZ3VuhusV6EaIsCvrlgReeFP12hFhuCL2InmlZcVOMk=;
 b=A0vYwXYaMPyGDHPfRvw2khZxcMavfI6VN5r3GWftnqF2t0EStDJwZrBF5JZ6ZyBUn1
 TDiIKzO1ZgVc54HEjQ5SeMZ5FgqhS9Mojx+6uyxOjJUL/dMSbtLeeU7ciLjZ6o6MegAv
 DvwFrwFcftEtoyM79mnpifkqLV710W5HGPMNemEoNwUQChVVnJeUsSSrmjuJaQmNRfni
 TjQdS10Ried+hjjdLpGK0VVAy7iNCJXULIccGiub3AMsIPtzNpuucfaR9SFkaDpwHxpX
 AxBTqxYBYkjJmK8NUBVh4cM6qStOPpyUBORuR5dFBVvBT/mivvD2gqTDjTAM2yUIWldc
 A6HQ==
X-Gm-Message-State: AOAM532no7sRW4taKUukcip1H8fLV7+jOTYe/1hK22/a8kHhYY06tCiH
 UyP6uz/ZX9Z9JqvxKsLR48t0azgPdOi6Vzhy
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr5655733wrn.226.1626183459949; 
 Tue, 13 Jul 2021 06:37:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/34] target/arm: Implement MVE integer vector
 comparisons
Date: Tue, 13 Jul 2021 14:37:06 +0100
Message-Id: <20210713133726.26842-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I9XNeOgR9lbE

Implement the MVE integer vector comparison instructions.  These are
"VCMP (vector)" encodings T1, T2 and T3, and "VPT (vector)" encodings
T1, T2 and T3.

These insns compare corresponding elements in each vector, and update
the VPR.P0 predicate bits with the results of the comparison.  VPT
also sets the VPR.MASK01 and VPR.MASK23 fields -- it is effectively
"VCMP then VPST".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 32 ++++++++++++++++++++++
 target/arm/mve.decode      | 18 +++++++++++-
 target/arm/mve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 47 ++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 54b252e98af..e89238eac9d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -484,3 +484,35 @@ DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_uqrshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqrshr, TCG_CALL_NO_RWG, i32, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpeqb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpneb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpneh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpnew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpcsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmphib, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphih, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphiw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgeb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgeh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpltb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpltw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgtb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgtw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpleb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplew, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 88c9c18ebf1..76bbf9a6136 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -37,6 +37,7 @@
 &2shift qd qm shift size
 &vidup qd rn size imm
 &viwdup qd rn rm size imm
+&vcmp qm qn size mask
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -86,6 +87,10 @@
 @2_shr_w .... .... .. 1 ..... .... .... .... .... &2shift qd=%qd qm=%qm \
          size=2 shift=%rshift_i5
 
+# Vector comparison; 4-bit Qm but 3-bit Qn
+%mask_22_13      22:1 13:3
+@vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -345,7 +350,6 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
 # Predicate operations
-%mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
 
 # Logical immediate operations (1 reg and modified-immediate)
@@ -458,3 +462,15 @@ VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
 VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
 
 VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
+
+# Comparisons. We expand out the conditions which are split across
+# encodings T1, T2, T3 and the fc bits. These include VPT, which is
+# effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
+VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
+VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
+VCMPCS            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
+VCMPHI            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
+VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
+VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
+VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0ef5f5d8871..23398e86f7d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1762,3 +1762,59 @@ DO_VIDUP_ALL(vidup, DO_ADD)
 DO_VIDUP_ALL(vddup, DO_SUB)
 DO_VIWDUP_ALL(viwdup, do_add_wrap)
 DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
+
+/*
+ * Vector comparison.
+ * P0 bits for non-executed beats (where eci_mask is 0) are unchanged.
+ * P0 bits for predicated lanes in executed beats (where mask is 0) are 0.
+ * P0 bits otherwise are updated with the results of the comparisons.
+ * We must also keep unchanged the MASK fields at the top of v7m.vpr.
+ */
+#define DO_VCMP(OP, ESIZE, TYPE, FN)                                    \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, void *vm)   \
+    {                                                                   \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            bool r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)]);                \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+            emask <<= ESIZE;                                            \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMP_S(OP, FN)                       \
+    DO_VCMP(OP##b, 1, int8_t, FN)               \
+    DO_VCMP(OP##h, 2, int16_t, FN)              \
+    DO_VCMP(OP##w, 4, int32_t, FN)
+
+#define DO_VCMP_U(OP, FN)                       \
+    DO_VCMP(OP##b, 1, uint8_t, FN)              \
+    DO_VCMP(OP##h, 2, uint16_t, FN)             \
+    DO_VCMP(OP##w, 4, uint32_t, FN)
+
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_NE(N, M) ((N) != (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_GE(N, M) ((N) >= (M))
+#define DO_LT(N, M) ((N) < (M))
+#define DO_GT(N, M) ((N) > (M))
+#define DO_LE(N, M) ((N) <= (M))
+
+DO_VCMP_U(vcmpeq, DO_EQ)
+DO_VCMP_U(vcmpne, DO_NE)
+DO_VCMP_U(vcmpcs, DO_GE)
+DO_VCMP_U(vcmphi, DO_GT)
+DO_VCMP_S(vcmpge, DO_GE)
+DO_VCMP_S(vcmplt, DO_LT)
+DO_VCMP_S(vcmpgt, DO_GT)
+DO_VCMP_S(vcmple, DO_LE)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index de65a1c3cf1..a7334609e29 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -43,6 +43,7 @@ typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1180,3 +1181,49 @@ static bool trans_VDWDUP(DisasContext *s, arg_viwdup *a)
     };
     return do_viwdup(s, a, fns[a->size]);
 }
+
+static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
+{
+    TCGv_ptr qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qn, qm);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    if (a->mask) {
+        /* VPT */
+        gen_vpst(s, a->mask);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VCMP(INSN, FN)                                       \
+    static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
+    {                                                           \
+        static MVEGenCmpFn * const fns[] = {                    \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vcmp(s, a, fns[a->size]);                     \
+    }
+
+DO_VCMP(VCMPEQ, vcmpeq)
+DO_VCMP(VCMPNE, vcmpne)
+DO_VCMP(VCMPCS, vcmpcs)
+DO_VCMP(VCMPHI, vcmphi)
+DO_VCMP(VCMPGE, vcmpge)
+DO_VCMP(VCMPLT, vcmplt)
+DO_VCMP(VCMPGT, vcmpgt)
+DO_VCMP(VCMPLE, vcmple)
-- 
2.20.1

