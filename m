Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp740929lfq;
        Thu, 1 Oct 2020 10:11:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAlQqFT1h+WXNpMF/gLmPeI3zTyBudk1uuc/RB+p9PM+lbnuXdNJtuh9bVfmAsyUwdLFOA
X-Received: by 2002:a25:3004:: with SMTP id w4mr9143946ybw.240.1601572274943;
        Thu, 01 Oct 2020 10:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601572274; cv=none;
        d=google.com; s=arc-20160816;
        b=MGlzD7zFXGfAmDsUXVFCFDB+K+R9d9PGg4BTWCcroeVeCsAUchy4xEwCHkWYOMTiI2
         xdXs9V/IJuj2r4gWS1kZ+LtqcA8ety8TxVsSFOQFP43yC5esFN5KkyNRABX1OBMqDTp0
         Irdp7cu7tabVNIhuMk5/7H4w/+elto0otE1sYW6XpOdYfv7GOJ5BOi/l+2/FcGTppXNi
         JBhuEA3mL18uhQ3SHwKjYNk6jBaqE6mH14DEMpjIpqWXAyT+PjyAmFnmKoNvFRh4ENO4
         DJ74kGUke2i5xMqTLb2bn371bPWCvEOCDXmuwhRt9x5sRmeXWcRnZFM8KGI+h31gfx6W
         8Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sfSYdBc6CheTHBO26lzGYA11Fg1DNWXy/CVy38CspZc=;
        b=NMdNy7eeiUIM8C0SJbjLJ2IGBZ7QhfJ98LLqY+iZT1mcwu8qb/855Hai1NAOgS53ix
         2bV9l0evkP/HvxmsMrBhE/Xo1y1+O9Ni0QZ28dK9tYG+8EuoQ64fnebfOt/0Q6Vc9ffQ
         +WGhTFr+uy7vEQmezfaN2UkIoiO+kd/TW4DiBBeH6cfqH9oKZwreZL6eRksbTqUV9uiL
         85vD5MGVJ1x2ofcFYB1AIBnmcEbeH+v7ORzNPir9NyEAtiJWEUp11EJ44E4TYQr139pl
         Q9IBJ0/O69lRltpH2l4VTSX0/lZxLdE3SpLyqditGsnmVlfCW5Oo491Zu+2/YBjt6Mzx
         eXOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iB0zz89T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o184si5229118yba.124.2020.10.01.10.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 10:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iB0zz89T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO26s-0005HW-AC
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 13:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23o-000269-CR
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:08:04 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23k-0001cg-TO
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:08:04 -0400
Received: by mail-oi1-x244.google.com with SMTP id m7so6379162oie.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sfSYdBc6CheTHBO26lzGYA11Fg1DNWXy/CVy38CspZc=;
 b=iB0zz89TQvzFwwarPlK9s1c4anjsoobqkmrHKdv+lBj4cRIR2niaAQoBrJiZzuHhNM
 lFP0Axrsms7txfthz+i9GbgnwU5KQ0KOSt+vbfI8PEtbwN1gg8zK24bkPMu3jNyjqVjQ
 kvMNBkFM81LDR6utPspvWkCWGSVWcGZuB9Fa4jRo8OqylnXtg8DCqUveERqAcRdlUd9I
 0OIR4zIFS/bAbSvHm8B2jA9oihhj/zZLPLVchOxgTqZZSNPiJxdxEnrA/4wS44IYm/hS
 xXZsslTiTbte3/f40ene87gWr48oIV28CgCD9C+zcOwHtxYN8/Y4zVMxxEF15EsTIMVG
 oNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfSYdBc6CheTHBO26lzGYA11Fg1DNWXy/CVy38CspZc=;
 b=YlLGVDMqskjZ7tv3vmBf2lZOZP6QUy0WlJpn1r8SjoNu2OCxfnqHZPnf8PAEnbQv4c
 coq1TduybqZhtYsBak8whmsslXY6T/cHdDsCM7vYY7HLa97x4k2MIVUAZpCM8otm9hoZ
 0a+yOyEYnQEs2NE2o8Ci3eccIq2FGkfoKh7SFXdU1uR0xTdlNrbKtN8T/N4JgP1KvzEw
 MnkZYfEGkt/3Mk8Y8cqBkL4H7eQHQdAg6G8bpc43aOO5KMvlU8f6RwKW98mPgFKVUSgQ
 +SsUmyJmzmtUoRNb8FWdG9aJsFDNUOk2aRrfL3A4uIG9Fl+035W+Je2KWnhtcWFsgM8J
 sp4Q==
X-Gm-Message-State: AOAM532yzxu1TavvDPnkU8ROwyF5Zq5MuL+wagHtldqsyjqTb1sj2dPG
 QGTCYDst4zRZgsyOFjy4jE6u/QXhakRqjkKK
X-Received: by 2002:aca:f54e:: with SMTP id t75mr550382oih.84.1601572079863;
 Thu, 01 Oct 2020 10:07:59 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w25sm1334350oth.22.2020.10.01.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:07:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] target/arm: Use tlb_flush_page_bits_by_mmuidx*
Date: Thu,  1 Oct 2020 12:07:52 -0500
Message-Id: <20201001170752.82063-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201001170752.82063-1-richard.henderson@linaro.org>
References: <20201001170752.82063-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Jordan Frank <jordanfrank@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1UWS0MBq1ts

When TBI is enabled in a given regime, 56 bits of the address
are significant and we need to clear out any other matching
virtual addresses with differing tags.

The other uses of tlb_flush_page (without mmuidx) in this file
are only used by aarch32 mode.

Fixes: 38d931687fa1
Reported-by: Jordan Frank <jordanfrank@fb.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 46 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88bd9dd35d..7e9095d687 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -49,6 +49,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 #endif
 
 static void switch_mode(CPUARMState *env, int mode);
+static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
@@ -4456,6 +4457,33 @@ static int vae1_tlbmask(CPUARMState *env)
     }
 }
 
+/* Return 56 if TBI is enabled, 64 otherwise. */
+static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint64_t addr)
+{
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+    int select = extract64(addr, 55, 1);
+
+    return (tbi >> select) & 1 ? 56 : 64;
+}
+
+static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
+{
+    ARMMMUIdx mmu_idx;
+
+    /* Only the regime of the mmu_idx below is significant. */
+    if (arm_is_secure_below_el3(env)) {
+        mmu_idx = ARMMMUIdx_SE10_0;
+    } else if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE))
+               == (HCR_E2H | HCR_TGE)) {
+        mmu_idx = ARMMMUIdx_E20_0;
+    } else {
+        mmu_idx = ARMMMUIdx_E10_0;
+    }
+    return tlbbits_for_regime(env, mmu_idx, addr);
+}
+
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
@@ -4592,8 +4620,9 @@ static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
     int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae1_tlbbits(env, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4607,11 +4636,12 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = env_cpu(env);
     int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae1_tlbbits(env, pageaddr);
 
     if (tlb_force_broadcast(env)) {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+        tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
     } else {
-        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
+        tlb_flush_page_bits_by_mmuidx(cs, pageaddr, mask, bits);
     }
 }
 
@@ -4620,9 +4650,10 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_E2);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_E2, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4630,9 +4661,10 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
 
-    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_SE3);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_SE3, bits);
 }
 
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1

