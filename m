Received: by 10.223.197.9 with SMTP id q9csp5937108wrf;
        Wed, 4 Oct 2017 11:51:04 -0700 (PDT)
X-Received: by 10.55.220.2 with SMTP id v2mr26864235qki.64.1507143064506;
        Wed, 04 Oct 2017 11:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507143064; cv=none;
        d=google.com; s=arc-20160816;
        b=v3/Q6BhdLXadWkv62rLg82rvJUlZB+eaOgBrOUU1/ehOtKAJpuEoixAGv2zOkp4CZY
         M+vNADsma60sIqF3MKDzo0OCHGkTYeK5XhyOjHLZZ4wYBB0Tvk0Lm67UoRc0GUUBXbMC
         mDehjpDOzL52Akbb2fmRrfn6xchpIielFyyzMs9scNc1hWPtu3ZyNeM1XZZKZKlWD72J
         2fiuQTmK3fjRWEry1oOTB3vl/OKfQaK+urBDRv+lN6n0mZCUI0Lgzhd27QwmYvx/oGNv
         amh9tEeIgWGPvX1OroC24eFjDplOiGNNdGew8XBOt/grGOHKoP6+j5oTnhqEjx+fTqeH
         +UFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rMT1W5HxLg4WwnwPsKmlw0wdDpnm+eT3B+41Ikrii8k=;
        b=jsrDNuQaVDbvLadp2EwCvkF4Og7IaMYjZA0H/RK9A5ZVqBWv1PabzmANlv8rQWn54Y
         T1zsA/olW0y0twK4YuFikhJbqUeue8Gf9rDLRwa1Aek3S6HEiDPcQPA6vjGbYP8SmGgk
         lx6pXS5zIUu+8A2nfMuw7xc7XJMii0vibCKOiVdZEfYwl/hpmAU6HsI8/z+/e77JvZPt
         2JOYrddOAuta2qtgpXerUmlpk4IoxJv9O9XXFkVL79PTDU7teWyLPSXkinacsVOmznNH
         x5s+CkGVTmnQULURPiLG95+2ND/nK94zf6mnGm/SLzkq3LNPTYhLdvFYO6qnQIgnNKyN
         NIYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jSv+EIef;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si31620qkw.302.2017.10.04.11.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jSv+EIef;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzol5-0005pd-VF
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:51:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzoe0-0008Gv-31
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodz-0002mh-2Q
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:44 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzody-0002mB-Ts
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:42 -0400
Received: by mail-qt0-x234.google.com with SMTP id a43so15131701qta.0
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rMT1W5HxLg4WwnwPsKmlw0wdDpnm+eT3B+41Ikrii8k=;
	b=jSv+EIefUE0XdeRD8EsThnxWK5Zhk4ZIG3opnDB8dac7XRbkJTFUjCikNWir2Eszqm
	thJWhR3vv83o4hUPUP0eqjVY3Dl4CxMhzbIMAk/xE/jmQk6bFCLN4o+2DnFxSUKRwLWc
	rHFaZRyetko5Qbhuq5yQ+w5LxwjL5sCgUddVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rMT1W5HxLg4WwnwPsKmlw0wdDpnm+eT3B+41Ikrii8k=;
	b=pOqQxqeJXk2WPW3yyFuwN+krN5TtBqhQoKsr22EoeTVbH2cKv2zxmRt9npig2OaMOD
	IIYmWa7RprG/gpi+N323Sx+rGm/8TVvQ5HSJsepCw+aTVg59SOVV7zp3DB61LONhU/Wh
	w4l9Cp/KeBCH/Hg+t3M/4IBGcpUq+nJBKI8u6Sz5Dk0FG98MFSw8/Dl7RoaGKz7w+4aD
	J3bWpyLoXGy0C188B2oLzAE9Ki6xVZMNi5E2Oq9svnzXp+1ibDjslaP/c8XRVgwOpCkB
	URpd7dyZmXsJrIXfLb1LiMg8bR+YP0HGvC5ulj98y/+OJvIyfjNGayNfr2fD+1K1Sk8g
	LNww==
X-Gm-Message-State: AMCzsaWEWWK05Q7/CKbEcQhSVaknYWpuvHH8z7SQpnqX0W/wNZzNq8r5
	7dFDWRtfwGL0wfyU4RsizsIDZQ1GsAA=
