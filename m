Received: by 10.28.71.27 with SMTP id u27csp2089144wma;
        Sat, 17 Feb 2018 10:51:28 -0800 (PST)
X-Google-Smtp-Source: AH8x225+NljSOTYALL+oi9sJMT/ycF0yBn+Der2GWaRysf2sOo6KG7RD/TTIsLiM0QDxRkS7UlmI
X-Received: by 10.129.77.84 with SMTP id a81mr7546931ywb.145.1518893488709;
        Sat, 17 Feb 2018 10:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893488; cv=none;
        d=google.com; s=arc-20160816;
        b=ogOjXC6+NWSjRFHf31H99SVlOhYSddXW5rY5IncYXL2M3ED6lZd2nsNBelxaQZlm+Z
         /QP7+jxQaluj/Vk8J91miYSTTfChwL/hXyQNFrSnT0L785Qrbl3DBE/REUkmaxd8EI2g
         jUGuy5YYARc4rWvRMUeDisVh/Z2o+gyUlLZE4nDV+eIR8FMSIaN05aim+wUny7W4Eaqe
         FeHOTZSWgkT/YpHKAfsuasQkCWjVEEXtl34UeS9sex6wI5+HKlHL3QRYEm7wtazPOxOA
         H1xVvntsFde+1QioP93+sP6ibF2Q3CNKZezy5c0ueK2DDPmDUZhItjZufdddoCyGIEYe
         4EPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6mOX10P32ylwuosMCM/vEVrBSkq/IoiKDXfgaS7C6yA=;
        b=pBlMESvv3pvv/75g8/JSGoAO5F5nVCCyqmPdsTcqJXxmaFktcmlO6Qlk6QeElq3ZKG
         DuD21qiqixiZ2a3fVZu2zZrCT5SZ3OlJbSBfzqL9sfSMPku0svayeEHnr+7eYXC2J639
         /QYk3pntIuspLzqJHpxA4T5inFtzp9tE3zfPbSnzv+8DGgEzubNPQKNO5oA+jHyyS1uy
         WnkcJX5Ww5q0fKBW2YH3IcAfpOwPXvTN1vRClldyfg2zJEYKMYvQVBOekjMp2GhDf6kZ
         6HLLqQVP9uWO+nOkkDv/9XAl4MiX/i3zaXpvwiOZ8b9fGkuSPz6W/sJ0OqoV2P1f6H1e
         cl5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cbn5c3Cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5si3176389ywl.328.2018.02.17.10.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cbn5c3Cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7a4-0006PC-1r
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79Y-0000d1-CQ
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79X-0001jQ-4n
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:04 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79W-0001it-UG
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:03 -0500
Received: by mail-pg0-x241.google.com with SMTP id m1so261684pgp.13
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6mOX10P32ylwuosMCM/vEVrBSkq/IoiKDXfgaS7C6yA=;
	b=Cbn5c3CnrlMaYY+GBPBs8zLeBddcAqd4zwZnExg8yJ02kypfRfaFRyNWR6S9zJwPd9
	pZJ8df3NshxjKAxOD7EB4Kp8eP3I25lDutZz+5Vqd64yyLPKaobNcK7l0sHiYPvyLUeG
	NdIXhhF/Vlws3L/LW62psQJMsazQnJWrms3Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6mOX10P32ylwuosMCM/vEVrBSkq/IoiKDXfgaS7C6yA=;
	b=pNRgmxKMSH3YV7uHHwptjtWuIcV21FfIJT4UbIcdHvb+Jn3F940tMtAFXBihDi7NKX
	BYX8U6qmv7ingx103S3oaEXARca8SYA/Stey4vvE965rtUSKTb+jFES3MQwQEkJ/gyxt
	AopbgCY7hefh7pbcV0eaFESZ7ucYlNZ2JwWJbJZ+57g0tc8if7bnnbLJiTOkA6eTrVmN
	QlcViwGKOukbsqRe/P3ezwdkOQDRKpAxi2QdGhLNojCX9togrMwJFAQYeVhgvEvIcFew
	IM11J8aGeAVbj0RKd+hTWV58o7SGNOAWP9gz1Oj5BAzhP3dvr0moxgwRdv25fYAnRPHJ
	1dLQ==
X-Gm-Message-State: APf1xPAjizeAFk4WXraI68UmSqSTIkcCZ213Q9PKtPE2f8tG4lfjANhF
	S5Ud1bftUz9ax9tjCTQ9Qc9EkJrQuXM=
X-Received: by 10.98.245.131 with SMTP id b3mr9812757pfm.20.1518891842022;
	Sat, 17 Feb 2018 10:24:02 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:38 -0800
Message-Id: <20180217182323.25885-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 22/67] target/arm: Implement SVE
 floating-point trig select coefficient
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
X-TUID: 2tw9fIt3ZFq1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 ++++
 target/arm/sve_helper.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 target/arm/sve.decode      |  4 ++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e2925ff8ec..4f1bd5a62f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -389,6 +389,10 @@ DEF_HELPER_FLAGS_3(sve_fexpa_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_ftssel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4d42653eef..b4f70af23f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -23,6 +23,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "fpu/softfloat.h"
 
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -1182,3 +1183,45 @@ void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
         d[i] = coeff[idx] | (exp << 52);
     }
 }
+
+void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint16_t nn = n[i];
+        uint16_t mm = m[i];
+        if (mm & 1) {
+            nn = float16_one;
+        }
+        d[i] = nn ^ (mm & 2) << 14;
+    }
+}
+
+void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint32_t nn = n[i];
+        uint32_t mm = m[i];
+        if (mm & 1) {
+            nn = float32_one;
+        }
+        d[i] = nn ^ (mm & 2) << 30;
+    }
+}
+
+void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i];
+        uint64_t mm = m[i];
+        if (mm & 1) {
+            nn = float64_one;
+        }
+        d[i] = nn ^ (mm & 2) << 62;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f23f1b192..e32be385fd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -902,6 +902,25 @@ static void trans_FEXPA(DisasContext *s, arg_rr_esz *a, uint32_t insn)
                        vsz, vsz, 0, fns[a->esz]);
 }
 
+static void trans_FTSSEL(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_ftssel_h,
+        gen_helper_sve_ftssel_s,
+        gen_helper_sve_ftssel_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e791fe8031..4ea3f33919 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -297,6 +297,10 @@ ADR_p64		00000100 11 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
 # Note esz != 0
 FEXPA		00000100 .. 1 00000 101110 ..... .....		@rd_rn
 
+# SVE floating-point trig select coefficient
+# Note esz != 0
+FTSSEL		00000100 .. 1 ..... 101100 ..... .....		@rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

