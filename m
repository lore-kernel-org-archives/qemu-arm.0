Received: by 10.25.21.156 with SMTP id 28csp1960534lfv;
        Tue, 19 Jul 2016 22:03:46 -0700 (PDT)
X-Received: by 10.66.150.67 with SMTP id ug3mr72646111pab.41.1468991020277;
        Tue, 19 Jul 2016 22:03:40 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d10si1260915pat.143.2016.07.19.22.03.40;
        Tue, 19 Jul 2016 22:03:40 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751545AbcGTFDd (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:33 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34465 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303AbcGTFDZ (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:25 -0400
Received: by mail-pf0-f193.google.com with SMTP id g202so2694370pfb.1
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:24 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e53C5wxavI9lx7rPfdKl+cUL5DG/A3kJwOIJ8/bCmzs=;
        b=OuyfG4OhAYyzHcd1aw8WKURzpwmoZt4/hHqgJI2OYg0S/Lzy0RWvfLhDODTelrolfF
         Jajcikec++tX0Ud5bx64rwPxyfoqbLYgcmh1DCcW08roPd6v80z2/nwgkZYHNTkWFuAa
         vPYlHeXbrjJIFiyk6zbpCyjNMnkq0pXoS2zCkF4xOfWwn7/wjrBYdeokkHC1gWsEh7Z+
         7uMvaxNrwOiQW84qD0Ya9slIBt2eQNqYs25s2u69yAqYxm/xyNFHX1a4HE6bmknjC9XH
         SEN9rgFHo8kxQAmKvr+nwxvaFGEWx2pVt9KFdIWakwnHDYvZQ6D2y6QNhBtt/X9tmkhu
         wKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e53C5wxavI9lx7rPfdKl+cUL5DG/A3kJwOIJ8/bCmzs=;
        b=TimxuDDaZIpMrEYiNePqH32F83OrKtigKj2NrCCQSnekOEc0/bJTh5W6Llws8fNMM+
         GVQ+t04er1rn+KtvkoyVoUHrZ58SXG8IdIR1t9SzzB0glGpxgNkcx6GNlGRY8dT01ATi
         H3alsgnjEFblknko0NVlnl3e3kdWslYGhQRLGA7obvikLFwtmy/ega0gPpDO//7BYogK
         CWey8CieW4sEUEHv781UMruJVMBjM3Au13b9fIgnSqEulL9DrBfXMqUw4cJZsIx5XHql
         xfDWtcysTiLKfKoikBF3H5L0p6vvIB/yOe4tQ96CTpn+03z/FpBN2RAgnNk7tpBCTEq+
         kPVQ==
X-Gm-Message-State: ALyK8tLMwR9o0n26Fu6bd2kKRfjZsTQVImW/k1McYkj/YFojz1ZOAOv0PqwjLjHi6h/D+Q==
X-Received: by 10.98.112.196 with SMTP id l187mr61784548pfc.59.1468991003168;
        Tue, 19 Jul 2016 22:03:23 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:22 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 06/10] Change signature of cpu_memory_rw_debug() to avoid casting
Date:	Tue, 19 Jul 2016 22:02:56 -0700
Message-Id: <1468990980-4598-7-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: kTyTuVPDs2jY

Change signature of cpu_memory_rw_debug() to expectet void * as a buffer
instead of uint8_t * to avoid forcing the caller of the function to do a
type cast.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c                      |  6 ++++--
 hw/i386/kvmvapic.c          | 10 +++++-----
 include/exec/cpu-all.h      |  2 +-
 include/exec/softmmu-semi.h |  8 ++++----
 target-arm/arm-semi.c       |  2 +-
 target-arm/kvm64.c          |  8 ++++----
 target-i386/helper.c        |  4 ++--
 target-i386/kvm.c           |  8 ++++----
 target-ppc/kvm.c            |  8 ++++----
 target-s390x/kvm.c          |  6 +++---
 target-xtensa/xtensa-semi.c |  6 +++---
 11 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/exec.c b/exec.c
index e2425c5..f20b216 100644
--- a/exec.c
+++ b/exec.c
@@ -2436,11 +2436,12 @@ MemoryRegion *get_system_io(void)
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write)
+                        void *b, int len, int is_write)
 {
     int l, flags;
     target_ulong page;
     void * p;
+    uint8_t *buf = b;
 
     while (len > 0) {
         page = addr & TARGET_PAGE_MASK;
@@ -3617,11 +3618,12 @@ void stq_be_phys(AddressSpace *as, hwaddr addr, uint64_t val)
 
 /* virtual memory access for debug (includes writing to ROM) */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write)
+                        void *b, int len, int is_write)
 {
     int l;
     hwaddr phys_addr;
     target_ulong page;
+    uint8_t *buf = b;
 
     while (len > 0) {
         int asidx;
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 3bf1ddd..c684675 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -261,7 +261,7 @@ instruction_ok:
      * and update the cached values.
      */
     if (cpu_memory_rw_debug(cs, ip + instr->addr_offset,
-                            (void *)&real_tpr_addr,
+                            &real_tpr_addr,
                             sizeof(real_tpr_addr), 0) < 0) {
         return -1;
     }
@@ -349,7 +349,7 @@ static int get_kpcr_number(X86CPU *cpu)
     } QEMU_PACKED kpcr;
 
     if (cpu_memory_rw_debug(CPU(cpu), env->segs[R_FS].base,
-                            (void *)&kpcr, sizeof(kpcr), 0) < 0 ||
+                            &kpcr, sizeof(kpcr), 0) < 0 ||
         kpcr.self != env->segs[R_FS].base) {
         return -1;
     }
