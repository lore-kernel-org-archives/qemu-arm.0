Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955908lfg;
        Tue, 9 Mar 2021 08:22:07 -0800 (PST)
X-Received: by 2002:a4a:3901:: with SMTP id m1mr22728803ooa.60.1615306927089;
        Tue, 09 Mar 2021 08:22:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306927; cv=none;
        d=google.com; s=arc-20160816;
        b=QB6vpccN/dELgQZv7AqUUN9zNUnIHp6wSybF8SO7b2ldiztnfoW+NpMpwNvihvAFEa
         PX7RDYiJe4JZGqqWZs4ppDBJpeXFwWPsN7ZEwuF0TN8/6HgG7tw0TbOZltKR7lGi1xkP
         V+LoQq8/zhe83+ngAY3npz175LmZNr7UQ2PDHBRGjQwhOd9Q9ues5oKTIvL2z7mZqZKa
         NLfF8FttDxPMpjGbo4OyiEPLtU8Ywnp5SfCyRnkoBM0CMQQgYV7WhHg4VN9WfdP3on3i
         JRkqYnTxZYVhkKlGjlAoOGMu7dgpcjXoXNkwhB/cDv77YiRv6dTLNwqcPYKrqaxQfvDl
         x94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r8qWPPJzVA86rxlts7U6E1EFTR6n39CVbZo89lBzbCI=;
        b=eq84uQNluPG2HJhn8T07La5O+5AWz3uvQ0kfd/tBrpQbHxaC+85O8EkN8Dpb8zcz3o
         NICUs5ka3GuLH7fYxFD3J4DeRS+N5z3dI948lJBR9XiPUJ4meBUhGgEPJ6bROl5NGHmO
         mXa2AjP1y82HrhzB2LGUsV5s/VC5OjLir8n7OfER7DbDzrav45zSyj8WpLxJyRAfnvbw
         dflJdhlUQPo4C/sZY9KlY5xRFjHfZo/xfjkCiMRXc5dx53YRhZcYWc2Q5CCEv4eClsjk
         lDph+q4l6LP/t7CWPdL7iXrrzyKzLRv/+/GG2loebut/WwOSyTdEAndc+mS1DTiwIpwf
         6J7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YczDUld1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l28sor6923013ooa.14.2021.03.09.08.22.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YczDUld1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8qWPPJzVA86rxlts7U6E1EFTR6n39CVbZo89lBzbCI=;
        b=YczDUld1qtyPKcICrQV1pUYue/CPwvzw0XK91yJMR1F1MltJMHLoY4eekTASUymXne
         77XzisG7vPMk0kB3nkackK91l1jldzZuW8tJBd5eGo21L05ROt4cOwPlFGF36AaeuaCB
         Eyq82kEz2saWhlIXdw7frQoxM3DuGm1WiBCGLxn29IJ63P0Z6M43YRWR1n1aMq1LGbuu
         2wIN499cDVKBkhfvPiWKMVcDwkpRhmnOIapTFijF2I/57Nx9+6tGn/8cbl7Kwlx7/+Wz
         9LpI54H5WD1cpWJDtRGgfcQ5GUbFJBv8bGrCwOX7ZVP6AsVaG8FTdYade6lF3PFfDlt7
         tx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8qWPPJzVA86rxlts7U6E1EFTR6n39CVbZo89lBzbCI=;
        b=m76PC93iwNL+rCSu0x42fis3CH9mg2ibbJj97khB8TUILMpfpTGwOJoc+IHZCysY/P
         +1mIHehQPQZSb1ZySD+2okxaA0hy6+N8o5iZ38dhuIGCBYyOcEtHntOluie0OUQt/qSy
         MiZGrkuZVv7KRQDFrf0MBG0Foa2+9MTMH6f/lIhnDscAU80dLX9fB6Y8S0FXMYkesW6t
         mwxIBsbfWER+oYlH47sCQvjxTw0SdbHh+3rSK5EZVs8V/gWvI+rsBT3xhdyW5jsSyLkK
         4eJZDHF+pXIB6irRA5Sm2as4mjSh1AXjSkrWCnFsXUTNfGN80LBjiYFPGme/bBd0SGka
         nckQ==
X-Gm-Message-State: AOAM532g6eT4GwHOJeE3d/dEpUvXtTgMQBAUsn5zV3Wf8fSsXIP2bhFD
	5R/lsoJip7wDHWp6xBAuwfX4yJhi
X-Google-Smtp-Source: ABdhPJwYCIknWNSGyOeB4ML2eQnACk8xj18CpL6N4uhax0RIrqQEPOUEREssxvuCz+oJOfVjRfFBBw==
X-Received: by 2002:a4a:9101:: with SMTP id k1mr8329364oog.7.1615306926693;
        Tue, 09 Mar 2021 08:22:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 46/78] target/arm: Implement SVE2 FMMLA
