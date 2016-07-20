Received: by 10.25.21.156 with SMTP id 28csp1960515lfv;
        Tue, 19 Jul 2016 22:03:43 -0700 (PDT)
X-Received: by 10.66.74.133 with SMTP id t5mr19050409pav.114.1468991019970;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d10si1260915pat.143.2016.07.19.22.03.39;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751527AbcGTFDc (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:32 -0400
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36810 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304AbcGTFDZ (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:25 -0400
Received: by mail-pa0-f65.google.com with SMTP id ez1so2564565pab.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:24 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Cy1T2XoacS0R1ZoTsYbQ+GwBo3QNntW3UXwOfy+Cuqk=;
        b=yUbtBnqZb2YaWOCAgYa7CEhLvfNvzestWWvN5Jh89yNZv/Zi9Ge7fLED3xe7fHOYoZ
         iEDa3yDGvZVQEofFccvt53U943SBw+GL0vHfy+bUp3jq6DiZlqDy1gKJe13lkAJCKXer
         rrmrE+8MYUZN6XyAyT9w+Iik+z1Hw3oXkduP0OcALA0h+w0BMiJFbwifUfyUWrhKd24k
         3WOMPEAkLC++PV1TyJZgmSn/PdBf67mOOQbUN/llduiHtBKGa9MeB6iIubUCjXh3cCpn
         R7IasXb0CPh1T3mLDYvrNjRlv6C4zzxZBpIs2Qz6FwOvY+Ue/NENqXu45K3MwX5sZzvW
         ZD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Cy1T2XoacS0R1ZoTsYbQ+GwBo3QNntW3UXwOfy+Cuqk=;
        b=knKHqWPVITs7WK5k1ryKQe5MoW5JmJiu3ENI6UHS1va+va4FdZ6oo+VKiM+XlnfVJ8
         dYgr5shQ+MNoboZ1/yj3ZRS9TDQGQ+v3UAyw49GgAsdD82uohl8ha8RPIuxCXRHCCXOr
         D5wgHFCfvJgstiqdNTroPFslVebWLyD2Nr6ptkcoY0qsEkYmbFhIoh0EQTze00HLAnJo
         qCWetM2LcpUchC7A8HGUsn6pLkKqmQhVLQiQDU63Nz2nd/LGA/KW8MDo18S2PhAZIyWt
         dK4oA1WOVn1WoikayyDmKBpBp1sTK7rivC13i7E/LIjdiY7QXnikpm8/mjXbjVzE6rRI
         JINA==
X-Gm-Message-State: ALyK8tLE4c/5lVxUdpVpc6nId27jFFC7jCmHXmS5xGCnKn7ZdZHc0y5U1Ro6JsGZSLQVvg==
X-Received: by 10.66.101.101 with SMTP id ff5mr66346029pab.88.1468991004068;
        Tue, 19 Jul 2016 22:03:24 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:23 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 07/10] Convert cpu_memory_rw_debug to use MemoryAccessType
Date:	Tue, 19 Jul 2016 22:02:57 -0700
Message-Id: <1468990980-4598-8-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: 07D7K5ABMpp6

Convert cpu_memory_rw_debug() to use MemoryAccessType as a way of
specifying memory reads/writes. This makes caller code be more obvious
in what it does (previously one had to interpret 0 or 1 and remember the
semantics of the last boolean argument of the function).

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 cpus.c                      |  2 +-
 disas.c                     |  4 ++--
 exec.c                      | 14 ++++++++++----
 gdbstub.c                   |  3 ++-
 hw/i386/kvmvapic.c          | 20 +++++++++++---------
 include/exec/cpu-all.h      |  2 +-
 include/exec/softmmu-semi.h | 16 ++++++++--------
 monitor.c                   |  3 ++-
 target-arm/arm-semi.c       |  2 +-
 target-arm/kvm64.c          | 12 ++++++++----
 target-i386/helper.c        |  7 ++++---
 target-i386/kvm.c           |  9 +++++----
 target-ppc/kvm.c            |  9 +++++----
 target-s390x/kvm.c          |  9 +++++----
 target-sparc/mmu_helper.c   |  8 ++++++--
 target-xtensa/xtensa-semi.c | 10 +++++-----
 16 files changed, 76 insertions(+), 54 deletions(-)

diff --git a/cpus.c b/cpus.c
index 84c3520..ce19a13 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1691,7 +1691,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
         l = sizeof(buf);
         if (l > size)
             l = size;
-        if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
+        if (cpu_memory_rw_debug(cpu, addr, buf, l, MEM_DATA_LOAD) != 0) {
             error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
                              " specified", orig_addr, orig_size);
             goto exit;
diff --git a/disas.c b/disas.c
index 05a7a12..c72c0dc 100644
--- a/disas.c
+++ b/disas.c
@@ -39,7 +39,7 @@ target_read_memory (bfd_vma memaddr,
 {
     CPUDebug *s = container_of(info, CPUDebug, info);
 
-    cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
+    cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, MEM_DATA_LOAD);
     return 0;
 }
 
@@ -358,7 +358,7 @@ monitor_read_memory (bfd_vma memaddr, bfd_byte *myaddr, int length,
     if (monitor_disas_is_physical) {
         cpu_physical_memory_read(memaddr, myaddr, length);
     } else {
-        cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
+        cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, MEM_DATA_LOAD);
     }
     return 0;
 }