@@ -388,7 +388,7 @@ static void patch_call(VAPICROMState *s, X86CPU *cpu, target_ulong ip,
 
     offset = cpu_to_le32(target - ip - 5);
     patch_byte(cpu, ip, 0xe8); /* call near */
-    cpu_memory_rw_debug(CPU(cpu), ip + 1, (void *)&offset, sizeof(offset), 1);
+    cpu_memory_rw_debug(CPU(cpu), ip + 1, &offset, sizeof(offset), 1);
 }
 
 static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
@@ -434,8 +434,8 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
         break;
     case 0xc7: /* mov imm32, r/m32 (c7/0) */
         patch_byte(cpu, ip, 0x68);  /* push imm32 */
-        cpu_memory_rw_debug(cs, ip + 6, (void *)&imm32, sizeof(imm32), 0);
-        cpu_memory_rw_debug(cs, ip + 1, (void *)&imm32, sizeof(imm32), 1);
+        cpu_memory_rw_debug(cs, ip + 6, &imm32, sizeof(imm32), 0);
+        cpu_memory_rw_debug(cs, ip + 1, &imm32, sizeof(imm32), 1);
         patch_call(s, cpu, ip + 5, handlers->set_tpr);
         break;
     case 0xff: /* push r/m32 */
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b6a7059..ad498d0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -310,7 +310,7 @@ void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
 #endif /* !CONFIG_USER_ONLY */
 
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write);
+                        void *buf, int len, int is_write);
 
 int cpu_exec(CPUState *cpu);
 
diff --git a/include/exec/softmmu-semi.h b/include/exec/softmmu-semi.h
index 7eefad8..263aa25 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/exec/softmmu-semi.h
@@ -14,7 +14,7 @@ static inline uint64_t softmmu_tget64(CPUArchState *env, target_ulong addr)
 {
     uint64_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, 0);
     return tswap64(val);
 }
 
@@ -22,7 +22,7 @@ static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
 {
     uint32_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, 0);
     return tswap32(val);
 }
 
@@ -43,14 +43,14 @@ static inline void softmmu_tput64(CPUArchState *env,
                                   target_ulong addr, uint64_t val)
 {
     val = tswap64(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, 1);
 }
 
 static inline void softmmu_tput32(CPUArchState *env,
                                   target_ulong addr, uint32_t val)
 {
     val = tswap32(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, 1);
 }
 #define put_user_u64(arg, p) ({ softmmu_tput64(env, p, arg) ; 0; })
 #define put_user_u32(arg, p) ({ softmmu_tput32(env, p, arg) ; 0; })
diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index 7cac873..bd4bf13 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -187,7 +187,7 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     /* The size is always stored in big-endian order, extract
        the value. We assume the size always fit in 32 bits.  */
     uint32_t size;
-    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, (uint8_t *)&size, 4, 0);
+    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, &size, 4, 0);
     size = be32_to_cpu(size);
     if (is_a64(env)) {
         env->xregs[0] = size;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 5faa76c..7ba5acd 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -874,8 +874,8 @@ static const uint32_t brk_insn = 0xd4200000;
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+        if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 4, 0) ||
+            cpu_memory_rw_debug(cs, bp->pc, &brk_insn, 4, 1)) {
             return -EINVAL;
         }
         return 0;
