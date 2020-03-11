Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp388788lfc;
        Tue, 10 Mar 2020 23:46:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtJziByX3hhwXNsC4m1smaCa8ZgOJuNkLwY9z8r5VBrteqm4+gQIJv0MNhT256KzStoGPNr
X-Received: by 2002:ac8:6b8d:: with SMTP id z13mr1336679qts.290.1583909212031;
        Tue, 10 Mar 2020 23:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909212; cv=none;
        d=google.com; s=arc-20160816;
        b=H9GiR3yfV+oFfS8Nki9qXTTHWWDegtPSbwkt7jnEe0BoJIs3ZSDXB8wHy2vbOxgGp7
         mfF4xzMQjidUFIBUGFRdflWSEP1igVoi/sgN17iqfzIxgzBGs4OOD+oVeR3E5NlfsHUY
         FkFTnanspE1ZrbiBC+bC8HJuDY/VXBibHmaYE/kiBUUu4qmyUCg7rS6VKnzVumEQEBxB
         sFWs0JUuSnn2X1WyDlzrAdUttgbidj/YLQnXehbXxE/c2vRewoUf/HWjeHOve5GIE02N
         XYRJdvGqtZWvkW1sN1r1ozqhbkIyb7rDc+WNX1EnCwmuzTqrG/HFFu6oZbiPFAHA1s65
         Yxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x2sQUQOTqOZ29kmZWF8+Fedva6/mV+pCTu/MNQTzpjU=;
        b=NXfe80FK2RmvzEJu4thL0yFHRiIHOgdp2iweivhi7FUM57Zne1cI3WyRsk301fAH3d
         0js5oOkbtipBZsYNx77MVPk90ZY/UuILs05BRrSqQirdBjBuv3Cx/E/j4cfV57PywboE
         uZ9849TdcYBhuucXHsnKJKNrbFYCpZndEu0Q90nQWmmWQd1bxScJP4qJ3nEBibO94ceY
         W5cYZF5HRJSdXeeYj8D2EvKISUFqQ+FU4+dnp/JMrxDry5oKLrrDpxhIM7ee0bBIGsET
         fjcgnTyNuNbI15a1OKY+ZjulzalEL4shKvdxyhq9DvP4OhXucYH2ZfdrxwVdRz+rTV2d
         fshQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUs5ATgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si406756qvm.183.2020.03.10.23.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUs5ATgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBv8l-0001Ga-EM
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6W-00069S-06
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6T-0001r2-WF
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:31 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42305)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6T-0001nd-22
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:29 -0400
Received: by mail-pg1-x544.google.com with SMTP id h8so628690pgs.9
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2sQUQOTqOZ29kmZWF8+Fedva6/mV+pCTu/MNQTzpjU=;
 b=jUs5ATgiOY2goWQDP8wHHTO4JnkBdWW94XVQdx35YRib2w1wDldTvX3S19jJvkQm8M
 Mp6lGiODavUH6VzuzQ8Ceme2SSze9je3T9syMM6QDcYpUMiYnCkI6Xw/xAg608PXky7N
 /6maAxk4PCIsgC/PfiqPCSai43ih5aqKJjJNI6fyZjfHlub0Y0XwXDVhEUoiRVhWs4Oe
 JmIaJggZlD4ceq8Un7bWOMrI1yJGTWuSBaOTcD5DSqhuyqWdfaeaxchUsDP4kG2xn55f
 TD65DC4mdajR/VmPc+s3sxUeVL+CMCwxX+lM+q0k5A0rOI8OKwNjsHRCWdNG9iHciogm
 2beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x2sQUQOTqOZ29kmZWF8+Fedva6/mV+pCTu/MNQTzpjU=;
 b=NIIEezk4i9rrDMW/cNhreR5E6aaN9DuGazlVpa5M+NALtFZ22yK2hI8RaNLUJW54B+
 Ul1eaEf3nm4rH5Q1HfRHaz//c6gc0b7TrwGGH20/72j1Rc3fRf3BQdo7NciJp6gie1LN
 2oxjQ73jqyZe9IvekUVahGEYYbzdE+3ooKi7WTvJdbiWdUWZScaSuYoVs8GOl68ZC0Wg
 dN/7PMKa8Xv1QfgFVi0dnmDGoMEvJOTr0WYjVvgctTQ2TGQb7jbWG5RsrLT8EHs45is+
 WgNnMcfosIqtV+cuMQTiosaSFnnPpO3JPT1acR96WP25JFEkdvapXwKHN1w5h835quHb
 1Dug==
