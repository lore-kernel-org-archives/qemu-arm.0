Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5782699wrq;
        Tue, 26 Jun 2018 21:54:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcxJ70cPLEy5U9Awfmq9vWfE9Su3krbvBfieni/8tcBsjJSc5ynF/lR9FhpXrM+PqEInEvq
X-Received: by 2002:ac8:3fda:: with SMTP id v26-v6mr4179863qtk.414.1530075287033;
        Tue, 26 Jun 2018 21:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075287; cv=none;
        d=google.com; s=arc-20160816;
        b=FrfeFsLgGqgTDYvEtd4yAtYC+iTDa3myuuBB8AfaVDPtVLGHRESXMfYSxtzW+bZEx/
         BS0zHByUb/9KGXl15lSTMIqJpdiGwCpzmPsxnRH875rFW9vOrUz2AWafJAlEMED0sQU4
         giMa2O4s6VyyrZ//Lgl1CVPjgB/265YbLKFlNHLwbf+0BxulhF87PIbNMpiQa2Zko8s1
         PweZClXcca7/XXpfO/SmrOWZpF8o2bufBrOK9g0OFqxhOKopXyXbVgVKAfOvjpHGV2AA
         qY+pPArHuIGaHZbYHaqLg5Qh6ntul3JUlD8LtLJI6q159vuFw+aTe9SOmcf5z60vj1JR
         0Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=r45jIobnF+wtoBKzXFQCmSBJ8FmsuLpFIk2TKAlXpxU=;
        b=hKjvXiLC+Rh8SnL2RSZbjwwMsaITh4uxUc9Sn1xqPojRipO/PBT+O41yKIk7+mNLxH
         geEIZ2kTxVhodYF2t0P4EVUdQGx0KM4eJVwB34nM37hWDpX4T0yOaVFH3HYf/HJiz+6z
         ZNxKsdFPXrnYTIhxOlLS1cauj/UND1inMFgrBN60h0j8vv3rzUw5+s+kllv73r6T2nRs
         1cCeGMRQDOgOxx2+PMb0O7zbEPsQDtg6+bqWkvkMYUUmppRiK5W5RdPGrg0FJHUVzoZ/
         zUab6EvXNQlsGUf6VtdVbjpo1DzuoQcTx27Lq26sDRzpNZ59PJMwnxFnwboZFRPzcdOt
         s3KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=idJ00xcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38-v6si3209328qtm.176.2018.06.26.21.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=idJ00xcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Td-0004Qp-II
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:54:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29n-0004eq-WD
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29m-00011f-AR
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:16 -0400
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:33916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29m-00010t-1t
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:14 -0400
Received: by mail-pl0-x236.google.com with SMTP id z9-v6so421713plo.1
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r45jIobnF+wtoBKzXFQCmSBJ8FmsuLpFIk2TKAlXpxU=;
	b=idJ00xcqkfipev5FaBl0Bv4pSnx6QzXpkhpn+XRsROXKHe2ZRz2DEYqFDkZkaUbloQ
	c+ThOR9mczsV6bJVUbiu+170XU74PENysndxc7jdnHByNyN5o9HYpcR+L+r2MCMvGqCC
	2mETfakPAe3o7MIy0SfghYcppOVsG+xGfUQIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r45jIobnF+wtoBKzXFQCmSBJ8FmsuLpFIk2TKAlXpxU=;
	b=NR5VEESqTXJvCRVJiz4fap4I+W+JejZHXFaJ+ondrNQrP5cQFfvbya09SRbBkv/OJk
	/0PgcIHNTDHL8VUWCRHAD9cL9MQX0sLArL3BueOnxJOCjCQVSSw1W/PjMFhc0a0pXOI6
	UWXELM+U8EekoTFn+0zQMaRWwc1NhrUl3HiSBzq6W6q6Pvffv7iaV+nG7pfKIiI+/g6L
	H/0OMz+HSaNUoIsESlF5SZcBZMh26QQ21VeY8qGbatu2KlUkgQoFlFnLhw0Vb5JaB1L8
	+P3Cs41MBuzGfYZQdPj/kuQUJGd5BT8J/geNowxoApc8G5NbjvklhMomG8CIFD+aleRK
	OVJg==
X-Gm-Message-State: APt69E0uqUFlisg9FgT2ksH9PjpqR3OOyRB/QwtV6Vp2X/K/zXgvkNgr
	PfS417fr4C0WKw6X+3crT9bJ+lsHKLg=
X-Received: by 2002:a17:902:722:: with SMTP id
	31-v6mr4541650pli.3.1530074053168; 
	Tue, 26 Jun 2018 21:34:13 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:23 -0700
