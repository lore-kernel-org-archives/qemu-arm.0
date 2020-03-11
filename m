Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp387159lfc;
        Tue, 10 Mar 2020 23:44:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vup+VPHDFSn78+/eXWbXs1iZruJrm1x6WWP39t2Rhb4Cw6o89LoXAaF7O9OW2GE6b71VU2y
X-Received: by 2002:ac8:4084:: with SMTP id p4mr1342865qtl.30.1583909095364;
        Tue, 10 Mar 2020 23:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909095; cv=none;
        d=google.com; s=arc-20160816;
        b=CJdCxqS95I0kCxvw+3YCSaxfgfMe9Ed/VIwmoHFaF11QfMwSmwzKiYJYWSoT375Cti
         rZtKu7vsGuOIt74sFD3DO9Xkejy/h8bIOPImZh63R1mNBlzCwjhC2PP7NU3q8O5Jcfw5
         2s5maI8v3OcEwagy5Fym+Dq31vyFzcH75JDWYTHHjy1PaX3HukV8fqKhtG8ENosmfskG
         BT79iWhDTQMHGoVYR11JBMULtpy6CUZjAroMHbqHfa7Poa41oriyOt1Af2qb0Fmaf9yW
         CQTq+Dq8Z6q09Vn4n1niB+S361bFCVP2ClppxDCo2aVIy3y3EelsGG58qlY/hUqTvfNs
         YuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GCUC3ck5APqYH1cRrCKzJ3VHOu3Vf4yYuFQi3uqihJ0=;
        b=R+iVrKJ/YyXRzB+/2EBSAPsDYucmNAR8xzlFTwWhflB/taM9g1fijxIjj5n+rX80IW
         sBoRSPtAwv+WwvFy7FBHXlPmg5rtK0PmLUJoZ15kQ4hst8e+IMKy5jOUAG7yY5rXun8W
         +CbK8fI7O0Awkqsz2D1Bcuk/UqUCSI9CsXsjdayiMuoj6yvz5OUoC6Do1HTEqFzigaRC
         3g3BlKzGKAnrC0FhXdhxQeJE0nrfLlpe15ZJJ3FF4dCBeYzIaaMyLlQDcmmioo8pXhhE
         lZJhG/QZMiHCXHM99BU2ZOHLxNNgSAuYmfetdsH513Bg2WzigPX3camRrKQRtCIfpvHf
         YgTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/xn6S31";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si411191qvt.172.2020.03.10.23.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/xn6S31";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBv6s-0006LZ-Mq
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6V-00069Q-WF
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6S-0001nj-O3
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:31 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6S-0001l3-5T
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:28 -0400
Received: by mail-pf1-x442.google.com with SMTP id p14so747032pfn.4
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCUC3ck5APqYH1cRrCKzJ3VHOu3Vf4yYuFQi3uqihJ0=;
 b=p/xn6S31kRYlmK7AzUGp7ETctjPY7TgDPfSOK+iyfTxoaQBIUUimHloq9CJHNt7dWS
 ewo2luyE9ARy8RHIPLT1LUtaATfFnHpbvgwBC3fBpvzPAaOkFPIa90RPShzUPOyBwg0A
 9VS9e9M1ImaR74B670ygBT8O8o2IjoX0jtRwvkPzyE+NVSYno4/UnUJpV7mrDAzQh/fa
 C4tGxtbRraf3BBZ4mSzN69ENcjFxALq3YbKwtY6lU8kysJdtL8he/+lMa6NZtt4E7lBT
 YHxZsikiiaiTP5fMbHRePhvKt1ThHc5rRkgmBLME0kLrXMozYGv78XD38jI1kfEbUxle
 yHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCUC3ck5APqYH1cRrCKzJ3VHOu3Vf4yYuFQi3uqihJ0=;
 b=QiKFhLYzLqxKhhlMQSJJhfbE2vpF2y5ehPSzfVXCt5MWDBSvrNuUQKW45M8pyPCq9Q
 eGmsnag47bMiTcWcO8zR+lKnu8uLy/cq9WYC0uxs6LF5V1y764m+/IsMf5ktAgRToXGe
 u8nXnX8vZBTSCkjVKH3FcWFCidnDwYGn1WvOPx2BF6k0hMwoIvyjpsY5LEe8Byqc9zeO
 NAdpIbuzuu0BY6vx9ryfuQAkgincwZ9VbVzSEsW5hOlSWUIefwC8NujLupWNhsnZIBNO
 AQ2g1e+BIiud8NZ4vTf+zCIteY2wE6UpS/9/AWQxnGiYTHSs9LCS1v1a8dNJwdyB/JuX
 nKeQ==
