Received: by 10.28.71.27 with SMTP id u27csp2118350wma;
        Sat, 17 Feb 2018 11:33:38 -0800 (PST)
X-Google-Smtp-Source: AH8x227fVUpnMI6qZ53gS0GZDAlkwReWsmHNq2NSAeEs8eTxk8o7Qa8AbQkDakMasc/cjdsXZKU3
X-Received: by 10.37.129.130 with SMTP id p2mr7025708ybk.234.1518896018101;
        Sat, 17 Feb 2018 11:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518896018; cv=none;
        d=google.com; s=arc-20160816;
        b=GfGpv3wOhgYWEzk6lmkZm11g1VfPtBY2wQImYvzDodHO+WAHZ1VQcK+PX6pee+nUkX
         UfH+d8njtxQ0DnXeVj6jb/zirfSIEh7YILPtxsRcE7GAtAHqJNhfDjpAjl7iluwIxMx9
         64Ue5DmIKw1b//peanMsqIHX4JzpqZZQhjkbCRSSUck1I3NOukOwzaSqk4Uu0C7rQCHg
         e5jKycpRdCBwaoAWKi77R5cYlMl/sPmXIAAwn+07fsqsA9c/L6mfeF1oVLFFOF8kzvZr
         j5RDBcYSF7INtDSlFdC/hxgWjMBMlQ1hO5ItrP3Csu6v+OR3V3Ag8I2aUu3xiHej/gPh
         U6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Pssv/btxNtN7VLrefrxQ25vQ0Lh51u2AnNokoqUYCik=;
        b=Nby2DCrT1Z4lDIQkQILkhjRdeJXHUeT8wtvIi2mkgXnSdj8FJ3uhHGx7dDQdiSXW8c
         89+pbChEh3RHxDmVXIPTZn1GPS70KUSWqbHdydQLs4S4k1XnmmeVEnxRM3EbiBUO/VBZ
         cQzzo7XH77WU+nyEzmNQHnWVNZQHsase/H1w1+ZEB0EBDugB3hWpWrKbg59GdltJoI/+
         y7+c50YqlbyKWNGdy501EE/2n9LYf+Yb/zFpAFiR2j18Y1ubmt1Ku2acAVc/7o+1wbBU
         0W/mWCElmIIcZ77jlcsajWfmbodHudb9xE2U+hrXTJIimGwqZloyKXz9X/r+umXCh+yi
         +ziQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2Uawo0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p62si1108206ywp.128.2018.02.17.11.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:33:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2Uawo0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8Er-0003tY-F8
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:33:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ad-0001xl-07
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Aa-0002I1-Ta
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:10 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:41396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7Aa-0002HS-Kl
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:08 -0500
Received: by mail-pg0-x241.google.com with SMTP id t4so4348587pgp.8
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pssv/btxNtN7VLrefrxQ25vQ0Lh51u2AnNokoqUYCik=;
	b=E2Uawo0FIlMnJilATgNe2hX5D+Yya7srydNRR5+IlzMd5CwI0lHbU5mP/qjB5fZYts
	1/J77E6Sw2O3RARrKchEA1sK+eFZWlwBUnfrsv9Cihgfjzea+svbDoBZCfLjLxq9zp+H
	nrOrs39p9q1s8PgbfqTIyff9ZCfNHE+qPKWBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pssv/btxNtN7VLrefrxQ25vQ0Lh51u2AnNokoqUYCik=;
	b=seUDVgne0mASqJx4qGu32xwJ8z3XH65m7ZEtWf/BmZ6rV2bDOXY/YGEM3dbTi6TCRT
	TbDmhFi1QXEiGDUHhIhz44Wv9c+Azl2hj8ciSPms2g6ZqCaQ17Wbsoqekk8hIM9X+dI7
	6FptspS7Y4FU1ZYh5N8CFIDStarlFxVEuIchwI6bVGHX2JHB4OdkhIuktOL6t+N6QyOE
	OcRz/4fugnAYSuIzDGfTJjrqSThLjQYWMhImtJSlQV9hBKRaKTVDvUcGvn4NgX+Ks3Fr
	JROPZb2CMSGN424CpT+PtOgUrkbRaqnUCsew91WfbxaM9wSNbu6mflzobaNo2Ky8Hz2C
	d0Xw==
X-Gm-Message-State: APf1xPBvfO91xvMyD85W34J6Piwu5nM2bDmQsRyh7UrOkPpq0OQQB2XG
	TZkTjDULlQVUZ8kW0k38edtZBw==
X-Received: by 10.98.58.129 with SMTP id v1mr1982096pfj.203.1518891907734;
	Sat, 17 Feb 2018 10:25:07 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:19 -0800
