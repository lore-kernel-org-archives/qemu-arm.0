Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5778280wrq;
        Tue, 26 Jun 2018 21:47:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfVz3Zx4BO3+5D5japWvrwoZv2j6+T1sZCz4zLMz7iYa7FMK3YglsPXJr/EwlZnzURTTvHk
X-Received: by 2002:a37:4142:: with SMTP id o63-v6mr3876633qka.287.1530074861422;
        Tue, 26 Jun 2018 21:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074861; cv=none;
        d=google.com; s=arc-20160816;
        b=WumYVoEC85h4BJDXyPPbJL+y9QmuPOtUKjepSoOlkUTZLsECX+1cRqrpCi1PlkDqMV
         WFyxOyV+SxXrpWKKmGV+aBQ4qBNzRQtIsoXwoV8yj8IKTDk8A7wBLQ6q01rL4KSj0W7h
         VfiZqqG5+hpGBhhVeBw7N8RAmhCrqQH8ZNfBtGKjW8fjEwFpwyw9avWD40cNPSiRKsqt
         R9n2bGXkZ1mzhKRVg100/tPyJPFE3Fhq1fKqLau4uCPitZfSI8lZW78h3RmYgBK760CR
         y1oUT+grFJ528ELJaIZxuiPyLnAlxisLt4B1/DVeI7B4kBWLVNwZ7XUhu5sf8HrCmkYs
         Iiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=byKdj6HVM6KPhixbbVwIcI/5hCpEok+1J/IcwVGk+xs=;
        b=kSA0WVd2wEfJ3rmx/huUgWRgilGyjpkUPUWUmRxjM9UBNR8oikQ2djlTD06tNirh07
         PMy4PFRaJiDK/dBVIVGUQFNZ5pW+VoCDUnaHE/gfovKfcJwrAn9kX7vnArsnno2iAIT/
         g1PMbJGeVO6tjcifIEsOhxrfoBJKlV2o/XM1drtfVfEKfkD33kDXmdWMGM/iHYd98Q2Z
         axNpD9im8DmiIFRyV6+6JfXq/5D2R7nWkE5dS72r8YP8sCSM55evZYk2dZb1LF8K94Dm
         OyG+A/ZURNU889p/PczM27dGo28wSViXCWstnTkKbaPkk6++o4nE0sjUHPmS4f+3pPHx
         Qe0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OdXX1Dm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l35-v6si3004553qve.23.2018.06.26.21.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OdXX1Dm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Mm-0007LZ-S4
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:47:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29d-0004VU-6V
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29b-0000o2-7A
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:05 -0400
Received: from mail-pl0-x22e.google.com ([2607:f8b0:400e:c01::22e]:37553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29a-0000m8-TF
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:03 -0400
Received: by mail-pl0-x22e.google.com with SMTP id 31-v6so416177plc.4
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=byKdj6HVM6KPhixbbVwIcI/5hCpEok+1J/IcwVGk+xs=;
	b=OdXX1Dm4dTgWBJZHV6pMZl1YbdHcesjJlszOoiSq5/AqlyS4PjRQavT3U9Qu+VydpH
	DnQsyubLH9C+9sIndlpd+uNrFaDvil9ojEucfcaV75LyrdC9dZOUL+gQoPSbbOVEDRlL
	t/Z9CdP46cH23n5zxqcuhC8YzFUQCZuLWI0Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=byKdj6HVM6KPhixbbVwIcI/5hCpEok+1J/IcwVGk+xs=;
	b=fwZ2BwSa7y9Yz0231BOohHEx4N/2WaUz8c6yKvTAEGD7rNC3EuufaNfX9EcDfpHN8M
	WJzeKvknDEyIn3dIlymo98p5PbwrB3nzEJabebb517wSDPkHKR8soc8cbosuE1sq05i6
	qmi4v8IorbVHhQ1wLcBxzd0t2RPUicD/F8zY2nIpB58Z6AbbA9/iD1OIYbTQPYNaLRJw
	rYB98Mv9E6MLVNcPLqxPNMEoyq136ybq7++wxjq9JsnnrUVIwqD0Rsg2HfGYZv40gM3C
	UKgQPoqb6ry2ekUnjw9ORml6YetTir2GBnLey478qcF+tn5P4HKgtFTV6maNxPorb2//
	1WWg==
X-Gm-Message-State: APt69E09aYIZyS6vEQssShbPwKcTGav9Dqmjz0VZDMwMLSaihlbt749K
	DnShTQ+kkxdo6Oovf0bnpXeH8A==
X-Received: by 2002:a17:902:9681:: with SMTP id
	n1-v6mr4593204plp.244.1530074041940; 
	Tue, 26 Jun 2018 21:34:01 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:15 -0700
Message-Id: <20180627043328.11531-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22e
Subject: [Qemu-arm] [PATCH v6 22/35] target/arm: Implement SVE
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aBYi1A78ghbV

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 +++
 target/arm/sve_helper.c    | 70 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 27 +++++++++++++++
 target/arm/sve.decode      |  3 ++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 44a98440c9..aca137fc37 100644
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
index 0486cb1e5e..79358c804b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3428,6 +3428,76 @@ DO_FPCMP_PPZ0_ALL(sve_fcmlt0, DO_FCMLT)
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
index cfee256be9..a86ebc0a91 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3597,6 +3597,33 @@ DO_PPZ(FCMNE_ppz0, fcmne0)
 
 #undef DO_PPZ
 
+/*
+ *** SVE floating-point trig multiply-add coefficient
+ */
+
+static bool trans_FTMAD(DisasContext *s, arg_FTMAD *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_ftmad_h,
+        gen_helper_sve_ftmad_s,
+        gen_helper_sve_ftmad_d,
+    };
+
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           status, vsz, vsz, a->imm, fns[a->esz - 1]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a774becd6c..fdcc252eaa 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -800,6 +800,9 @@ FMINNM_zpzi     01100101 .. 011 101 100 ... 0000 . .....        @rdn_i1
 FMAX_zpzi       01100101 .. 011 110 100 ... 0000 . .....        @rdn_i1
 FMIN_zpzi       01100101 .. 011 111 100 ... 0000 . .....        @rdn_i1
 
+# SVE floating-point trig multiply-add coefficient
+FTMAD           01100101 esz:2 010 imm:3 100000 rm:5 rd:5       rn=%reg_movprfx
+
 ### SVE FP Multiply-Add Group
 
 # SVE floating-point multiply-accumulate writing addend
-- 
2.17.1

