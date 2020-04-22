Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp193383lfm;
        Tue, 21 Apr 2020 21:34:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypJcUtfNqkQI19iyFWluC7Zl18bU/KAo4sMOR/YJiYR3SpuivTiQQvilOuvgV34CkuyZLxex
X-Received: by 2002:a05:6214:1402:: with SMTP id n2mr23518358qvx.104.1587530055541;
        Tue, 21 Apr 2020 21:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530055; cv=none;
        d=google.com; s=arc-20160816;
        b=gs/rN66/5JZTlnhj4j5ze4Qq5zwdoVaf1WyfNOjXlM8UR6rcVxn2Id23oO5TW7KOHR
         QzWFlIHyO/e/bFL4uzcn8Y0AIjkkCLjFkL85gp3fD0IyAAG6UBCW6psQ0I/JNVf6yb0J
         bolmhsZsF8BMI+vLqnB1/JgXVduJEaa6s3wydn1Ur7jWVdwoGgZt/+0I3hxWUHLRCaD9
         BhHSrPFrVPM5aIXBDDV1Qvp566Cqmchb/vPI12GjGD80ZntTU7EhjfPx0GB35SZCkWwm
         BfCKgqExDPs/f1al3cOoDUv0KhwX1GUpgcVHZBAVVS4UWj9XzciY1BGJ6eCuHCLHbXeS
         +GlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fF+5wwLOen+npTtt/gQ1qVYGPHz8onoyiX2hDw1RdH0=;
        b=ZuE9tGNkmMCTk5Fg+CX6D2zhgK+Pz0IC/S9yfahz70xiEY10pkeDyKHnN7/vHLw8D6
         TxROdq4yTVqek792FOPwUl13JL+/DjkzyvHeeatqmEC5YSdDja47+9bwzPLLKFUKVk7X
         tdqiuRaGIBIKbrWA7TEnZIgLtagYJGEQ4DRqc4QyVZkYEiVc1IgGUJsvH/HZ0s7hP6E0
         sExWNpmNPIC3AHDYgV6I7PQmxs9vfWITKLmWWaa4QqIx2v5l3gX4qWcZWBZkbRjgYrNK
         Hg8FBgpbFVw8oBWTOL6FyYQGjSj9Wf9nLBukf3whbqdObo1vrs0dEZxy3GTMTFprEIVV
         RHJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0gPa6Da;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si2647757qvh.44.2020.04.21.21.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0gPa6Da;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR75S-0000ms-Px
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74g-0000gG-Mh
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74e-0005Gf-3E
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74d-0005AK-Gf
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:23 -0400
Received: by mail-pl1-x643.google.com with SMTP id t4so423775plq.12
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 21:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fF+5wwLOen+npTtt/gQ1qVYGPHz8onoyiX2hDw1RdH0=;
 b=G0gPa6DatS4Qs7B0xQ6cnq+NzGzS0+WBV33MPPCI7JiY/q6XWwYjBSdPvtqayA1pyk
 52Ut1Ro4moyOICFIkKnM94O5oFpCxZq4iAB9jli/QZ0tPzx2Fq/oxJYxzhJ7cwmQBIzK
 RzZdLOIwpaeazlF0JcJL/GK5AsA+c4ZJj/5S/K3POHXh89M/RsXmUQWph4RFQ9gfoCsu
 4CBcPJgkstDyb/2IY1qm2pamLMoA/jkCXTJx3BwmX6dKlOCVBaVJUZhHrWb0j35K61+b
 ns8EXK3tHxTtQyz9eoA0f04QGfz+Ov5oVfjEtVThW8GR3B0gRAkD5eCsMW/Q7+6q+1GN
 5luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fF+5wwLOen+npTtt/gQ1qVYGPHz8onoyiX2hDw1RdH0=;
 b=AO6Rmi7Pd4SoP3yQLNeDZk8Durw9Fo+2M7CQI3R2bU6IKG3ZbQQhRPUVBcRLouGJEP
 KgsKjX6L8yexxXmvawDfksBI4djVHtiVN0xTDpYZm7WHnqYPQnNsgG7SlBnrsBMPGRwo
 OHkW9Jo5NnjcKtOXcVwD7vM4mZ5UDPOcYiIEN8u3yzEQ9Sj/03XxtncskKrUrue13NXG
 73jHJATJ52MUWqYlx7AO+sfzsf7wZ05JhjGZBiILAPp2En20pmCo9PFNG+n4RhFLP1Bq
 X5hmOvkv25HM0JWDpNk1X4BAL4FqjmWGKt1gOh1+gV7HqhfUNSfnSzJ1RJ3wH78uK/eZ
 QUiA==
X-Gm-Message-State: AGi0PubMmeGsnQcDIwBktsA7N/eSUEv9CQ298xaDP7WMt1ipW1+OM8ib
 wPjz9ze3HpDjvlbLqMOls0smCzhyl8Q=
