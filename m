Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp508298wrp;
        Wed, 13 Feb 2019 20:00:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaB5t57kuGffAQL1xt7Pb2BEx7UIFMODf3cm/XRs+lxPFQMb0K+KKA5WQHPfT6B08CIxB/7
X-Received: by 2002:a25:9ac9:: with SMTP id t9mr1349784ybo.430.1550116845486;
        Wed, 13 Feb 2019 20:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550116845; cv=none;
        d=google.com; s=arc-20160816;
        b=vTPJETg/V9WEpsBqsObF0Il0JmQRU/rmBxIOdEwtoZpSg2HAFmYC11BtfMKmK6mUNu
         xQNuv4yEh7/aCo8pwB0vb6/LCY+LdI9D3VBA9Eb1amVqau18oLqMUU6AJTNB/Jas+zgh
         M1mz2sqn4P86XDC+BwycR7Vjszbq2wsuyxj60f7wL8wYhYLELgFz4LwTZs0HvDvR535Q
         My6Um1EG4sHMQbcKpJ/FP2mNZ8QWsncLrTZVY9UhuUoAVC+NYecL1uShHZhN/vxNZw+F
         yv30ITGsYFqnETmlunXm8pxCSaRKDMDi+BDzAmVaZ7NvGlLzIRKWkuPDBqV6/I/URtBJ
         zGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Pc/X7bYACbirL+ncExC8NIvdujuhp6NL2EDWTl+xV4k=;
        b=AijjFvs+efkjTBGo6waySNFkFv9yz0CTLANgeoebkEsh1QNdKeVHMFXNImA3NOK3pc
         eG5psLFo6mj6K6KF653kKB3wVeUeMwt7572dm6m7w6C2dKzdBpMqT6DOTGCHgl8GG8TB
         WyW94Jp/Q5pZyjM8dDLVM0OgK23B2ybSsDXqZXCtbijvXrT3VhwKUxDSIsa9N9w4mUb9
         l1B2benW9ujhpQPXTnOHyn5vMPA1FBfMVLT+625jh7UZJoBbstQfVLnDNFS7jAlMs7eh
         w74oH+lFrjtCulMpux++5HGt6OxiLCa2loUiyWntMH+rWiiwwMPp10g825QwGIUTPJll
         WueQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jsJ/lgTR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si783356ybm.95.2019.02.13.20.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 20:00:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jsJ/lgTR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gu8Ca-0000Ku-Oc
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 23:00:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu89b-0006hY-GA
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:57:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu7wL-000789-Tm
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:44:00 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gu7wL-0006zn-Im
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:43:57 -0500
Received: by mail-pl1-x643.google.com with SMTP id e5so2379984plb.5
	for <qemu-devel@nongnu.org>; Wed, 13 Feb 2019 19:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pc/X7bYACbirL+ncExC8NIvdujuhp6NL2EDWTl+xV4k=;
	b=jsJ/lgTRqYyPkT9BMPB+jtRfgkbRNxj+8d2MoF94lEucJKVAy5uaXuLtNQNbUn+Rei
	rA73h+M+OkTgVGLvrHU7n9hSzMzp8ryEPxmDU/cu6dNam1fD/DnVMeiYCS0aB9Wm04/Z
	RlzvbzcbcQMgE3y6FVx51JVGrcCktCqDIZbJoX4hdGsq9PbCUFGJPEYoUo93gHkdDJ6o
	BgA8sWCE7PN1L95x9dz0Izuac1hjmO6dFlS3kaky+9CKK165M5QRhfDjqXPT1UtYe+b9
	vys5ux4t0HNdD9+/eKrBRLRMrRtXgTehNye70HdclGst8UablFH2IAIGLb/w6TZ1dfNs
	ivxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pc/X7bYACbirL+ncExC8NIvdujuhp6NL2EDWTl+xV4k=;
	b=DRG0nRNJ9uyhDW30Fh/yJe6GMs2UOmGmDTfXSIkweTc4rVFYmoQRXXOyKlFHWuDpKa
	KzGOGta3RTnoSB1SuLLFOWYKe7bUkNvHzOHSPAlns62SmoNkxi0LlNHLxc14JHjKdegX
	uq3/hnR+7G/Bf4UWWuSi2KvaQmvxteyMH6FpcKixvV47mh7aWvpYcgJDpwATKHgxixnu
	xDM1p0Mvqe4rtYzk1IE4uggN2WjylRwCrj6Z5ZONFDV30nSvH/GnfLFo6pCSCie8QNUV
	WdmaNn2CxL+RQ/AouJ3/5H3GSjd2LBdULcv1PE9MTZ70WBjJHIUjRtL4ul4IrIJdcLir
	refg==
X-Gm-Message-State: AHQUAuaRxgMVAEu9oMQe7JFApJY+lqjarKWB1+m3tkf332QaDUPR/JHn
	zttwgW8Ch+ZNXzkpU3E4fgVcJTshOw4=
X-Received: by 2002:a17:902:760a:: with SMTP id
	k10mr1897636pll.102.1550115829227; 
	Wed, 13 Feb 2019 19:43:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id o2sm972713pgq.90.2019.02.13.19.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 19:43:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 19:43:42 -0800
Message-Id: <20190214034345.24722-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190214034345.24722-1-richard.henderson@linaro.org>
References: <20190214034345.24722-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH 1/4] target/arm: Add helpers for FMLAL and FMLSL
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFuYTlg5HmGV

