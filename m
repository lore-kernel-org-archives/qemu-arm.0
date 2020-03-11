Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp392526lfc;
        Tue, 10 Mar 2020 23:51:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vujXQt3Qltdjxy2Q1URdHBzDNcCYhWoDPM9TRyrX6aHEipNMu4AiXNLk/RRd4/UG6cOkJ7N
X-Received: by 2002:ae9:f707:: with SMTP id s7mr1480956qkg.5.1583909497351;
        Tue, 10 Mar 2020 23:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909497; cv=none;
        d=google.com; s=arc-20160816;
        b=iEcqMz4VrDTD/12PekTlZ0Ku2A5MCXmo3LMqMQjEci29jms1aeC8kqrQCPQ2fNYfMc
         gepyYZ25yURXLp6NwZyXd4vUfuNe7ojTwYnKgvxe+AOB9crL1+CaPbD8puvBkBKe3eLw
         wYKTAPbXaI47/7r59EZZuOnKzddr6qJ/Cjm2YykDtSmkYcTE89wMVwc1y/I0KQfnT7oO
         m0LFOIad8/w+5X1047IU7vrCnJ9fXbc5Csm2HQ5r35HPD8Is3kpS6tvINxtuKFiS5g9W
         3hL9E7Ce4aZhSWWfTr1RxN1XU1GdSN8FObc2E6JiL2u8P7to0ECb9wge2ZoDXkx/CwMj
         H2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JO9UDGNI/3FywIxMw2Y2YRQLM5xOitYFKQKOyJDpZrk=;
        b=UYU+db6XBAaSCilAnJhG6YIgwpnb76zF/71rNv0qfDPoNHLY1T7aS0RX3C+yqPFyTx
         1iuWFIr2yW84U/qhQ6b+EnzU4jRLGrcyV8I/HRqQCIo66ji6nq31l5kb3Xh+XrDtDd03
         5WqxbYZ95b8qZN7FgfAGzEUMPl4zfEXSeQPCTr3LcHy4736X33LfNSp/R3wxGHr8JIml
         diYJn66aTdDOH5Wwhnk8KdRiq5/cOzRCGWwXp3f0pN9LKy+jY4mt/zsz87uQqo2tudG3
         QSOrr/BbDJ/zebjhfHEUPwSLfYokP/DwfdAd43YEIBMtka79FyPHeQyVvqgkdzbunbAz
         CMpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+Sfwx6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si519199qtn.381.2020.03.10.23.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+Sfwx6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBvDM-0007yg-O5
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6j-0006Ud-Kv
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6h-00025F-Ro
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:44:45 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36836)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6h-00024P-KX
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 02:44:43 -0400
Received: by mail-pf1-x441.google.com with SMTP id i13so751166pfe.3
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JO9UDGNI/3FywIxMw2Y2YRQLM5xOitYFKQKOyJDpZrk=;
 b=M+Sfwx6b6MM1KXMzEOpPGdsCRxA/iZj8DUjKXgTHEyzUTW3VwXzdgwViEcdW+c6zyP
 zn0xpW2rrCXV5gpIgQKUgWqybgDX3mbePqLm8GRCXbodPhO/U5A36zi0/QUcuubZQUXG
 c9FC/7vf1XdSoc4FN2H48kQ2EUJFPgCp7rd8gxBfrBAU+vRvQf3HBbJgEjSaJ/tej7JI
 acnQh5NNkh+cgiISJJssHOuypnUD6LdEgcQuG77TdILlFQIngnQBprYjkmGzZIcibTim
 q+vN04OuozaQLky0O3veMW2r4nY3cF75y66qgqS7wo6WiDX8Y4VA5N6GG9cdkXWJIFLx
 JCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JO9UDGNI/3FywIxMw2Y2YRQLM5xOitYFKQKOyJDpZrk=;
 b=O6uyd2YdwONtorl8F8TWf9aHWT9dqH5ox1xTevtWgVk2R1gWcEFjBgqG2+3wAUnikq
 KQHstb27UOtdjpuwDnmxVgrphTZbJG3JBlSeI8+EbRxhVOfwSoFikPFRgVB8AQG/u63/
 MDP6FHbwk3lD/995ZRSkHa5lprHq2+jL5ngvtl5icaDnCl/ZxRMyo8SaITJzUbutHRfG
 ECG7r+9dy+PzwZdrsEW2lHKfK3QzXvvyhgWcfd1QUPWcF0kvGDBjQ9Ihl7WzBYNLAIOe
 M8dG8PlAYXfjNYxatH/wF7qvER/UTSYu/NzZdxNevSEJFIditEwWWZVdA4a3iZxlEXVb
 Tn3Q==