X-Gm-Message-State: ANhLgQ1+xxxQd5YMEuMq0DkrODaP7twWCdKI8ruVYDrbAzPa0i+8wiCU
 Mf82evF9Kr9hFKLtCgFsGMB2qQ==
X-Received: by 2002:a62:2587:: with SMTP id l129mr474534pfl.180.1583909066713; 
 Tue, 10 Mar 2020 23:44:26 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
Date: Tue, 10 Mar 2020 23:44:08 -0700
Message-Id: <20200311064420.30606-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: f/bBa2iWTaif

Use the "normal" memory access functions, rather than the
softmmu internal helper functions directly.

Since fb901c905dc3, cpu_mem_index is now a simple extract
from env->hflags and not a large computation.  Which means
that it's now more work to pass around this value than it
is to recompute it.

This only adjusts the primitives, and does not clean up
all of the uses within sve_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 241 ++++++++++++++++++----------------------
 1 file changed, 107 insertions(+), 134 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fdfa652094..f8b310a16b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3991,12 +3991,15 @@ typedef intptr_t sve_ld1_host_fn(void *vd, void *vg, void *host,
  * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
  * The controlling predicate is known to be true.
  */
-typedef void sve_ld1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
-                            target_ulong vaddr, TCGMemOpIdx oi, uintptr_t ra);
-typedef sve_ld1_tlb_fn sve_st1_tlb_fn;
+typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
+                              target_ulong vaddr, uintptr_t retaddr);
 
 /*
  * Generate the above primitives.
+ *
+ * For *_tlb, this uses the cpu_*_data_ra helpers.  There are not
+ * endian-specific versions of these, so we must handle endianness
+ * locally.
  */
 
 #define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST) \
@@ -4016,27 +4019,25 @@ static intptr_t sve_##NAME##_host(void *vd, void *vg, void *host,           \
     return mem_off;                                                         \
 }
 
-#ifdef CONFIG_SOFTMMU
-#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, HOST, MOEND, TLB) \
+#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, BSWAP, TLB) \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, TCGMemOpIdx oi, uintptr_t ra)  \
+                             target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    TYPEM val = TLB(env, addr, oi, ra);                                     \
+    TYPEM val = BSWAP(TLB(env, addr, ra));                                  \
     *(TYPEE *)(vd + H(reg_off)) = val;                                      \
 }
-#else
-#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, HOST, MOEND, TLB)                  \
+
+#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, BSWAP, TLB) \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, TCGMemOpIdx oi, uintptr_t ra)  \
+                             target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    TYPEM val = HOST(g2h(addr));                                            \
-    *(TYPEE *)(vd + H(reg_off)) = val;                                      \
+    TYPEM val = *(TYPEE *)(vd + H(reg_off));                                \
+    TLB(env, addr, BSWAP(val), ra);                                         \
 }
-#endif
 
 #define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
     DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
-    DO_LD_TLB(NAME, H, TE, TM, ldub_p, 0, helper_ret_ldub_mmu)
+    DO_LD_TLB(NAME, H, TE, TM, , cpu_ldub_data_ra)
 
 DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
 DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
@@ -4046,39 +4047,67 @@ DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
 DO_LD_PRIM_1(ld1bdu,     , uint64_t, uint8_t)
 DO_LD_PRIM_1(ld1bds,     , uint64_t,  int8_t)
 
