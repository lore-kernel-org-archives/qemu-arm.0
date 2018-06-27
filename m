Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5787613wrq;
        Tue, 26 Jun 2018 22:01:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcrYdlRI3lNUn9DbOJNWkOMy92SzhPFIXldmSCSFcMbWgoPrT7arGCFmukmQIwltH1fnTJ0
X-Received: by 2002:a37:cbd3:: with SMTP id u80-v6mr3846309qkl.290.1530075709971;
        Tue, 26 Jun 2018 22:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075709; cv=none;
        d=google.com; s=arc-20160816;
        b=zB0s6K7VpNX1blsw6b+ohmc6fdspRGvAKTWANLhsublKIIPA0fduv2WKpvhC6YAsYk
         SK/2TF6EUe3ghdVKFK4uoSMoLJ5EwqmNYgPeHZRw8OEdbeuEX+6cXHC459fZd11hxxHX
         +VyWhACLvWp48tUP2z8mUaOmUrorrixGpS+STePUc5WW3fOFvUq7hbd/sk6vsakcNQsz
         8fD3JZt05kq2kSAW31PEZk9PILjDEOnjHiGfwobO8akBKI45XySYgYLK+XAmj8WMCi6j
         UllPd9qOFq0cseGVwdHvC+h8kofs/NrL1Ku1E/XWsX4/7jgnuFsHExdufRgMZcjEBCto
         pXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=51qnQVLdHtI56j1vCLTEgJ6dbb/yME4EFqLsFYPoNTk=;
        b=ZT2xXwKm4QaXfjSe8+aEoERaDUjudCoanRlUOmuPyUH2zhdNcCKwpJNy6RWMrJ+Jos
         fl8R39W8Ll2brWDUZVcwOBg38lGXbSgL6S2A3jgnlef5w9qkUBdjVVp+yjBrEC4pWgHC
         qTU5Sh/wwsmMGjwvVM2u5j+dIgyKF60HocG7Kq4GS1TyKArS0jQY3So8vFJv17Zo8Bkv
         vSEg8eZ2d2XsJ7sdfGQOLFO54CwsKWg/okxsACTJXXfaFgh27ULcYAUIHnbh+95vx/xE
         VhLXN+ta/scgzOHSFWVVwfLBGgGkdPvYZC7x9L8CARZKynyF7LBLxZbTFqnXwpXDS0JC
         ouxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C03UqQks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l30-v6si3285175qtl.135.2018.06.26.22.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 22:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C03UqQks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2aT-0002HV-G9
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 01:01:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29m-0004dR-QA
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29j-0000yM-MY
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:14 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:46877)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29j-0000y4-EX
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:11 -0400
Received: by mail-pf0-x235.google.com with SMTP id q1-v6so379734pff.13
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=51qnQVLdHtI56j1vCLTEgJ6dbb/yME4EFqLsFYPoNTk=;
	b=C03UqQks117ENZNnF30MpCLAG87vlsifSRCsTZkn10WzIkxHXnLTjG369cYOG/WExa
	6KXRhdlA7UBzWbAOd/23yoNEFfE554mSJeU1MBD58lT5Snx3k7ECwO+lAmQ84TTTD3x6
	6pPvekeNFApjCU8rM6kWo/OZijP2ecSlYRduM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=51qnQVLdHtI56j1vCLTEgJ6dbb/yME4EFqLsFYPoNTk=;
	b=Eup0OFYgp+qiVTDKjhRMi/Qz3MeEAiv9b6qurSGzMRZLIfTVPCW2Gm322jL2UXx9nF
	XBygi+KeFKXRx5lbzLKtSr+VHMb73AhHKYXA/Rv1MeGxiMUWsMojrrAPaTRPogr1tam4
	SlJmKjocWsWJFpJFCeAjN9uWx0crWZnT9GJqZJQtxtyZ+g37RcYgF1BkEyRe+cpftZGG
	zLsvAIMs+oEaMUUpzcxvXv54SWkmu45hFC+ing/BN0ntKT88k9DNr1+JRvukNQNWhKLZ
	ZUelnGY39FYYS3ZcI3GDyizn/ckX58mfeZQwNKz6xn2+3FhoB7AyiGbVwMlZwYC1P6ua
	hmYg==
X-Gm-Message-State: APt69E3ZLLCtMWbyfrHjGHxKL+VQh7nyAl46q3jK8KYJLB3N6bM8e/R9
	dK+bPc436wcNRp+BF3L26utwDA==
X-Received: by 2002:a63:3190:: with SMTP id
	x138-v6mr3762791pgx.60.1530074050533; 
	Tue, 26 Jun 2018 21:34:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:21 -0700
