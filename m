Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5781830wrq;
        Tue, 26 Jun 2018 21:53:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpejn7Zq5yh5iSM/g87KuxRaL2HfQFkJiRH3OaI58RAAk/6Z9RZo3qX4WoQPspwCz0MCPFi5
X-Received: by 2002:a37:a64a:: with SMTP id p71-v6mr3790298qke.344.1530075210618;
        Tue, 26 Jun 2018 21:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075210; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCKYh3GFwJDnkkgr4FoBXdwCMT5ZNuGyA0sszD0cAkCk2NoiI/3lGaQTfBZ/zHJD/9
         veQqobZyGPkUK1SmB0dwYfVlDjNWO6v7xvJMTI/VTDPN0XMR5caQkUc6YzjSzwYWCezI
         gMRTJR3YpH7qkXofz8re/2wyrIW6YY1jIKtHBYXKpOKt3e2Qfujekv0LiGUPL/fCTKIS
         PR8SFY4DpY0kzRnvA7dy3rHID+xnCof07f+Evbr2KU6E3uSrTnpuVFd+xSN2k9HELJCV
         H/8mEj31f1KPsrDlj4UZtkoeJi2i1NB2WJyBLOQBkemfzn3cW64ReSwVjjU3NqFA5S5S
         3rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jAT3MbivOAuh2cXOphZuTzwQ/j70NHuupQD49/hoOCQ=;
        b=S3GM9QYZ4CPGymCSRFXn01AkZHNLI2JrN0lMz1/BlKXGDr2zR8snVH7F9Y4oHJ8Tfj
         t4D3A2hU/KNnZrmOageFn7PB1wetG/NUbteEMm1MyKpYhYIQxmdbPYlRCFi5K+KNonB2
         2j1kGFLDKfQwAZcl3xQwNN66eNG7V7kdzf4oFCuaT4SNSQaeC1yPeWF/V86MkPsDXP1W
         JqkOiXKNCOyDl1vCuBA0iqwUo3JX+WrKIM9mcJQRPsRx1XbrlSyU+ABp0+hTQAjR47JY
         nYOnw9wLh9XJl8q5DDM6PpKlbFcwBNz9GNVARMfy78+kVMcy1wDo2RsXasPAMYpJzQFX
         ikyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bvdz6coe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v8-v6si2968122qvi.252.2018.06.26.21.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bvdz6coe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2SQ-0003Ly-3O
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:53:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29m-0004dU-S6
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29l-00010F-5l
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:14 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:35478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29k-0000zO-UE
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:13 -0400
Received: by mail-pl0-x243.google.com with SMTP id k1-v6so419164plt.2
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jAT3MbivOAuh2cXOphZuTzwQ/j70NHuupQD49/hoOCQ=;
	b=Bvdz6coePgMV9aY0yCHnfbjN+wjvXlOGI3HX+feoE4GZPLoGgdCgmDHC2S5bVlZmJN
	e/f65YmpnBwtuAhIH0iNM3N5FCAFNjup4Aol4lDKdADuJyXCAvS1ZlGo8LrJwC1UZ4Al
	mYNPkwsBgMKoZbB439NY62H2T9EIKKt9Ibg4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jAT3MbivOAuh2cXOphZuTzwQ/j70NHuupQD49/hoOCQ=;
	b=jNRvjDr1nOzSvJGzAF/DP/qKl6v0vucTEkM9pYod5GzVjksvQQnUAZMmDil71xTZ62
	t0Hd9EI166E73KQrXceNDHLzZfN+H63k4izvmuFr8LFNQ+ZAj71qQ06kxgcmn7mx7lw4
	KqJ1O8T8050sXgHYkP7ExnMBUQFqEfwEgwLu58rjGO76ku+2yA6PXkV5PsDl8QcRB+RW
	muVvDwGTOh44+ybDNGhSsSTq+y5SgnTugfF4D98QHnCSvoVWUIr7LV5icuj7JMH4Huth
	150+HMVtDyYTIh7/RTZvhOY6rERY51Ma35ImzyS3WAc9outQ44ftF+CusxSlxIEoZ8wG
	eLdw==
X-Gm-Message-State: APt69E1ooPp4elAWREuxnnu9nEvFX4g6zr8rXw2BR2XRxrYTl7xq+puM
	64d5dXSbk4ibBpJEb0miYYxvyg==
X-Received: by 2002:a17:902:3c5:: with SMTP id
	d63-v6mr4518297pld.163.1530074051944; 
	Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:22 -0700
Message-Id: <20180627043328.11531-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v6 29/35] target/arm: Implement SVE fp complex
 multiply add
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
X-TUID: dbkbApxJe8Hz

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   4 +
 target/arm/sve_helper.c    | 162 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  37 +++++++++
 target/arm/sve.decode      |   4 +
 4 files changed, 207 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0bd9fe2f28..023952a9a4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1115,6 +1115,10 @@ DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index bdb7565779..790cbacd14 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3757,6 +3757,168 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
     } while (i != 0);
 }
 
