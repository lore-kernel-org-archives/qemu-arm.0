Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261284dyc;
        Fri, 4 Jul 2025 07:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPW4qG4fSu0B5FVTLAg/TugiKiq5bVGt/T0e1rff43SvxPY2mmHO9bRjBkrGQG/XAlGO8I2Fg0CmG5WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFgZybrn5tnEkkz3ABQS2l6DsR4kbBo//dnoCSAKWHQ/NAk8HOXyBEutbb+cQNnZ42tDm79
X-Received: by 2002:a05:6102:444a:20b0:4e5:a83a:3ceb with SMTP id ada2fe7eead31-4f2ee255bb2mr1569086137.20.1751640080618;
        Fri, 04 Jul 2025 07:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640080; cv=none;
        d=google.com; s=arc-20240605;
        b=M9Jr3DF7SorDM/SLwRXkuS567fWmNm8oedovp6bzbWFjYk33Su8YGG+uE9jKEZ35jZ
         jj8iZaH9kOfJduFS0hZ11tH43J8iQOx+3M6JbVO71fj4u2hhpPxM22wHa2S0po7zElRu
         pBm2M6l+anePmy7XBXaZskdL3zJbuJsQ5OivdHD7qErK/JfwsO6P/SEx7/3tyjGwhyr8
         Kb7junf1kiBjDxGrgxrdQYWS/fgdjUNMFNEz8AiU2928L6/ZnSUaEeU0fpt8E+zUy0Ah
         AoC8BSiArIEVuxwy5r63iT9FeIac68X8GNL8Pd/2dhL5WpupBGFoQfJDPOksFDUBUcwT
         u42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YsCup+gJOZBgnqsU6/l1yujbu9XY09yoYQpIK5Jy3OY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=SlpzwxBRhraeJLxnli6jxL3Mtyr3nJDjN6m9IFzJj7DUSE9p8QWzFStrc9BN3nT9++
         c53qhxSZc5KO44y66nzOadV070+gM2diN6AwW7vBbTmDHCtQf1qT/WT9PEnicVIEj07Z
         VjsnS7q+ZCbrcxiDZjmPpB/jG54Z2ndlIp4mKSBuAhwfxq+B3QnnuJpzwy/+qyJZIOaF
         f2ShU4LTqto3+VzNN200dmqiibBpVfyh7RSGeuG9zQka6hdmkUJ5d0wtzHUkX9PdGAdb
         d0N3+iV3IZb5+Ip8vo9Lv/fkQwwCLbEAj4dUi/ZJasMRX/UUOIBQFI9FrJXoF8uSSMXz
         j9cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3zzvXMc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6b7f3asi855927137.279.2025.07.04.07.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3zzvXMc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhR8-000620-Qg; Fri, 04 Jul 2025 10:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM6-0004Vk-3b
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:35 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLz-00085I-CS
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:32 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-611998766c0so545349eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639124; x=1752243924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsCup+gJOZBgnqsU6/l1yujbu9XY09yoYQpIK5Jy3OY=;
 b=f3zzvXMc/vNmrUcVTJ9ccD2I6shxrEkAynztvCPm2rN1+108hynApNbpCkxFj6oCen
 3qK6YkAfqQkTLHePyxC5lJOsLcpfuulKEPc+kYg7oMxPoP4oETRQSdghRIOvltpHEMOG
 K7QVxDwDiv5tw/70qY+/qc2s7zTpTqLhRuH/vouDENkGqgoc7gQ66j8U9gQ723GBIL2/
 UKStu6CqTrX6KZGRiX3WlE1VXQi+wnzHslJm0JNZm9JJdnjlgTVOAvteXs04WGnYlJzC
 P5u7SoaxuXNdTvE0lzOPiAsdblp0EXS13F2hofAnKgoWW4yYZAMjGNJHeOiUAsVQbDFb
 vwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639124; x=1752243924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsCup+gJOZBgnqsU6/l1yujbu9XY09yoYQpIK5Jy3OY=;
 b=UdzOQoeT5ixupzcwWY5EgR6crDf6dRmd6uQJtuwaHi4Vo9j+LAnusaeGh+im/P84M6
 TCZMgPu24LIyfORgrYATadkb+s7mDOB4kr1QKQ2hwTYPsHEtPtqEvHXu+rtHsPe7xttn
 RcPef6yMrmH4sfNoznh8IG7DphUjvqnpJfd+Ympv2VO6Affqtpa7GJUwAnWur7NSIoRy
 yJ32DpKVuKIj6Za0dn1G+qZ2XZaTvgCuy9mcYkMUrgXyYEEIto3aXYvdiss48c5WJNkj
 I542nfAuWGZwy78o/1eAGo9v1vfDYeDFkNvZ7MYTd6NrmB+QXkzOtcUdPqU7woYxt7pV
 EgNw==