X-Gm-Message-State: ANhLgQ3paJZVsFxZeOtN5OOwn0bjoUty0qJJa8i00OxztbbNxnPLEt8D
 aukkVkQ+7NZOgZzok8YXvID3ryWyv+o=
X-Received: by 2002:a62:be04:: with SMTP id l4mr1473040pff.234.1583909082120; 
 Tue, 10 Mar 2020 23:44:42 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/16] target/arm: Reuse sve_probe_page for gather loads
Date: Tue, 10 Mar 2020 23:44:19 -0700
Message-Id: <20200311064420.30606-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: yVV9LVV1l8pq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 208 +++++++++++++++++++++-------------------
 1 file changed, 109 insertions(+), 99 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e8b8f2560d..4ad870f1ee 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5125,130 +5125,140 @@ static target_ulong off_zd_d(void *reg, intptr_t reg_ofs)
     return *(uint64_t *)(reg + reg_ofs);
 }
 
-static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
-                       target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
+static inline QEMU_ALWAYS_INLINE
+void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+               target_ulong base, uint32_t desc, uintptr_t retaddr,
+               int esize, int msize, zreg_off_fn *off_fn,
+               sve_ldst1_host_fn *host_fn,
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch = { };
+    const int mmu_idx = cpu_mmu_index(env, false);
+    const intptr_t reg_max = simd_oprsz(desc);
+    ARMVectorReg scratch;
+    intptr_t reg_off;
+    SVEHostPage info, info2;
 
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+    memset(&scratch, 0, reg_max);
+    reg_off = 0;
+    do {
+        uint64_t pg = vg[reg_off >> 6];
         do {
             if (likely(pg & 1)) {
-                target_ulong off = off_fn(vm, i);
-                tlb_fn(env, &scratch, i, base + (off << scale), ra);
+                target_ulong addr = base + (off_fn(vm, reg_off) << scale);
+                target_ulong in_page = -(addr | TARGET_PAGE_MASK);
+
+                sve_probe_page(&info, false, env, addr, 0, MMU_DATA_LOAD,
+                               mmu_idx, retaddr);
+
+                if (likely(in_page >= msize)) {
+                    if (unlikely(info.flags & TLB_WATCHPOINT)) {
+                        cpu_check_watchpoint(env_cpu(env), addr, msize,
+                                             info.attrs, BP_MEM_READ, retaddr);
+                    }
+                    /* TODO: MTE check */
+                    host_fn(&scratch, reg_off, info.host);
+                } else {
+                    /* Element crosses the page boundary. */
+                    sve_probe_page(&info2, false, env, addr + in_page, 0,
+                                   MMU_DATA_LOAD, mmu_idx, retaddr);
+                    if (unlikely((info.flags | info2.flags) & TLB_WATCHPOINT)) {
+                        cpu_check_watchpoint(env_cpu(env), addr,
+                                             msize, info.attrs,
+                                             BP_MEM_READ, retaddr);
+                    }
+                    /* TODO: MTE check */
+                    tlb_fn(env, &scratch, reg_off, addr, retaddr);
+                }
             }
-            i += 4, pg >>= 4;
-        } while (i & 15);
-    }
+            reg_off += esize;
+            pg >>= esize;
+        } while (reg_off & 63);
+    } while (reg_off < reg_max);
 
     /* Wait until all exceptions have been raised to write back.  */
-    memcpy(vd, &scratch, oprsz);
+    memcpy(vd, &scratch, reg_max);
 }
 
