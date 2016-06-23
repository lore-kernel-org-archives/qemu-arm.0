Received: by 10.25.21.96 with SMTP id l93csp561856lfi;
        Thu, 23 Jun 2016 07:46:53 -0700 (PDT)
X-Received: by 10.200.47.156 with SMTP id l28mr45493948qta.20.1466693213495;
        Thu, 23 Jun 2016 07:46:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32si395619qta.101.2016.06.23.07.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 07:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:37090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG5u8-0004wd-Ri
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 10:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5q6-0000IP-Bk
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG5q3-0003mN-0t
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:42:42 -0400
Received: from forward7m.cmail.yandex.net ([5.255.216.200]:57474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG5q1-0003lW-DT; Thu, 23 Jun 2016 10:42:38 -0400
Received: from smtp3m.mail.yandex.net (smtp3m.mail.yandex.net
	[IPv6:2a02:6b8:0:2519::125])
	by forward7m.cmail.yandex.net (Yandex) with ESMTP id C26D6219E5;
	Thu, 23 Jun 2016 17:42:23 +0300 (MSK)
Received: from smtp3m.mail.yandex.net (localhost [127.0.0.1])
	by smtp3m.mail.yandex.net (Yandex) with ESMTP id 27E9127A08C0;
	Thu, 23 Jun 2016 17:42:22 +0300 (MSK)
Received: by smtp3m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	OxsvMmnl66-gL5WSdFs; Thu, 23 Jun 2016 17:42:21 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466692941; bh=VDIzan2AhiFrEv+k8m67814IVI/MWm/w7jS3nUc3sfA=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=i5laPVqlT2TICgqSqhc+57sM4cbxm3+e5QvjFmnvsz8FW4lJDKavJIjDcimB3P8+Z
	sP1Eg5HjSmPP13G3F0ZyuO/iofJ7uaog7NjZ5qlzr1dgHyr+ZUElmrPTeCukbCcXdC
	TA75jMD9+cAcu/fZ4qmvlJnWdWznoajgzfA+HaEc=
Authentication-Results: smtp3m.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 0,1 0,1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Thu, 23 Jun 2016 17:42:06 +0300
Message-Id: <1466692926-522819-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.200
Subject: [Qemu-arm] [PATCH v3] Improve the alignment check infrastructure
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
Cc: Sergey Sorokin <afarallax@yandex.ru>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhOdCZIIOtID

Some architectures (e.g. ARMv8) need the address which is aligned
to a size more than the size of the memory access.
To support such check it's enough the current costless alignment
check implementation in QEMU, but we need to support
an alignment size specifying.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
In second version of the patch TLB flags layout was changed to depend on
TARGET_PAGE_BITS value. It was made to support architectures with small pages
as was discussed in the previous patch email thread.
Also there are additional checks to be sure that TLB flags don't intercept with
alignment bits.
A code in tcg_dump_ops() was slightly changed.
Some little fixes.

In third version of the patch TLB flags interception check was moved into
get_alignment_bits() function to keep it in one place.
Some little fix.

 include/exec/cpu-all.h       | 16 ++++++--
 softmmu_template.h           | 88 ++++++++++++--------------------------------
 tcg/aarch64/tcg-target.inc.c |  9 +++--
 tcg/i386/tcg-target.inc.c    | 15 +++++---
 tcg/ppc/tcg-target.inc.c     | 14 ++++---
 tcg/s390/tcg-target.inc.c    |  9 +++--
 tcg/tcg.c                    | 21 +++++++----
 tcg/tcg.h                    | 84 +++++++++++++++++++++++++++++++++++-------
 8 files changed, 148 insertions(+), 108 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9f38edf..8007abb 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -288,14 +288,22 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #if !defined(CONFIG_USER_ONLY)
 
 /* Flags stored in the low bits of the TLB virtual address.  These are
-   defined so that fast path ram access is all zeros.  */
+ * defined so that fast path ram access is all zeros.
+ * The flags all must be between TARGET_PAGE_BITS and
+ * maximum address alignment bit.
+ */
 /* Zero if TLB entry is valid.  */
-#define TLB_INVALID_MASK   (1 << 3)
+#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS - 1))
 /* Set if TLB entry references a clean RAM page.  The iotlb entry will
    contain the page physical address.  */
-#define TLB_NOTDIRTY    (1 << 4)
+#define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS - 2))
 /* Set if TLB entry is an IO callback.  */
-#define TLB_MMIO        (1 << 5)
+#define TLB_MMIO            (1 << (TARGET_PAGE_BITS - 3))
+
+/* Use this mask to check interception with an alignment mask
+ * in a TCG backend.
+ */
+#define TLB_FLAGS_MASK  (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO)
 
 void dump_exec_info(FILE *f, fprintf_function cpu_fprintf);
 void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
diff --git a/softmmu_template.h b/softmmu_template.h
index 208f808..4d378ca 100644
--- a/softmmu_template.h
+++ b/softmmu_template.h
@@ -171,20 +171,21 @@ WORD_TYPE helper_le_ld_name(CPUArchState *env, target_ulong addr,
     unsigned mmu_idx = get_mmuidx(oi);
     int index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     target_ulong tlb_addr = env->tlb_table[mmu_idx][index].ADDR_READ;
+    int a_bits = get_alignment_bits(get_memop(oi));
     uintptr_t haddr;
     DATA_TYPE res;
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
+    if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
+                             mmu_idx, retaddr);
+    }
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if ((addr & TARGET_PAGE_MASK)
          != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
-        if ((addr & (DATA_SIZE - 1)) != 0
-            && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                                 mmu_idx, retaddr);
-        }
         if (!VICTIM_TLB_HIT(ADDR_READ)) {
             tlb_fill(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
                      mmu_idx, retaddr);
@@ -215,10 +216,6 @@ WORD_TYPE helper_le_ld_name(CPUArchState *env, target_ulong addr,
         DATA_TYPE res1, res2;
         unsigned shift;
     do_unaligned_access:
-        if ((get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                                 mmu_idx, retaddr);
-        }
         addr1 = addr & ~(DATA_SIZE - 1);
         addr2 = addr1 + DATA_SIZE;
         /* Note the adjustment at the beginning of the function.
@@ -232,13 +229,6 @@ WORD_TYPE helper_le_ld_name(CPUArchState *env, target_ulong addr,
         return res;
     }
 
-    /* Handle aligned access or unaligned access in the same page.  */
-    if ((addr & (DATA_SIZE - 1)) != 0
-        && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                             mmu_idx, retaddr);
-    }
-
     haddr = addr + env->tlb_table[mmu_idx][index].addend;
 #if DATA_SIZE == 1
     res = glue(glue(ld, LSUFFIX), _p)((uint8_t *)haddr);
@@ -255,20 +245,21 @@ WORD_TYPE helper_be_ld_name(CPUArchState *env, target_ulong addr,
     unsigned mmu_idx = get_mmuidx(oi);
     int index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     target_ulong tlb_addr = env->tlb_table[mmu_idx][index].ADDR_READ;
+    int a_bits = get_alignment_bits(get_memop(oi));
     uintptr_t haddr;
     DATA_TYPE res;
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
+    if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
+                             mmu_idx, retaddr);
+    }
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if ((addr & TARGET_PAGE_MASK)
          != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
-        if ((addr & (DATA_SIZE - 1)) != 0
-            && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                                 mmu_idx, retaddr);
-        }
         if (!VICTIM_TLB_HIT(ADDR_READ)) {
             tlb_fill(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
                      mmu_idx, retaddr);
@@ -299,10 +290,6 @@ WORD_TYPE helper_be_ld_name(CPUArchState *env, target_ulong addr,
         DATA_TYPE res1, res2;
         unsigned shift;
     do_unaligned_access:
-        if ((get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                                 mmu_idx, retaddr);
-        }
         addr1 = addr & ~(DATA_SIZE - 1);
         addr2 = addr1 + DATA_SIZE;
         /* Note the adjustment at the beginning of the function.
@@ -316,13 +303,6 @@ WORD_TYPE helper_be_ld_name(CPUArchState *env, target_ulong addr,
         return res;
     }
 
-    /* Handle aligned access or unaligned access in the same page.  */
-    if ((addr & (DATA_SIZE - 1)) != 0
-        && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, READ_ACCESS_TYPE,
-                             mmu_idx, retaddr);
-    }
-
     haddr = addr + env->tlb_table[mmu_idx][index].addend;
     res = glue(glue(ld, LSUFFIX), _be_p)((uint8_t *)haddr);
     return res;
@@ -376,19 +356,20 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     unsigned mmu_idx = get_mmuidx(oi);
     int index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     target_ulong tlb_addr = env->tlb_table[mmu_idx][index].addr_write;
+    int a_bits = get_alignment_bits(get_memop(oi));
     uintptr_t haddr;
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
+    if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
+                             mmu_idx, retaddr);
+    }
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if ((addr & TARGET_PAGE_MASK)
         != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
-        if ((addr & (DATA_SIZE - 1)) != 0
-            && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                                 mmu_idx, retaddr);
-        }
         if (!VICTIM_TLB_HIT(addr_write)) {
             tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, retaddr);
         }
