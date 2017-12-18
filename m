Received: by 10.223.159.74 with SMTP id f10csp2928422wrg;
        Mon, 18 Dec 2017 09:42:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBoud+v/2iH5TgL3u0dvuL4CQGY7HpT61hYwQSMXjewusZX6s0Wj4HCEwkGEWKEc4dqsMavQO
X-Received: by 10.37.15.213 with SMTP id 204mr454419ybp.456.1513618978340;
        Mon, 18 Dec 2017 09:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513618978; cv=none;
        d=google.com; s=arc-20160816;
        b=DBTEJ7kIhNXdyMqM+6XyjXvQb9lKkJfM4UM+xHik6iMPxW0hN0y6vWLOXgH0GW9zBD
         IXOZ+lhw4M+tuhXL18Gs4TCbuwEXvS72Ag9HevOPBCSAnWQi5ruvOgNcGcHQz5IIVq/Y
         Tk4io8VWuWy+bEwoEYpduXU3nnLYqRvUhYaxi1XNGgYoggywNdTe140mThg1QvOIR6hs
         M2XCa90uFxwY999gBdQmPIRTcbqO56ftHXTgR7ng3CAIzBSJ3nW6OJMeBL6u6rGnlv8g
         gibA0oVG+QeZPkHt+sidSCwGQwNgzrq4rI+bnZiAgSAyw9bg9LosEJLDrPadFa5xAGph
         wAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=iQ5LZPZSGs0K79ksja0IDxF/0z6h8Y8IG7iuFV2P9oE=;
        b=WpoZl8FFwSGoxFObY3GRxUf6MpJhsr3ZJ0P/Lj3BzrlTjuaDyYAzeQAQiryoB8WFAJ
         QKrjdWrt9k5aodcaL+zsO1RyXtim2PxSp2pQkxM28D41lde4rC6oF4hi5AjqNbdmkWG1
         Yrl69smuDFoORfd7qaj4Fkvmpb7Oq8KhuF2mziKjnkH/CSchXg9umQ/clEOkygE3BP38
         5KbXvNxgizJcIkSFJpW+tS7UEEtdTIS/rlCE2UJ18nv1M1WpAHel1mNmiKS/ChUr++sL
         BxeIFetSc7CdVB+6xXqteKWrWx6SGonw3J0LnB8ncJYuRpGGIffeJiRdq2wu9mMGcVnf
         OE1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUgBGTLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84si2474427ywg.698.2017.12.18.09.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUgBGTLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzRJ-0004yC-Na
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:42:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9g-00064S-9v
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9e-0008IE-50
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:44 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:45003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9d-0008HT-Sg
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:42 -0500
Received: by mail-pl0-x244.google.com with SMTP id n13so5204362plp.11
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iQ5LZPZSGs0K79ksja0IDxF/0z6h8Y8IG7iuFV2P9oE=;
	b=bUgBGTLo94QeFWhh1hKBIXzASpcVfcPy0+IUfoA8V0E0MK2fDQF2uy7SC+IbxTOs+x
	HmM1MpLXmC4LvEI+yKYQt4IhLXW37rQHLNl//VJzlNW2f7fgjuZEHCBhfjRStWQgSBxY
	eajdJCkXW8z0qQa/ntUdReEnH1MA0BVUhqQI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iQ5LZPZSGs0K79ksja0IDxF/0z6h8Y8IG7iuFV2P9oE=;
	b=aImGR6X16bWgMTkrEN6wYTK0ficj8YUXm4v/S/yXcwfQQzxdLsxVIsNb6KUVUXv4u+
	UDaTWvyQYl4zwYSO85xT3zBaFxWePMmmtyJAeCqs/6FIlba38SFokv3TZOwYosn6KfcY
	Fh7BrausmtrA+LFchRLdI4cA2g5kt/YeywoXxDAJk9eLXNh2LTNnLCUw2kqIXlFMJ8S3
	r5w4O+xX5CTfmQhNmaTU+p41jfxgu35TKbyta3btk9zfHlOENknw1nz4p0dnSzHbh1J5
	KKQVI7j5EDyApN//YxYt9XxAUbPS8/0n9jsOFPv9ybZx3MX7f++8ZvXRz8s30TqPo9qZ
	dKBw==
X-Gm-Message-State: AKGB3mJr4t8GHAYcE+MkqWti5sKErXpvm0hFAPX21C0y5FZ5nl9SXUkJ
	H9ynaDnkAX1z/ZV7d8M1aME2JiWtVhQ=
X-Received: by 10.84.130.41 with SMTP id 38mr421802plc.131.1513617880925;
	Mon, 18 Dec 2017 09:24:40 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:23 -0800