diff --git a/exec.c b/exec.c
index f20b216..995ff60 100644
--- a/exec.c
+++ b/exec.c
@@ -2436,13 +2436,16 @@ MemoryRegion *get_system_io(void)
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *b, int len, int is_write)
+                        void *b, int len, MemoryAccessType access_type)
 {
     int l, flags;
     target_ulong page;
     void * p;
     uint8_t *buf = b;
 
+    g_assert(access_type == MEM_DATA_STORE ||
+             access_type == MEM_DATA_LOAD);
+
     while (len > 0) {
         page = addr & TARGET_PAGE_MASK;
         l = (page + TARGET_PAGE_SIZE) - addr;
@@ -2451,7 +2454,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         flags = page_get_flags(page);
         if (!(flags & PAGE_VALID))
             return -1;
-        if (is_write) {
+        if (access_type == MEM_DATA_STORE) {
             if (!(flags & PAGE_WRITE))
                 return -1;
             /* XXX: this code should not depend on lock_user */
@@ -3618,13 +3621,16 @@ void stq_be_phys(AddressSpace *as, hwaddr addr, uint64_t val)
 
 /* virtual memory access for debug (includes writing to ROM) */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *b, int len, int is_write)
+                        void *b, int len, MemoryAccessType access_type)
 {
     int l;
     hwaddr phys_addr;
     target_ulong page;
     uint8_t *buf = b;
 
+    g_assert(access_type == MEM_DATA_STORE ||
+             access_type == MEM_DATA_LOAD);
+
     while (len > 0) {
         int asidx;
         MemTxAttrs attrs;
@@ -3639,7 +3645,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         if (l > len)
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
-        if (is_write) {
+        if (access_type == MEM_DATA_STORE) {
             cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
                                           phys_addr, buf, l);
         } else {
diff --git a/gdbstub.c b/gdbstub.c
index 5da66f1..9c4cbe4 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -51,7 +51,8 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
     if (cc->memory_rw_debug) {
         return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
-    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+    return cpu_memory_rw_debug(cpu, addr, buf, len,
+                               is_write ? MEM_DATA_STORE : MEM_DATA_LOAD);
 }
 
 enum {
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index c684675..8e15c0b 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -233,7 +233,7 @@ static int evaluate_tpr_instruction(VAPICROMState *s, X86CPU *cpu,
                 continue;
             }
             if (cpu_memory_rw_debug(cs, ip - instr->length, opcode,
-                                    sizeof(opcode), 0) < 0) {
+                                    sizeof(opcode), MEM_DATA_LOAD) < 0) {
                 return -1;
             }
             if (opcode_matches(opcode, instr)) {
@@ -243,7 +243,8 @@ static int evaluate_tpr_instruction(VAPICROMState *s, X86CPU *cpu,
         }
         return -1;
     } else {
-        if (cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), 0) < 0) {
+        if (cpu_memory_rw_debug(cs, ip, opcode,
+                                sizeof(opcode), MEM_DATA_LOAD) < 0) {
             return -1;
         }
         for (i = 0; i < ARRAY_SIZE(tpr_instr); i++) {
@@ -262,7 +263,7 @@ instruction_ok:
      */
     if (cpu_memory_rw_debug(cs, ip + instr->addr_offset,
                             &real_tpr_addr,
-                            sizeof(real_tpr_addr), 0) < 0) {
+                            sizeof(real_tpr_addr), MEM_DATA_LOAD) < 0) {
         return -1;
     }
     real_tpr_addr = le32_to_cpu(real_tpr_addr);
@@ -349,7 +350,7 @@ static int get_kpcr_number(X86CPU *cpu)
     } QEMU_PACKED kpcr;
 
     if (cpu_memory_rw_debug(CPU(cpu), env->segs[R_FS].base,
-                            &kpcr, sizeof(kpcr), 0) < 0 ||
+                            &kpcr, sizeof(kpcr), MEM_DATA_LOAD) < 0 ||
         kpcr.self != env->segs[R_FS].base) {
         return -1;
     }
@@ -378,7 +379,7 @@ static int vapic_enable(VAPICROMState *s, X86CPU *cpu)
 
 static void patch_byte(X86CPU *cpu, target_ulong addr, uint8_t byte)
 {
-    cpu_memory_rw_debug(CPU(cpu), addr, &byte, 1, 1);
+    cpu_memory_rw_debug(CPU(cpu), addr, &byte, 1, MEM_DATA_STORE);
 }
 
 static void patch_call(VAPICROMState *s, X86CPU *cpu, target_ulong ip,
@@ -388,7 +389,8 @@ static void patch_call(VAPICROMState *s, X86CPU *cpu, target_ulong ip,
 
     offset = cpu_to_le32(target - ip - 5);
     patch_byte(cpu, ip, 0xe8); /* call near */
-    cpu_memory_rw_debug(CPU(cpu), ip + 1, &offset, sizeof(offset), 1);
+    cpu_memory_rw_debug(CPU(cpu), ip + 1, &offset,
+                        sizeof(offset), MEM_DATA_STORE);
 }
 
 static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
@@ -415,7 +417,7 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
 
     pause_all_vcpus();
 
-    cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), 0);
+    cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), MEM_DATA_LOAD);
 
     switch (opcode[0]) {
     case 0x89: /* mov r32 to r/m32 */
@@ -434,8 +436,8 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
         break;
     case 0xc7: /* mov imm32, r/m32 (c7/0) */
         patch_byte(cpu, ip, 0x68);  /* push imm32 */
-        cpu_memory_rw_debug(cs, ip + 6, &imm32, sizeof(imm32), 0);
-        cpu_memory_rw_debug(cs, ip + 1, &imm32, sizeof(imm32), 1);
+        cpu_memory_rw_debug(cs, ip + 6, &imm32, sizeof(imm32), MEM_DATA_LOAD);
+        cpu_memory_rw_debug(cs, ip + 1, &imm32, sizeof(imm32), MEM_DATA_STORE);
         patch_call(s, cpu, ip + 5, handlers->set_tpr);
         break;
     case 0xff: /* push r/m32 */
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index ad498d0..8cde65d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -310,7 +310,7 @@ void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
 #endif /* !CONFIG_USER_ONLY */
 
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *buf, int len, int is_write);
+                        void *buf, int len, MemoryAccessType access_type);
 
 int cpu_exec(CPUState *cpu);
 