@@ -416,10 +397,6 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
                      >= TARGET_PAGE_SIZE)) {
         int i;
     do_unaligned_access:
-        if ((get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                                 mmu_idx, retaddr);
-        }
         /* XXX: not efficient, but simple */
         /* Note: relies on the fact that tlb_fill() does not remove the
          * previous page from the TLB cache.  */
@@ -434,13 +411,6 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
         return;
     }
 
-    /* Handle aligned access or unaligned access in the same page.  */
-    if ((addr & (DATA_SIZE - 1)) != 0
-        && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
-    }
-
     haddr = addr + env->tlb_table[mmu_idx][index].addend;
 #if DATA_SIZE == 1
     glue(glue(st, SUFFIX), _p)((uint8_t *)haddr, val);
@@ -456,19 +426,20 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     unsigned mmu_idx = get_mmuidx(oi);
     int index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     target_ulong tlb_addr = env->tlb_table[mmu_idx][index].addr_write;
+    int a_bits = get_alignment_bits(get_memop(oi));
     uintptr_t haddr;
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
+    if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
+                             mmu_idx, retaddr);
+    }
+
     /* If the TLB entry is for a different page, reload and try again.  */
     if ((addr & TARGET_PAGE_MASK)
         != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
-        if ((addr & (DATA_SIZE - 1)) != 0
-            && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                                 mmu_idx, retaddr);
-        }
         if (!VICTIM_TLB_HIT(addr_write)) {
             tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, retaddr);
         }
