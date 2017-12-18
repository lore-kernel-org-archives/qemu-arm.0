Received: by 10.223.159.74 with SMTP id f10csp2937656wrg;
        Mon, 18 Dec 2017 09:50:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBotoWnA+bCYRFIWG6N7WtkqZuXlbV2GEtqkk18CrTR7zn3YOp3q+ylGiK+GfRqBM8EqkJHL1
X-Received: by 10.37.189.137 with SMTP id f9mr470499ybh.217.1513619424447;
        Mon, 18 Dec 2017 09:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619424; cv=none;
        d=google.com; s=arc-20160816;
        b=YHnfo/qtviAghMTlsDaafHRGsMf6FDCaxW2/ohQ3JFW7bRvtRsWt/JG4ofHSI/otYi
         9ja4dMS9VbktWQmW98q9wK7c3z4WX74x5jfKnZp4r8kDaAIdqIN1bixTa+Bqpii6yLeg
         netbd85g6LRqgfP4wBViad4tECEPlACOlFmtallVQPzN3V1kt+0Q3K8L7bWFPvZI9VMH
         KPIVahQ+AmPkm2CVQX/j9zxpVynyKICVSwIAI+tbRz8fP5csaH1y5POdCAApHBk2G7uC
         hEeHrY2RR1X9KEpqLAlmvivzSl1N6VaJhX7QNWCoCZIcBoYf9L2yz8TOn8pkpLL0DrOh
         RU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=iF2u6nO9UW/lfrFKH/HFrJ+iMIQqlH26d96QJAudy8Q=;
        b=wAezrUmfrs9gtbA9SU0HHsOqv97KIfmI0FhyWSaEGo4V3BX9/NGk6iTZZ7zBNhdG5g
         R2Q7pCNHFB91vzfr3bzbLg1rRBVSSqwp/TgIcs43P63omygrVxY0iQv5NoJBqnn3EHZG
         xO2o65cP3cr6ECfzFfYeJLasDNAIEnZ0e5QGLzcmouhGE0Huam1QUA7rhK+Cg0rm3Z+q
         p5XhbhU/PVIe4OWVvBm1kXkFAznTEgWj4UGs+k7cz8gcSZ4147Pwp6BpubW8S8u0d509
         Q5vIAQFas7VbtYsSnNLmOiwp21ikxCNDBqheU2vjE6YLwRNir7qdK2wAkBZUZdLfHVdf
         kJMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FVsIRHn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si1443692ywb.55.2017.12.18.09.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FVsIRHn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzYV-0003bs-Re
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:50:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9Z-0005vK-3d
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9X-0008AQ-Sa
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:37 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:36469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9X-00089B-Kt
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:35 -0500
Received: by mail-pl0-x241.google.com with SMTP id b12so5197086plm.3
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iF2u6nO9UW/lfrFKH/HFrJ+iMIQqlH26d96QJAudy8Q=;
	b=FVsIRHn7aDlYIaNxXOSzRIuajjtf0KunCof/W/h4eKiT4auwKEBYQoeKiJV5bhriX6
	cbhVvVY+aZeIHVv1gcCdnlk3yEjZ1jzcGtdB5/u/GYXutgH/uTvSb+SSZTSfBbe3/aZu
	sbliK7WefH1n31DPMxtvub+CUd+leW1b3GJLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iF2u6nO9UW/lfrFKH/HFrJ+iMIQqlH26d96QJAudy8Q=;
	b=CXdoOxMl1nAFyqQGFgQxos25moKuivH1PxG3TS1qWDIcc6twYMkACQlVQvyDfrJqS4
	ncYK8b2UbF7+a5NTyFHkS2IK4h6MCGtJoLm+VieEx7jEGFBBbP7V0AT8XgXBDZNwQGGZ
	VWitfl9Ozbo+0M8MRKqZhIPD1sdorJ4NnLEGF7z/yX8ngRwKecGvzW9ANPW1YXIQ7wCb
	9tHAHHJFEAcXN+2XRYdz1IMlgcjEsGxAY01OhKtLz8cEwDytiH5JpzNm8Tq/42sJa+Fy
	rwExjao43Px3qFMlooa/pklVBUFXKiJFGzdE2hGJ2Hjn3pIST1Je1egbe99/yV4P3aRY
	IcVg==
X-Gm-Message-State: AKGB3mJlg2k28Ko+4ZlDfgXW2KaDDamCDFWU2T81eyaJ2yC0elP/HgLz
	p63Psd3UrlQIYj7QrUU4/ZyLOA==
X-Received: by 10.84.217.131 with SMTP id p3mr439872pli.270.1513617874624;
	Mon, 18 Dec 2017 09:24:34 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:19 -0800
