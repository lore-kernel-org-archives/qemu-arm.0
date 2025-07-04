Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1266760dyc;
        Fri, 4 Jul 2025 07:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLJoAm0T2eRUe/xAOGL+pn2Kmta5nPC+S31jFi6/SRi6ZkJOsf41LEqZOoOLvZ9VrJRE3ngHZrTYyz8w==@linaro.org
X-Google-Smtp-Source: AGHT+IFI2U6VxL05JilnWG02L1oktpRTf+/9+ahNenPtzG2E00S1KCFI5I8mf9jdcM7Y9RjmPbdi
X-Received: by 2002:ac8:5813:0:b0:4a7:61f0:147a with SMTP id d75a77b69052e-4a9964ebe4dmr42154971cf.29.1751640678572;
        Fri, 04 Jul 2025 07:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640678; cv=none;
        d=google.com; s=arc-20240605;
        b=kIpe6JFeFfsh0Nd02J/Uxg5fxtCy7b9gz9UZqXNin5+XfzYRRGP1nV3jGE6BbcSeqE
         mcoSlCryR7TQAk/qgqtjAJ9GYE585TyStPMF3rrIJ6+9MZdTh7gELb8DYAuQx3IZX96L
         0xjW+wEWLcH7o+6UAfro/K0fRyt1iWM5WNj3UHfI5u6QZcUqEYuFrxxRKkTRpRBRjlGe
         nYydvJb1xoXyUeGn9dyXEVws+ub3fkz2s+G6Ah1hzVxXQ0qWGaA4ycohjRQFmSLbwHw8
         M6e7i76Swg5ETnPo+CTwwONbCaoNL7la9WZbeOZdT/vD3FMh+VHH9OWd32VIgu0O/+/3
         joDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vv9/FbVQ9OQ1MNhfBoLQppE1DlJI90EkZXM61FqgCVU=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=HCu5150o86onHuUcmlCePbjtYfIDfaA+Vn3YPUZnyMEmrie0dkmYcFBM0HWcu1+AwD
         BqQLc2fnDrWarUgzYuAPQNXpSmk8CxuCJybaXL2uBZ4IAaLEt7H82W0JZLnsncvhzfsp
         YHEQhOCLvk9T/ehK0CwgqraCw1XLVJBLRePVANoBo0rwZ7wi41YBjuhe5RAEiIyrtNeJ
         Pt8sa3/nUJJ/anDJ7AxINi5Z5HPXS218P4NRIBnUMifdBUqZbyXm3byH18YsgslD+F65
         dsoDuSkQpTYZJjhgzN+jOeicUvnXHaTMukmw4tiy8lpl1KIBfwlygOL9hTxtEXCRJzY/
         o7Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaOCQwno;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbec6c45si226654085a.377.2025.07.04.07.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaOCQwno;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLK-0002zx-S8; Fri, 04 Jul 2025 10:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIT-0005Pw-Ao
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:51 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIQ-00066K-SI
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:49 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2f78ef10832so691124fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638906; x=1752243706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vv9/FbVQ9OQ1MNhfBoLQppE1DlJI90EkZXM61FqgCVU=;
 b=SaOCQwnos3naFN8NxhxOFTK3isj8lZKgF+Jc/618O39Hp7E1AXhOC97gqrwlYm6AY3
 9JQDfBfQbjINH97HSUWfhwc2C958WBwl4BcUNpln8jmqASvz8/JrRemrMvIrxfYU18Ks
 ZBKQBI6Y1ASQo6ZVXqaLqgmuMjIEqD9Z1y52nbPrl+W8xRJs0xLzHPhxZaiEe3YmKUq5
 nmOKipSWvCCDiKJsHC8ZJr7pZbqvUppdn3NbK1GP3RrQYtbP4Y3cTdz85RsdKo7VgExG
 KtqFiBXuD2Ck6hm50hOo9GqHzBdD27JoT9Mg4AZeiGwy+uYpKZwlkcGgLY+CvrNvM0JZ
 l9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638906; x=1752243706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vv9/FbVQ9OQ1MNhfBoLQppE1DlJI90EkZXM61FqgCVU=;
 b=GuWe8JmPVJEOtLqLGW5o7LOwB4b3Nn3qFCBS9XItEGdW8lTS4XG6yNGgCaH81vi2Ge
 7Ts/kJVzjN9FvCmnH0osYSfeRMARldMdF3CXpHQyBEB06maVi9NSbUEYtPWVqWtAtOmz
 0dCRR59Oy+i5X4YohiReKyWT/VpGLN9hjCsF+isVMmUtBrNnLn4/VJmUDEKDEl97zr11
 Ulntj1X8gFM/1jzYqTCPMg/RBldw4YesRcgGwujRm4GfqUx6hCCxZD05V0xaC206zUk0
 B5lyF1DHIKHBw1Pmf/Zx3nXtjywDiIrIzE3ztEMRNZJ7tYWbrfSE8TnhvJ8KnSao4Xze
 A07A==