Date: Tue,  9 Mar 2021 08:20:09 -0800
Message-Id: <20210309162041.23124-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZHPr3mVIg2in

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422165503.13511-1-steplong@quicinc.com>
[rth: Fix indexing in helpers, expand macro to straight functions.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++
 target/arm/helper-sve.h    |  3 ++
 target/arm/sve.decode      |  4 +++
 target/arm/sve_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++
 5 files changed, 125 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 57d03addb4..3f19c4cbed 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,16 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_f32mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
+}
+
+static inline bool isar_feature_aa64_sve2_f64mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 28b8f00201..7e99dcd119 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2662,3 +2662,6 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(fmmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(fmmla_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c3958bed6a..cb2ee86228 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 floating point matrix multiply accumulate
+
+FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
+
 ### SVE2 Memory Gather Load Group
 
 # SVE2 64-bit gather non-temporal load
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0a02deef70..fcfb7d1f41 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7264,3 +7264,77 @@ void HELPER(sve2_xar_s)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = ror32(n[i] ^ m[i], shr);
     }
 }
+
+void HELPER(fmmla_s)(void *vd, void *vn, void *vm, void *va,
+                     void *status, uint32_t desc)
+{
+    intptr_t s, opr_sz = simd_oprsz(desc) / (sizeof(float32) * 4);
+
+    for (s = 0; s < opr_sz; ++s) {
+        float32 *n = vn + s * sizeof(float32) * 4;
+        float32 *m = vm + s * sizeof(float32) * 4;
+        float32 *a = va + s * sizeof(float32) * 4;
+        float32 *d = vd + s * sizeof(float32) * 4;
+        float32 n00 = n[H4(0)], n01 = n[H4(1)];
+        float32 n10 = n[H4(2)], n11 = n[H4(3)];
+        float32 m00 = m[H4(0)], m01 = m[H4(1)];
+        float32 m10 = m[H4(2)], m11 = m[H4(3)];
+        float32 p0, p1;
+
+        /* i = 0, j = 0 */
+        p0 = float32_mul(n00, m00, status);
+        p1 = float32_mul(n01, m01, status);
+        d[H4(0)] = float32_add(a[H4(0)], float32_add(p0, p1, status), status);
+
+        /* i = 0, j = 1 */
+        p0 = float32_mul(n00, m10, status);
+        p1 = float32_mul(n01, m11, status);
+        d[H4(1)] = float32_add(a[H4(1)], float32_add(p0, p1, status), status);
+
+        /* i = 1, j = 0 */
+        p0 = float32_mul(n10, m00, status);
+        p1 = float32_mul(n11, m01, status);
+        d[H4(2)] = float32_add(a[H4(2)], float32_add(p0, p1, status), status);
+
+        /* i = 1, j = 1 */
+        p0 = float32_mul(n10, m10, status);
+        p1 = float32_mul(n11, m11, status);
+        d[H4(3)] = float32_add(a[H4(3)], float32_add(p0, p1, status), status);
+    }
+}
+
+void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
+                     void *status, uint32_t desc)
+{
+    intptr_t s, opr_sz = simd_oprsz(desc) / (sizeof(float64) * 4);
+
+    for (s = 0; s < opr_sz; ++s) {
+        float64 *n = vn + s * sizeof(float64) * 4;
+        float64 *m = vm + s * sizeof(float64) * 4;
+        float64 *a = va + s * sizeof(float64) * 4;
+        float64 *d = vd + s * sizeof(float64) * 4;
+        float64 n00 = n[0], n01 = n[1], n10 = n[2], n11 = n[3];
+        float64 m00 = m[0], m01 = m[1], m10 = m[2], m11 = m[3];
+        float64 p0, p1;
+
+        /* i = 0, j = 0 */
+        p0 = float64_mul(n00, m00, status);
+        p1 = float64_mul(n01, m01, status);
+        d[0] = float64_add(a[0], float64_add(p0, p1, status), status);
+
+        /* i = 0, j = 1 */
+        p0 = float64_mul(n00, m10, status);
+        p1 = float64_mul(n01, m11, status);
+        d[1] = float64_add(a[1], float64_add(p0, p1, status), status);
+
+        /* i = 1, j = 0 */
+        p0 = float64_mul(n10, m00, status);
+        p1 = float64_mul(n11, m01, status);
+        d[2] = float64_add(a[2], float64_add(p0, p1, status), status);
+
+        /* i = 1, j = 1 */
+        p0 = float64_mul(n10, m10, status);
+        p1 = float64_mul(n11, m11, status);
+        d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21ecb535ca..8c93d87897 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7673,6 +7673,40 @@ DO_SVE2_ZPZZ_FP(FMINP, fminp)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
+static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
+{
+    gen_helper_gvec_4_ptr *fn;
+
+    switch (a->esz) {
+    case MO_32:
+        if (!dc_isar_feature(aa64_sve2_f32mm, s)) {
+            return false;
+        }
+        fn = gen_helper_fmmla_s;
+        break;
+    case MO_64:
+        if (!dc_isar_feature(aa64_sve2_f64mm, s)) {
+            return false;
+        }
+        fn = gen_helper_fmmla_d;
+        break;
+    default:
+        return false;
+    }
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
                             bool sel1, bool sel2)
 {
-- 
2.25.1