diff --git a/include/exec/softmmu-semi.h b/include/exec/softmmu-semi.h
index 263aa25..4dde38c 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/exec/softmmu-semi.h
@@ -14,7 +14,7 @@ static inline uint64_t softmmu_tget64(CPUArchState *env, target_ulong addr)
 {
     uint64_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, MEM_DATA_LOAD);
     return tswap64(val);
 }
 
@@ -22,7 +22,7 @@ static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
 {
     uint32_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, MEM_DATA_LOAD);
     return tswap32(val);
 }
 
@@ -30,7 +30,7 @@ static inline uint32_t softmmu_tget8(CPUArchState *env, target_ulong addr)
 {
     uint8_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 1, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 1, MEM_DATA_LOAD);
     return val;
 }
 
@@ -43,14 +43,14 @@ static inline void softmmu_tput64(CPUArchState *env,
                                   target_ulong addr, uint64_t val)
 {
     val = tswap64(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 8, MEM_DATA_STORE);
 }
 
 static inline void softmmu_tput32(CPUArchState *env,
                                   target_ulong addr, uint32_t val)
 {
     val = tswap32(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 4, MEM_DATA_STORE);
 }
 #define put_user_u64(arg, p) ({ softmmu_tput64(env, p, arg) ; 0; })
 #define put_user_u32(arg, p) ({ softmmu_tput32(env, p, arg) ; 0; })
@@ -63,7 +63,7 @@ static void *softmmu_lock_user(CPUArchState *env,
     /* TODO: Make this something that isn't fixed size.  */
     p = malloc(len);
     if (p && copy) {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, 0);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, MEM_DATA_LOAD);
     }
     return p;
 }