-#define DO_LD_PRIM_2(NAME, end, MOEND, H, TE, TM, PH, PT)  \
-    DO_LD_HOST(NAME##_##end, H, TE, TM, PH##_##end##_p)    \
-    DO_LD_TLB(NAME##_##end, H, TE, TM, PH##_##end##_p,     \
-              MOEND, helper_##end##_##PT##_mmu)
+#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
+    DO_ST_TLB(st1##NAME, H, TE, TM, , cpu_stb_data_ra)
 
-DO_LD_PRIM_2(ld1hh,  le, MO_LE, H1_2, uint16_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hsu, le, MO_LE, H1_4, uint32_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hss, le, MO_LE, H1_4, uint32_t,  int16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hdu, le, MO_LE,     , uint64_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hds, le, MO_LE,     , uint64_t,  int16_t, lduw, lduw)
+DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
+DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
+DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
+DO_ST_PRIM_1(bd,     , uint64_t, uint8_t)
 
-DO_LD_PRIM_2(ld1ss,  le, MO_LE, H1_4, uint32_t, uint32_t, ldl, ldul)
-DO_LD_PRIM_2(ld1sdu, le, MO_LE,     , uint64_t, uint32_t, ldl, ldul)
-DO_LD_PRIM_2(ld1sds, le, MO_LE,     , uint64_t,  int32_t, ldl, ldul)
+#define DO_LD_PRIM_2(NAME, H, TE, TM, BSWAP, LD)        \
+    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
+    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
+    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, be_##BSWAP, cpu_##LD##_data_ra) \
+    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, le_##BSWAP, cpu_##LD##_data_ra)
 
-DO_LD_PRIM_2(ld1dd,  le, MO_LE,     , uint64_t, uint64_t, ldq, ldq)
+#define DO_ST_PRIM_2(NAME, H, TE, TM, BSWAP, ST)        \
+    DO_ST_TLB(st1##NAME##_be, H, TE, TM, be_##BSWAP, cpu_##ST##_data_ra) \
+    DO_ST_TLB(st1##NAME##_le, H, TE, TM, le_##BSWAP, cpu_##ST##_data_ra)
 
-DO_LD_PRIM_2(ld1hh,  be, MO_BE, H1_2, uint16_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hsu, be, MO_BE, H1_4, uint32_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hss, be, MO_BE, H1_4, uint32_t,  int16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hdu, be, MO_BE,     , uint64_t, uint16_t, lduw, lduw)
-DO_LD_PRIM_2(ld1hds, be, MO_BE,     , uint64_t,  int16_t, lduw, lduw)
+#ifdef TARGET_WORDS_BIGENDIAN
+# define be_bswap16(x)  ((uint16_t)(x))
+# define be_bswap32(x)  ((uint32_t)(x))
+# define be_bswap64(x)  ((uint64_t)(x))
+# define le_bswap16(x)  bswap16(x)
+# define le_bswap32(x)  bswap32(x)
+# define le_bswap64(x)  bswap64(x)
+#else
+# define be_bswap16(x)  bswap16(x)
+# define be_bswap32(x)  bswap32(x)
+# define be_bswap64(x)  bswap64(x)
+# define le_bswap16(x)  ((uint16_t)(x))
+# define le_bswap32(x)  ((uint32_t)(x))
+# define le_bswap64(x)  ((uint64_t)(x))
+#endif
 
-DO_LD_PRIM_2(ld1ss,  be, MO_BE, H1_4, uint32_t, uint32_t, ldl, ldul)
-DO_LD_PRIM_2(ld1sdu, be, MO_BE,     , uint64_t, uint32_t, ldl, ldul)
-DO_LD_PRIM_2(ld1sds, be, MO_BE,     , uint64_t,  int32_t, ldl, ldul)
+DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, bswap16, lduw)
+DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, bswap16, lduw)
+DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, bswap16, lduw)
+DO_LD_PRIM_2(hdu,     , uint64_t, uint16_t, bswap16, lduw)
+DO_LD_PRIM_2(hds,     , uint64_t,  int16_t, bswap16, lduw)
 
-DO_LD_PRIM_2(ld1dd,  be, MO_BE,     , uint64_t, uint64_t, ldq, ldq)
+DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, bswap16, stw)
+DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, bswap16, stw)
+DO_ST_PRIM_2(hd,     , uint64_t, uint16_t, bswap16, stw)
+
+DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, bswap32, ldl)
+DO_LD_PRIM_2(sdu,     , uint64_t, uint32_t, bswap32, ldl)
+DO_LD_PRIM_2(sds,     , uint64_t,  int32_t, bswap32, ldl)
+
+DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, bswap32, stl)
+DO_ST_PRIM_2(sd,     , uint64_t, uint32_t, bswap32, stl)
+
+DO_LD_PRIM_2(dd,     , uint64_t, uint64_t, bswap64, ldq)
+DO_ST_PRIM_2(dd,     , uint64_t, uint64_t, bswap64, stq)
 
 #undef DO_LD_TLB