Note that float16_to_float32 rightly squashes SNaN to QNaN.
But of course pickNaNMulAdd, for ARM, selects SNaNs first.
So we have to preserve SNaN long enough for the correct NaN
to be selected.  Thus float16_to_float32_by_bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h     |   9 +++
 target/arm/vec_helper.c | 154 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 53a38188c6..0302e13604 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -653,6 +653,15 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmlal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmlsl_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmlal_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmlsl_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 37f338732e..0c3b3de961 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -766,3 +766,157 @@ DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4)
 DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
 
 #undef DO_FMLA_IDX
+
+/*
+ * Convert float16 to float32, raising no exceptions and
+ * preserving exceptional values, including SNaN.
+ * This is effectively an unpack+repack operation.
+ */
+static float32 float16_to_float32_by_bits(uint32_t f16)
+{
+    const int f16_bias = 15;
+    const int f32_bias = 127;
+    uint32_t sign = extract32(f16, 15, 1);
+    uint32_t exp = extract32(f16, 10, 5);
+    uint32_t frac = extract32(f16, 0, 10);
+
+    if (exp == 0x1f) {
+        /* Inf or NaN */
+        exp = 0xff;
+    } else if (exp == 0) {
+        /* Zero or denormal.  */
+        if (frac != 0) {
+            /*
+             * Denormal; these are all normal float32.
+             * Shift the fraction so that the msb is at bit 11,
+             * then remove bit 11 as the implicit bit of the
+             * normalized float32.  Note that we still go through
+             * the shift for normal numbers below, to put the
+             * float32 fraction at the right place.
+             */
+            int shift = clz32(frac) - 21;
+            frac = (frac << shift) & 0x3ff;
+            exp = f32_bias - f16_bias - shift + 1;
+        }
+    } else {
+        /* Normal number; adjust the bias.  */
+        exp += f32_bias - f16_bias;
+    }
+    sign <<= 31;
+    exp <<= 23;
+    frac <<= 23 - 10;
+
+    return sign | exp | frac;
+}
+
+static float32 fmlal(float32 a, float16 n16, float16 m16, float_status *fpst)
+{
+    float32 n = float16_to_float32_by_bits(n16);
+    float32 m = float16_to_float32_by_bits(m16);
+    return float32_muladd(n, m, a, 0, fpst);
+}
+
+static float32 fmlsl(float32 a, float16 n16, float16 m16, float_status *fpst)
+{
+    float32 n = float16_to_float32_by_bits(n16);
+    float32 m = float16_to_float32_by_bits(m16);
+    return float32_muladd(float32_chs(n), m, a, 0, fpst);
+}
+
+static inline uint64_t load4_f16(uint64_t *ptr, int is_q, int is_2)
+{
+    /*
+     * Branchless load of u32[0], u64[0], u32[1], or u64[1].
+     * Load the 2nd qword iff is_q & is_2.
+     * Shift to the 2nd dword iff !is_q & is_2.
+     * For !is_q & !is_2, the upper bits of the result are garbage.
+     */
+    return ptr[is_q & is_2] >> ((is_2 & ~is_q) << 5);
+}
+
+/*
+ * Note that FMLAL and FMLSL require oprsz == 8 or oprsz == 16,
+ * as there is not yet SVE versions that might use blocking.
+ */
+
+void HELPER(gvec_fmlal_h)(void *vd, void *vn, void *vm,
+                          void *fpst, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
+    int is_q = oprsz == 16;
+    float32 *d = vd;
+    uint64_t n_4, m_4;
+
+    /* Pre-load all of the f16 data, avoiding overlap issues.  */
+    n_4 = load4_f16(vn, is_q, is_2);
+    m_4 = load4_f16(vm, is_q, is_2);
+
+    for (i = 0; i < oprsz / 4; i++) {
+        d[H4(i)] = fmlal(d[H4(i)], extract64(n_4, i*16, 16),
+                         extract64(m_4, i*16, 16), fpst);
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fmlsl_h)(void *vd, void *vn, void *vm,
+                          void *fpst, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
+    int is_q = oprsz == 16;
+    float32 *d = vd;
+    uint64_t n_4, m_4;
+
+    /* Pre-load all of the f16 data, avoiding overlap issues.  */
+    n_4 = load4_f16(vn, is_q, is_2);
+    m_4 = load4_f16(vm, is_q, is_2);
+
+    for (i = 0; i < oprsz / 4; i++) {
+        d[H4(i)] = fmlsl(d[H4(i)], extract64(n_4, i*16, 16),
+                         extract64(m_4, i*16, 16), fpst);
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fmlal_idx_h)(void *vd, void *vn, void *vm,
+                              void *fpst, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
+    int index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
+    int is_q = oprsz == 16;
+    float32 *d = vd;
+    uint64_t n_4;
+    float16 m_1;
+
+    /* Pre-load all of the f16 data, avoiding overlap issues.  */
+    n_4 = load4_f16(vn, is_q, is_2);
+    m_1 = ((float16 *)vm)[H2(index)];
+
+    for (i = 0; i < oprsz / 4; i++) {
+        d[H4(i)] = fmlal(d[H4(i)], extract64(n_4, i * 16, 16), m_1, fpst);
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fmlsl_idx_h)(void *vd, void *vn, void *vm,
+                              void *fpst, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
+    int index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
+    int is_q = oprsz == 16;
+    float32 *d = vd;
+    uint64_t n_4;
+    float16 m_1;
+
+    /* Pre-load all of the f16 data, avoiding overlap issues.  */
+    n_4 = load4_f16(vn, is_q, is_2);
+    m_1 = ((float16 *)vm)[H2(index)];
+
+    for (i = 0; i < oprsz / 4; i++) {
+        d[H4(i)] = fmlsl(d[H4(i)], extract64(n_4, i*16, 16), m_1, fpst);
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
-- 
2.17.2