@@ -496,10 +467,6 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
                      >= TARGET_PAGE_SIZE)) {
         int i;
     do_unaligned_access:
-        if ((get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-            cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                                 mmu_idx, retaddr);
-        }
         /* XXX: not efficient, but simple */
         /* Note: relies on the fact that tlb_fill() does not remove the
          * previous page from the TLB cache.  */
@@ -514,13 +481,6 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
         return;
     }
 
-    /* Handle aligned access or unaligned access in the same page.  */
-    if ((addr & (DATA_SIZE - 1)) != 0
-        && (get_memop(oi) & MO_AMASK) == MO_ALIGN) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
-    }
-
     haddr = addr + env->tlb_table[mmu_idx][index].addend;
     glue(glue(st, SUFFIX), _be_p)((uint8_t *)haddr, val);
 }
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 1447f7c..8627b60 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -1071,19 +1071,20 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, TCGMemOp opc,
     int tlb_offset = is_read ?
         offsetof(CPUArchState, tlb_table[mem_index][0].addr_read)
         : offsetof(CPUArchState, tlb_table[mem_index][0].addr_write);
-    int s_mask = (1 << (opc & MO_SIZE)) - 1;
+    int a_bits = get_alignment_bits(opc);
     TCGReg base = TCG_AREG0, x3;
     uint64_t tlb_mask;
 
     /* For aligned accesses, we check the first byte and include the alignment
        bits within the address.  For unaligned access, we check that we don't
        cross pages using the address of the last byte of the access.  */