-static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
-                       target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
-{
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t i, oprsz = simd_oprsz(desc) / 8;
-    ARMVectorReg scratch = { };
-
-    for (i = 0; i < oprsz; i++) {
-        uint8_t pg = *(uint8_t *)(vg + H1(i));
-        if (likely(pg & 1)) {
-            target_ulong off = off_fn(vm, i * 8);
-            tlb_fn(env, &scratch, i * 8, base + (off << scale), ra);
-        }
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(vd, &scratch, oprsz * 8);
+#define DO_LD1_ZPZ_S(MEM, OFS, MSZ) \
+void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                            \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
+              off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
 }
 
-#define DO_LD1_ZPZ_S(MEM, OFS) \
-void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
-    (CPUARMState *env, void *vd, void *vg, void *vm,         \
-     target_ulong base, uint32_t desc)                       \
-{                                                            \
-    sve_ld1_zs(env, vd, vg, vm, base, desc, GETPC(),         \
-              off_##OFS##_s, sve_ld1##MEM##_tlb);            \
+#define DO_LD1_ZPZ_D(MEM, OFS, MSZ) \
+void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                            \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
+              off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
 }
 
-#define DO_LD1_ZPZ_D(MEM, OFS) \
-void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
-    (CPUARMState *env, void *vd, void *vg, void *vm,         \
-     target_ulong base, uint32_t desc)                       \
-{                                                            \
-    sve_ld1_zd(env, vd, vg, vm, base, desc, GETPC(),         \
-               off_##OFS##_d, sve_ld1##MEM##_tlb);           \
-}
+DO_LD1_ZPZ_S(bsu, zsu, MO_8)
+DO_LD1_ZPZ_S(bsu, zss, MO_8)
+DO_LD1_ZPZ_D(bdu, zsu, MO_8)
+DO_LD1_ZPZ_D(bdu, zss, MO_8)
+DO_LD1_ZPZ_D(bdu, zd, MO_8)
 
-DO_LD1_ZPZ_S(bsu, zsu)
-DO_LD1_ZPZ_S(bsu, zss)
-DO_LD1_ZPZ_D(bdu, zsu)
-DO_LD1_ZPZ_D(bdu, zss)
-DO_LD1_ZPZ_D(bdu, zd)
+DO_LD1_ZPZ_S(bss, zsu, MO_8)
+DO_LD1_ZPZ_S(bss, zss, MO_8)
+DO_LD1_ZPZ_D(bds, zsu, MO_8)
+DO_LD1_ZPZ_D(bds, zss, MO_8)
+DO_LD1_ZPZ_D(bds, zd, MO_8)
 
-DO_LD1_ZPZ_S(bss, zsu)
-DO_LD1_ZPZ_S(bss, zss)
-DO_LD1_ZPZ_D(bds, zsu)
-DO_LD1_ZPZ_D(bds, zss)
-DO_LD1_ZPZ_D(bds, zd)
+DO_LD1_ZPZ_S(hsu_le, zsu, MO_16)
+DO_LD1_ZPZ_S(hsu_le, zss, MO_16)
+DO_LD1_ZPZ_D(hdu_le, zsu, MO_16)
+DO_LD1_ZPZ_D(hdu_le, zss, MO_16)
+DO_LD1_ZPZ_D(hdu_le, zd, MO_16)
 
-DO_LD1_ZPZ_S(hsu_le, zsu)
-DO_LD1_ZPZ_S(hsu_le, zss)
-DO_LD1_ZPZ_D(hdu_le, zsu)
-DO_LD1_ZPZ_D(hdu_le, zss)
-DO_LD1_ZPZ_D(hdu_le, zd)
+DO_LD1_ZPZ_S(hsu_be, zsu, MO_16)
+DO_LD1_ZPZ_S(hsu_be, zss, MO_16)
+DO_LD1_ZPZ_D(hdu_be, zsu, MO_16)
+DO_LD1_ZPZ_D(hdu_be, zss, MO_16)
+DO_LD1_ZPZ_D(hdu_be, zd, MO_16)
 
-DO_LD1_ZPZ_S(hsu_be, zsu)
-DO_LD1_ZPZ_S(hsu_be, zss)
-DO_LD1_ZPZ_D(hdu_be, zsu)
-DO_LD1_ZPZ_D(hdu_be, zss)
-DO_LD1_ZPZ_D(hdu_be, zd)
+DO_LD1_ZPZ_S(hss_le, zsu, MO_16)
+DO_LD1_ZPZ_S(hss_le, zss, MO_16)
+DO_LD1_ZPZ_D(hds_le, zsu, MO_16)
+DO_LD1_ZPZ_D(hds_le, zss, MO_16)
+DO_LD1_ZPZ_D(hds_le, zd, MO_16)
 
-DO_LD1_ZPZ_S(hss_le, zsu)
-DO_LD1_ZPZ_S(hss_le, zss)
-DO_LD1_ZPZ_D(hds_le, zsu)
-DO_LD1_ZPZ_D(hds_le, zss)
-DO_LD1_ZPZ_D(hds_le, zd)
+DO_LD1_ZPZ_S(hss_be, zsu, MO_16)
+DO_LD1_ZPZ_S(hss_be, zss, MO_16)
+DO_LD1_ZPZ_D(hds_be, zsu, MO_16)
+DO_LD1_ZPZ_D(hds_be, zss, MO_16)
+DO_LD1_ZPZ_D(hds_be, zd, MO_16)
 
-DO_LD1_ZPZ_S(hss_be, zsu)
-DO_LD1_ZPZ_S(hss_be, zss)
-DO_LD1_ZPZ_D(hds_be, zsu)
-DO_LD1_ZPZ_D(hds_be, zss)
-DO_LD1_ZPZ_D(hds_be, zd)
+DO_LD1_ZPZ_S(ss_le, zsu, MO_32)
+DO_LD1_ZPZ_S(ss_le, zss, MO_32)
+DO_LD1_ZPZ_D(sdu_le, zsu, MO_32)
+DO_LD1_ZPZ_D(sdu_le, zss, MO_32)
+DO_LD1_ZPZ_D(sdu_le, zd, MO_32)
 
-DO_LD1_ZPZ_S(ss_le, zsu)
-DO_LD1_ZPZ_S(ss_le, zss)
-DO_LD1_ZPZ_D(sdu_le, zsu)
-DO_LD1_ZPZ_D(sdu_le, zss)
-DO_LD1_ZPZ_D(sdu_le, zd)
+DO_LD1_ZPZ_S(ss_be, zsu, MO_32)
+DO_LD1_ZPZ_S(ss_be, zss, MO_32)
+DO_LD1_ZPZ_D(sdu_be, zsu, MO_32)
+DO_LD1_ZPZ_D(sdu_be, zss, MO_32)
+DO_LD1_ZPZ_D(sdu_be, zd, MO_32)
 
-DO_LD1_ZPZ_S(ss_be, zsu)
-DO_LD1_ZPZ_S(ss_be, zss)
-DO_LD1_ZPZ_D(sdu_be, zsu)
-DO_LD1_ZPZ_D(sdu_be, zss)
-DO_LD1_ZPZ_D(sdu_be, zd)
+DO_LD1_ZPZ_D(sds_le, zsu, MO_32)
+DO_LD1_ZPZ_D(sds_le, zss, MO_32)
+DO_LD1_ZPZ_D(sds_le, zd, MO_32)
 
-DO_LD1_ZPZ_D(sds_le, zsu)
-DO_LD1_ZPZ_D(sds_le, zss)
-DO_LD1_ZPZ_D(sds_le, zd)
+DO_LD1_ZPZ_D(sds_be, zsu, MO_32)
+DO_LD1_ZPZ_D(sds_be, zss, MO_32)
+DO_LD1_ZPZ_D(sds_be, zd, MO_32)
 
-DO_LD1_ZPZ_D(sds_be, zsu)
-DO_LD1_ZPZ_D(sds_be, zss)
-DO_LD1_ZPZ_D(sds_be, zd)
+DO_LD1_ZPZ_D(dd_le, zsu, MO_64)
+DO_LD1_ZPZ_D(dd_le, zss, MO_64)
+DO_LD1_ZPZ_D(dd_le, zd, MO_64)
 
-DO_LD1_ZPZ_D(dd_le, zsu)
-DO_LD1_ZPZ_D(dd_le, zss)
-DO_LD1_ZPZ_D(dd_le, zd)
-
-DO_LD1_ZPZ_D(dd_be, zsu)
-DO_LD1_ZPZ_D(dd_be, zss)
-DO_LD1_ZPZ_D(dd_be, zd)
+DO_LD1_ZPZ_D(dd_be, zsu, MO_64)
+DO_LD1_ZPZ_D(dd_be, zss, MO_64)
+DO_LD1_ZPZ_D(dd_be, zd, MO_64)
 
 #undef DO_LD1_ZPZ_S
 #undef DO_LD1_ZPZ_D
-- 
2.20.1