+#undef DO_ST_TLB
 #undef DO_LD_HOST
 #undef DO_LD_PRIM_1
+#undef DO_ST_PRIM_1
 #undef DO_LD_PRIM_2
+#undef DO_ST_PRIM_2
 
 /*
  * Skip through a sequence of inactive elements in the guarding predicate @vg,
@@ -4152,7 +4181,7 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
                       uint32_t desc, const uintptr_t retaddr,
                       const int esz, const int msz,
                       sve_ld1_host_fn *host_fn,
-                      sve_ld1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int mmu_idx = get_mmuidx(oi);
@@ -4234,7 +4263,7 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
          * on I/O memory, it may succeed but not bring in the TLB entry.
          * But even then we have still made forward progress.
          */
-        tlb_fn(env, &scratch, reg_off, addr + mem_off, oi, retaddr);
+        tlb_fn(env, &scratch, reg_off, addr + mem_off, retaddr);
         reg_off += 1 << esz;
     }
 #endif
@@ -4293,9 +4322,8 @@ DO_LD1_2(ld1dd,  3, 3)
  */
 static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, int size, uintptr_t ra,
-                      sve_ld1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[2] = { };
@@ -4305,8 +4333,8 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, oi, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, oi, ra);
+                tlb_fn(env, &scratch[0], i, addr, ra);
+                tlb_fn(env, &scratch[1], i, addr + size, ra);
             }
             i += size, pg >>= size;
             addr += 2 * size;
@@ -4321,9 +4349,8 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
 
 static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, int size, uintptr_t ra,
-                      sve_ld1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[3] = { };
@@ -4333,9 +4360,9 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, oi, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, oi, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, oi, ra);
+                tlb_fn(env, &scratch[0], i, addr, ra);
+                tlb_fn(env, &scratch[1], i, addr + size, ra);
+                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
             }
             i += size, pg >>= size;
             addr += 3 * size;
@@ -4351,9 +4378,8 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
 
 static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, int size, uintptr_t ra,
-                      sve_ld1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch[4] = { };
@@ -4363,10 +4389,10 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, oi, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, oi, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, oi, ra);
-                tlb_fn(env, &scratch[3], i, addr + 3 * size, oi, ra);
+                tlb_fn(env, &scratch[0], i, addr, ra);
+                tlb_fn(env, &scratch[1], i, addr + size, ra);
+                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
+                tlb_fn(env, &scratch[3], i, addr + 3 * size, ra);
             }
             i += size, pg >>= size;
             addr += 4 * size;
@@ -4459,7 +4485,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                         uint32_t desc, const uintptr_t retaddr,
                         const int esz, const int msz,
                         sve_ld1_host_fn *host_fn,
-                        sve_ld1_tlb_fn *tlb_fn)
+                        sve_ldst1_tlb_fn *tlb_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int mmu_idx = get_mmuidx(oi);
@@ -4519,7 +4545,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Perform one normal read, which will fault or not.
      * But it is likely to bring the page into the tlb.
      */
-    tlb_fn(env, vd, reg_off, addr + mem_off, oi, retaddr);
+    tlb_fn(env, vd, reg_off, addr + mem_off, retaddr);
 
     /* After any fault, zero any leading predicated false elts.  */
     swap_memzero(vd, reg_off);
@@ -4671,60 +4697,14 @@ DO_LDFF1_LDNF1_2(dd,  3, 3)
 #undef DO_LDFF1_LDNF1_1
 #undef DO_LDFF1_LDNF1_2
 
