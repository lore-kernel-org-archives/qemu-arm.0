Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5770194wrq;
        Tue, 26 Jun 2018 21:34:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd+pURr0C5s5kVh22bfJqXS6Le80htA8XJS04bIC6+Ec0Kdlbvm9ThYmvUepZuQSIafcYWx
X-Received: by 2002:a37:bf43:: with SMTP id p64-v6mr3765970qkf.46.1530074076098;
        Tue, 26 Jun 2018 21:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074076; cv=none;
        d=google.com; s=arc-20160816;
        b=rr+iBIUxDDPMOYstO1aS2/ZJZoFjYt8/D47S8XKfIBWGwE6Fm/Kt3aOL2UP/usWtIV
         rwboykH6ff0w0tq8ENHOdC7S24j8N24eARby8fPUb+FXEbXzTFEn1zyTS872uYY7xY8s
         tamU3dTbSCByauKszn51qPNEntMc657cBRhxiG7RNuRgbJV4l3mBdyYIijF6SGwZvEpm
         gQxkuQtS24ruDihlurysJ4APqw1zl3dnh21QQzDijki4hQhQhSJpMQ5CZsdXqdEeBg0C
         rMVzoJhS59arOfQdd6edcO/G0bAPDaU/KoKy2JEAkiV0uj4w4vYNGaymtcxL3h4qFmxJ
         c0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=iG8HT096URRb4CWAiRTwQ1cVUSLxVdPPA37onBhzXoI=;
        b=u1T84Ow9oqc4nsWH7LRDtjVWv5EUVOCQ+fD0Xbgmx3EViZjvUDMof2rDVt5gU6Ayvm
         x1VeC2JyVCAfidLFZBGL7SSyYRPKpwdJGnOO7pU3uvzlHCpho0l/ALp3gKhpmZTgpbU/
         8X/fFopdSBRWgiArwz9G64MR703g7TdsbznYfsbNr47DojnE1ldyd0dCvwCEbKqIHVO5
         HgsOzN8eg2LCmZcm9hlGvyrNZnfg5RYamHx1LNi/ZabHySLvLdsWC2zrOEMTQxdbgu7h
         fSY3uj7yZlu/nBG4j2SExI7sVdjcFTaa9I4onQN3d5pdiTwsFLjoX5SznOG1KFk7YBy1
         R0BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JIOKqtY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v44-v6si1507376qvc.183.2018.06.26.21.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JIOKqtY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2A7-0004jO-Go
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:34:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29L-00048z-97
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29H-0000GT-Vo
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:47 -0400
Received: from mail-pg0-x230.google.com ([2607:f8b0:400e:c05::230]:42178)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29H-0000EZ-J5
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:43 -0400
Received: by mail-pg0-x230.google.com with SMTP id c10-v6so361401pgu.9
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iG8HT096URRb4CWAiRTwQ1cVUSLxVdPPA37onBhzXoI=;
	b=JIOKqtY0fKjngKNtOnlNhv3HvytEvRnFMUiFqNTwwkTmTNbQjz6LQEopDhUjljOdqQ
	vTlJTwrQVwyFMNdyd0eRza2CYn2mi/5Aut8UMz/tkd4Wm0dAhiMxkr5CNeU0KUGDi7wR
	qw/bsn3EIjk7zCXyZuTO84Xj0VsrUIESOY1/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iG8HT096URRb4CWAiRTwQ1cVUSLxVdPPA37onBhzXoI=;
	b=oG6bhP8PCPxo8Daq8mHDg+IQCsbFQT9h0kwWd/BPHbP87zJ4JCJ8sFauIl4XZNFqLD
	CIj0SAzBLm6CQ39nsPlpBH8vScikxxukPEtGEjnqqhiVFEG3om/LeY2xGfZ4t87XDTWB
	vM91HaaG644a42+S6mOwGNdTfKYn9YFzp6f4yRUTFCKQfVbKaiZHx1+jNFaqjoHXVmnW
	LlKklFmjSmD81VSlS9bCb+1ie+pljwyQRBxcF5Miwjd88wCASUv4PqvbEbbHf3fnubYJ
	zme4Z85PjTiHwvwdRGUzvnZXgI9NN3lLGVzIykTca+cVlBmPGQoM4bjDM75vEO7vn048
	blwQ==
