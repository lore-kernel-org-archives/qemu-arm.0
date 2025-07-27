Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E27C87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:06:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMa-00010A-6p; Sun, 27 Jul 2025 04:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLx-0005fI-46
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:29 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLv-00048c-3e
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b31c84b8052so3966333a12.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603406; x=1754208206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlJ6FDp1q2NQgZlTviuGz87rhz20dNXg1agPJ/fUdpY=;
 b=lj/uK+J9yJUhcrvtcr46OcwAIm4K63erUNWGUN5FWl9Jtxi/AVp+JEik/OvuiAOBGC
 WURn2/EkVor6nS2xKUoccvYhwqse+JiaEifMyMQqgrCzbmKmN0dBNv9lJMDN0Gi2K95I
 RlINsOw9Otxh6DMNSBCi1BjUxDfcb0cIay+yu/PvS516OM1JWguRvLXOD2wa2OfYnqK7
 XJpiH0+fp16YQWXr1QYtgHeRYEtMpte7/RDtLX3U4F8/fr4YI7A7eOsa5mcFza0LBWii
 5bO4tuNAE4WfKigsd4pVFgrZP1MFqE7ZXV9vAxRtISykmtyla1Usk2d6czfhjsr+JI3e
 Zk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603406; x=1754208206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlJ6FDp1q2NQgZlTviuGz87rhz20dNXg1agPJ/fUdpY=;
 b=dXsSEoGwduH60640zRjOmhw/JX48zdLrIX5822HNir+tKODZcaWXsEvg3HTrLutEn2
 604V3sowfASsMcpU7ucC6sf/6Sy22pKFkSLDE3jDX8nTy89XLXEgOlIPbdMm7iHjQ+o0
 l/O1BX/OUvcLtt+RPxxslL05bwkNaZG1DgRR+t1ByWLNxiw9k4ekCE4VHsGg5UwFByPR
 0acMeNUqStOzVZ5/LdroVh9Qvs8fS3xhpUVle86xwULiAeTKbMjMqSJLMxBAiriTylYQ
 rm2ttXmn4Vl0lOwAGPB4Vf9x5PxlgdHMjFLAmylVed9bl/9Tpzh/BRm0xecu8EpA4Erk
 IYQA==
X-Gm-Message-State: AOJu0YwzoqQlGTiNVuH0zb6kMxFFp5UMipmHiG39G9Cih49X3qnkNOlU
 wX5tXEEzdto978IygkaYmqrzmF2p9VrJ6colkvXUpTO5qlLpCLPfD2bepQjm4IuwjCk=
X-Gm-Gg: ASbGncuj4wfjnb9XAfurYadEWrjZfvefT/vemH8RUMLQTw4F0Nk0H+OiOJ1y5shI3Ko
 7yBvZAcLqXlUuZPzJKkxBKDE5ewYNcGfvonjvzleLyIBk1AgueNrtbVw+yF3WqDLBX9qgPbh5h2
 x1p+F93P+PHdRnnYUKgUYZ/Wk+EYrNwNXY1EFE5D1L4t2YojqX/ijtIazVfOdtq/NYk36pU51PV
 TIcR+K6oLCRbownNBvqvnqCYShfqeVCuTAr7MQWMHuVsQWk+MtS/p8WwHUoeR6xjNb6FpAMeuGO
 5A4HHbri76XoNQNOGSNkErTABW49WIa9Q1csbYgFeN+UnNPsD/pgmkARVevsqBvqwLUu4khHqw8
 qLu26VGUVW1XGesnPpsRZN9gA0qYm8WUmJGrVw7BE2sktSQ0T7D6DyILVgP+VK0/WSRg4TUQ/RW
 1VYtEvpsnRAA==
X-Google-Smtp-Source: AGHT+IFwnlPl9ex85Y1qAQIlHahJ5Um2Cb1c1wxF89A5WEIwgxzqx4+rwrcpDIfiHpSVHCTt4AfPIg==
X-Received: by 2002:a17:903:3c26:b0:237:f76f:ce34 with SMTP id
 d9443c01a7336-23fb3082c1bmr120976475ad.15.1753603405649; 
 Sun, 27 Jul 2025 01:03:25 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/82] include/hw/core/cpu: Introduce cpu_tlb_fast
