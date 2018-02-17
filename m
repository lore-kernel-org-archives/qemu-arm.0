Received: by 10.28.71.27 with SMTP id u27csp2095908wma;
        Sat, 17 Feb 2018 11:01:29 -0800 (PST)
X-Google-Smtp-Source: AH8x226iMMfeZz1nEdNzhamcwob5RPDRFpeqFgH8eM4LKGHSaAv8fU9GpFMHCyIFxPvUNfi+L6ET
X-Received: by 10.129.178.133 with SMTP id q127mr7504461ywh.45.1518894089596;
        Sat, 17 Feb 2018 11:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894089; cv=none;
        d=google.com; s=arc-20160816;
        b=xC/gbvAAisyhcqCcu1bV8EIEOdD4VHTparNN8NlHXW4jFRmw4YSdkt2zzqd6IcqLwy
         fbzuU0ho/ELVX0WWbL/HRYMDIikhIOofgT2K4MZgyfLhXVL6x3/4sFMvc+xoQEZfQumu
         bgzh0rGcOy58X0VSHD1kMVNtiFvbk4yyXAMAZO96e3LHJ7/oc2Z/4FO3fCqBM3b2Pyip
         iLWsvzcWH5jFBJfj1FTGNWwA5WbKZZA117ujEZfDjKNdW3ur8UDTk2mueRD/9kj5Xv1w
         S6XqgUEg+AZSHxlxs4m/72yR6A0ma/3vcXCFwlfxz7wj3SJ5fbMKrZ8VJbl36E3M8Tdc
         lLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cokBBhuDkWzo28jRgpOw6j/fAbncWNu8+0qc6t2uB2A=;
        b=LxBfXAMeFt6Px5ATHpvfuQEX8ei4M8Fq2FLHWenQm0weS25vh4I2PPD9L0vouOKeA0
         QRAmiNxgAFQw+iqA9wslBswQn8vfbJRpYmcKKgkd1r8tL01cfTkLcx76samHE/0PuwrG
         2whGsEPkAN0JWfeW7a3C7aFlXg7t4eN3onR6uUK96HKBE8APVtO18VRNBUcpOc/pnVOB
         IojzlPd8NB/kk7NRRJtXnhGj17SZsC+IVEhhVx9hYLU7TE10OTbXDgvF/XShoG6HVa97
         ysn5oCutXmYfShgzCAMmJ37M5tDZ7XdHtRC0CgqcALmsTfSF2HJodkyvX/aDeYD5oTXY
         An6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VAo/oF8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si1062757ybd.509.2018.02.17.11.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VAo/oF8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7jl-00074j-2C
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:01:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AG-0001TA-AO
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AF-00027r-4w
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:48 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:37018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AE-00027e-TC
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:47 -0500
Received: by mail-pl0-x244.google.com with SMTP id ay8so3443302plb.4
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cokBBhuDkWzo28jRgpOw6j/fAbncWNu8+0qc6t2uB2A=;
	b=VAo/oF8A+CY8ToSIg/4fbQP52ZtyxwcUn0hg4PSmo+ru7LWv7WHA/UuerjwCRlOzz4
	NnjH5dK+8OVJLUlan+plCftRZjgD1QsyQN+DxXWcSbAqdrGNnroV4dRLCwNc4Mi5xvoT
	EEP9qMp2RVsDTH1sKJYoz3Fa2ib42s6P3/pzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cokBBhuDkWzo28jRgpOw6j/fAbncWNu8+0qc6t2uB2A=;
	b=fAfd9L0u4cJL15Y+SG3Jqf08UEdHHREGcjVsuI9ox2OI4efK334YrIUkIvI4XGzf2H
	c9FafVMb6SJV6tVVCAz4JFyJx/EOvXS+T49dHzfg4gBR68IQhhT6l6MXb/PifMhjjoJv
	LmzD7jnLYU20CT10f1qHYqVjKtM8hAoCoLA7O3VSbgJlrUjAz6Ph1d25qv7ZWf1+Weuf
	NsRYM7Ms0SZKO4YnDnaZXT4HyYg6r7ldIIl1EBGOFT7NIA9jTJESqkYjG54RII89aAQ3
	8dZkd7q/VIqjnXIhjc827VmI+8y1QZVMOxNZcwvF1MZ7KT4D03/DorIVDR9oonxMJUU6
	YwyQ==