X-Gm-Message-State: APt69E1fFfVDURi6wy7d3o7dntrYkt8SgxMXgWqylSKU4cdnmUksuBp2
	wToj5EQw/dD3L7j404r66v+KFxWywS8=
X-Received: by 2002:a62:f705:: with SMTP id
	h5-v6mr4290259pfi.169.1530074022520; 
	Tue, 26 Jun 2018 21:33:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:01 -0700
Message-Id: <20180627043328.11531-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::230
Subject: [Qemu-arm] [PATCH v6 08/35] target/arm: Implement SVE Floating
 Point Accumulating Reduction Group
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
X-TUID: Ptmhteue/rVu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  7 +++++
 target/arm/sve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 45 ++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  5 ++++
 4 files changed, 113 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index eb0645dd43..68e55a8d03 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -720,6 +720,13 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fadda_h, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fadda_s, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fadda_d, TCG_CALL_NO_RWG,
+                   i64, i64, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve_fadd_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2f416e5e28..2d08b7dcd3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2811,6 +2811,62 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+uint64_t HELPER(sve_fadda_h)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);
+    float16 result = nn;
+
+    do {
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+        do {
+            if (pg & 1) {
+                float16 mm = *(float16 *)(vm + H1_2(i));
+                result = float16_add(result, mm, status);
+            }
+            i += sizeof(float16), pg >>= sizeof(float16);
+        } while (i & 15);
+    } while (i < opr_sz);
+
+    return result;
+}
+
+uint64_t HELPER(sve_fadda_s)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);
+    float32 result = nn;
+
+    do {
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+        do {
+            if (pg & 1) {
+                float32 mm = *(float32 *)(vm + H1_2(i));
+                result = float32_add(result, mm, status);
+            }
+            i += sizeof(float32), pg >>= sizeof(float32);
+        } while (i & 15);
+    } while (i < opr_sz);
+
+    return result;
+}
+
+uint64_t HELPER(sve_fadda_d)(uint64_t nn, void *vm, void *vg,
+                             void *status, uint32_t desc)
+{
+    intptr_t i = 0, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i++) {
+        if (pg[H1(i)] & 1) {
+            nn = float64_add(nn, m[i], status);
+        }
+    }
+
+    return nn;
+}
+
 /* Fully general three-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index acad6374ef..483ad33179 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3383,6 +3383,51 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+/*
+ *** SVE Floating Point Accumulating Reduction Group
+ */
+
+static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    typedef void fadda_fn(TCGv_i64, TCGv_i64, TCGv_ptr,
+                          TCGv_ptr, TCGv_ptr, TCGv_i32);
+    static fadda_fn * const fns[3] = {
+        gen_helper_sve_fadda_h,
+        gen_helper_sve_fadda_s,
+        gen_helper_sve_fadda_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr t_rm, t_pg, t_fpst;
+    TCGv_i64 t_val;
+    TCGv_i32 t_desc;
+
+    if (a->esz == 0) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    t_val = load_esz(cpu_env, vec_reg_offset(s, a->rn, 0, a->esz), a->esz);
+    t_rm = tcg_temp_new_ptr();
+    t_pg = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(t_rm, cpu_env, vec_full_reg_offset(s, a->rm));
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    t_fpst = get_fpstatus_ptr(a->esz == MO_16);
+    t_desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+
+    fns[a->esz - 1](t_val, t_val, t_rm, t_pg, t_fpst, t_desc);
+
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(t_fpst);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_ptr(t_rm);
+
+    write_fp_dreg(s, a->rd, t_val);
+    tcg_temp_free_i64(t_val);
+    return true;
+}
+
 /*
  *** SVE Floating Point Arithmetic - Unpredicated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index e8531e28cd..675b81aaa0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -676,6 +676,11 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
+### SVE FP Accumulating Reduction Group
+
+# SVE floating-point serial reduction (predicated)
+FADDA           01100101 .. 011 000 001 ... ..... .....         @rdn_pg_rm
+
 ### SVE Floating Point Arithmetic - Unpredicated Group
 
 # SVE floating-point arithmetic (unpredicated)
-- 
2.17.1