X-Gm-Message-State: AOJu0YxebIwsgKQXikotwr3KaH4ZKPt5ifhiS+etNpLXXzd4KOk1JiU0
 QNrZNgmAKFG5ioijsVYrAc5eB2pFvRP+SqteUVr9/XSCbT0xSIWk4emCDb3Zb9Kl1QnvZVDHYpZ
 CDncn3hc=
X-Gm-Gg: ASbGncuriP/7Mr6R2eV9akj+ZdfdGu3cLQS9g65zMZTisytYe+1n8683xnDeyIGGbzP
 BP3KArG4cjCchCdRS885orin3/ksvq9ja/xNOCl2CsO8iWHLfbZS5KEdopbYXF5mq8VEEMZzXYo
 V8TMWqpmXg0dpRcKb8EzZdT9CxUtwKsBwXVVz+c6li8cWEUhkFzjj72JZqaAutuJ2IEYPf87+hI
 IJNxZyOMUDi/I9H8rMV31m2yOwdhAEaSVCw7DT0O3455ddxSx42Z/bVU5fBRz6sE0A3qz1c7wxR
 z3HtVh2DfHP0Iyw+h1aVsbDk/U+nsE0FABdE6C9fb+DwqyOzK+/xkQXI0QXmBxF+YfS3uowNb1g
 zzbf6so2YYcIETp314BTneF50ma3aky7j2fXrZn8TcOTQGzu0
X-Received: by 2002:a05:6871:3392:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2f796d5d132mr1726176fac.25.1751638905516; 
 Fri, 04 Jul 2025 07:21:45 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 030/108] target/arm: Implement SME2 Multiple and Single SVE
 Destructive