X-Google-Smtp-Source: AOwi7QCqvwkwUUAz5gu19WZoSbz1xhPsdrh5VFzFKSQvE5uegwYvclB4rAYPUtQgFOR7RZL9w6p+7g==
X-Received: by 10.37.234.83 with SMTP id o19mr4749768ybe.358.1507142622034;
	Wed, 04 Oct 2017 11:43:42 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:22 -0400
Message-Id: <20171004184325.24157-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-devel] [PATCH v1 09/12] target/arm: Decode aa64 armv8.3 fcadd
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kY4UuJeGuQMC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |  5 ++++
 target/arm/advsimd_helper.c | 66 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  | 33 ++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 67583b3c2e..350e2fa0e1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -551,6 +551,11 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
index b0f4b02a12..fe2e0cbcef 100644
--- a/target/arm/advsimd_helper.c
+++ b/target/arm/advsimd_helper.c
@@ -24,6 +24,18 @@
 #include "tcg/tcg-gvec-desc.h"
 
 
+/* Note that vector data is stored in host-endian 64-bit chunks,
+   so addressing units smaller than that needs a host-endian fixup.  */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)  ((x) ^ 7)
+#define H2(x)  ((x) ^ 3)
+#define H4(x)  ((x) ^ 1)
+#else
+#define H1(x)  (x)
+#define H2(x)  (x)
+#define H4(x)  (x)
+#endif
+
 #define SET_QC() env->vfp.xregs[ARM_VFP_FPSCR] |= CPSR_Q
 
 static void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
@@ -177,3 +189,57 @@ void HELPER(gvec_qrdmlsh_s32)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fcadds)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    uint32_t neg_real = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = neg_real ^ 1;
+    uintptr_t i;
+
+    neg_real <<= 31;
+    neg_imag <<= 31;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i)];
+        float32 e1 = m[H4(i + 1)] ^ neg_imag;
+        float32 e2 = n[H4(i + 1)];
+        float32 e3 = m[H4(i)] ^ neg_real;
+
+        d[H4(i)] = float32_add(e0, e1, fpst);
+        d[H4(i + 1)] = float32_add(e2, e3, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float64 *d = vd;
+    float64 *n = vn;
+    float64 *m = vm;
+    float_status *fpst = vfpst;
+    uint64_t neg_real = extract64(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t neg_imag = neg_real ^ 1;
+    uintptr_t i;
+
+    neg_real <<= 63;
+    neg_imag <<= 63;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        float64 e0 = n[i];
+        float64 e1 = m[i + 1] ^ neg_imag;
+        float64 e2 = n[i + 1];
+        float64 e3 = m[i] ^ neg_real;
+
+        d[i] = float64_add(e0, e1, fpst);
+        d[i + 1] = float64_add(e2, e3, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b02aad8cd7..f13a945c43 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9890,7 +9890,8 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 22, 2);
     bool u = extract32(insn, 29, 1);
     bool is_q = extract32(insn, 30, 1);
-    int feature;
+    int feature, data;
+    TCGv_ptr fpst;
 
     if (!u) {
         unallocated_encoding(s);
@@ -9906,6 +9907,14 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_1_SIMD;
         break;
+    case 0xc: /* FCADD, #90 */
+    case 0xe: /* FCADD, #270 */
+        if (size != 2 && (size != 3 || !is_q)) { /* FIXME: fp16 support */
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_FCMA;
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -9952,6 +9961,28 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                            0, fn_gvec_ptr);
         break;
 
+    case 0xc: /* FCADD, #90 */
+    case 0xe: /* FCADD, #270 */
+        switch (size) {
+        case 2:
+            fn_gvec_ptr = gen_helper_gvec_fcadds;
+            break;
+        case 3:
+            fn_gvec_ptr = gen_helper_gvec_fcaddd;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        data = extract32(opcode, 1, 1);
+        fpst = get_fpstatus_ptr();
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm), fpst,
+                           is_q ? 16 : 8, vec_full_reg_size(s),
+                           data, fn_gvec_ptr);
+        tcg_temp_free_ptr(fpst);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.13.6