X-Gm-Message-State: APf1xPBL02QzhoOTsKGx8CRVldphb+/sER1ovg+0nxbeepQDjjfYSa+3
	RtGgD8pkUl6o6DkutrdkFzuUoj048fA=
X-Received: by 2002:a17:902:2bc5:: with SMTP id
	l63-v6mr9565360plb.108.1518891886027; 
	Sat, 17 Feb 2018 10:24:46 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:06 -0800
Message-Id: <20180217182323.25885-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 50/67] target/arm: Implement SVE Floating
 Point Accumulating Reduction Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Fk3QhzH5Imx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  7 ++++++
 target/arm/sve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  5 +++++
 4 files changed, 110 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a95f077c7f..c4502256d5 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -720,6 +720,13 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fadda_h, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fadda_s, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fadda_d, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve_fadd_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6622275b44..0e2b3091b0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2789,6 +2789,62 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+uint64_t HELPER(sve_fadda_h)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);
+    float16 result = nn;
+
+    do {
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+        do {
+            if (pg & 1) {
+                float16 mm = *(float16 *)(vm + H1_2(i));
+                result = float16_add(result, mm, status);
+            }
+            i += sizeof(float16), pg >>= sizeof(float16);
+        } while (i & 15);
+    } while (i < opr_sz);
+
+    return result;
+}
+
+uint64_t HELPER(sve_fadda_s)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);
+    float32 result = nn;
+
+    do {
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+        do {
+            if (pg & 1) {
+                float32 mm = *(float32 *)(vm + H1_2(i));
+                result = float32_add(result, mm, status);
+            }
+            i += sizeof(float32), pg >>= sizeof(float32);
+        } while (i & 15);
+    } while (i < opr_sz);
+
+    return result;
+}
+
+uint64_t HELPER(sve_fadda_d)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i++) {
+        if (pg[H1(i)] & 1) {
+            nn = float64_add(nn, m[i], status);
+        }
+    }
+
+    return nn;
+}
+
 /* Fully general three-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3124368fb5..32f0340738 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3120,6 +3120,48 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+/*
+ *** SVE Floating Point Accumulating Reduction Group
+ */
+
+static void trans_FADDA(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    typedef void fadda_fn(TCGv_i64, TCGv_i64, TCGv_ptr,
+                          TCGv_ptr, TCGv_ptr, TCGv_i32);
+    static fadda_fn * const fns[3] = {
+        gen_helper_sve_fadda_h,
+        gen_helper_sve_fadda_s,
+        gen_helper_sve_fadda_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr t_rm, t_pg, t_fpst;
+    TCGv_i64 t_val;
+    TCGv_i32 t_desc;
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    t_val = load_esz(cpu_env, vec_reg_offset(s, a->rn, 0, a->esz), a->esz);
+    t_rm = tcg_temp_new_ptr();
+    t_pg = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(t_rm, cpu_env, vec_full_reg_offset(s, a->rm));
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    t_fpst = get_fpstatus_ptr(a->esz == MO_16);
+    t_desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+
+    fns[a->esz - 1](t_val, t_val, t_rm, t_pg, t_fpst, t_desc);
+
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(t_fpst);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_ptr(t_rm);
+
+    write_fp_dreg(s, a->rd, t_val);
+    tcg_temp_free_i64(t_val);
+}
+
 /*
  *** SVE Floating Point Arithmetic - Unpredicated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 817833f96e..95a290aed0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -684,6 +684,11 @@ UMIN_zzi	00100101 .. 101 011 110 ........ .....		@rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi		00100101 .. 110 000 110 ........ .....		@rdn_i8s
 
+### SVE FP Accumulating Reduction Group
+
+# SVE floating-point serial reduction (predicated)
+FADDA		01100101 .. 011 000 001 ... ..... .....		@rdn_pg_rm
+
 ### SVE Floating Point Arithmetic - Unpredicated Group
 
 # SVE floating-point arithmetic (unpredicated)
-- 
2.14.3

