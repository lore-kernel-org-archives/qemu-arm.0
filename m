Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955087lfg;
        Tue, 9 Mar 2021 08:21:06 -0800 (PST)
X-Received: by 2002:a05:6808:2d0:: with SMTP id a16mr3473104oid.83.1615306865954;
        Tue, 09 Mar 2021 08:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306865; cv=none;
        d=google.com; s=arc-20160816;
        b=UiUmtPahy2EgDcRRe9wMyjY5rN2d3NIVbk/kWjaHk1l6vvHWbCkcLdpy9SfWbP6/hq
         1Wsi6Qm3be7jdfFJe5DrYjkio46Ay2DVjZevBRNIWoxaQtug1FPyc33flfLffmv02ql4
         up74tWCJTPgDjV2gzgrogNhBh8G4tlp4NeyJDsANLlCGmJZ6WocUHCxamhFSw18fUXgh
         sm+J9iI/a/rSQS69P5eXj5JbNZRmQRikinlE3L/nsynyvNQcnM0Eob5NOqaWu62oYi8H
         CDXw6JWG034iiTTxxwxTJ8vG0qtuEnhxUFeN8o0l2o703JDrzyBu192onEDmFsXL3efJ
         IrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OB55iI1IUo2lwcmr8zS27hEcvopOYX8FmeGTqkG2if0=;
        b=G2NTUyeWvtfMDdM8g3K29uUtEwxTE3ga7eHv35XSrCVBNaKwWUltYQ8zXOj//EHxlR
         w1Pt3Gj4uRTfzWmkRLFK59EDtWCf60ZBmJVvzBS+ahdBF/AZCSrVbeySDsylAGRZKpiH
         5aGv7fSVb0EZj+YpG+PWQvdTiuQjBOQBkQl36rD8NdyjQlX7Q9PUamesJ3nazSoLf/3I
         SM3e+JEaTj4MaB+T4B+o8EWFpI/Ig8bXHgG+eTrb1Dena3ukpo0sjwRkIVrEgm+Dl2a0
         6QSnuxS7q7ZVQ+qpfCUmCA00D+iu72CiPNf68hZLmbYCeNAurm+D322fX3+lkdU6vzE0
         WJaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTpfUFX6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r131sor4127275oif.58.2021.03.09.08.21.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FTpfUFX6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OB55iI1IUo2lwcmr8zS27hEcvopOYX8FmeGTqkG2if0=;
        b=FTpfUFX6nSlrAv862BSzH6bjrB1HSO5Uj33nOwgkVsqVbH6StlKBUxxqXK+MwbfC2r
         sR8Ptu3bcnPSbjQG8D5IcPLETGsHJsIDkRaNY8040OUr4GurLi/QXuyIgIOG0hjlGgBo
         r0RdOLfW7R6Ab/XRgzam5JxQs2s/IQLvvXZSwNA1OoXgQjdEGIzXdHoxLmr2ebgtVsTm
         FEioWmFuzOz5tt1VYqcKntEht44gg27NvhvNT35pMQkdJUmgUT+T4fcRYVB6SqUX7M90
         whkC4jCIvg6heG8p6epKQt0elS04JD1roevKe+x2r/YYKQXAEQE1HgtumOUPQbjxea2R
         TEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OB55iI1IUo2lwcmr8zS27hEcvopOYX8FmeGTqkG2if0=;
        b=nzQQNw0y51oVoWj+AOBwyFrbntwDEsxi4dhJAmOv74zdG7F06hi6gUSta4Nu7rcbno
         G+IfUQ07kAIIucvKxSGkfFtoLXZya/xaoHRRyl6IjZTPi3sFTL+pByVcqiqDrK20WVTQ
         soIiDRxVCrXYJ3/NSvEvwUwmuc7hoONnfq6zI4Wmj7SxLVWvCyfh7Xf95Ku/Sx3WreBf
         tljyWANgEm1xUb39rHdzk475h3CoMJqC5B4A3mIA/c9xHXDD12riVMAh20ZJkZjeJmZ1
         /LG7RvjWA++mu4SHXjh0hezf9dMZhSpbELeX/6mJ42DroMFZvwGJII0DluJ8qu8cCWvT
         Iawg==
X-Gm-Message-State: AOAM532Dj/DWxeHqxREOfKtxR5Oud2yWyrNyBjrm5BdttblBlMoTDjjU
	I2ztIXHl0LE8kfGhGVyuo5w5QBMm
X-Google-Smtp-Source: ABdhPJzjtCjp6V19y6x1Epl0TyDMoUbPlfokgGeUPXTWQi4AqCVraNv7dxBJAfEae0x1o5qPAH7JKw==
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr3643357oih.48.1615306865567;
        Tue, 09 Mar 2021 08:21:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 20/78] target/arm: Implement SVE2 integer add/subtract long with carry
Date: Tue,  9 Mar 2021 08:19:43 -0800
Message-Id: <20210309162041.23124-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hNJbGpd6nBIA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sel indexing and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve.decode      |  6 ++++++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 229fb396b2..4a62012850 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2416,3 +2416,6 @@ DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_adcl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_adcl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 56b7353bfa..79046d81e3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1247,3 +1247,9 @@ SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
 SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
 UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
 UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
+
+## SVE2 integer add/subtract long with carry
+
+# ADC and SBC decoded via size in helper dispatch.
+ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
+ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dd2c6a7404..aea04a60fd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1264,6 +1264,40 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZW_ACC
 
+void HELPER(sve2_adcl_s)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = H4(extract32(desc, SIMD_DATA_SHIFT, 1));
+    uint32_t inv = -extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t *a = va, *n = vn;
+    uint64_t *d = vd, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint32_t e1 = a[2 * i + H4(0)];
+        uint32_t e2 = n[2 * i + sel] ^ inv;
+        uint64_t c = extract64(m[i], 32, 1);
+        /* Compute and store the entire 33-bit result at once. */
+        d[i] = c + e1 + e2;
+    }
+}
+
+void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        Int128 e1 = int128_make64(a[i]);
+        Int128 e2 = int128_make64(n[i + sel] ^ inv);
+        Int128 c = int128_make64(m[i + 1] & 1);
+        Int128 r = int128_add(int128_add(e1, e2), c);
+        d[i + 0] = int128_getlo(r);
+        d[i + 1] = int128_gethi(r);
+    }
+}
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c179e1f123..92420d3ec7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6372,3 +6372,26 @@ static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_abal(s, a, true, true);
 }
+
+static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2] = {
+        gen_helper_sve2_adcl_s,
+        gen_helper_sve2_adcl_d,
+    };
+    /*
+     * Note that in this case the ESZ field encodes both size and sign.
+     * Split out 'subtract' into bit 1 of the data field for the helper.
+     */
+    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+}
+
+static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, false);
+}
+
+static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, true);
+}
-- 
2.25.1