-    if ((opc & MO_AMASK) == MO_ALIGN || s_mask == 0) {
-        tlb_mask = TARGET_PAGE_MASK | s_mask;
+    if (a_bits >= 0) {
+        /* A byte access or an alignment check required */
+        tlb_mask = TARGET_PAGE_MASK | ((1 << a_bits) - 1);
         x3 = addr_reg;
     } else {
         tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, addr_reg, s_mask);
+                     TCG_REG_X3, addr_reg, (1 << (opc & MO_SIZE)) - 1);
         tlb_mask = TARGET_PAGE_MASK;
         x3 = TCG_REG_X3;
     }
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 317484c..15c724c 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1195,8 +1195,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
-    int s_mask = (1 << (opc & MO_SIZE)) - 1;
-    bool aligned = (opc & MO_AMASK) == MO_ALIGN || s_mask == 0;
+    int a_bits = get_alignment_bits(opc);
+    target_ulong tlb_mask;
 
     if (TCG_TARGET_REG_BITS == 64) {
         if (TARGET_LONG_BITS == 64) {
@@ -1213,19 +1213,22 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     }
 
     tcg_out_mov(s, tlbtype, r0, addrlo);
-    if (aligned) {
+    if (a_bits >= 0) {
+        /* A byte access or an alignment check required */
         tcg_out_mov(s, ttype, r1, addrlo);
+        tlb_mask = TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     } else {
         /* For unaligned access check that we don't cross pages using
            the page address of the last byte.  */
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask);
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo,
+                             (1 << (opc & MO_SIZE)) - 1);
+        tlb_mask = TARGET_PAGE_MASK;
     }
 
     tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
 
-    tgen_arithi(s, ARITH_AND + trexw, r1,
-                TARGET_PAGE_MASK | (aligned ? s_mask : 0), 0);
+    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
     tgen_arithi(s, ARITH_AND + tlbrexw, r0,
                 (CPU_TLB_SIZE - 1) << CPU_TLB_ENTRY_BITS, 0);
 
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index da10052..be1b467 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -1399,6 +1399,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,
     int add_off = offsetof(CPUArchState, tlb_table[mem_index][0].addend);
     TCGReg base = TCG_AREG0;
     TCGMemOp s_bits = opc & MO_SIZE;