-/*
- * Store contiguous data, protected by a governing predicate.
- */
-
-#ifdef CONFIG_SOFTMMU
-#define DO_ST_TLB(NAME, H, TYPEM, HOST, MOEND, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, TCGMemOpIdx oi, uintptr_t ra) \
-{                                                                           \
-    TLB(env, addr, *(TYPEM *)(vd + H(reg_off)), oi, ra);                    \
-}
-#else
-#define DO_ST_TLB(NAME, H, TYPEM, HOST, MOEND, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, TCGMemOpIdx oi, uintptr_t ra) \
-{                                                                           \
-    HOST(g2h(addr), *(TYPEM *)(vd + H(reg_off)));                           \
-}
-#endif
-
-DO_ST_TLB(st1bb,   H1,  uint8_t, stb_p, 0, helper_ret_stb_mmu)
-DO_ST_TLB(st1bh, H1_2, uint16_t, stb_p, 0, helper_ret_stb_mmu)
-DO_ST_TLB(st1bs, H1_4, uint32_t, stb_p, 0, helper_ret_stb_mmu)
-DO_ST_TLB(st1bd,     , uint64_t, stb_p, 0, helper_ret_stb_mmu)
-
-DO_ST_TLB(st1hh_le, H1_2, uint16_t, stw_le_p, MO_LE, helper_le_stw_mmu)
-DO_ST_TLB(st1hs_le, H1_4, uint32_t, stw_le_p, MO_LE, helper_le_stw_mmu)
-DO_ST_TLB(st1hd_le,     , uint64_t, stw_le_p, MO_LE, helper_le_stw_mmu)
-
-DO_ST_TLB(st1ss_le, H1_4, uint32_t, stl_le_p, MO_LE, helper_le_stl_mmu)
-DO_ST_TLB(st1sd_le,     , uint64_t, stl_le_p, MO_LE, helper_le_stl_mmu)
-
-DO_ST_TLB(st1dd_le,     , uint64_t, stq_le_p, MO_LE, helper_le_stq_mmu)
-
-DO_ST_TLB(st1hh_be, H1_2, uint16_t, stw_be_p, MO_BE, helper_be_stw_mmu)
-DO_ST_TLB(st1hs_be, H1_4, uint32_t, stw_be_p, MO_BE, helper_be_stw_mmu)
-DO_ST_TLB(st1hd_be,     , uint64_t, stw_be_p, MO_BE, helper_be_stw_mmu)
-
-DO_ST_TLB(st1ss_be, H1_4, uint32_t, stl_be_p, MO_BE, helper_be_stl_mmu)
-DO_ST_TLB(st1sd_be,     , uint64_t, stl_be_p, MO_BE, helper_be_stl_mmu)
-
-DO_ST_TLB(st1dd_be,     , uint64_t, stq_be_p, MO_BE, helper_be_stq_mmu)
-
-#undef DO_ST_TLB
-
 /*
  * Common helpers for all contiguous 1,2,3,4-register predicated stores.
  */
 static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, const uintptr_t ra,
                       const int esize, const int msize,
-                      sve_st1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     void *vd = &env->vfp.zregs[rd];
@@ -4734,7 +4714,7 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, vd, i, addr, oi, ra);
+                tlb_fn(env, vd, i, addr, ra);
             }
             i += esize, pg >>= esize;
             addr += msize;
@@ -4746,9 +4726,8 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
 static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, const uintptr_t ra,
                       const int esize, const int msize,
-                      sve_st1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     void *d1 = &env->vfp.zregs[rd];
@@ -4759,8 +4738,8 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, d1, i, addr, oi, ra);
-                tlb_fn(env, d2, i, addr + msize, oi, ra);
+                tlb_fn(env, d1, i, addr, ra);
+                tlb_fn(env, d2, i, addr + msize, ra);
             }
             i += esize, pg >>= esize;
             addr += 2 * msize;
@@ -4772,9 +4751,8 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
 static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, const uintptr_t ra,
                       const int esize, const int msize,
-                      sve_st1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     void *d1 = &env->vfp.zregs[rd];
@@ -4786,9 +4764,9 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, d1, i, addr, oi, ra);
-                tlb_fn(env, d2, i, addr + msize, oi, ra);
-                tlb_fn(env, d3, i, addr + 2 * msize, oi, ra);
+                tlb_fn(env, d1, i, addr, ra);
+                tlb_fn(env, d2, i, addr + msize, ra);
+                tlb_fn(env, d3, i, addr + 2 * msize, ra);
             }
             i += esize, pg >>= esize;
             addr += 3 * msize;
@@ -4800,9 +4778,8 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
 static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
                       uint32_t desc, const uintptr_t ra,
                       const int esize, const int msize,
-                      sve_st1_tlb_fn *tlb_fn)
+                      sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     intptr_t i, oprsz = simd_oprsz(desc);
     void *d1 = &env->vfp.zregs[rd];
