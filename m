Received: by 10.223.159.74 with SMTP id f10csp2945278wrg;
        Mon, 18 Dec 2017 09:57:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBouAJjSicsMIBWGZ5H/HC8KfDFvgTWgpoweJbHJqyojX83qwD5TqI/Xu71IXlddY4Q5/ZiWt
X-Received: by 10.129.79.132 with SMTP id d126mr441407ywb.399.1513619856792;
        Mon, 18 Dec 2017 09:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619856; cv=none;
        d=google.com; s=arc-20160816;
        b=F25J8YlNH1vF38P9QA04vceStxUedH1oyk+jx4q8VRDfdhdzIceu2zIcfOiH46GMQi
         WC1xlYfzehjxEfB3d+8QyNHSHEwudEkjJPPUom0DYB7mwbIZs3b2Xa2zIJWoPzCEgQyJ
         IO6JyHBFOMjwGQrLpZMG9AQzwwL2gxuANxh0V5pvIx3oMbNFD7KCw3gmdnlL9Iru/41A
         7X24L6PhXAQAHbdlm4L+VkxurZoXLYXMtwpCxJKLtds9Yn7jy1vUHtS/IDOOdGixGnnu
         D4iAVoNCP8vsPURgDKOJxHU/VBbFo7Zb28dwi/jplCgRdGVpM5ywKYzVD8fGKnhVYUH2
         Gy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=w97zHg5wUthGNuq+jeq9m01tyUZWy6RWue7I9jUXJeY=;
        b=EVNhsI6Jzk93imFgm4U9lQkm+qf3Ae3xvbj1SO2cGL1YEVUxTEMlIAD+nkHJH4faMb
         q5TPtKY/2hJppnds9JVo9IAUYSPmqJZx4tsgnzluiwxprHMHwyTyDwe3249Aldqkkdqg
         DkmydMgZkDJalC09dplQFOrWAVGOTZIi7RMZl/z83CYakRcFtQLDIsPdY/Guo+ZF7qZk
         3jnr2l8F3m+nFzxAJ/2YhCnwFKFz++WN/7LxR2R/Ixi0rzUlv/e7xpATIynZBV1syd/7
         BKTrqCT19zb2Kknv2k/rFpzmM++JfibMTcIB4Eic91p9jomJhzHvDg2qwuA3wzN04R/l
         sp+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=brS4wGpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si1432449ywx.1.2017.12.18.09.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=brS4wGpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzfU-0001xB-6I
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:57:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFJ-0002cD-Sd
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFI-0004ga-A6
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:33 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:39808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFI-0004fl-36
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:32 -0500
Received: by mail-pg0-x243.google.com with SMTP id w7so9417699pgv.6
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w97zHg5wUthGNuq+jeq9m01tyUZWy6RWue7I9jUXJeY=;
	b=brS4wGpInY67iIfHqFY4TgtdQY02Ugw6ZeQdRm8wRIl3Cxwf3SP5h7RuZvN38MJtEF
	DD47op3Sqyg07R7uN1ANE9ZJVYJgfI/YJsPw2E16VtzzMLuKmaPpK+r+ry5IqeGhxaDe
	jCpdq1M9SxeK6CiTFVOJbx6lUznJzPbQxTamg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w97zHg5wUthGNuq+jeq9m01tyUZWy6RWue7I9jUXJeY=;
	b=WSHmzPXTFoctatQ9Xy5pL1AEysj3kUzy+lzpO6wgv370mGRXTqEZhD531WQnJFPZYf
	8Ds0H5rNZjtwVekbvxJxwQZcYHJgsNTHTSlEY78U7irStD21jmBG7S8yLmRv2/lSbtJp
	uYRiuxHki/HgZgOZcs531u0YHxM44rWbc/QFEXjiGwtJo9gMhAvfZwtaCKehY2lsY0Bn
	8+O3RMbGokJX+2+ak1kSwcy30ciwHFRIUPZxtCMLoHOsi0pYc0BTb8rTIDLn/6Na6bM1
	uOCZTZ2PxAuKs0CMv5THgXdxNzpxcOJuUxkq71W43RuiMfk8jlrqmdFXV9r4GnvyaV7G
	1AUA==