+    int a_bits = get_alignment_bits(opc);
 
     /* Extract the page index, shifted into place for tlb index.  */
     if (TCG_TARGET_REG_BITS == 64) {
@@ -1456,14 +1457,17 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,
          * the bottom bits and thus trigger a comparison failure on
          * unaligned accesses
          */
+        if (a_bits < 0) {
+            a_bits = s_bits;
+        }
         tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
-                    (32 - s_bits) & 31, 31 - TARGET_PAGE_BITS);
-    } else if (s_bits) {
-        /* > byte access, we need to handle alignment */
-        if ((opc & MO_AMASK) == MO_ALIGN) {
+                    (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
+    } else if (a_bits) {
+        /* More than byte access, we need to handle alignment */
+        if (a_bits > 0) {
             /* Alignment required by the front-end, same as 32-bits */
             tcg_out_rld(s, RLDICL, TCG_REG_R0, addrlo,
-                        64 - TARGET_PAGE_BITS, TARGET_PAGE_BITS - s_bits);
+                        64 - TARGET_PAGE_BITS, TARGET_PAGE_BITS - a_bits);
             tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
        } else {
            /* We support unaligned accesses, we need to make sure we fail
diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
index e0a60e6..0c4e1b4 100644
--- a/tcg/s390/tcg-target.inc.c
+++ b/tcg/s390/tcg-target.inc.c
@@ -1499,18 +1499,19 @@ QEMU_BUILD_BUG_ON(offsetof(CPUArchState, tlb_table[NB_MMU_MODES - 1][1])
 static TCGReg tcg_out_tlb_read(TCGContext* s, TCGReg addr_reg, TCGMemOp opc,
                                int mem_index, bool is_ld)
 {
-    int s_mask = (1 << (opc & MO_SIZE)) - 1;
+    int a_bits = get_alignment_bits(opc);
     int ofs, a_off;
     uint64_t tlb_mask;
 
     /* For aligned accesses, we check the first byte and include the alignment
        bits within the address.  For unaligned access, we check that we don't
        cross pages using the address of the last byte of the access.  */
-    if ((opc & MO_AMASK) == MO_ALIGN || s_mask == 0) {
+    if (a_bits >= 0) {
+        /* A byte access or an alignment check required */
         a_off = 0;
-        tlb_mask = TARGET_PAGE_MASK | s_mask;
+        tlb_mask = TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     } else {
-        a_off = s_mask;
+        a_off = (1 << (opc & MO_SIZE)) - 1;
         tlb_mask = TARGET_PAGE_MASK;
     }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 254427b..140dd78 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -997,6 +997,17 @@ static const char * const ldst_name[] =
     [MO_BEQ]  = "beq",
 };
 
+static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
+    [MO_UNALN >> MO_ASHIFT]    = "un+",
+    [MO_ALIGN >> MO_ASHIFT]    = "al+",
+    [MO_ALIGN_2 >> MO_ASHIFT]  = "al2+",
+    [MO_ALIGN_4 >> MO_ASHIFT]  = "al4+",
+    [MO_ALIGN_8 >> MO_ASHIFT]  = "al8+",
+    [MO_ALIGN_16 >> MO_ASHIFT] = "al16+",
+    [MO_ALIGN_32 >> MO_ASHIFT] = "al32+",
+    [MO_ALIGN_64 >> MO_ASHIFT] = "al64+",
+};
+
 void tcg_dump_ops(TCGContext *s)
 {
     char buf[128];
@@ -1098,14 +1109,8 @@ void tcg_dump_ops(TCGContext *s)
                     if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
                         qemu_log(",$0x%x,%u", op, ix);
                     } else {
-                        const char *s_al = "", *s_op;
-                        if (op & MO_AMASK) {
-                            if ((op & MO_AMASK) == MO_ALIGN) {
-                                s_al = "al+";
-                            } else {
-                                s_al = "un+";
-                            }
-                        }
+                        const char *s_al, *s_op;
+                        s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];
                         s_op = ldst_name[op & (MO_BSWAP | MO_SSIZE)];
                         qemu_log(",%s%s,%u", s_al, s_op, ix);
                     }
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 66d7fc0..8dd8be0 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -191,6 +191,15 @@ typedef uint64_t tcg_insn_unit;
 #endif
 
 
+#ifdef CONFIG_DEBUG_TCG
+# define tcg_debug_assert(X) do { assert(X); } while (0)
+#elif QEMU_GNUC_PREREQ(4, 5)
+# define tcg_debug_assert(X) \
+    do { if (!(X)) { __builtin_unreachable(); } } while (0)
+#else
+# define tcg_debug_assert(X) do { (void)(X); } while (0)
+#endif
+
 typedef struct TCGRelocation {
     struct TCGRelocation *next;
     int type;
@@ -275,10 +284,26 @@ typedef enum TCGMemOp {
 #endif
 
     /* MO_UNALN accesses are never checked for alignment.
-       MO_ALIGN accesses will result in a call to the CPU's
-       do_unaligned_access hook if the guest address is not aligned.
-       The default depends on whether the target CPU defines ALIGNED_ONLY.  */
-    MO_AMASK = 16,
+     * MO_ALIGN accesses will result in a call to the CPU's
+     * do_unaligned_access hook if the guest address is not aligned.
+     * The default depends on whether the target CPU defines ALIGNED_ONLY.
+     * Some architectures (e.g. ARMv8) need the address which is aligned
+     * to a size more than the size of the memory access.
+     * To support such check it's enough the current costless alignment
+     * check implementation in QEMU, but we need to support
+     * an alignment size specifying.
+     * MO_ALIGN supposes a natural alignment
+     * (i.e. the alignment size is the size of a memory access).
+     * Note that an alignment size must be equal or greater
+     * than an access size.
+     * There are three options:
+     * - an alignment to the size of an access (MO_ALIGN);
+     * - an alignment to the specified size that is equal or greater than
+     *   an access size (MO_ALIGN_x where 'x' is a size in bytes);
+     * - unaligned access permitted (MO_UNALN).
+     */
+    MO_ASHIFT = 4,
+    MO_AMASK = 7 << MO_ASHIFT,
 #ifdef ALIGNED_ONLY
     MO_ALIGN = 0,
     MO_UNALN = MO_AMASK,
@@ -286,6 +311,12 @@ typedef enum TCGMemOp {
     MO_ALIGN = MO_AMASK,
     MO_UNALN = 0,
 #endif
+    MO_ALIGN_2  = 1 << MO_ASHIFT,
+    MO_ALIGN_4  = 2 << MO_ASHIFT,
+    MO_ALIGN_8  = 3 << MO_ASHIFT,
+    MO_ALIGN_16 = 4 << MO_ASHIFT,
+    MO_ALIGN_32 = 5 << MO_ASHIFT,
+    MO_ALIGN_64 = 6 << MO_ASHIFT,
 
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
@@ -317,6 +348,42 @@ typedef enum TCGMemOp {
     MO_SSIZE = MO_SIZE | MO_SIGN,
 } TCGMemOp;
 
+/**
+ * get_alignment_bits
+ * @memop: TCGMemOp value
+ *
+ * Extract the alignment size from the memop.
+ *
+ * Returns: 0 in case of byte access (which is always aligned);
+ *          positive value - number of alignment bits;
+ *          negative value if unaligned access enabled
+ *          and this is not a byte access.
+ */
+static inline int get_alignment_bits(TCGMemOp memop)
+{
+    int a = memop & MO_AMASK;
+    int s = memop & MO_SIZE;
+
+    if (a == MO_UNALN) {
+        /* Negative value if unaligned access enabled,
+         * or zero value in case of byte access.
+         */
+        return -s;
+    } else if (a == MO_ALIGN) {
+        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << s) - 1)) == 0);
+        /* A natural alignment: return a number of access size bits */
+        return s;
+    } else {
+        /* Specific alignment size. It must be equal or greater
+         * than the access size.
+         */
+        a >>= MO_ASHIFT;
+        tcg_debug_assert(a >= s);
+        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << a) - 1)) == 0);
+        return a;
+    }
+}
+
 typedef tcg_target_ulong TCGArg;
 
 /* Define a type and accessor macros for variables.  Using pointer types
@@ -790,15 +857,6 @@ do {\
     abort();\
 } while (0)
 
-#ifdef CONFIG_DEBUG_TCG
-# define tcg_debug_assert(X) do { assert(X); } while (0)
-#elif QEMU_GNUC_PREREQ(4, 5)
-# define tcg_debug_assert(X) \
-    do { if (!(X)) { __builtin_unreachable(); } } while (0)
-#else
-# define tcg_debug_assert(X) do { (void)(X); } while (0)
-#endif
-
 void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs);
 
 #if UINTPTR_MAX == UINT32_MAX
-- 
1.9.3