Message-Id: <20171218172425.18200-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 09/11] target/arm: Decode aa64 armv8.3 fcmla
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
X-TUID: Wrn3eZHh/VlF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |  11 ++++
 target/arm/advsimd_helper.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  | 149 ++++++++++++++++++++++++++++++++------------
 3 files changed, 265 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0f0fc942b0..5b6333347d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -574,6 +574,17 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fcmlah, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
index afc2bb1142..6a2a53e111 100644
--- a/target/arm/advsimd_helper.c
+++ b/target/arm/advsimd_helper.c
@@ -274,3 +274,147 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float16 *d = vd;
+    float16 *n = vn;
+    float16 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    neg_real <<= 15;
+    neg_imag <<= 15;
+
+    for (i = 0; i < opr_sz / 2; i += 2) {
+        float16 e0 = n[H2(i + flip)];
+        float16 e1 = m[H2(i + flip)] ^ neg_real;
+        float16 e2 = e0;
+        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;
+
+        d[H2(i)] = float16_muladd(e0, e1, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e2, e3, d[H2(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
+                             void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float16 *d = vd;
+    float16 *n = vn;
+    float16 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+    float16 e1 = m[H2(flip)];
+    float16 e3 = m[H2(1 - flip)];
+
+    neg_real <<= 15;
+    neg_imag <<= 15;
+    e1 ^= neg_real;
+    e3 ^= neg_imag;
+
+    for (i = 0; i < opr_sz / 2; i += 2) {
+        float16 e0 = n[H2(i + flip)];
+        float16 e2 = e0;
+
+        d[H2(i)] = float16_muladd(e0, e1, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e2, e3, d[H2(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    neg_real <<= 31;
+    neg_imag <<= 31;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i + flip)];
+        float32 e1 = m[H4(i + flip)] ^ neg_real;
+        float32 e2 = e0;
+        float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;
+
+        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
+                             void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float32 *d = vd;
+    float32 *n = vn;
+    float32 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+    float32 e1 = m[H4(flip)];
+    float32 e3 = m[H4(1 - flip)];
+
+    neg_real <<= 31;
+    neg_imag <<= 31;
+    e1 ^= neg_real;
+    e3 ^= neg_imag;
+
+    for (i = 0; i < opr_sz / 4; i += 2) {
+        float32 e0 = n[H4(i + flip)];
+        float32 e2 = e0;
+
+        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
+                         void *vfpst, uint32_t desc)
+{
+    uintptr_t opr_sz = simd_oprsz(desc);
+    float64 *d = vd;
+    float64 *n = vn;
+    float64 *m = vm;
+    float_status *fpst = vfpst;
+    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t neg_real = flip ^ neg_imag;
+    uintptr_t i;
+
+    neg_real <<= 63;
+    neg_imag <<= 63;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        float64 e0 = n[i + flip];
+        float64 e1 = m[i + flip] ^ neg_real;
+        float64 e2 = e0;
+        float64 e3 = m[i + 1 - flip] ^ neg_imag;
+
+        d[i] = float64_muladd(e0, e1, d[i], 0, fpst);
+        d[i + 1] = float64_muladd(e2, e3, d[i + 1], 0, fpst);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 89a0616894..79fede35c1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10713,6 +10713,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = ARM_FEATURE_V8_1_SIMD;
         break;
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         if (size == 0 || (size == 3 && !is_q)) {
@@ -10767,6 +10771,26 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                            0, fn_gvec_ptr);
         break;
 
+    case 0x8: /* FCMLA, #0 */
+    case 0x9: /* FCMLA, #90 */
+    case 0xa: /* FCMLA, #180 */
+    case 0xb: /* FCMLA, #270 */
+        switch (size) {
+        case 1:
+            fn_gvec_ptr = gen_helper_gvec_fcmlah;
+            break;
+        case 2:
+            fn_gvec_ptr = gen_helper_gvec_fcmlas;
+            break;
+        case 3:
+            fn_gvec_ptr = gen_helper_gvec_fcmlad;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        data = extract32(opcode, 0, 2);
+        goto do_fpst;
+
     case 0xc: /* FCADD, #90 */
     case 0xe: /* FCADD, #270 */
         switch (size) {
@@ -10783,6 +10807,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
         }
         data = extract32(opcode, 1, 1);
+    do_fpst:
         fpst = get_fpstatus_ptr(size == 1);
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
                            vec_full_reg_offset(s, rn),
@@ -11864,80 +11889,80 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool is_long = false;
-    bool is_fp = false;
+    int is_fp = 0;
+    bool is_fp16 = false;
     int index;
     TCGv_ptr fpst;
 
-    switch (opcode) {
-    case 0x0: /* MLA */
-    case 0x4: /* MLS */
-        if (!u || is_scalar) {
+    switch (16 * u + opcode) {
+    case 0x00: /* MLA */
+    case 0x04: /* MLS */
+    case 0x08: /* MUL */
+        if (is_scalar) {
             unallocated_encoding(s);
             return;
         }
         break;
-    case 0x2: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
-    case 0x6: /* SMLSL, SMLSL2, UMLSL, UMLSL2 */
-    case 0xa: /* SMULL, SMULL2, UMULL, UMULL2 */
+    case 0x02: /* SMLAL, SMLAL2 */
+    case 0x12: /* UMLAL, UMLAL2 */
+    case 0x06: /* SMLSL, SMLSL2 */
+    case 0x16: /* UMLSL, UMLSL2 */
+    case 0x0a: /* SMULL, SMULL2 */
+    case 0x1a: /* UMULL, UMULL2 */
         if (is_scalar) {
             unallocated_encoding(s);
             return;
         }
         is_long = true;
         break;
-    case 0x3: /* SQDMLAL, SQDMLAL2 */
-    case 0x7: /* SQDMLSL, SQDMLSL2 */
-    case 0xb: /* SQDMULL, SQDMULL2 */
+    case 0x03: /* SQDMLAL, SQDMLAL2 */
+    case 0x07: /* SQDMLSL, SQDMLSL2 */
+    case 0x0b: /* SQDMULL, SQDMULL2 */
         is_long = true;
-        /* fall through */
-    case 0xc: /* SQDMULH */
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
         break;
-    case 0xd: /* SQRDMULH / SQRDMLAH */
-        if (u && !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
-            unallocated_encoding(s);
-            return;
-        }
+    case 0x0c: /* SQDMULH */
+    case 0x0d: /* SQRDMULH */
         break;
-    case 0xf: /* SQRDMLSH */
-        if (!u || !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+    case 0x1d: /* SQRDMLAH */
+    case 0x1f: /* SQRDMLSH */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
             unallocated_encoding(s);
             return;
         }
         break;
-    case 0x8: /* MUL */
-        if (u || is_scalar) {
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
             unallocated_encoding(s);
             return;
         }
+        is_fp = 2;
         break;
-    case 0x1: /* FMLA */
-    case 0x5: /* FMLS */
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x9: /* FMUL, FMULX */
-        if (size == 1 || (size < 2 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+    case 0x01: /* FMLA */
+    case 0x05: /* FMLS */
+    case 0x09: /* FMUL */
+    case 0x19: /* FMULX */
+        if (size == 1
+            || (size < 2 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
             unallocated_encoding(s);
             return;
         }
-        is_fp = true;
+        is_fp = 1;
         break;
     default:
         unallocated_encoding(s);
         return;
     }
 
-    if (is_fp) {
+    switch (is_fp) {
+    case 1: /* normal fp */
         /* convert insn encoded size to TCGMemOp size */
         switch (size) {
         case 0: /* half-precision */
             size = MO_16;
+            is_fp16 = true;
             index = h << 2 | l << 1 | m;
             break;
         case 2: /* single precision */
@@ -11958,7 +11983,36 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
             break;
         }
-    } else {
+        break;
+
+    case 2: /* complex fp */
+        switch (size) {
+        case 1:
+            size = MO_32;
+            is_fp16 = true;
+            if (h && !is_q) {
+                unallocated_encoding(s);
+                return;
+            }
+            index = h << 1 | l;
+            rm |= (m << 4);
+            break;
+        case 2:
+            size = MO_64;
+            if (l || !is_q) {
+                unallocated_encoding(s);
+                return;
+            }
+            index = h;
+            rm |= (m << 4);
+            break;
+        default:
+            unallocated_encoding(s);
+            return;
+        }
+        break;
+
+    default: /* integer */
         switch (size) {
         case 1:
             index = h << 2 | l << 1 | m;
@@ -11978,11 +12032,28 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     if (is_fp) {
-        fpst = get_fpstatus_ptr(false);
+        fpst = get_fpstatus_ptr(is_fp16);
     } else {
         fpst = NULL;
     }
 
+    switch (16 * u + opcode) {
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_reg_offset(s, rm, index, size), fpst,
+                           is_q ? 16 : 8, vec_full_reg_size(s),
+                           extract32(insn, 13, 2), /* rot */
+                           size == MO_64
+                           ? gen_helper_gvec_fcmlas_idx
+                           : gen_helper_gvec_fcmlah_idx);
+        tcg_temp_free_ptr(fpst);
+        return;
+    }
+
     if (size == 3) {
         TCGv_i64 tcg_idx = tcg_temp_new_i64();
         int pass;
-- 
2.14.3