X-Gm-Message-State: AOJu0Yyt3C2dldJNy81bqSrApK2qUkzbJlKiRQg+Vis0bGrhFRRFzPky
 dbTLBPXhmjiw++7zxXqr6MfPDKZHZVnyFB/BA06VSwyQetKK2tON5RGC+CfGOLSjnXA=
X-Gm-Gg: ASbGnct/2GdcoQjZaxDCqN3qJrDP/SV0ZlgE+U+mG3TpW/QWeulFOjtLzFwb1F+6M1c
 b1qCvmGIaLcCOQqejx7imVvX6qIbAbt9qPI35xBbXNkFgaRlhO6Y09FTeZBNhpkY5a+PDqEyFG2
 gh1uvbQJNiWpxkGz7NVCOsZat/EDW9kiw5QcQGSLDLXyMBrTfUymT1U9VlX9cUJsRleIA/f/4cH
 L2imUp3hkvzKun4VJQk35m0PPnqDZOJ9TxCdYcTYV0xRG/iST+MK3bDzrRMF1KWCT19StBMOX3R
 6WKqZFQ8lGrWgdVOjeOJXTNQIB4ez76n4XH3yhVyDVQVgQC5LTzEFVB9cSjoEvYGAfhduKbaR6j
 L0mcmRngiWjB20QNjJkcD7EpZtnJcE6rh+HJjk9uLi2zUymvG
X-Received: by 2002:a05:6820:2108:b0:611:f241:b8f5 with SMTP id
 006d021491bc7-6138fd8960fmr1969094eaf.5.1751639124321; 
 Fri, 04 Jul 2025 07:25:24 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 066/108] target/arm: Implement SME2 FCLAMP, SCLAMP, UCLAMP
