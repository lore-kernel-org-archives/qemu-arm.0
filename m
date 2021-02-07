Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp704836lfc;
        Sun, 7 Feb 2021 14:58:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvMxsGkTZe9GQlDQT6orQfMWM4R+2N32nxDQn7K7pEy3tTUvbwCoMGmYKWkV+CkQrA2LMH
X-Received: by 2002:a25:6082:: with SMTP id u124mr2679092ybb.214.1612738737357;
        Sun, 07 Feb 2021 14:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612738737; cv=none;
        d=google.com; s=arc-20160816;
        b=W0TYIH/2ObCfjtkqoHMp+QQH9xxI7VxgMs9jbUCVwQ37HD4jH+Cy7S5VQtgSD7TZrV
         Ex3I7aLt+3uLkZOQxATlGq+DFfdj1ndkRuAtTC1Rd5yJ30dhjhc/06Q5lb4J+EDZWyXi
         oQVO8QahRei+j1wvRiUANYSbZVwdosvX7W+lTGggBzX75mY+xWEi7BOKTVXK2txXQx2N
         8u17mFxYYeaYpdbnT/AXXioxfdooygoeJNIo4vVFF3umnpj7IEnCMXamLet7LFTrU8eZ
         HoXXM2QN4HNkUd0Yn2HvKQsDf9LiJ2iPphDH0eNkGkTJX6J8J9yHOnupx8Jgg1Jh+bhI
         Q6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6n5uXZgPlc77dVVpesg0vBLpgeFYV6lVDwxVtKrTEDs=;
        b=PBbrF+/UFhRWQqRsYVaOsJ8RvxckW6wqrf8acPyRxMg1t310KUdFMkdh4PuaaQWvO/
         wV7EjJR3N+qJn9qhjQqIYKRcv3ySteqrIl7599Nz/R7lXDJHhCE1VQ/A1ULftm4mLdhL
         9Nl9hPQjv0IbQAAdb23FnrKzmxSZYkjpgsvspBcJ/UVp0efDK6Te5V08w/JN83qR+Toj
         m9JZy3VSqEwpP2aj+uxcvsGkJDbsGDPWWlPcYSDKIIS3pb3Er6cLXRDKOaLaLn2wFXQh
         e9iUfY068FU2QCnfyWjO9qSAF4rpTQTddbWIl0kQ1JVvNzKBnfDe+JNISHgyI77orrXf
         enYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YeIVFRo/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si15866302ybk.89.2021.02.07.14.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 14:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YeIVFRo/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8t16-0003C4-M2
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 17:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0T-0002ou-52; Sun, 07 Feb 2021 17:58:17 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0R-0001EE-Gz; Sun, 07 Feb 2021 17:58:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u14so15122530wri.3;
 Sun, 07 Feb 2021 14:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6n5uXZgPlc77dVVpesg0vBLpgeFYV6lVDwxVtKrTEDs=;
 b=YeIVFRo/yRcs5SJWzrCfTiCArWRYrocnMn4X6kziKbr6MhW++SX1PtCyEyGQZd+kGY
 tOlwZBr+7deQFsdQKadLsMBe4ASJUp+HSxxuDNVPaYBJueRZb/C/C7WxJG3D79ppRhCQ
 iUGrCEcXFdQ+iWmNmK92/f4EmX4IbTeA5ugKv/A9s9bxOkxNpN2xcGcziJfE+il5CvtD
 YMlJZhd3zUNQlcdDVcVSAQUb5uQeyzWmnoK7HFXi4aa86VSSoDlHL20qdudrv20O/NR/
 MOWVDWVvrqiS26OgljeMyyq5Ghc+JvAtqQu6GVOFuNeDLUwGmos1txKeX3hoYIjq41hY
 YB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6n5uXZgPlc77dVVpesg0vBLpgeFYV6lVDwxVtKrTEDs=;
 b=HzQ/eb7GCMhEOKfkzRUXKWyQNkD7VEWe+cpVwHOy2dazlIT+YBuNNQi0NVH3Lm0q4P
 qYqltYerGpNJr7ByH6ugIUY0lvbQ3w5VJ7cuXh3SY5XcL7ff9CnsopDqWBrz/kERSiC8
 mvvMFr6s6gPVWJeQLa4rHU7o3kcPtAYyT+tHMQr7PteVP7PrLLoZVid5vGY8BSCilzqf
 Pqw0CeEKEqqQaJeFVlfNAbRxP9AckIQQ0L7uJMPPLfLd0a1psk+aiFsh9PCGZiNIYlTL
 sJ0pi9CgZxCdKMTBuEDaDCNXVYNVaD4pTdTWVy29Wg42c61yMR4qfBrNXHe266Sb7W9x
 xBpA==