X-Gm-Message-State: AKGB3mLl+xcyzicAerkFlHvFIbg5uM5PesBLlMTQga6Ba1mBtgTKDgJi
	NVBsOjo75H590lkZRw0osEwCTQ==
X-Received: by 10.101.85.3 with SMTP id f3mr384392pgr.45.1513618231159;
	Mon, 18 Dec 2017 09:30:31 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:17 -0800
Message-Id: <20171218173022.18418-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 4/9] target/arm: Use pointers in neon tbl helper
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
X-TUID: +iH0IjRXtG4/

Rather than passing a regno to the helper, pass pointers to the
vector register directly.  This eliminates the need to pass in
the environment pointer and reduces the number of places that
directly access env->vfp.regs[].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    |  2 +-
 target/arm/op_helper.c | 17 +++++++----------
 target/arm/translate.c |  8 ++++----
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index d39ca11cbd..206e39a207 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -201,7 +201,7 @@ DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_2(recpe_u32, i32, i32, ptr)
 DEF_HELPER_FLAGS_2(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32, ptr)
-DEF_HELPER_5(neon_tbl, i32, env, i32, i32, i32, i32)
+DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i32, i32, i32, ptr, i32)
 
 DEF_HELPER_3(shl_cc, i32, env, i32, i32)
 DEF_HELPER_3(shr_cc, i32, env, i32, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c2bb4f3a43..df3aab170b 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -54,20 +54,17 @@ static int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
-uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
-                          uint32_t rn, uint32_t maxindex)
+uint32_t HELPER(neon_tbl)(uint32_t ireg, uint32_t def, void *vn,
+                          uint32_t maxindex)
 {
-    uint32_t val;
-    uint32_t tmp;
-    int index;
-    int shift;
-    uint64_t *table;
-    table = (uint64_t *)&env->vfp.regs[rn];
+    uint32_t val, shift;
+    uint64_t *table = vn;
+
     val = 0;
     for (shift = 0; shift < 32; shift += 8) {
-        index = (ireg >> shift) & 0xff;
+        uint32_t index = (ireg >> shift) & 0xff;
         if (index < maxindex) {
-            tmp = (table[index >> 3] >> ((index & 7) << 3)) & 0xff;
+            uint32_t tmp = (table[index >> 3] >> ((index & 7) << 3)) & 0xff;
             val |= tmp << shift;
         } else {
             val |= def & (0xff << shift);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 68e928640f..55afd29b21 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7623,9 +7623,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     tcg_gen_movi_i32(tmp, 0);
                 }
                 tmp2 = neon_load_reg(rm, 0);
-                tmp4 = tcg_const_i32(rn);
+                ptr1 = vfp_reg_ptr(true, rn);
                 tmp5 = tcg_const_i32(n);
-                gen_helper_neon_tbl(tmp2, cpu_env, tmp2, tmp, tmp4, tmp5);
+                gen_helper_neon_tbl(tmp2, tmp2, tmp, ptr1, tmp5);
                 tcg_temp_free_i32(tmp);
                 if (insn & (1 << 6)) {
                     tmp = neon_load_reg(rd, 1);
@@ -7634,9 +7634,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     tcg_gen_movi_i32(tmp, 0);
                 }
                 tmp3 = neon_load_reg(rm, 1);
-                gen_helper_neon_tbl(tmp3, cpu_env, tmp3, tmp, tmp4, tmp5);
+                gen_helper_neon_tbl(tmp3, tmp3, tmp, ptr1, tmp5);
                 tcg_temp_free_i32(tmp5);
-                tcg_temp_free_i32(tmp4);
+                tcg_temp_free_ptr(ptr1);
                 neon_store_reg(rd, 0, tmp2);
                 neon_store_reg(rd, 1, tmp3);
                 tcg_temp_free_i32(tmp);
-- 
2.14.3