@@ -79,7 +79,7 @@ static char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
         return NULL;
     }
     do {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &c, 1, 0);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &c, 1, MEM_DATA_LOAD);
         addr++;
         *(p++) = c;
     } while (c);
@@ -90,7 +90,7 @@ static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
                                 target_ulong len)
 {
     if (len) {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, 1);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, MEM_DATA_STORE);
     }
     free(p);
 }
diff --git a/monitor.c b/monitor.c
index d0ff246..226b060 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1269,7 +1269,8 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         if (is_physical) {
             cpu_physical_memory_read(addr, buf, l);
         } else {
-            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) < 0) {
+            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf,
+                                    l, MEM_DATA_LOAD) < 0) {
                 monitor_printf(mon, " Cannot access memory\n");
                 break;
             }
diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index bd4bf13..157fb0b 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -187,7 +187,7 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     /* The size is always stored in big-endian order, extract
        the value. We assume the size always fit in 32 bits.  */
     uint32_t size;
-    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, &size, 4, 0);
+    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, &size, 4, MEM_DATA_LOAD);
     size = be32_to_cpu(size);
     if (is_a64(env)) {
         env->xregs[0] = size;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 7ba5acd..9bd821e 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -874,8 +874,10 @@ static const uint32_t brk_insn = 0xd4200000;
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, &brk_insn, 4, 1)) {
+        if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
+                                4, MEM_DATA_LOAD) ||
+            cpu_memory_rw_debug(cs, bp->pc, &brk_insn,
+                                4, MEM_DATA_STORE)) {
             return -EINVAL;
         }
         return 0;
@@ -890,9 +892,11 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     static uint32_t brk;
 
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, &brk, 4, 0) ||
+        if (cpu_memory_rw_debug(cs, bp->pc, &brk,
+                                4, MEM_DATA_LOAD) ||
             brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 4, 1)) {
+            cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
+                                4, MEM_DATA_STORE)) {
             return -EINVAL;
         }
         return 0;
diff --git a/target-i386/helper.c b/target-i386/helper.c
index 3e8d86f..8161807 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -555,7 +555,8 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 
         cpu_fprintf(f, "Code=");
         for (i = 0; i < DUMP_CODE_BYTES_TOTAL; i++) {
-            if (cpu_memory_rw_debug(cs, base - offs + i, &code, 1, 0) == 0) {
+            if (cpu_memory_rw_debug(cs, base - offs + i, &code,
+                                    1, MEM_DATA_LOAD) == 0) {
                 snprintf(codestr, sizeof(codestr), "%02x", code);
             } else {
                 snprintf(codestr, sizeof(codestr), "??");
@@ -1286,8 +1287,8 @@ int cpu_x86_get_descr_debug(CPUX86State *env, unsigned int selector,
     index = selector & ~7;
     ptr = dt->base + index;
     if ((index + 7) > dt->limit
-        || cpu_memory_rw_debug(cs, ptr, &e1, sizeof(e1), 0) != 0
-        || cpu_memory_rw_debug(cs, ptr + 4, &e2, sizeof(e2), 0) != 0)
+        || cpu_memory_rw_debug(cs, ptr, &e1, sizeof(e1), MEM_DATA_LOAD) != 0
+        || cpu_memory_rw_debug(cs, ptr + 4, &e2, sizeof(e2), MEM_DATA_LOAD) != 0)
         return 0;
 
     *base = ((e1 >> 16) | ((e2 & 0xff) << 16) | (e2 & 0xff000000));
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 46e6a64..8d01142 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -2913,8 +2913,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t int3 = 0xcc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, MEM_DATA_LOAD) ||
+        cpu_memory_rw_debug(cs, bp->pc, &int3, 1, MEM_DATA_STORE)) {
         return -EINVAL;
     }
     return 0;
@@ -2924,8 +2924,9 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t int3;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
-        cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, MEM_DATA_LOAD) ||
+        int3 != 0xcc ||
+        cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn, 1, MEM_DATA_STORE)) {
         return -EINVAL;
     }
     return 0;
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 73ac879..8ffe6e0 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1455,8 +1455,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     uint32_t sc = debug_inst_opcode;
 
     if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
-                            sizeof(sc), 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, &sc, sizeof(sc), 1)) {
+                            sizeof(sc), MEM_DATA_LOAD) ||
+        cpu_memory_rw_debug(cs, bp->pc, &sc, sizeof(sc), MEM_DATA_STORE)) {
         return -EINVAL;
     }
 
