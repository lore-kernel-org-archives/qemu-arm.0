Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253560dyc;
        Fri, 4 Jul 2025 07:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ3IugDWnPSm/MKmt5XxzrYf+75a3fXqE7nJruKEHLc0Va4DHH4+8XghtzE40wPpLhadTlYVfmtYiYQw==@linaro.org
X-Google-Smtp-Source: AGHT+IFdWgCt1OMtLBsN/c7tuuwL56ca0yOSx3ieBIJbqLPaZ8bXQekGw63KmsFq2Uf8Ub1tHc6s
X-Received: by 2002:a05:622a:9016:b0:4a9:a2c4:a06d with SMTP id d75a77b69052e-4a9a2c4b915mr4886561cf.22.1751639331879;
        Fri, 04 Jul 2025 07:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639331; cv=none;
        d=google.com; s=arc-20240605;
        b=THeYPm82n0jirqdbr1a27EX9IWmZEgYoXg4mJ/urPucKWg2EV/MvtW4wODOMlWgBKw
         B6Ru5NcPzjEgZZBwBKKznU3qib2k+ODN/o450H448LrDpqGO3Ca7kNXFUlbWTntm6LC4
         kmoldYyoQXbSnNpG/Cd/NFU5aJoZpbcEPFlz22VEYq5gLIGeu5jfZXVpeDvrS8Rp0JKy
         w84eQ8LLT3CMNVZntllN+kdjZdNirDl/slJvdThQEGmx8KMMU8UwoIqRlXwZBSiv6DAl
         DBUZUUxBhJIuNxrPU8DJTAS5fLhjq5NoTG7DqCrapkC11nB7vkyM93/4CNQ9Z+FCqs+9
         Ajtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FEPGNQQvQr3Cijwb3PZO1i8kaDuvxvDoph9ofBlPEBQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=JawOnRa8VzxD5nJg4OSgV5Z9SiBVYayiEwsfTDmcCMqXYh+f53onhUBYC9BBQ9HCP9
         Z97UXDIQ0qE2De2bkafxquD0Zlk1uz/MHT0QaYsjQopcB69IhF/E/tUznlg9VHW2tXw2
         Mn/aYoscjOYdJBjE2gy52w12JU4QqikXb+QQX6IYMDh1a+opm4Bn2qJs5lw+Scm55EV4
         l0jM+bK/mNSr58C7w8VqWQ9laaUFkj00immkjPxK4CmgNeQpgChnjm1V9MdtoH4U85F9
         Mt56i6owC4Kxuo9itcidZk/jcUVZkl71YyyB0ROVH5QbuDz45J/TvyGT+ajbDfHO77n4
         CDKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP7ucBlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ad23basi21982211cf.387.2025.07.04.07.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP7ucBlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhO5-00007C-Bl; Fri, 04 Jul 2025 10:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLp-0003yq-RA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:21 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLn-0007w3-T3
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:17 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6138aedd718so618835eaf.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639112; x=1752243912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FEPGNQQvQr3Cijwb3PZO1i8kaDuvxvDoph9ofBlPEBQ=;
 b=nP7ucBlwrfjifp1Y08U5WLFITh5/ViY3vUExFaWg0JiEdbzMxUH31Ap7I+0YiDa2qx
 DXJLUfoJiNYXpbwzRpRMQmUEcVSbEngbTfvylERTsrQi7xRS+mYsVfb9LMzmclw/3cLb
 Grjb1kzH06JHjaNV5YUwvVPEz1hRo9yowghWvvXwQhxSugA7OBQSttWhmhMaW8XImTCl
 hLW1xEcq8llXNJx46OpG5VewZGoXkInleH8BUGBpeU9Iy47IRpjf2+OlEvCCh99QLG7U
 EzCyQKBuuev8DywSiljHmf6lhmcOTD1oUP/KpwEkKokIMSVHfknzjKc8U6vMUQ5Z8Jmu
 Qw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639112; x=1752243912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEPGNQQvQr3Cijwb3PZO1i8kaDuvxvDoph9ofBlPEBQ=;
 b=Pj92QfjomIe46TW//mzHDSrzsV5pZUYVu1gJLhBQ5RBfkFX0P9WTsGlXDxjB1nDhI6
 YphM7OALPw/1QO1XUGAkeJDed2YkGxUnO6txzHXP8d3NZIcEuhVxH+R7VytprTHqZQpH
 hKw+5Kkd89PFPSPaIgcNViHrwOZnKs9BIQPjrKROUTngdV4MhtrEcOaerHJP2S3MHniV
 02x+gg9FaJ5sZPPHiuxqOYSDth7wJMlOz49Yr07SSUJBy/qeNrWecnGUQ/OK6j6Xk1lE
 a5IWKdRLUozG0gxHsexA8+9bD9R02DNRdqqL45K/bNv0Pglevc9Dlub6G+iUEoDCg6/T
 f6Jw==
X-Gm-Message-State: AOJu0Yyu2GHCy0JcsrNkOWARxvWwLA7gRMUeG1rOoEYBzFkcHFtcYKFX
 RZztzmd4LBvRiGQKjdtGRH+yxU5mswojkuJKfQvNzJsrzvpjAbMzngtdFdJqi670Agg=