Date: Fri,  4 Jul 2025 08:20:29 -0600
Message-ID: <20250704142112.1018902-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: itH8Zo1XBtbb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 15 +++++++
 target/arm/tcg/sme_helper.c    | 56 +++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 75 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 17 ++++++++
 4 files changed, 163 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 06b95da3c3..78ba3d1f20 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -298,3 +298,18 @@ DEF_HELPER_FLAGS_3(sme2_sqrshrun_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_sqrshrn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uqrshrn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_sqrshrun_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_sclamp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_sclamp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_sclamp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_sclamp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_uclamp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uclamp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uclamp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uclamp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sme2_fclamp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(sme2_fclamp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(sme2_fclamp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(sme2_bfclamp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index cf0e655bdd..8a1f9fbf3d 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2062,3 +2062,59 @@ UZP4(sme2_uzp4_d, uint64_t, )
 UZP4(sme2_uzp4_q, Int128, )
 
 #undef UZP4
+
+#define ICLAMP(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    size_t stride = sizeof(ARMVectorReg) / sizeof(TYPE);        \
+    size_t elements = simd_oprsz(desc) / sizeof(TYPE);          \
+    size_t nreg = simd_data(desc);                              \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    for (size_t e = 0; e < elements; e++) {                     \
+        TYPE nn = n[H(e)], mm = m[H(e)];                        \
+        for (size_t r = 0; r < nreg; r++) {                     \
+            TYPE *dd = &d[r * stride + H(e)];                   \
+            *dd = MIN(MAX(*dd, nn), mm);                        \
+        }                                                       \
+    }                                                           \
+}
+
+ICLAMP(sme2_sclamp_b, int8_t, H1)
+ICLAMP(sme2_sclamp_h, int16_t, H2)
+ICLAMP(sme2_sclamp_s, int32_t, H4)
+ICLAMP(sme2_sclamp_d, int64_t, H8)
+
+ICLAMP(sme2_uclamp_b, uint8_t, H1)
+ICLAMP(sme2_uclamp_h, uint16_t, H2)
+ICLAMP(sme2_uclamp_s, uint32_t, H4)
+ICLAMP(sme2_uclamp_d, uint64_t, H8)
+
+#undef ICLAMP
+
+/*
+ * Note the argument ordering to minnum and maxnum must match
+ * the ARM pseudocode so that NaNs are propagated properly.
+ */
+#define FCLAMP(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm,                 \
+                  float_status *fpst, uint32_t desc)            \
+{                                                               \
+    size_t stride = sizeof(ARMVectorReg) / sizeof(TYPE);        \
+    size_t elements = simd_oprsz(desc) / sizeof(TYPE);          \
+    size_t nreg = simd_data(desc);                              \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    for (size_t e = 0; e < elements; e++) {                     \
+        TYPE nn = n[H(e)], mm = m[H(e)];                        \
+        for (size_t r = 0; r < nreg; r++) {                     \
+            TYPE *dd = &d[r * stride + H(e)];                   \
+            *dd = TYPE##_minnum(TYPE##_maxnum(nn, *dd, fpst), mm, fpst); \
+        }                                                       \
+    }                                                           \
+}
+
+FCLAMP(sme2_fclamp_h, float16, H2)
+FCLAMP(sme2_fclamp_s, float32, H4)
+FCLAMP(sme2_fclamp_d, float64, H8)
+FCLAMP(sme2_bfclamp, bfloat16, H2)
+
+#undef FCLAMP
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d52ccf2ac5..99e4056316 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1547,3 +1547,78 @@ static gen_helper_gvec_3 * const uzp2_fns[] = {
     gen_helper_sme2_uzp2_q,
 };
 TRANS_FEAT(UZP_2, aa64_sme2, do_zipuzp_2, a, uzp2_fns)
+
+static bool trans_FCLAMP(DisasContext *s, arg_zzz_en *a)
+{
+    static gen_helper_gvec_3_ptr * const fn[] = {
+        gen_helper_sme2_bfclamp,
+        gen_helper_sme2_fclamp_h,
+        gen_helper_sme2_fclamp_s,
+        gen_helper_sme2_fclamp_d,
+    };
+    TCGv_ptr fpst;
+    int vl;
+
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    /* This insn uses MO_8 to encode BFloat16. */
+    if (a->esz == MO_8 && !dc_isar_feature(aa64_sme_b16b16, s)) {
+        return false;
+    }
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
+    vl = vec_full_reg_size(s);
+
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->zd),
+                       vec_full_reg_offset(s, a->zn),
+                       vec_full_reg_offset(s, a->zm),
+                       fpst, vl, vl, a->n, fn[a->esz]);
+    return true;
+}
+
+static bool do_clamp(DisasContext *s, arg_zzz_en *a,
+                     gen_helper_gvec_3 * const fn[4])
+{
+    int vl;
+
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    /*
+     * Clamp is just a min+max, easily supported by most host
+     * vector operations -- we already have such an expansion in
+     * translate-sve.c for a single output.
+     * TODO: Add support in gvec for multiple simultaneous output,
+     * and/or copy to temporary upon overlap.
+     */
+    vl = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->zd),
+                       vec_full_reg_offset(s, a->zn),
+                       vec_full_reg_offset(s, a->zm),
+                       vl, vl, a->n, fn[a->esz]);
+    return true;
+}
+
+static gen_helper_gvec_3 * const sclamp_fns[] = {
+    gen_helper_sme2_sclamp_b,
+    gen_helper_sme2_sclamp_h,
+    gen_helper_sme2_sclamp_s,
+    gen_helper_sme2_sclamp_d,
+};
+TRANS(SCLAMP, do_clamp, a, sclamp_fns)
+
+static gen_helper_gvec_3 * const uclamp_fns[] = {
+    gen_helper_sme2_uclamp_b,
+    gen_helper_sme2_uclamp_h,
+    gen_helper_sme2_uclamp_s,
+    gen_helper_sme2_uclamp_d,
+};
+TRANS(UCLAMP, do_clamp, a, uclamp_fns)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index c1f73d9f63..47adcb5a15 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -860,3 +860,20 @@ UZP_2           11000001 esz:2 1 zm:5 110100 zn:5 .... 1    \
                 &zzz_e zd=%zd_ax2
 UZP_2           11000001 00    1 zm:5 110101 zn:5 .... 1    \
                 &zzz_e zd=%zd_ax2 esz=4
+
+&zzz_en         zd zn zm esz n
+
+FCLAMP          11000001 esz:2 1 zm:5 110000 zn:5 .... 0    \
+                &zzz_en zd=%zd_ax2 n=2
+FCLAMP          11000001 esz:2 1 zm:5 110010 zn:5 ...0 0    \
+                &zzz_en zd=%zd_ax4 n=4
+
+SCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 0    \
+                &zzz_en zd=%zd_ax2 n=2
+SCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 0    \
+                &zzz_en zd=%zd_ax4 n=4
+
+UCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 1    \
+                &zzz_en zd=%zd_ax2 n=2
+UCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 1    \
+                &zzz_en zd=%zd_ax4 n=4
-- 
2.43.0