X-Received: by 2002:a17:90a:6581:: with SMTP id
 k1mr9513665pjj.50.1587530001301; 
 Tue, 21 Apr 2020 21:33:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/18] target/arm: Drop manual handling of
 set/clear_helper_retaddr
Date: Tue, 21 Apr 2020 21:32:58 -0700
Message-Id: <20200422043309.18430-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B21SqAEkoPDF

Since we converted back to cpu_*_data_ra, we do not need to
do this ourselves.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 655bc9476f..aad2c8c237 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4133,12 +4133,6 @@ static intptr_t max_for_page(target_ulong base, intptr_t mem_off,
     return MIN(split, mem_max - mem_off) + mem_off;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* These are normally defined only for CONFIG_USER_ONLY in <exec/cpu_ldst.h> */
-static inline void set_helper_retaddr(uintptr_t ra) { }
-static inline void clear_helper_retaddr(void) { }
-#endif
-
 /*
  * The result of tlb_vaddr_to_host for user-only is just g2h(x),
  * which is always non-null.  Elide the useless test.
@@ -4180,7 +4174,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
         return;
     }
     mem_off = reg_off >> diffsz;
-    set_helper_retaddr(retaddr);
 
     /*
      * If the (remaining) load is entirely within a single page, then:
@@ -4195,7 +4188,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            clear_helper_retaddr();
             /* After having taken any fault, zero leading inactive elements. */
             swap_memzero(vd, reg_off);
             return;
@@ -4246,7 +4238,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    clear_helper_retaddr();
     memcpy(vd, &scratch, reg_max);
 }
 
@@ -4306,7 +4297,6 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[2] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4318,7 +4308,6 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4333,7 +4322,6 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[3] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4346,7 +4334,6 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4362,7 +4349,6 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[4] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4376,7 +4362,6 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4483,7 +4468,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         return;
     }
     mem_off = reg_off >> diffsz;
-    set_helper_retaddr(retaddr);
 
     /*
      * If the (remaining) load is entirely within a single page, then:
@@ -4498,7 +4482,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            clear_helper_retaddr();
             /* After any fault, zero any leading inactive elements.  */
             swap_memzero(vd, reg_off);
             return;
@@ -4541,7 +4524,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    clear_helper_retaddr();
     record_fault(env, reg_off, reg_max);
 }
 
@@ -4687,7 +4669,6 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     void *vd = &env->vfp.zregs[rd];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4698,7 +4679,6 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4711,7 +4691,6 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d1 = &env->vfp.zregs[rd];
     void *d2 = &env->vfp.zregs[(rd + 1) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4723,7 +4702,6 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4737,7 +4715,6 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d2 = &env->vfp.zregs[(rd + 1) & 31];
     void *d3 = &env->vfp.zregs[(rd + 2) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4750,7 +4727,6 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4765,7 +4741,6 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d3 = &env->vfp.zregs[(rd + 2) & 31];
     void *d4 = &env->vfp.zregs[(rd + 3) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4779,7 +4754,6 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 #define DO_STN_1(N, NAME, ESIZE) \
@@ -4875,7 +4849,6 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4886,7 +4859,6 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz);
@@ -4900,7 +4872,6 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
     ARMVectorReg scratch = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; i++) {
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
@@ -4908,7 +4879,6 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, &scratch, i * 8, base + (off << scale), ra);
         }
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz * 8);
@@ -5080,13 +5050,11 @@ static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
     reg_off = find_next_active(vg, 0, reg_max, MO_32);
     if (likely(reg_off < reg_max)) {
         /* Perform one normal read, which will fault or not.  */
-        set_helper_retaddr(ra);
         addr = off_fn(vm, reg_off);
         addr = base + (addr << scale);
         tlb_fn(env, vd, reg_off, addr, ra);
 
         /* The rest of the reads will be non-faulting.  */
-        clear_helper_retaddr();
     }
 
     /* After any fault, zero the leading predicated false elements.  */
@@ -5122,13 +5090,11 @@ static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
     reg_off = find_next_active(vg, 0, reg_max, MO_64);
     if (likely(reg_off < reg_max)) {
         /* Perform one normal read, which will fault or not.  */
-        set_helper_retaddr(ra);
         addr = off_fn(vm, reg_off);
         addr = base + (addr << scale);
         tlb_fn(env, vd, reg_off, addr, ra);
 
         /* The rest of the reads will be non-faulting.  */
-        clear_helper_retaddr();
     }
 
     /* After any fault, zero the leading predicated false elements.  */
@@ -5240,7 +5206,6 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc);
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -5251,7 +5216,6 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
@@ -5261,7 +5225,6 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; i++) {
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
@@ -5269,7 +5232,6 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, vd, i * 8, base + (off << scale), ra);
         }
     }
-    clear_helper_retaddr();
 }
 
 #define DO_ST1_ZPZ_S(MEM, OFS) \
-- 
2.20.1