X-Gm-Message-State: AOAM532I5KUAvCaBBZ+LXWgUAWjykRsWIMDwDL4li8+1bdrGcDoX7dXC
 JbA7W1NRN7n+j9s0JojPdoFc5pHP50A=
X-Received: by 2002:adf:9148:: with SMTP id j66mr17301090wrj.28.1612738693175; 
 Sun, 07 Feb 2021 14:58:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 17sm5576104wmf.32.2021.02.07.14.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:58:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] exec/cpu_ldst: Move tlb* declarations to "exec/exec-all.h"
Date: Sun,  7 Feb 2021 23:57:38 +0100
Message-Id: <20210207225738.2482987-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207225738.2482987-1-f4bug@amsat.org>
References: <20210207225738.2482987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVOewkjjPF0r

Keep MMU functions in "exec/cpu_ldst.h", and move TLB functions
to "exec/exec-all.h". As tlb_addr_write() is only called in
accel/tcg/cputlb.c, make move it there as a static function.

Doing so we removed the "tcg/tcg.h" dependency on "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 52 -----------------------------------------
 include/exec/exec-all.h | 38 ++++++++++++++++++++++++++++++
 accel/tcg/cputlb.c      |  9 +++++++
 3 files changed, 47 insertions(+), 52 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f8..cb0a096497f 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -291,34 +291,6 @@ static inline void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 
 #else
 
-/* Needed for TCG_OVERSIZED_GUEST */
-#include "tcg/tcg.h"
-
-static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
-{
-#if TCG_OVERSIZED_GUEST
-    return entry->addr_write;
-#else
-    return qatomic_read(&entry->addr_write);
-#endif
-}
-
-/* Find the TLB index corresponding to the mmu_idx + address pair.  */
-static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
-                                  target_ulong addr)
-{
-    uintptr_t size_mask = env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
-
-    return (addr >> TARGET_PAGE_BITS) & size_mask;
-}
-
-/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
-static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
-                                     target_ulong addr)
-{
-    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
-}
-
 uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                             int mmu_idx, uintptr_t ra);
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -422,28 +394,4 @@ static inline int cpu_ldsw_code(CPUArchState *env, abi_ptr addr)
     return (int16_t)cpu_lduw_code(env, addr);
 }
 
-/**
- * tlb_vaddr_to_host:
- * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index to use for lookup
- *
- * Look up the specified guest virtual index in the TCG softmmu TLB.
- * If we can translate a host virtual address suitable for direct RAM
- * access, without causing a guest exception, then return it.
- * Otherwise (TLB entry is for an I/O access, guest software
- * TLB fill required, etc) return NULL.
- */
-#ifdef CONFIG_USER_ONLY
-static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                                      MMUAccessType access_type, int mmu_idx)
-{
-    return g2h(addr);
-}
-#else
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                        MMUAccessType access_type, int mmu_idx);
-#endif
-
 #endif /* CPU_LDST_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index c5e8e355b7f..5024b9abd4a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -297,6 +297,38 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size);
 
+/**
+ * tlb_vaddr_to_host:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index to use for lookup
+ *
+ * Look up the specified guest virtual index in the TCG softmmu TLB.
+ * If we can translate a host virtual address suitable for direct RAM
+ * access, without causing a guest exception, then return it.
+ * Otherwise (TLB entry is for an I/O access, guest software
+ * TLB fill required, etc) return NULL.
+ */
+void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                        MMUAccessType access_type, int mmu_idx);
+
+/* Find the TLB index corresponding to the mmu_idx + address pair.  */
+static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
+                                  target_ulong addr)
+{
+    uintptr_t size_mask = env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+
+    return (addr >> TARGET_PAGE_BITS) & size_mask;
+}
+
+/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
+static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
+                                     target_ulong addr)
+{
+    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
+}
+
 /*
  * Find the iotlbentry for ptr.  This *must* be present in the TLB
  * because we just found the mapping.
@@ -374,6 +406,12 @@ tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap, unsigned bits)
 {
 }
+
+static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                                      MMUAccessType access_type, int mmu_idx)
+{
+    return g2h(addr);
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a6247da34a0..084d19b52d7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -429,6 +429,15 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
     tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
 }
 
+static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
+{
+#if TCG_OVERSIZED_GUEST
+    return entry->addr_write;
+#else
+    return qatomic_read(&entry->addr_write);
+#endif
+}
+
 void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
                                             uint64_t ptr,
                                             MMUAccessType ptr_access,
-- 
2.26.2