Message-Id: <20180627043328.11531-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: [Qemu-arm] [PATCH v6 28/35] target/arm: Implement SVE
 floating-point complex add
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
X-TUID: 7898nab+BNkO

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   7 +++
 target/arm/sve_helper.c    | 100 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  24 +++++++++
 target/arm/sve.decode      |   4 ++
 4 files changed, 135 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 891346a5ac..0bd9fe2f28 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1092,6 +1092,13 @@ DEF_HELPER_FLAGS_6(sve_facgt_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_facgt_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve_fcadd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcadd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcadd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 83bd8c4269..bdb7565779 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3657,6 +3657,106 @@ void HELPER(sve_ftmad_d)(void *vd, void *vn, void *vm, void *vs, uint32_t desc)
     }
 }
 
+/*
+ * FP Complex Add
+ */
+
+void HELPER(sve_fcadd_h)(void *vd, void *vn, void *vm, void *vg,
+                         void *vs, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    uint64_t *g = vg;
+    float16 neg_imag = float16_set_sign(0, simd_data(desc));
+    float16 neg_real = float16_chs(neg_imag);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float16 e0, e1, e2, e3;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float16);
+            i -= 2 * sizeof(float16);
+
+            e0 = *(float16 *)(vn + H1_2(i));
+            e1 = *(float16 *)(vm + H1_2(j)) ^ neg_real;
+            e2 = *(float16 *)(vn + H1_2(j));
+            e3 = *(float16 *)(vm + H1_2(i)) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                *(float16 *)(vd + H1_2(i)) = float16_add(e0, e1, vs);
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                *(float16 *)(vd + H1_2(j)) = float16_add(e2, e3, vs);
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fcadd_s)(void *vd, void *vn, void *vm, void *vg,
+                         void *vs, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    uint64_t *g = vg;
+    float32 neg_imag = float32_set_sign(0, simd_data(desc));
+    float32 neg_real = float32_chs(neg_imag);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float32 e0, e1, e2, e3;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float32);
+            i -= 2 * sizeof(float32);
+
+            e0 = *(float32 *)(vn + H1_2(i));
+            e1 = *(float32 *)(vm + H1_2(j)) ^ neg_real;
+            e2 = *(float32 *)(vn + H1_2(j));
+            e3 = *(float32 *)(vm + H1_2(i)) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                *(float32 *)(vd + H1_2(i)) = float32_add(e0, e1, vs);
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                *(float32 *)(vd + H1_2(j)) = float32_add(e2, e3, vs);
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
+void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
+                         void *vs, uint32_t desc)
+{
+    intptr_t j, i = simd_oprsz(desc);
+    uint64_t *g = vg;
+    float64 neg_imag = float64_set_sign(0, simd_data(desc));
+    float64 neg_real = float64_chs(neg_imag);
+
+    do {
+        uint64_t pg = g[(i - 1) >> 6];
+        do {
+            float64 e0, e1, e2, e3;
+
+            /* I holds the real index; J holds the imag index.  */
+            j = i - sizeof(float64);
+            i -= 2 * sizeof(float64);
+
+            e0 = *(float64 *)(vn + H1_2(i));
+            e1 = *(float64 *)(vm + H1_2(j)) ^ neg_real;
+            e2 = *(float64 *)(vn + H1_2(j));
+            e3 = *(float64 *)(vm + H1_2(i)) ^ neg_imag;
+
+            if (likely((pg >> (i & 63)) & 1)) {
+                *(float64 *)(vd + H1_2(i)) = float64_add(e0, e1, vs);
+            }
+            if (likely((pg >> (j & 63)) & 1)) {
+                *(float64 *)(vd + H1_2(j)) = float64_add(e2, e3, vs);
+            }
+        } while (i & 63);
+    } while (i != 0);
+}
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4883de3fab..b1764f099b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3895,6 +3895,30 @@ DO_FPCMP(FACGT, facgt)
 
 #undef DO_FPCMP
 
+static bool trans_FCADD(DisasContext *s, arg_FCADD *a, uint32_t insn)
+{
+    static gen_helper_gvec_4_ptr * const fns[3] = {
+        gen_helper_sve_fcadd_h,
+        gen_helper_sve_fcadd_s,
+        gen_helper_sve_fcadd_d
+    };
+
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, a->rot, fns[a->esz - 1]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
 
 static bool do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c725ee2584..e5f8f43254 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -725,6 +725,10 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
+# SVE floating-point complex add (predicated)
+FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
+                rn=%reg_movprfx
+
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-- 
2.17.1