+/*
+ * FP Complex Multiply
+ */
+
+QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 22 > 32);
+
+void HELPER(sve_fcmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    bool flip = rot & 1;
+    float16 neg_imag, neg_real;
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    neg_imag = float16_set_sign(0, (rot & 2) != 0);
+    neg_real = float16_set_sign(0, rot == 1 || rot == 2);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float16 e1, e2, e3, e4, nr, ni, mr, mi, d;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float16);
+            i -= 2 * sizeof(float16);
+
+            nr = *(float16 *)(vn + H1_2(i));
+            ni = *(float16 *)(vn + H1_2(j));
+            mr = *(float16 *)(vm + H1_2(i));
+            mi = *(float16 *)(vm + H1_2(j));
+
+            e2 = (flip ? ni : nr);
+            e1 = (flip ? mi : mr) ^ neg_real;
+            e4 = e2;
+            e3 = (flip ? mr : mi) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                d = *(float16 *)(va + H1_2(i));
+                d = float16_muladd(e2, e1, d, 0, &env->vfp.fp_status_f16);
+                *(float16 *)(vd + H1_2(i)) = d;
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                d = *(float16 *)(va + H1_2(j));
+                d = float16_muladd(e4, e3, d, 0, &env->vfp.fp_status_f16);
+                *(float16 *)(vd + H1_2(j)) = d;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fcmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    bool flip = rot & 1;
+    float32 neg_imag, neg_real;
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    neg_imag = float32_set_sign(0, (rot & 2) != 0);
+    neg_real = float32_set_sign(0, rot == 1 || rot == 2);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float32 e1, e2, e3, e4, nr, ni, mr, mi, d;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float32);
+            i -= 2 * sizeof(float32);
+
+            nr = *(float32 *)(vn + H1_2(i));
+            ni = *(float32 *)(vn + H1_2(j));
+            mr = *(float32 *)(vm + H1_2(i));
+            mi = *(float32 *)(vm + H1_2(j));
+
+            e2 = (flip ? ni : nr);
+            e1 = (flip ? mi : mr) ^ neg_real;
+            e4 = e2;
+            e3 = (flip ? mr : mi) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                d = *(float32 *)(va + H1_2(i));
+                d = float32_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                *(float32 *)(vd + H1_2(i)) = d;
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                d = *(float32 *)(va + H1_2(j));
+                d = float32_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                *(float32 *)(vd + H1_2(j)) = d;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
+    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    bool flip = rot & 1;
+    float64 neg_imag, neg_real;
+    void *vd = &env->vfp.zregs[rd];
+    void *vn = &env->vfp.zregs[rn];
+    void *vm = &env->vfp.zregs[rm];
+    void *va = &env->vfp.zregs[ra];
+    uint64_t *g = vg;
+
+    neg_imag = float64_set_sign(0, (rot & 2) != 0);
+    neg_real = float64_set_sign(0, rot == 1 || rot == 2);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float64 e1, e2, e3, e4, nr, ni, mr, mi, d;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float64);
+            i -= 2 * sizeof(float64);
+
+            nr = *(float64 *)(vn + H1_2(i));
+            ni = *(float64 *)(vn + H1_2(j));
+            mr = *(float64 *)(vm + H1_2(i));
+            mi = *(float64 *)(vm + H1_2(j));
+
+            e2 = (flip ? ni : nr);
+            e1 = (flip ? mi : mr) ^ neg_real;
+            e4 = e2;
+            e3 = (flip ? mr : mi) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                d = *(float64 *)(va + H1_2(i));
+                d = float64_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                *(float64 *)(vd + H1_2(i)) = d;
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                d = *(float64 *)(va + H1_2(j));
+                d = float64_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                *(float64 *)(vd + H1_2(j)) = d;
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b1764f099b..7ce3222158 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3968,6 +3968,43 @@ DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
 
 #undef DO_FMLA
 
+static bool trans_FCMLA_zpzzz(DisasContext *s,
+                              arg_FCMLA_zpzzz *a, uint32_t insn)
+{
+    static gen_helper_sve_fmla * const fns[3] = {
+        gen_helper_sve_fcmla_zpzzz_h,
+        gen_helper_sve_fcmla_zpzzz_s,
+        gen_helper_sve_fcmla_zpzzz_d,
+    };
+
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned desc;
+        TCGv_i32 t_desc;
+        TCGv_ptr pg = tcg_temp_new_ptr();
+
+        /* We would need 7 operands to pass these arguments "properly".
+         * So we encode all the register numbers into the descriptor.
+         */
+        desc = deposit32(a->rd, 5, 5, a->rn);
+        desc = deposit32(desc, 10, 5, a->rm);
+        desc = deposit32(desc, 15, 5, a->ra);
+        desc = deposit32(desc, 20, 2, a->rot);
+        desc = sextract32(desc, 0, 22);
+        desc = simd_desc(vsz, vsz, desc);
+
+        t_desc = tcg_const_i32(desc);
+        tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+        fns[a->esz - 1](cpu_env, pg, t_desc);
+        tcg_temp_free_i32(t_desc);
+        tcg_temp_free_ptr(pg);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Unary Operations Prediated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e5f8f43254..e342cfdf14 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -729,6 +729,10 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
 
+# SVE floating-point complex multiply-add (predicated)
+FCMLA_zpzzz     01100100 esz:2 0 rm:5 0 rot:2 pg:3 rn:5 rd:5 \
+                ra=%reg_movprfx
+
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-- 
2.17.1