@@ -890,9 +890,9 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     static uint32_t brk;
 
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        if (cpu_memory_rw_debug(cs, bp->pc, &brk, 4, 0) ||
             brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+            cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 4, 1)) {
             return -EINVAL;
         }
         return 0;
diff --git a/target-i386/helper.c b/target-i386/helper.c
index 1c250b8..3e8d86f 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -1286,8 +1286,8 @@ int cpu_x86_get_descr_debug(CPUX86State *env, unsigned int selector,
     index = selector & ~7;
     ptr = dt->base + index;
     if ((index + 7) > dt->limit
-        || cpu_memory_rw_debug(cs, ptr, (uint8_t *)&e1, sizeof(e1), 0) != 0
-        || cpu_memory_rw_debug(cs, ptr+4, (uint8_t *)&e2, sizeof(e2), 0) != 0)
+        || cpu_memory_rw_debug(cs, ptr, &e1, sizeof(e1), 0) != 0
+        || cpu_memory_rw_debug(cs, ptr + 4, &e2, sizeof(e2), 0) != 0)
         return 0;
 
     *base = ((e1 >> 16) | ((e2 & 0xff) << 16) | (e2 & 0xff000000));
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 9327523..46e6a64 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -2911,10 +2911,10 @@ static int kvm_handle_tpr_access(X86CPU *cpu)
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
-    static const uint8_t int3 = 0xcc;
+    uint8_t int3 = 0xcc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&int3, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, 0) ||
+        cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 1)) {
         return -EINVAL;
     }
     return 0;
@@ -2925,7 +2925,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     uint8_t int3;
 
     if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
+        cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, 1)) {
         return -EINVAL;
     }
     return 0;
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 7a8f555..73ac879 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1454,9 +1454,9 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     /* Mixed endian case is not handled */
     uint32_t sc = debug_inst_opcode;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
+    if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
                             sizeof(sc), 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), 1)) {
+        cpu_memory_rw_debug(cs, bp->pc, &sc, sizeof(sc), 1)) {
         return -EINVAL;
     }
 
@@ -1467,9 +1467,9 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint32_t sc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), 0) ||
+    if (cpu_memory_rw_debug(cs, bp->pc, &sc, sizeof(sc), 0) ||
         sc != debug_inst_opcode ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
+        cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
                             sizeof(sc), 1)) {
         return -EINVAL;
     }
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index 2991bff..565b1b2 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -671,9 +671,9 @@ static const uint8_t diag_501[] = {0x83, 0x24, 0x05, 0x01};
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
+    if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
                             sizeof(diag_501), 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)diag_501,
+        cpu_memory_rw_debug(cs, bp->pc, diag_501,
                             sizeof(diag_501), 1)) {
         return -EINVAL;
     }
@@ -688,7 +688,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
         return -EINVAL;
     } else if (memcmp(t, diag_501, sizeof(diag_501))) {
         return -EINVAL;
-    } else if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
+    } else if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
                                    sizeof(diag_501), 1)) {
         return -EINVAL;
     }
diff --git a/target-xtensa/xtensa-semi.c b/target-xtensa/xtensa-semi.c
index 370e365..ec199ac 100644
--- a/target-xtensa/xtensa-semi.c
+++ b/target-xtensa/xtensa-semi.c
@@ -202,7 +202,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             for (i = 0; i < ARRAY_SIZE(name); ++i) {
                 rc = cpu_memory_rw_debug(cs, regs[3] + i,
-                                         (uint8_t *)name + i, 1, 0);
+                                         &name[i], 1, 0);
                 if (rc != 0 || name[i] == 0) {
                     break;
                 }
@@ -247,7 +247,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             if (target_tv) {
                 cpu_memory_rw_debug(cs, target_tv,
-                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
+                                    target_tvv, sizeof(target_tvv), 0);
                 tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
                 tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
             }
@@ -282,7 +282,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             argv.argptr[0] = tswap32(regs[3] + offsetof(struct Argv, text));
             cpu_memory_rw_debug(cs,
-                                regs[3], (uint8_t *)&argv, sizeof(argv), 1);
+                                regs[3], &argv, sizeof(argv), 1);
         }
         break;
 
-- 
2.5.5