X-Gm-Message-State: ANhLgQ1tKtqREOGsrpgup0hgTXfzTOEHvyDzMruqspCWCW+hQyOSiVeP
 hC+HeC7xfBNQfo03+BSBBoJmYQ==
X-Received: by 2002:a63:257:: with SMTP id 84mr1436504pgc.304.1583909067912;
 Tue, 10 Mar 2020 23:44:27 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/16] target/arm: Drop manual handling of
 set/clear_helper_retaddr
Date: Tue, 10 Mar 2020 23:44:09 -0700
Message-Id: <20200311064420.30606-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 921fEJkPnYXK

Since we converted back to cpu_*_data_ra, we do not need to
do this ourselves.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f8b310a16b..8b470991db 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4155,12 +4155,6 @@ static intptr_t max_for_page(target_ulong base, intptr_t mem_off,
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
@@ -4202,7 +4196,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
         return;
     }
     mem_off = reg_off >> diffsz;
-    set_helper_retaddr(retaddr);
 
     /*
      * If the (remaining) load is entirely within a single page, then:
@@ -4217,7 +4210,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            clear_helper_retaddr();
             /* After having taken any fault, zero leading inactive elements. */
             swap_memzero(vd, reg_off);
             return;
@@ -4268,7 +4260,6 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    clear_helper_retaddr();
     memcpy(vd, &scratch, reg_max);
 }
 
@@ -4328,7 +4319,6 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[2] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4340,7 +4330,6 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4355,7 +4344,6 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[3] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4368,7 +4356,6 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4384,7 +4371,6 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[4] = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4398,7 +4384,6 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * size;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4505,7 +4490,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         return;
     }
     mem_off = reg_off >> diffsz;
-    set_helper_retaddr(retaddr);
 
     /*
      * If the (remaining) load is entirely within a single page, then:
@@ -4520,7 +4504,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            clear_helper_retaddr();
             /* After any fault, zero any leading inactive elements.  */
             swap_memzero(vd, reg_off);
             return;
@@ -4563,7 +4546,6 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    clear_helper_retaddr();
     record_fault(env, reg_off, reg_max);
 }
 
@@ -4709,7 +4691,6 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
     intptr_t i, oprsz = simd_oprsz(desc);
     void *vd = &env->vfp.zregs[rd];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4720,7 +4701,6 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4733,7 +4713,6 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d1 = &env->vfp.zregs[rd];
     void *d2 = &env->vfp.zregs[(rd + 1) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4745,7 +4724,6 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4759,7 +4737,6 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d2 = &env->vfp.zregs[(rd + 1) & 31];
     void *d3 = &env->vfp.zregs[(rd + 2) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4772,7 +4749,6 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4787,7 +4763,6 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
     void *d3 = &env->vfp.zregs[(rd + 2) & 31];
     void *d4 = &env->vfp.zregs[(rd + 3) & 31];
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4801,7 +4776,6 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * msize;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 #define DO_STN_1(N, NAME, ESIZE) \
@@ -4897,7 +4871,6 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -4908,7 +4881,6 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz);
@@ -4922,7 +4894,6 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
     ARMVectorReg scratch = { };
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; i++) {
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
@@ -4930,7 +4901,6 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, &scratch, i * 8, base + (off << scale), ra);
         }
     }
-    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz * 8);
@@ -5102,13 +5072,11 @@ static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
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
@@ -5144,13 +5112,11 @@ static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
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
@@ -5262,7 +5228,6 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc);
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; ) {
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
@@ -5273,7 +5238,6 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    clear_helper_retaddr();
 }
 
 static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
@@ -5283,7 +5247,6 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
 
-    set_helper_retaddr(ra);
     for (i = 0; i < oprsz; i++) {
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
@@ -5291,7 +5254,6 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, vd, i * 8, base + (off << scale), ra);
         }
     }
-    clear_helper_retaddr();
 }
 
 #define DO_ST1_ZPZ_S(MEM, OFS) \
-- 
2.20.1