Date: Sat, 26 Jul 2025 22:01:56 -1000
Message-ID: <20250727080254.83840-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Encapsulate access to cpu->neg.tlb.f[] in a function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  7 +++++++
 accel/tcg/cputlb.c    | 16 ++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1153cadb70..bd835b07d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -593,6 +593,13 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
     return (CPUArchState *)(cpu + 1);
 }
 
+#ifdef CONFIG_TCG
+static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
+{
+    return &cpu->neg.tlb.f[mmu_idx];
+}
+#endif
+
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
 extern CPUTailQ cpus_queue;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d324f33339..2a6aa01c57 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -129,7 +129,7 @@ static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
 static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
                                   vaddr addr)
 {
-    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+    uintptr_t size_mask = cpu_tlb_fast(cpu, mmu_idx)->mask >> CPU_TLB_ENTRY_BITS;
 
     return (addr >> TARGET_PAGE_BITS) & size_mask;
 }
@@ -138,7 +138,7 @@ static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
 static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
                                      vaddr addr)
 {
-    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
+    return &cpu_tlb_fast(cpu, mmu_idx)->table[tlb_index(cpu, mmu_idx, addr)];
 }
 
 static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
@@ -292,7 +292,7 @@ static void tlb_flush_one_mmuidx_locked(CPUState *cpu, int mmu_idx,
                                         int64_t now)
 {
     CPUTLBDesc *desc = &cpu->neg.tlb.d[mmu_idx];
-    CPUTLBDescFast *fast = &cpu->neg.tlb.f[mmu_idx];
+    CPUTLBDescFast *fast = cpu_tlb_fast(cpu, mmu_idx);
 
     tlb_mmu_resize_locked(desc, fast, now);
     tlb_mmu_flush_locked(desc, fast);
@@ -331,7 +331,7 @@ void tlb_init(CPUState *cpu)
     cpu->neg.tlb.c.dirty = 0;
 
     for (i = 0; i < NB_MMU_MODES; i++) {
-        tlb_mmu_init(&cpu->neg.tlb.d[i], &cpu->neg.tlb.f[i], now);
+        tlb_mmu_init(&cpu->neg.tlb.d[i], cpu_tlb_fast(cpu, i), now);
     }
 }
 
@@ -342,7 +342,7 @@ void tlb_destroy(CPUState *cpu)
     qemu_spin_destroy(&cpu->neg.tlb.c.lock);
     for (i = 0; i < NB_MMU_MODES; i++) {
         CPUTLBDesc *desc = &cpu->neg.tlb.d[i];
-        CPUTLBDescFast *fast = &cpu->neg.tlb.f[i];
+        CPUTLBDescFast *fast = cpu_tlb_fast(cpu, i);
 
         g_free(fast->table);
         g_free(desc->fulltlb);
@@ -667,7 +667,7 @@ static void tlb_flush_range_locked(CPUState *cpu, int midx,
                                    unsigned bits)
 {
     CPUTLBDesc *d = &cpu->neg.tlb.d[midx];
-    CPUTLBDescFast *f = &cpu->neg.tlb.f[midx];
+    CPUTLBDescFast *f = cpu_tlb_fast(cpu, midx);
     vaddr mask = MAKE_64BIT_MASK(0, bits);
 
     /*
@@ -923,7 +923,7 @@ void tlb_reset_dirty(CPUState *cpu, uintptr_t start, uintptr_t length)
     qemu_spin_lock(&cpu->neg.tlb.c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
         CPUTLBDesc *desc = &cpu->neg.tlb.d[mmu_idx];
-        CPUTLBDescFast *fast = &cpu->neg.tlb.f[mmu_idx];
+        CPUTLBDescFast *fast = cpu_tlb_fast(cpu, mmu_idx);
         unsigned int n = tlb_n_entries(fast);
         unsigned int i;
 
@@ -1316,7 +1316,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t mmu_idx, size_t index,
 
         if (cmp == page) {
             /* Found entry in victim tlb, swap tlb and iotlb.  */
-            CPUTLBEntry tmptlb, *tlb = &cpu->neg.tlb.f[mmu_idx].table[index];
+            CPUTLBEntry tmptlb, *tlb = &cpu_tlb_fast(cpu, mmu_idx)->table[index];
 
             qemu_spin_lock(&cpu->neg.tlb.c.lock);
             copy_tlb_helper_locked(&tmptlb, tlb);
-- 
2.43.0