@@ -1467,10 +1467,11 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint32_t sc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, &sc, sizeof(sc), 0) ||
+    if (cpu_memory_rw_debug(cs, bp->pc, &sc,
+                            sizeof(sc), MEM_DATA_LOAD) ||
         sc != debug_inst_opcode ||
         cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
-                            sizeof(sc), 1)) {
+                            sizeof(sc), MEM_DATA_STORE)) {
         return -EINVAL;
     }
 
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index 565b1b2..c279ddb 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -672,9 +672,9 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
 
     if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
-                            sizeof(diag_501), 0) ||
+                            sizeof(diag_501), MEM_DATA_LOAD) ||
         cpu_memory_rw_debug(cs, bp->pc, diag_501,
-                            sizeof(diag_501), 1)) {
+                            sizeof(diag_501), MEM_DATA_STORE)) {
         return -EINVAL;
     }
     return 0;
@@ -684,12 +684,13 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t t[sizeof(diag_501)];
 
-    if (cpu_memory_rw_debug(cs, bp->pc, t, sizeof(diag_501), 0)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, t,
+                            sizeof(diag_501), MEM_DATA_LOAD)) {
         return -EINVAL;
     } else if (memcmp(t, diag_501, sizeof(diag_501))) {
         return -EINVAL;
     } else if (cpu_memory_rw_debug(cs, bp->pc, &bp->saved_insn,
-                                   sizeof(diag_501), 1)) {
+                                   sizeof(diag_501), MEM_DATA_STORE)) {
         return -EINVAL;
     }
 
diff --git a/target-sparc/mmu_helper.c b/target-sparc/mmu_helper.c
index 32b629f..5040603 100644
--- a/target-sparc/mmu_helper.c
+++ b/target-sparc/mmu_helper.c
@@ -398,7 +398,10 @@ int sparc_cpu_memory_rw_debug(CPUState *cs, vaddr address,
             /* Handle access before this window.  */
             if (addr < fp) {
                 len1 = fp - addr;
-                if (cpu_memory_rw_debug(cs, addr, buf, len1, is_write) != 0) {
+                if (cpu_memory_rw_debug(cs, addr, buf, len1,
+                                        is_write ?
+                                        MEM_DATA_STORE :
+                                        MEM_DATA_LOAD) != 0) {
                     return -1;
                 }
                 addr += len1;
@@ -434,7 +437,8 @@ int sparc_cpu_memory_rw_debug(CPUState *cs, vaddr address,
             }
         }
     }
-    return cpu_memory_rw_debug(cs, addr, buf, len, is_write);
+    return cpu_memory_rw_debug(cs, addr, buf, len,
+                               is_write ? MEM_DATA_STORE : MEM_DATA_LOAD);
 }
 
 #else /* !TARGET_SPARC64 */
diff --git a/target-xtensa/xtensa-semi.c b/target-xtensa/xtensa-semi.c
index ec199ac..c775375 100644
--- a/target-xtensa/xtensa-semi.c
+++ b/target-xtensa/xtensa-semi.c
@@ -202,7 +202,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             for (i = 0; i < ARRAY_SIZE(name); ++i) {
                 rc = cpu_memory_rw_debug(cs, regs[3] + i,
-                                         &name[i], 1, 0);
+                                         &name[i], 1, MEM_DATA_LOAD);
                 if (rc != 0 || name[i] == 0) {
                     break;
                 }
@@ -246,8 +246,8 @@ void HELPER(simcall)(CPUXtensaState *env)
             FD_SET(fd, &fdset);
 
             if (target_tv) {
-                cpu_memory_rw_debug(cs, target_tv,
-                                    target_tvv, sizeof(target_tvv), 0);
+                cpu_memory_rw_debug(cs, target_tv, target_tvv,
+                                    sizeof(target_tvv), MEM_DATA_LOAD);
                 tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
                 tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
             }
@@ -281,8 +281,8 @@ void HELPER(simcall)(CPUXtensaState *env)
             };
 
             argv.argptr[0] = tswap32(regs[3] + offsetof(struct Argv, text));
-            cpu_memory_rw_debug(cs,
-                                regs[3], &argv, sizeof(argv), 1);
+            cpu_memory_rw_debug(cs, regs[3], &argv,
+                                sizeof(argv), MEM_DATA_STORE);
         }
         break;
 
-- 
2.5.5