Message-Id: <20171218172425.18200-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v2 05/11] target/arm: Decode aa32 armv8.1 three
 same
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
X-TUID: sOorNj+WtgXp

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 85 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c690658493..a9587ae242 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -25,6 +25,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
+#include "tcg-op-gvec.h"
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
@@ -5364,9 +5365,9 @@ static void gen_neon_narrow_op(int op, int u, int size,
 #define NEON_3R_VPMAX 20
 #define NEON_3R_VPMIN 21
 #define NEON_3R_VQDMULH_VQRDMULH 22
-#define NEON_3R_VPADD 23
+#define NEON_3R_VPADD_VQRDMLAH 23
 #define NEON_3R_SHA 24 /* SHA1C,SHA1P,SHA1M,SHA1SU0,SHA256H{2},SHA256SU1 */
-#define NEON_3R_VFM 25 /* VFMA, VFMS : float fused multiply-add */
+#define NEON_3R_VFM_VQRDMLSH 25 /* VFMA, VFMS : float fused multiply-add */
 #define NEON_3R_FLOAT_ARITH 26 /* float VADD, VSUB, VPADD, VABD */
 #define NEON_3R_FLOAT_MULTIPLY 27 /* float VMLA, VMLS, VMUL */
 #define NEON_3R_FLOAT_CMP 28 /* float VCEQ, VCGE, VCGT */
@@ -5398,9 +5399,9 @@ static const uint8_t neon_3r_sizes[] = {
     [NEON_3R_VPMAX] = 0x7,
     [NEON_3R_VPMIN] = 0x7,
     [NEON_3R_VQDMULH_VQRDMULH] = 0x6,
-    [NEON_3R_VPADD] = 0x7,
+    [NEON_3R_VPADD_VQRDMLAH] = 0x7,
     [NEON_3R_SHA] = 0xf, /* size field encodes op type */
-    [NEON_3R_VFM] = 0x5, /* size bit 1 encodes op */
+    [NEON_3R_VFM_VQRDMLSH] = 0x7, /* For VFM, size bit 1 encodes op */
     [NEON_3R_FLOAT_ARITH] = 0x5, /* size bit 1 encodes op */
     [NEON_3R_FLOAT_MULTIPLY] = 0x5, /* size bit 1 encodes op */
     [NEON_3R_FLOAT_CMP] = 0x5, /* size bit 1 encodes op */
@@ -5579,6 +5580,22 @@ static const uint8_t neon_2rm_sizes[] = {
     [NEON_2RM_VCVT_UF] = 0x4,
 };
 
+
+/* Expand v8.1 simd helper.  */
+static int do_v81_helper(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                         int q, int rd, int rn, int rm)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+        int opr_sz = (1 + q) * 8;
+        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
+                           vfp_reg_offset(1, rn),
+                           vfp_reg_offset(1, rm), cpu_env,
+                           opr_sz, opr_sz, 0, fn);
+        return 0;
+    }
+    return 1;
+}
+
 /* Translate a NEON data processing instruction.  Return nonzero if the
    instruction is invalid.
    We process data in a mixture of 32-bit and 64-bit chunks.
@@ -5630,12 +5647,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         if (q && ((rd | rn | rm) & 1)) {
             return 1;
         }
-        /*
-         * The SHA-1/SHA-256 3-register instructions require special treatment
-         * here, as their size field is overloaded as an op type selector, and
-         * they all consume their input in a single pass.
-         */
-        if (op == NEON_3R_SHA) {
+        switch (op) {
+        case NEON_3R_SHA:
+            /* The SHA-1/SHA-256 3-register instructions require special
+             * treatment here, as their size field is overloaded as an
+             * op type selector, and they all consume their input in a
+             * single pass.  */
             if (!q) {
                 return 1;
             }
@@ -5672,6 +5689,40 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_temp_free_i32(tmp2);
             tcg_temp_free_i32(tmp3);
             return 0;
+
+        case NEON_3R_VPADD_VQRDMLAH:
+            if (!u) {
+                break;  /* VPADD */
+            }
+            /* VQRDMLAH */
+            switch (size) {
+            case 1:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s16,
+                                     q, rd, rn, rm);
+            case 2:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlah_s32,
+                                     q, rd, rn, rm);
+            }
+            return 1;
+
+        case NEON_3R_VFM_VQRDMLSH:
+            if (!u) {
+                /* VFM, VFMS */
+                if ((5 & (1 << size)) == 0) {
+                    return 1;
+                }
+                break;
+            }
+            /* VQRDMLSH */
+            switch (size) {
+            case 1:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s16,
+                                     q, rd, rn, rm);
+            case 2:
+                return do_v81_helper(s, gen_helper_gvec_qrdmlsh_s32,
+                                     q, rd, rn, rm);
+            }
+            return 1;
         }
         if (size == 3 && op != NEON_3R_LOGIC) {
             /* 64-bit element instructions. */
@@ -5757,11 +5808,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 rm = rtmp;
             }
             break;
-        case NEON_3R_VPADD:
-            if (u) {
-                return 1;
-            }
-            /* Fall through */
+        case NEON_3R_VPADD_VQRDMLAH:
         case NEON_3R_VPMAX:
         case NEON_3R_VPMIN:
             pairwise = 1;
@@ -5795,8 +5842,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 return 1;
             }
             break;
-        case NEON_3R_VFM:
-            if (!arm_dc_feature(s, ARM_FEATURE_VFP4) || u) {
+        case NEON_3R_VFM_VQRDMLSH:
+            if (!arm_dc_feature(s, ARM_FEATURE_VFP4)) {
                 return 1;
             }
             break;
@@ -5993,7 +6040,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
             }
             break;
-        case NEON_3R_VPADD:
+        case NEON_3R_VPADD_VQRDMLAH:
             switch (size) {
             case 0: gen_helper_neon_padd_u8(tmp, tmp, tmp2); break;
             case 1: gen_helper_neon_padd_u16(tmp, tmp, tmp2); break;
@@ -6092,7 +6139,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
               }
             }
             break;
-        case NEON_3R_VFM:
+        case NEON_3R_VFM_VQRDMLSH:
         {
             /* VFMA, VFMS: fused multiply-add */
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.14.3

