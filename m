Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954979lfg;
        Tue, 9 Mar 2021 08:20:59 -0800 (PST)
X-Received: by 2002:a4a:94a7:: with SMTP id k36mr22667572ooi.45.1615306859271;
        Tue, 09 Mar 2021 08:20:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306859; cv=none;
        d=google.com; s=arc-20160816;
        b=nblVX+ukapsWx+wskTfAiKxykbYf6awdkkqOTvjP2ebAcqD2g8kQwgJOEHHfNHxHHj
         u8x0tQ5kBiK4VszT3QsmBuWKN4kN+1xFVvoVqO5AgZ4kpGG8lZi+DyjLUJSN+kh6ZYLG
         EtJcoisyFGYtQZFRRn/+jvzS+1IzUXxx8kZajUJFebJd1pzLtvHpUvF3tCfOpxKS0BEE
         t/beBwGSKpiTk2mo9uB+flkY1fgBr1cfFMxcC8wT3x0w1w/19tG6Smzb0lZH6dtpgEUn
         daI52F0g8aFEBy2dWDCtiWCFoZiFR7tgYwTinb4XgpUVXge7speTHNhOezk3rYKMrZeB
         YZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FdA8tFtpyXbNCIxq+Lmcx9QVlUew+tHqOvL8JhiAxSE=;
        b=JzcKFn1K01TT7LKoR0TdTUalf8d00oaRk+aLeVEUFUI66U+nujfwMm7edOW8P3Qk7u
         zXfByOpqi6EOGsiTMeHum+bstuLiaUyLCHjGg1sSJuGK+TkPKCpNr+tZ945se6L1lPgy
         aEKMwrUPKaATJrVPrXGpNNn0sxpVo9JFJW38+oYuPhElLFGZJMyYPLqmIvYv/JBLISeJ
         y8EQ35aDrJqD76zDWyiU92mqfnA6ZvnmRnc7mQZBzZTdU5YyxTurVLXcTs8bWam17ty4
         49cB3dIW0Ub0aDJOSUl5TI4UlNcGaENZEi6P/oCbYjM6htKDNwr1GIeMWFWEqUmd1I+T
         m7Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KWZ5hzYb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 74sor2056138otd.123.2021.03.09.08.20.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KWZ5hzYb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FdA8tFtpyXbNCIxq+Lmcx9QVlUew+tHqOvL8JhiAxSE=;
        b=KWZ5hzYb/Cy/mtS/FrvezYm9PeHrluo2e5vf1QQ1uDT3eUN/kMPJzgUnq03y4plxrm
         4jKCJvQKSTwKcp2aZJt1H6NN0hWqWUIq9ISlySWOF88W43UDzAQnuVzkjfwihWNOfyYT
         g0BNurTNHETVJ3BS+t8G8KwdZVndkIoZquTYIiyVVSGEcFjWNTOArV2LRLDcuje9yJLu
         UKz6ofpHG8PDpUu9rrKz+iUjwVc0Kq2fcOwdM8QUCyq1FlNShLLTQa19RPCeODjLHsuo
         9GrP9dSPQJMJmXbjdfllvSe8X376MOC8vQBszPbxgq8LIRW1awW4jDJ8f6iBr0yUp9a1
         0qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FdA8tFtpyXbNCIxq+Lmcx9QVlUew+tHqOvL8JhiAxSE=;
        b=iJsagcBctbJ6OA7o0nUOXsLZqpqN6Uzk06PTWQ4TcFVZQa2dIPJt+vWm2yoQ4itZd5
         0/lVSpKAC1tAfvWmVLn/lDCk6h5cAKH3KnNhubScPaiq0TxVqFI/jfxjeVlVYFs+gHqZ
         9vCS2cxi1qo+BuQhMij9/Mh+Y4NWvcjFPKrI3iA+nNvS16LypHl1Ku8Y8oTOfUSvAD2u
         Ifz/a9S6gaOKh40EWrp0xL3qp9GvZ3UNA46XMt3NlkZBVr17JYWveQ77VcDMb2eR4dah
         mGaXCNNx4P2gJab+2dJ7iFwQhnVzYAnCrb4GQmlcheXfgLqMo3tNp55U+9e+EtywJQMV
         X5Fw==
X-Gm-Message-State: AOAM532/BbDH9vbrzVdeOhf4bNQLB5Prjz6B39gT2IGmuKHk9XnoK1Ie
	AQpFnKqKcbtjv97c6g0h9vJahhmGWdycUDGVCvg=
X-Google-Smtp-Source: ABdhPJy1cztkJbg3AehUc8TyV46/kvo/JzgfTta5kFaJ/knohyW2/gtJpZ4emMAUSdoX0oW6jU/aBQ==
X-Received: by 2002:a05:6830:158c:: with SMTP id i12mr23783504otr.7.1615306858887;
        Tue, 09 Mar 2021 08:20:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 14/78] target/arm: Implement PMULLB and PMULLT
Date: Tue,  9 Mar 2021 08:19:37 -0800
Message-Id: <20210309162041.23124-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TyqYGF/9hI9o

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++++++
 target/arm/helper-sve.h    |  1 +
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/vec_helper.c    | 24 ++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ee92ea876e..824365209b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4198,6 +4198,16 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
+}
+
+static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ad8121eec6..bf3e533eb4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2363,3 +2363,4 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d9a72b7661..016c15ebb6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1201,6 +1201,8 @@ USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
 
 SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
 SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+PMULLB          01000101 .. 0 ..... 011 010 ..... .....  @rd_rn_rm
+PMULLT          01000101 .. 0 ..... 011 011 ..... .....  @rd_rn_rm
 SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8da87a6ce0..260337d111 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6031,6 +6031,28 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
+        NULL,                    gen_helper_sve2_pmull_d,
+    };
+    if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_PMULLB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, false);
+}
+
+static bool trans_PMULLT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, true);
+}
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 40b92100bf..b0ce597060 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1750,6 +1750,30 @@ void HELPER(sve2_pmull_h)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = pmull_h(nn, mm);
     }
 }
+
+static uint64_t pmull_d(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
+
+    for (i = 0; i < 32; ++i) {
+        uint64_t mask = -((op1 >> i) & 1);
+        result ^= (op2 << i) & mask;
+    }
+    return result;
+}
+
+void HELPER(sve2_pmull_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t sel = H4(simd_data(desc));
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *n = vn, *m = vm;
+    uint64_t *d = vd;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = pmull_d(n[2 * i + sel], m[2 * i + sel]);
+    }
+}
 #endif
 
 #define DO_CMP0(NAME, TYPE, OP)                         \
-- 
2.25.1