Message-Id: <20180217182323.25885-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 63/67] target/arm: Implement SVE
 floating-point trig multiply-add coefficient
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
X-TUID: 06utXCO1EaLA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 +++
 target/arm/sve_helper.c    | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 26 +++++++++++++++++
 target/arm/sve.decode      |  3 ++
 4 files changed, 103 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 696c97648b..ce5fe24dc2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1037,6 +1037,10 @@ DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6a052ce9ad..53e3516f47 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3338,6 +3338,76 @@ DO_FPCMP_PPZ0_ALL(sve_fcmlt0, DO_FCMLT)
 DO_FPCMP_PPZ0_ALL(sve_fcmeq0, DO_FCMEQ)
 DO_FPCMP_PPZ0_ALL(sve_fcmne0, DO_FCMNE)
 
+/* FP Trig Multiply-Add. */
+
+void HELPER(sve_ftmad_h)(void *vd, void *vn, void *vm, void *vs, uint32_t desc)
+{
+    static const float16 coeff[16] = {
+        0x3c00, 0xb155, 0x2030, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+        0x3c00, 0xb800, 0x293a, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float16);
+    intptr_t x = simd_data(desc);
+    float16 *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i++) {
+        float16 mm = m[i];
+        intptr_t xx = x;
+        if (float16_is_neg(mm)) {
+            mm = float16_abs(mm);
+            xx += 8;
+        }
+        d[i] = float16_muladd(n[i], mm, coeff[xx], 0, vs);
+    }
+}
+
+void HELPER(sve_ftmad_s)(void *vd, void *vn, void *vm, void *vs, uint32_t desc)
+{
+    static const float32 coeff[16] = {
+        0x3f800000, 0xbe2aaaab, 0x3c088886, 0xb95008b9,
+        0x36369d6d, 0x00000000, 0x00000000, 0x00000000,
+        0x3f800000, 0xbf000000, 0x3d2aaaa6, 0xbab60705,
+        0x37cd37cc, 0x00000000, 0x00000000, 0x00000000,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float32);
+    intptr_t x = simd_data(desc);
+    float32 *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i++) {
+        float32 mm = m[i];
+        intptr_t xx = x;
+        if (float32_is_neg(mm)) {
+            mm = float32_abs(mm);
+            xx += 8;
+        }
+        d[i] = float32_muladd(n[i], mm, coeff[xx], 0, vs);
+    }
+}
+
+void HELPER(sve_ftmad_d)(void *vd, void *vn, void *vm, void *vs, uint32_t desc)
+{
+    static const float64 coeff[16] = {
+        0x3ff0000000000000ull, 0xbfc5555555555543ull,
+        0x3f8111111110f30cull, 0xbf2a01a019b92fc6ull,
+        0x3ec71de351f3d22bull, 0xbe5ae5e2b60f7b91ull,
+        0x3de5d8408868552full, 0x0000000000000000ull,
+        0x3ff0000000000000ull, 0xbfe0000000000000ull,
+        0x3fa5555555555536ull, 0xbf56c16c16c13a0bull,
+        0x3efa01a019b1e8d8ull, 0xbe927e4f7282f468ull,
+        0x3e21ee96d2641b13ull, 0xbda8f76380fbb401ull,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(float64);
+    intptr_t x = simd_data(desc);
+    float64 *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i++) {
+        float64 mm = m[i];
+        intptr_t xx = x;
+        if (float64_is_neg(mm)) {
+            mm = float64_abs(mm);
+            xx += 8;
+        }
+        d[i] = float64_muladd(n[i], mm, coeff[xx], 0, vs);
+    }
+}
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 02655bff03..e185af29e3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3319,6 +3319,32 @@ DO_PPZ(FCMNE_ppz0, fcmne0)
 
 #undef DO_PPZ
 
+/*
+ *** SVE floating-point trig multiply-add coefficient
+ */
+
+static void trans_FTMAD(DisasContext *s, arg_FTMAD *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_ftmad_h,
+        gen_helper_sve_ftmad_s,
+        gen_helper_sve_ftmad_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status;
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    status = get_fpstatus_ptr(a->esz == MO_16);
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       status, vsz, vsz, a->imm, fns[a->esz - 1]);
+    tcg_temp_free_ptr(status);
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f4505ad0bf..ca54895900 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -804,6 +804,9 @@ FMINNM_zpzi	01100101 .. 011 101 100 ... 0000 . .....	@rdn_i1
 FMAX_zpzi	01100101 .. 011 110 100 ... 0000 . .....	@rdn_i1
 FMIN_zpzi	01100101 .. 011 111 100 ... 0000 . .....	@rdn_i1
 
+# SVE floating-point trig multiply-add coefficient
+FTMAD		01100101 esz:2 010 imm:3 100000 rm:5 rd:5	rn=%reg_movprfx
+
 ### SVE FP Multiply-Add Group
 
 # SVE floating-point multiply-accumulate writing addend
-- 
2.14.3