Date: Fri,  4 Jul 2025 08:19:53 -0600
Message-ID: <20250704142112.1018902-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
X-TUID: wfXLh/eoZTRx

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  13 ++++
 target/arm/tcg/helper.h        |   8 ++
 target/arm/tcg/vec_internal.h  |   4 +
 target/arm/tcg/helper-a64.c    |   2 +
 target/arm/tcg/neon_helper.c   |  30 ++++++++
 target/arm/tcg/translate-sme.c | 137 +++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    |   7 ++
 target/arm/tcg/sme.decode      |  40 ++++++++++
 8 files changed, 241 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index ecd06f2cd1..cdd7058aed 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -160,3 +160,16 @@ DEF_HELPER_FLAGS_6(sme2_smopa2_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme2_umopa2_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 80db7c2c37..8c4705fc53 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -353,6 +353,14 @@ DEF_HELPER_FLAGS_4(gvec_urshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_urshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_urshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme2_srshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_srshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_srshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_urshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_urshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_urshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_2(neon_add_u8, i32, i32, i32)
 DEF_HELPER_2(neon_add_u16, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index c02f9c37f8..64a7249d01 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -302,4 +302,8 @@ static inline float64 float64_maybe_ah_chs(float64 a, bool fpcr_ah)
     return fpcr_ah && float64_is_any_nan(a) ? a : float64_chs(a);
 }
 
+/* Not actually called directly as a helper, but uses similar machinery. */
+bfloat16 helper_sme2_ah_fmax_b16(bfloat16 a, bfloat16 b, float_status *fpst);
+bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 4f618ae390..c66d521278 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -402,6 +402,8 @@ AH_MINMAX_HELPER(vfp_ah_mind, float64, float64, min)
 AH_MINMAX_HELPER(vfp_ah_maxh, dh_ctype_f16, float16, max)
 AH_MINMAX_HELPER(vfp_ah_maxs, float32, float32, max)
 AH_MINMAX_HELPER(vfp_ah_maxd, float64, float64, max)
+AH_MINMAX_HELPER(sme2_ah_fmax_b16, bfloat16, bfloat16, max)
+AH_MINMAX_HELPER(sme2_ah_fmin_b16, bfloat16, bfloat16, min)
 
 /* 64-bit versions of the CRC helpers. Note that although the operation
  * (and the prototypes of crc32c() and crc32() mean that only the bottom
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 2cc8241f1e..8d288f3a70 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -228,16 +228,31 @@ NEON_VOP(rshl_s16, neon_s16, 2)
 NEON_GVEC_VOP2(gvec_srshl_h, int16_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, src2, 16, true, NULL))
+NEON_GVEC_VOP2(sme2_srshl_h, int16_t)
+#undef NEON_FN
+
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 32, true, NULL))
 NEON_GVEC_VOP2(gvec_srshl_s, int32_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, src2, 32, true, NULL))
+NEON_GVEC_VOP2(sme2_srshl_s, int32_t)
+#undef NEON_FN
+
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_d(src1, (int8_t)src2, true, NULL))
 NEON_GVEC_VOP2(gvec_srshl_d, int64_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_d(src1, src2, true, NULL))
+NEON_GVEC_VOP2(sme2_srshl_d, int64_t)
+#undef NEON_FN
+
 uint32_t HELPER(neon_rshl_s32)(uint32_t val, uint32_t shift)
 {
     return do_sqrshl_bhs(val, (int8_t)shift, 32, true, NULL);
@@ -260,16 +275,31 @@ NEON_VOP(rshl_u16, neon_u16, 2)
 NEON_GVEC_VOP2(gvec_urshl_h, uint16_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int16_t)src2, 16, true, NULL))
+NEON_GVEC_VOP2(sme2_urshl_h, uint16_t)
+#undef NEON_FN
+
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 32, true, NULL))
 NEON_GVEC_VOP2(gvec_urshl_s, int32_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, src2, 32, true, NULL))
+NEON_GVEC_VOP2(sme2_urshl_s, int32_t)
+#undef NEON_FN
+
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_d(src1, (int8_t)src2, true, NULL))
 NEON_GVEC_VOP2(gvec_urshl_d, int64_t)
 #undef NEON_FN
 
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_d(src1, src2, true, NULL))
+NEON_GVEC_VOP2(sme2_urshl_d, int64_t)
+#undef NEON_FN
+
 uint32_t HELPER(neon_rshl_u32)(uint32_t val, uint32_t shift)
 {
     return do_uqrshl_bhs(val, (int8_t)shift, 32, true, NULL);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 0a863a50bf..954da18ff0 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -543,3 +543,140 @@ TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmop
 TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
 TRANS_FEAT(SMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_smopa2_s)
 TRANS_FEAT(UMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_umopa2_s)
+
+static bool do_z2z_n1(DisasContext *s, arg_z2z_en *a, GVecGen3Fn *fn)
+{
+    int esz, dn, vsz, mofs, n;
+    bool overlap = false;
+
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    esz = a->esz;
+    n = a->n;
+    dn = a->zdn;
+    mofs = vec_full_reg_offset(s, a->zm);
+    vsz = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, dn + i);
+        if (dofs == mofs) {
+            overlap = true;
+        } else {
+            fn(esz, dofs, dofs, mofs, vsz, vsz);
+        }
+    }
+    if (overlap) {
+        fn(esz, mofs, mofs, mofs, vsz, vsz);
+    }
+    return true;
+}
+
+static void gen_sme2_srshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                           uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3 * const fns[] = {
+        gen_helper_gvec_srshl_b, gen_helper_sme2_srshl_h,
+        gen_helper_sme2_srshl_s, gen_helper_sme2_srshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
+}
+
+static void gen_sme2_urshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                           uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3 * const fns[] = {
+        gen_helper_gvec_urshl_b, gen_helper_sme2_urshl_h,
+        gen_helper_sme2_urshl_s, gen_helper_sme2_urshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
+}
+
+TRANS_FEAT(ADD_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_add)
+TRANS_FEAT(SMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smax)
+TRANS_FEAT(SMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smin)
+TRANS_FEAT(UMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umax)
+TRANS_FEAT(UMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umin)
+TRANS_FEAT(SRSHL_n1, aa64_sme2, do_z2z_n1, a, gen_sme2_srshl)
+TRANS_FEAT(URSHL_n1, aa64_sme2, do_z2z_n1, a, gen_sme2_urshl)
+TRANS_FEAT(SQDMULH_n1, aa64_sme2, do_z2z_n1, a, gen_gvec_sve2_sqdmulh)
+
+static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
+                           gen_helper_gvec_3_ptr * const fns[4])
+{
+    int esz = a->esz, n, dn, vsz, mofs;
+    bool overlap = false;
+    gen_helper_gvec_3_ptr *fn;
+    TCGv_ptr fpst;
+
+    /* These insns use MO_8 to encode BFloat16. */
+    if (esz == MO_8 && !dc_isar_feature(aa64_sme_b16b16, s)) {
+        return false;
+    }
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
+    fn = fns[esz];
+    n = a->n;
+    dn = a->zdn;
+    mofs = vec_full_reg_offset(s, a->zm);
+    vsz = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, dn + i);
+        if (dofs == mofs) {
+            overlap = true;
+        } else {
+            tcg_gen_gvec_3_ptr(dofs, dofs, mofs, fpst, vsz, vsz, 0, fn);
+        }
+    }
+    if (overlap) {
+        tcg_gen_gvec_3_ptr(mofs, mofs, mofs, fpst, vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3_ptr * const f_vector_fmax[2][4] = {
+    { gen_helper_gvec_fmax_b16,
+      gen_helper_gvec_fmax_h,
+      gen_helper_gvec_fmax_s,
+      gen_helper_gvec_fmax_d },
+    { gen_helper_gvec_ah_fmax_b16,
+      gen_helper_gvec_ah_fmax_h,
+      gen_helper_gvec_ah_fmax_s,
+      gen_helper_gvec_ah_fmax_d },
+};
+TRANS_FEAT(FMAX_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmax[s->fpcr_ah])
+
+static gen_helper_gvec_3_ptr * const f_vector_fmin[2][4] = {
+    { gen_helper_gvec_fmin_b16,
+      gen_helper_gvec_fmin_h,
+      gen_helper_gvec_fmin_s,
+      gen_helper_gvec_fmin_d },
+    { gen_helper_gvec_ah_fmin_b16,
+      gen_helper_gvec_ah_fmin_h,
+      gen_helper_gvec_ah_fmin_s,
+      gen_helper_gvec_ah_fmin_d },
+};
+TRANS_FEAT(FMIN_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmin[s->fpcr_ah])
+
+static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[4] = {
+    gen_helper_gvec_fmaxnum_b16,
+    gen_helper_gvec_fmaxnum_h,
+    gen_helper_gvec_fmaxnum_s,
+    gen_helper_gvec_fmaxnum_d,
+};
+TRANS_FEAT(FMAXNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmaxnm)
+
+static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
+    gen_helper_gvec_fminnum_b16,
+    gen_helper_gvec_fminnum_h,
+    gen_helper_gvec_fminnum_s,
+    gen_helper_gvec_fminnum_d,
+};
+TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3b7f308803..8b49577e2f 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1515,6 +1515,13 @@ DO_3OP(gvec_ah_fmin_h, helper_vfp_ah_minh, float16)
 DO_3OP(gvec_ah_fmin_s, helper_vfp_ah_mins, float32)
 DO_3OP(gvec_ah_fmin_d, helper_vfp_ah_mind, float64)
 
+DO_3OP(gvec_fmax_b16, bfloat16_max, bfloat16)
+DO_3OP(gvec_fmin_b16, bfloat16_min, bfloat16)
+DO_3OP(gvec_fmaxnum_b16, bfloat16_maxnum, bfloat16)
+DO_3OP(gvec_fminnum_b16, bfloat16_minnum, bfloat16)
+DO_3OP(gvec_ah_fmax_b16, helper_sme2_ah_fmax_b16, bfloat16)
+DO_3OP(gvec_ah_fmin_b16, helper_sme2_ah_fmin_b16, bfloat16)
+
 #endif
 #undef DO_3OP
 
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 36f369d02a..005f87777b 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -169,3 +169,43 @@ UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
 BMOPA           1000000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
 SMOPA2_s        1010000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
 UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
+
+### SME2 Multi-vector Multiple and Single SVE Destructive
+
+%zd_ax2         1:4 !function=times_2
+%zd_ax4         2:3 !function=times_4
+
+&z2z_en         zdn zm esz n
+@z2z_2x1        ....... . esz:2 .. zm:4 ....0. ..... .... . \
+                &z2z_en n=2 zdn=%zd_ax2
+@z2z_4x1        ....... . esz:2 .. zm:4 ....1. ..... ...0 . \
+                &z2z_en n=4 zdn=%zd_ax4
+
+SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_2x1
+SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_4x1
+UMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 1    @z2z_2x1
+UMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 1    @z2z_4x1
+SMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 0    @z2z_2x1
+SMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 0    @z2z_4x1
+UMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 1    @z2z_2x1
+UMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 1    @z2z_4x1
+
+FMAX_n1        1100000 1 .. 10 .... 1010.0 01000 .... 0    @z2z_2x1
+FMAX_n1        1100000 1 .. 10 .... 1010.0 01000 .... 0    @z2z_4x1
+FMIN_n1        1100000 1 .. 10 .... 1010.0 01000 .... 1    @z2z_2x1
+FMIN_n1        1100000 1 .. 10 .... 1010.0 01000 .... 1    @z2z_4x1
+FMAXNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 0    @z2z_2x1
+FMAXNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 0    @z2z_4x1
+FMINNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 1    @z2z_2x1
+FMINNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 1    @z2z_4x1
+
+SRSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 0    @z2z_2x1
+SRSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 0    @z2z_4x1
+URSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 1    @z2z_2x1
+URSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 1    @z2z_4x1
+
+ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_2x1
+ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_4x1
+
+SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_2x1
+SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
-- 
2.43.0