X-Gm-Gg: ASbGncsWda7itG8NN7NLdVFMJDJom5EZWHPLTkcy3PLTMIPlhjQ6WurPzHG6T6XfXJ+
 DqA/jiF6+PYe/EYLkWkePdxi90jFsOvHj08a+zyGFqgoXDPfc1SX6Eg/8fxnnR+M0Z/FKx8zOwG
 WUHsV5TFRVsgUvxP03jqwomz56mM54zg2KakT+OaDWDDI4cLgumWXkHRqbjV6s97jvEtmbWtOXd
 qjRz8VZzaTuVlyxzQ8AJbJw609lDmS9Jw//KN8CgP0VHfM63piNNorWPu2PKej7eHy0XySfI25v
 WsBpy9STtJWwU9aOuIiemKuQX9Q5LFgqNUDbaNpKLOqNyuaFzGdM57kkeikG9OZuPbMYnBeSOzt
 L6O+LEwhoL8vLm6LRqW26cWfSHRUJznTN3+FoPPnm+JaznAQl
X-Received: by 2002:a05:6820:1693:b0:611:5a9e:51c4 with SMTP id
 006d021491bc7-6138ecb5b6cmr2400789eaf.4.1751639111758; 
 Fri, 04 Jul 2025 07:25:11 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 053/108] target/arm: Implement SME2 FCVT (widening), FCVTL
Date: Fri,  4 Jul 2025 08:20:16 -0600
Message-ID: <20250704142112.1018902-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CCsg3qMQzx9q

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  2 ++
 target/arm/tcg/vec_internal.h  |  1 +
 target/arm/tcg/sme_helper.c    | 45 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve_helper.c    |  2 +-
 target/arm/tcg/translate-sme.c |  5 ++++
 target/arm/tcg/sme.decode      |  5 ++++
 6 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 97e70959e8..be4621f2d9 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -217,3 +217,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_n, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_w, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index c8199a3ef8..bbf76f63b1 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -306,6 +306,7 @@ static inline float64 float64_maybe_ah_chs(float64 a, bool fpcr_ah)
 bfloat16 helper_sme2_ah_fmax_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 
+float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index d97afdb69c..c696246d15 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -29,6 +29,13 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
+
+static bool vectors_overlap(ARMVectorReg *x, unsigned nx,
+                            ARMVectorReg *y, unsigned ny)
+{
+    return !(x + nx <= y || y + ny <= x);
+}
+
 void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     aarch64_set_svcr(env, val, mask);
@@ -1591,3 +1598,41 @@ void HELPER(sme2_fcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
         d[H2(i * 2 + 1)] = d1;
     }
 }
+
+/* Expand and convert */
+void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    ARMVectorReg scratch;
+    size_t oprsz = simd_oprsz(desc);
+    size_t i, n = oprsz / 4;
+    float16 *s = vs;
+    float32 *d0 = vd;
+    float32 *d1 = vd + sizeof(ARMVectorReg);
+
+    if (vectors_overlap(vd, 1, vs, 2)) {
+        s = memcpy(&scratch, s, oprsz);
+    }
+
+    for (i = 0; i < n; ++i) {
+        d0[H4(i)] = sve_f16_to_f32(s[H2(i)], fpst);
+    }
+    for (i = 0; i < n; ++i) {
+        d1[H4(i)] = sve_f16_to_f32(s[H2(n + i)], fpst);
+    }
+}
+
+/* Deinterleave and convert. */
+void HELPER(sme2_fcvtl)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    float16 *s = vs;
+    float32 *d0 = vd;
+    float32 *d1 = vd + sizeof(ARMVectorReg);
+
+    for (i = 0; i < n; ++i) {
+        float32 v0 = sve_f16_to_f32(s[H2(i * 2 + 0)], fpst);
+        float32 v1 = sve_f16_to_f32(s[H2(i * 2 + 1)], fpst);
+        d0[H4(i)] = v0;
+        d1[H4(i)] = v1;
+    }
+}
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index b522ddaf7c..4f12723afe 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4554,7 +4554,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                       \
  * FZ16.  When converting from fp16, this affects flushing input denormals;
  * when converting to fp16, this affects flushing output denormals.
  */
-static inline float32 sve_f16_to_f32(float16 f, float_status *fpst)
+float32 sve_f16_to_f32(float16 f, float_status *fpst)
 {
     bool save = get_flush_inputs_to_zero(fpst);
     float32 ret;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 10e5b77040..d6167eafe1 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1360,3 +1360,8 @@ TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_fcvt_n)
 TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_fcvtn)
+
+TRANS_FEAT(FCVT_w, aa64_sme_f16f16, do_zz_fpst, a, 0,
+           FPST_A64_F16, gen_helper_sme2_fcvt_w)
+TRANS_FEAT(FCVTL, aa64_sme_f16f16, do_zz_fpst, a, 0,
+           FPST_A64_F16, gen_helper_sme2_fcvtl)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 831179c0ee..5100ebaeba 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -726,9 +726,14 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
 &zz_n           zd zn n
 @zz_1x2         ........ ... ..... ...... ..... zd:5        \
                 &zz_n n=1 zn=%zn_ax2
+@zz_2x1         ........ ... ..... ...... zn:5  .....       \
+                &zz_n n=1 zd=%zd_ax2
 
 BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
 
 FCVT_n          11000001 001 00000 111000 ....0 .....       @zz_1x2
 FCVTN           11000001 001 00000 111000 ....1 .....       @zz_1x2
+
+FCVT_w          11000001 101 00000 111000 ..... ....0       @zz_2x1
+FCVTL           11000001 101 00000 111000 ..... ....1       @zz_2x1
-- 
2.43.0