Message-Id: <20180627043328.11531-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: [Qemu-arm] [PATCH v6 30/35] target/arm: Pass index to AdvSIMD FCMLA
 (indexed)
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
X-TUID: 8dQx/qgu+wBd

For aa64 advsimd, we had been passing the pre-indexed vector.
However, sve applies the index to each 128-bit segment, so we
need to pass in the index separately.

For aa32 advsimd, the fp32 operation always has index 0, but
we failed to interpret the fp16 index correctly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6:
  * Fix double-indexing in translate-a64.c
  * Fix non-indexing of fp16 in translate.c.
---
 target/arm/translate-a64.c | 21 ++++++++++++---------
 target/arm/translate.c     | 32 +++++++++++++++++++++++---------
 target/arm/vec_helper.c    | 10 ++++++----
 3 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8d8a4cecb0..eb3a4ab2f0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12669,15 +12669,18 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
     case 0x17: /* FCMLA #270 */
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           vec_reg_offset(s, rm, index, size), fpst,
-                           is_q ? 16 : 8, vec_full_reg_size(s),
-                           extract32(insn, 13, 2), /* rot */
-                           size == MO_64
-                           ? gen_helper_gvec_fcmlas_idx
-                           : gen_helper_gvec_fcmlah_idx);
-        tcg_temp_free_ptr(fpst);
+        {
+            int rot = extract32(insn, 13, 2);
+            int data = (index << 2) | rot;
+            tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                               vec_full_reg_offset(s, rn),
+                               vec_full_reg_offset(s, rm), fpst,
+                               is_q ? 16 : 8, vec_full_reg_size(s), data,
+                               size == MO_64
+                               ? gen_helper_gvec_fcmlas_idx
+                               : gen_helper_gvec_fcmlah_idx);
+            tcg_temp_free_ptr(fpst);
+        }
         return;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2a3e4f5d4c..a7a980b1f2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7826,26 +7826,42 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
 
 static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
 {
-    int rd, rn, rm, rot, size, opr_sz;
+    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+    int rd, rn, rm, opr_sz, data;
     TCGv_ptr fpst;
     bool q;
 
     q = extract32(insn, 6, 1);
     VFP_DREG_D(rd, insn);
     VFP_DREG_N(rn, insn);
-    VFP_DREG_M(rm, insn);
     if ((rd | rn) & q) {
         return 1;
     }
 
     if ((insn & 0xff000f10) == 0xfe000800) {
         /* VCMLA (indexed) -- 1111 1110 S.RR .... .... 1000 ...0 .... */
-        rot = extract32(insn, 20, 2);
-        size = extract32(insn, 23, 1);
-        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)
-            || (!size && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+        int rot = extract32(insn, 20, 2);
+        int size = extract32(insn, 23, 1);
+        int index;
+
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
             return 1;
         }
+        if (size == 0) {
+            if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+                return 1;
+            }
+            /* For fp16, rm is just Vm, and index is M.  */
+            rm = extract32(insn, 0, 4);
+            index = extract32(insn, 5, 1);
+        } else {
+            /* For fp32, rm is the usual M:Vm, and index is 0.  */
+            VFP_DREG_M(rm, insn);
+            index = 0;
+        }
+        data = (index << 2) | rot;
+        fn_gvec_ptr = (size ? gen_helper_gvec_fcmlas_idx
+                       : gen_helper_gvec_fcmlah_idx);
     } else {
         return 1;
     }
@@ -7864,9 +7880,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
     tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
                        vfp_reg_offset(1, rn),
                        vfp_reg_offset(1, rm), fpst,
-                       opr_sz, opr_sz, rot,
-                       size ? gen_helper_gvec_fcmlas_idx
-                       : gen_helper_gvec_fcmlah_idx);
+                       opr_sz, opr_sz, data, fn_gvec_ptr);
     tcg_temp_free_ptr(fpst);
     return 0;
 }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 073e5c58e7..8f2dc4b989 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -317,10 +317,11 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
     uint32_t neg_real = flip ^ neg_imag;
     uintptr_t i;
-    float16 e1 = m[H2(flip)];
-    float16 e3 = m[H2(1 - flip)];
+    float16 e1 = m[H2(2 * index + flip)];
+    float16 e3 = m[H2(2 * index + 1 - flip)];
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 15;
@@ -377,10 +378,11 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
     float_status *fpst = vfpst;
     intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 2, 2);
     uint32_t neg_real = flip ^ neg_imag;
     uintptr_t i;
-    float32 e1 = m[H4(flip)];
-    float32 e3 = m[H4(1 - flip)];
+    float32 e1 = m[H4(2 * index + flip)];
+    float32 e3 = m[H4(2 * index + 1 - flip)];
 
     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 31;
-- 
2.17.1