@@ -4815,10 +4792,10 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
         do {
             if (pg & 1) {
-                tlb_fn(env, d1, i, addr, oi, ra);
-                tlb_fn(env, d2, i, addr + msize, oi, ra);
-                tlb_fn(env, d3, i, addr + 2 * msize, oi, ra);
-                tlb_fn(env, d4, i, addr + 3 * msize, oi, ra);
+                tlb_fn(env, d1, i, addr, ra);
+                tlb_fn(env, d2, i, addr + msize, ra);
+                tlb_fn(env, d3, i, addr + 2 * msize, ra);
+                tlb_fn(env, d4, i, addr + 3 * msize, ra);
             }
             i += esize, pg >>= esize;
             addr += 4 * msize;
@@ -4914,9 +4891,8 @@ static target_ulong off_zd_d(void *reg, intptr_t reg_ofs)
 
 static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
                        target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn)
+                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc);
     ARMVectorReg scratch = { };
@@ -4927,7 +4903,7 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
         do {
             if (likely(pg & 1)) {
                 target_ulong off = off_fn(vm, i);
-                tlb_fn(env, &scratch, i, base + (off << scale), oi, ra);
+                tlb_fn(env, &scratch, i, base + (off << scale), ra);
             }
             i += 4, pg >>= 4;
         } while (i & 15);
@@ -4940,9 +4916,8 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
 
 static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
                        target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn)
+                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
     ARMVectorReg scratch = { };
@@ -4952,7 +4927,7 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
             target_ulong off = off_fn(vm, i * 8);
-            tlb_fn(env, &scratch, i * 8, base + (off << scale), oi, ra);
+            tlb_fn(env, &scratch, i * 8, base + (off << scale), ra);
         }
     }
     clear_helper_retaddr();
@@ -5114,7 +5089,7 @@ DO_LD_NF(dd_be,      , uint64_t, uint64_t, ldq_be_p)
  */
 static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
                                 target_ulong base, uint32_t desc, uintptr_t ra,
-                                zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn,
+                                zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn,
                                 sve_ld1_nf_fn *nonfault_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
@@ -5130,7 +5105,7 @@ static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
         set_helper_retaddr(ra);
         addr = off_fn(vm, reg_off);
         addr = base + (addr << scale);
-        tlb_fn(env, vd, reg_off, addr, oi, ra);
+        tlb_fn(env, vd, reg_off, addr, ra);
 
         /* The rest of the reads will be non-faulting.  */
         clear_helper_retaddr();
@@ -5156,7 +5131,7 @@ static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
 
 static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
                                 target_ulong base, uint32_t desc, uintptr_t ra,
-                                zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn,
+                                zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn,
                                 sve_ld1_nf_fn *nonfault_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
@@ -5172,7 +5147,7 @@ static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
         set_helper_retaddr(ra);
         addr = off_fn(vm, reg_off);
         addr = base + (addr << scale);
-        tlb_fn(env, vd, reg_off, addr, oi, ra);
+        tlb_fn(env, vd, reg_off, addr, ra);
 
         /* The rest of the reads will be non-faulting.  */
         clear_helper_retaddr();
@@ -5282,9 +5257,8 @@ DO_LDFF1_ZPZ_D(dd_be, zd)
 
 static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
                        target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn)
+                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc);
 
@@ -5294,7 +5268,7 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
         do {
             if (likely(pg & 1)) {
                 target_ulong off = off_fn(vm, i);
-                tlb_fn(env, vd, i, base + (off << scale), oi, ra);
+                tlb_fn(env, vd, i, base + (off << scale), ra);
             }
             i += 4, pg >>= 4;
         } while (i & 15);
@@ -5304,9 +5278,8 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
 
 static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
                        target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ld1_tlb_fn *tlb_fn)
+                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     intptr_t i, oprsz = simd_oprsz(desc) / 8;
 
@@ -5315,7 +5288,7 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
         uint8_t pg = *(uint8_t *)(vg + H1(i));
         if (likely(pg & 1)) {
             target_ulong off = off_fn(vm, i * 8);
-            tlb_fn(env, vd, i * 8, base + (off << scale), oi, ra);
+            tlb_fn(env, vd, i * 8, base + (off << scale), ra);
         }
     }
     clear_helper_retaddr();
-- 
2.20.1

