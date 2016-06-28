Received: by 10.25.21.96 with SMTP id l93csp1855567lfi;
        Tue, 28 Jun 2016 14:45:59 -0700 (PDT)
X-Received: by 10.98.192.135 with SMTP id g7mr5768888pfk.64.1467150359533;
        Tue, 28 Jun 2016 14:45:59 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w9si405409paz.164.2016.06.28.14.45.59;
        Tue, 28 Jun 2016 14:45:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752398AbcF1Vpp (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Tue, 28 Jun 2016 17:45:45 -0400
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35190 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbcF1Vpm (ORCPT <rfc822;kvm@vger.kernel.org>);
	Tue, 28 Jun 2016 17:45:42 -0400
Received: by mail-pa0-f67.google.com with SMTP id hf6so2628807pac.2
        for <kvm@vger.kernel.org>; Tue, 28 Jun 2016 14:45:08 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EazRJ4T6ns8/YnR3vXpfd7YlXtkZ/7LgHCHI3rolFsw=;
        b=oLC7Ko+QLT6cr1+FGpuA5WauiTfSTEmLIXiResnvShlfIWA/H5bSO9tQ1yWBdmSvFx
         EX0gVyM3hJkNIzExG12fVH7Y6xPxdbI/OQhRtruWr3urX3YLfl9R54TQvgfmtgnWAmyc
         49J2Y0aNXMpry7vQ5ozeNiVRLskeDdjwYhxv0xinXOe+v19pn5dCNChf91yCLMqfZDOG
         QdsdEwBf9efAnXA5j1wjnqol7gBj2nudw3WiNhfCODOcofMS3iFGQU5kdI9lw7c04XsE
         /JV3NkIDBgd7osmyP/8a0uPHj33WUr9AThyBIUQMaKyq8Pp03OCSzbyxE/bn8eunUm+h
         kuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EazRJ4T6ns8/YnR3vXpfd7YlXtkZ/7LgHCHI3rolFsw=;
        b=MViOxaSSZdFH0K3+AP0Jx5ZPUOBrvq03iAa96Q9TgT6oFLFopkofxOSvUrWagQqqRG
         B/SL9wN4FAUlmjtJuClia7nzQCyc+YUUgrhI/6yw7BljfugvPLBH6Ydd+Sf3LjSLLrOf
         k9ePxWrSTQvIL+dUAgL/FRuSMArAp54JfNhLlUPsVXZmHV4Ze6r/ccXK+V4yUKM5S90G
         Nd5fPFc6qy2uR6Rwmu4sFY9Pwv3aB4HvGrnCILpbeQpPRiYUDleh+9nL3IdTqdMUeAUv
         wim6NXoIHFb8rSorHR4tvhc7hLgirxnWtfSq+oN/SGMENOUGaYfOJeUuqp5d/PuI+keH
         +2vg==
X-Gm-Message-State: ALyK8tL9DkRWMxLTtRtpp96BhZR/ihXpGgHtmWG5WcyWER96sT6IVa32wY7xG63yIYCfUQ==
X-Received: by 10.66.218.195 with SMTP id pi3mr5668112pac.83.1467150306956;
        Tue, 28 Jun 2016 14:45:06 -0700 (PDT)
Received: from squirtle.localdomain.com ([173.226.206.194])
        by smtp.gmail.com with ESMTPSA id a87sm294596pfc.63.2016.06.28.14.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2016 14:45:06 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org (open list:PReP),
	qemu-arm@nongnu.org (open list:ARM),
	kvm@vger.kernel.org (open list:X86)
Subject: [RFC PATCH] exec: Support non-direct memory writes in cpu_memory_rw_debug
Date:	Tue, 28 Jun 2016 14:44:28 -0700
Message-Id: <1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: ka44NW7croX4

Add code to support writing to memory mapped peripherals via
cpu_memory_rw_debug(). The code of that function already supports
reading from such memory regions, so this commit makes that
functionality "symmetric".

One use-case for that functionality is setting various registers of a
non-running CPU. A concrete example would be starting QEMU emulating
Cortex-M with -S, connecting with GDB and modifying the value of Vector
Table Offset register.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 cpus.c                      |  2 +-
 disas.c                     |  4 ++--
 exec.c                      | 57 ++++++++++++++++++++++++---------------------
 gdbstub.c                   | 10 ++++----
 hw/i386/kvmvapic.c          | 18 +++++++-------
 hw/mips/mips_jazz.c         |  2 +-
 hw/pci-host/prep.c          |  2 +-
 hw/virtio/virtio.c          |  2 +-
 include/exec/cpu-all.h      |  2 +-
 include/exec/memory.h       | 15 +++++++++---
 include/exec/softmmu-semi.h | 16 ++++++-------
 ioport.c                    |  6 ++---
 monitor.c                   |  2 +-
 target-arm/arm-semi.c       |  2 +-
 target-arm/kvm64.c          |  8 +++----
 target-i386/helper.c        |  6 ++---
 target-i386/kvm.c           |  8 +++----
 target-ppc/kvm.c            |  8 +++----
 target-s390x/kvm.c          |  8 +++----
 target-xtensa/xtensa-semi.c |  6 ++---
 20 files changed, 100 insertions(+), 84 deletions(-)

diff --git a/cpus.c b/cpus.c
index 84c3520..14f0f4f 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1691,7 +1691,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
         l = sizeof(buf);
         if (l > size)
             l = size;
-        if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
+        if (cpu_memory_rw_debug(cpu, addr, buf, l, MEMTX_READ) != 0) {
             error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
                              " specified", orig_addr, orig_size);
             goto exit;
diff --git a/disas.c b/disas.c
index 05a7a12..8ceeedb 100644
--- a/disas.c
+++ b/disas.c
@@ -39,7 +39,7 @@ target_read_memory (bfd_vma memaddr,
 {
     CPUDebug *s = container_of(info, CPUDebug, info);
 
-    cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
+    cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, MEMTX_READ);
     return 0;
 }
 
@@ -358,7 +358,7 @@ monitor_read_memory (bfd_vma memaddr, bfd_byte *myaddr, int length,
     if (monitor_disas_is_physical) {
         cpu_physical_memory_read(memaddr, myaddr, length);
     } else {
-        cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
+        cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, MEMTX_READ);
     }
     return 0;
 }
diff --git a/exec.c b/exec.c
index 0122ef7..048d3d0 100644
--- a/exec.c
+++ b/exec.c
@@ -2219,7 +2219,7 @@ static MemTxResult subpage_write(void *opaque, hwaddr addr,
         abort();
     }
     return address_space_write(subpage->as, addr + subpage->base,
-                               attrs, buf, len);
+                               attrs, buf, len, false);
 }
 
 static bool subpage_accepts(void *opaque, hwaddr addr,
@@ -2436,7 +2436,7 @@ MemoryRegion *get_system_io(void)
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write)
+                        uint8_t *buf, int len, MemTxType type)
 {
     int l, flags;
     target_ulong page;
@@ -2450,7 +2450,8 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         flags = page_get_flags(page);
         if (!(flags & PAGE_VALID))
             return -1;
-        if (is_write) {
+        if (type == MEMTX_WRITE ||
+            type == MEMTX_PROGRAM) {
             if (!(flags & PAGE_WRITE))
                 return -1;
             /* XXX: this code should not depend on lock_user */
@@ -2552,7 +2553,8 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
                                                 MemTxAttrs attrs,
                                                 const uint8_t *buf,
                                                 int len, hwaddr addr1,
-                                                hwaddr l, MemoryRegion *mr)
+                                                hwaddr l, MemoryRegion *mr,
+                                                bool force)
 {
     uint8_t *ptr;
     uint64_t val;
@@ -2560,7 +2562,14 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
     bool release_lock = false;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+
+        if (memory_access_is_direct(mr, true) ||
+            (force && memory_region_is_romd(mr))) {
+            /* RAM case */
+            ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
+            memcpy(ptr, buf, l);
+            invalidate_and_set_dirty(mr, addr1, l);
+        } else {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2593,11 +2602,6 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
             default:
                 abort();
             }
-        } else {
-            /* RAM case */
-            ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
-            memcpy(ptr, buf, l);
-            invalidate_and_set_dirty(mr, addr1, l);
         }
 
         if (release_lock) {
@@ -2621,7 +2625,7 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
 }
 
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                                const uint8_t *buf, int len)
+                                const uint8_t *buf, int len, bool force)
 {
     hwaddr l;
     hwaddr addr1;
@@ -2633,7 +2637,7 @@ MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
         l = len;
         mr = address_space_translate(as, addr, &addr1, &l, true);
         result = address_space_write_continue(as, addr, attrs, buf, len,
-                                              addr1, l, mr);
+                                              addr1, l, mr, force);
         rcu_read_unlock();
     }
 
@@ -2731,12 +2735,17 @@ MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
 }
 
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                             uint8_t *buf, int len, bool is_write)
+                             uint8_t *buf, int len, MemTxType type)
 {
-    if (is_write) {
-        return address_space_write(as, addr, attrs, (uint8_t *)buf, len);
-    } else {
+    switch (type) {
+    case MEMTX_READ:
         return address_space_read(as, addr, attrs, (uint8_t *)buf, len);
+    case MEMTX_WRITE:
+        return address_space_write(as, addr, attrs, (uint8_t *)buf, len, false);
+    case MEMTX_PROGRAM:
+        return address_space_write(as, addr, attrs, (uint8_t *)buf, len, true);
+    default:
+        abort();
     }
 }
 
@@ -3010,7 +3019,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
     }
     if (is_write) {
         address_space_write(as, bounce.addr, MEMTXATTRS_UNSPECIFIED,
-                            bounce.buffer, access_len);
+                            bounce.buffer, access_len, false);
     }
     qemu_vfree(bounce.buffer);
     bounce.buffer = NULL;
@@ -3626,7 +3635,7 @@ void stq_be_phys(AddressSpace *as, hwaddr addr, uint64_t val)
 
 /* virtual memory access for debug (includes writing to ROM) */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write)
+                        uint8_t *buf, int len, MemTxType type)
 {
     int l;
     hwaddr phys_addr;
@@ -3646,14 +3655,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         if (l > len)
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
-        if (is_write) {
-            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
-                                          phys_addr, buf, l);
-        } else {
-            address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
-                             MEMTXATTRS_UNSPECIFIED,
-                             buf, l, 0);
-        }
+
+        address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
+                         MEMTXATTRS_UNSPECIFIED,
+                         buf, l, type);
         len -= l;
         buf += l;
         addr += l;
diff --git a/gdbstub.c b/gdbstub.c
index 5da66f1..afccce0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -44,14 +44,16 @@
 #endif
 
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                                         uint8_t *buf, int len, bool is_write)
+                                         uint8_t *buf, int len, MemTxType type)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (cc->memory_rw_debug) {
+        const bool is_write = (type == MEMTX_WRITE ||
+                               type == MEMTX_PROGRAM);
         return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
-    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+    return cpu_memory_rw_debug(cpu, addr, buf, len, type);
 }
 
 enum {
@@ -965,7 +967,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             break;
         }
 
-        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) != 0) {
+        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, MEMTX_READ) != 0) {
             put_packet (s, "E14");
         } else {
             memtohex(buf, mem_buf, len);
@@ -987,7 +989,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         hextomem(mem_buf, p, len);
         if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
-                                   true) != 0) {
+                                   MEMTX_PROGRAM) != 0) {
             put_packet(s, "E14");
         } else {
             put_packet(s, "OK");
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 3bf1ddd..839686a 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -233,7 +233,7 @@ static int evaluate_tpr_instruction(VAPICROMState *s, X86CPU *cpu,
                 continue;
             }
             if (cpu_memory_rw_debug(cs, ip - instr->length, opcode,
-                                    sizeof(opcode), 0) < 0) {
+                                    sizeof(opcode), MEMTX_READ) < 0) {
                 return -1;
             }
             if (opcode_matches(opcode, instr)) {
@@ -243,7 +243,7 @@ static int evaluate_tpr_instruction(VAPICROMState *s, X86CPU *cpu,
         }
         return -1;
     } else {
-        if (cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), 0) < 0) {
+        if (cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), MEMTX_READ) < 0) {
             return -1;
         }
         for (i = 0; i < ARRAY_SIZE(tpr_instr); i++) {
@@ -262,7 +262,7 @@ instruction_ok:
      */
     if (cpu_memory_rw_debug(cs, ip + instr->addr_offset,
                             (void *)&real_tpr_addr,
-                            sizeof(real_tpr_addr), 0) < 0) {
+                            sizeof(real_tpr_addr), MEMTX_READ) < 0) {
         return -1;
     }
     real_tpr_addr = le32_to_cpu(real_tpr_addr);
@@ -349,7 +349,7 @@ static int get_kpcr_number(X86CPU *cpu)
     } QEMU_PACKED kpcr;
 
     if (cpu_memory_rw_debug(CPU(cpu), env->segs[R_FS].base,
-                            (void *)&kpcr, sizeof(kpcr), 0) < 0 ||
+                            (void *)&kpcr, sizeof(kpcr), MEMTX_READ) < 0 ||
         kpcr.self != env->segs[R_FS].base) {
         return -1;
     }
@@ -378,7 +378,7 @@ static int vapic_enable(VAPICROMState *s, X86CPU *cpu)
 
 static void patch_byte(X86CPU *cpu, target_ulong addr, uint8_t byte)
 {
-    cpu_memory_rw_debug(CPU(cpu), addr, &byte, 1, 1);
+    cpu_memory_rw_debug(CPU(cpu), addr, &byte, 1, MEMTX_WRITE);
 }
 
 static void patch_call(VAPICROMState *s, X86CPU *cpu, target_ulong ip,
@@ -388,7 +388,7 @@ static void patch_call(VAPICROMState *s, X86CPU *cpu, target_ulong ip,
 
     offset = cpu_to_le32(target - ip - 5);
     patch_byte(cpu, ip, 0xe8); /* call near */
-    cpu_memory_rw_debug(CPU(cpu), ip + 1, (void *)&offset, sizeof(offset), 1);
+    cpu_memory_rw_debug(CPU(cpu), ip + 1, (void *)&offset, sizeof(offset), MEMTX_WRITE);
 }
 
 static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
@@ -415,7 +415,7 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
 
     pause_all_vcpus();
 
-    cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), 0);
+    cpu_memory_rw_debug(cs, ip, opcode, sizeof(opcode), MEMTX_READ);
 
     switch (opcode[0]) {
     case 0x89: /* mov r32 to r/m32 */
@@ -434,8 +434,8 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
         break;
     case 0xc7: /* mov imm32, r/m32 (c7/0) */
         patch_byte(cpu, ip, 0x68);  /* push imm32 */
-        cpu_memory_rw_debug(cs, ip + 6, (void *)&imm32, sizeof(imm32), 0);
-        cpu_memory_rw_debug(cs, ip + 1, (void *)&imm32, sizeof(imm32), 1);
+        cpu_memory_rw_debug(cs, ip + 6, (void *)&imm32, sizeof(imm32), MEMTX_READ);
+        cpu_memory_rw_debug(cs, ip + 1, (void *)&imm32, sizeof(imm32), MEMTX_WRITE);
         patch_call(s, cpu, ip + 5, handlers->set_tpr);
         break;
     case 0xff: /* push r/m32 */
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 73f6c9f..1bf8d59 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -73,7 +73,7 @@ static void rtc_write(void *opaque, hwaddr addr,
 {
     uint8_t buf = val & 0xff;
     address_space_write(&address_space_memory, 0x90000071,
-                        MEMTXATTRS_UNSPECIFIED, &buf, 1);
+                        MEMTXATTRS_UNSPECIFIED, &buf, 1, false);
 }
 
 static const MemoryRegionOps rtc_ops = {
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 487e32e..da3e227 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -175,7 +175,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
     }
 
     address_space_write(&s->pci_io_as, addr + 0x80000000,
-                        MEMTXATTRS_UNSPECIFIED, buf, size);
+                        MEMTXATTRS_UNSPECIFIED, buf, size, false);
 }
 
 static const MemoryRegionOps raven_io_ops = {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7ed06ea..23f71d0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -164,7 +164,7 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     virtio_tswap32s(vq->vdev, &uelem->len);
     pa = vq->vring.used + offsetof(VRingUsed, ring[i]);
     address_space_write(&address_space_memory, pa, MEMTXATTRS_UNSPECIFIED,
-                       (void *)uelem, sizeof(VRingUsedElem));
+                        (void *)uelem, sizeof(VRingUsedElem), false);
 }
 
 static uint16_t vring_used_idx(VirtQueue *vq)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9f38edf..d5b4966 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -302,6 +302,6 @@ void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
 #endif /* !CONFIG_USER_ONLY */
 
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        uint8_t *buf, int len, int is_write);
+                        uint8_t *buf, int len, MemTxType type);
 
 #endif /* CPU_ALL_H */
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4ab6800..8fbaf1b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -14,6 +14,13 @@
 #ifndef MEMORY_H
 #define MEMORY_H
 
+typedef enum {
+    MEMTX_READ,
+    MEMTX_WRITE,
+    MEMTX_PROGRAM,
+} MemTxType;
+
+
 #ifndef CONFIG_USER_ONLY
 
 #define DIRTY_MEMORY_VGA       0
@@ -1240,6 +1247,7 @@ AddressSpace *address_space_init_shareable(MemoryRegion *root,
  */
 void address_space_destroy(AddressSpace *as);
 
+
 /**
  * address_space_rw: read from or write to an address space.
  *
@@ -1251,11 +1259,11 @@ void address_space_destroy(AddressSpace *as);
  * @addr: address within that address space
  * @attrs: memory transaction attributes
  * @buf: buffer with the data transferred
- * @is_write: indicates the transfer direction
+ * @type: indicates the transfer type
  */
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
                              MemTxAttrs attrs, uint8_t *buf,
-                             int len, bool is_write);
+                             int len, MemTxType type);
 
 /**
  * address_space_write: write to address space.
@@ -1268,10 +1276,11 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
  * @addr: address within that address space
  * @attrs: memory transaction attributes
  * @buf: buffer with the data transferred
+ * @force: force writing to ROM areas
  */
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, int len);
+                                const uint8_t *buf, int len, bool force);
 
 /* address_space_ld*: load from an address space
  * address_space_st*: store to an address space
diff --git a/include/exec/softmmu-semi.h b/include/exec/softmmu-semi.h
index 3a58c3f..25d1fe1 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/exec/softmmu-semi.h
@@ -13,7 +13,7 @@ static inline uint64_t softmmu_tget64(CPUArchState *env, target_ulong addr)
 {
     uint64_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, MEMTX_READ);
     return tswap64(val);
 }
 
@@ -21,7 +21,7 @@ static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
 {
     uint32_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, MEMTX_READ);
     return tswap32(val);
 }
 
@@ -29,7 +29,7 @@ static inline uint32_t softmmu_tget8(CPUArchState *env, target_ulong addr)
 {
     uint8_t val;
 
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 1, 0);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &val, 1, MEMTX_READ);
     return val;
 }
 
@@ -42,14 +42,14 @@ static inline void softmmu_tput64(CPUArchState *env,
                                   target_ulong addr, uint64_t val)
 {
     val = tswap64(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 8, MEMTX_WRITE);
 }
 
 static inline void softmmu_tput32(CPUArchState *env,
                                   target_ulong addr, uint32_t val)
 {
     val = tswap32(val);
-    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, 1);
+    cpu_memory_rw_debug(ENV_GET_CPU(env), addr, (uint8_t *)&val, 4, MEMTX_WRITE);
 }
 #define put_user_u64(arg, p) ({ softmmu_tput64(env, p, arg) ; 0; })
 #define put_user_u32(arg, p) ({ softmmu_tput32(env, p, arg) ; 0; })
@@ -62,7 +62,7 @@ static void *softmmu_lock_user(CPUArchState *env,
     /* TODO: Make this something that isn't fixed size.  */
     p = malloc(len);
     if (p && copy) {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, 0);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, MEMTX_READ);
     }
     return p;
 }
@@ -78,7 +78,7 @@ static char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
         return NULL;
     }
     do {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &c, 1, 0);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, &c, 1, MEMTX_READ);
         addr++;
         *(p++) = c;
     } while (c);
@@ -89,7 +89,7 @@ static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
                                 target_ulong len)
 {
     if (len) {
-        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, 1);
+        cpu_memory_rw_debug(ENV_GET_CPU(env), addr, p, len, MEMTX_READ);
     }
     free(p);
 }
diff --git a/ioport.c b/ioport.c
index 94e08ab..41f3e43 100644
--- a/ioport.c
+++ b/ioport.c
@@ -59,7 +59,7 @@ void cpu_outb(uint32_t addr, uint8_t val)
 {
     trace_cpu_out(addr, 'b', val);
     address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        &val, 1);
+                        &val, 1, false);
 }
 
 void cpu_outw(uint32_t addr, uint16_t val)
@@ -69,7 +69,7 @@ void cpu_outw(uint32_t addr, uint16_t val)
     trace_cpu_out(addr, 'w', val);
     stw_p(buf, val);
     address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 2);
+                        buf, 2, false);
 }
 
 void cpu_outl(uint32_t addr, uint32_t val)
@@ -79,7 +79,7 @@ void cpu_outl(uint32_t addr, uint32_t val)
     trace_cpu_out(addr, 'l', val);
     stl_p(buf, val);
     address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 4);
+                        buf, 4, false);
 }
 
 uint8_t cpu_inb(uint32_t addr)
diff --git a/monitor.c b/monitor.c
index a27e115..862db2b 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1268,7 +1268,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         if (is_physical) {
             cpu_physical_memory_read(addr, buf, l);
         } else {
-            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) < 0) {
+            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, MEMTX_READ) < 0) {
                 monitor_printf(mon, " Cannot access memory\n");
                 break;
             }
diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index 8be0645..e9ee204 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -187,7 +187,7 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     /* The size is always stored in big-endian order, extract
        the value. We assume the size always fit in 32 bits.  */
     uint32_t size;
-    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, (uint8_t *)&size, 4, 0);
+    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, (uint8_t *)&size, 4, MEMTX_READ);
     size = be32_to_cpu(size);
     if (is_a64(env)) {
         env->xregs[0] = size;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 5faa76c..6f69e13 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -874,8 +874,8 @@ static const uint32_t brk_insn = 0xd4200000;
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, MEMTX_READ) ||
+            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, MEMTX_WRITE)) {
             return -EINVAL;
         }
         return 0;
@@ -890,9 +890,9 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     static uint32_t brk;
 
     if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, MEMTX_READ) ||
             brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, MEMTX_WRITE)) {
             return -EINVAL;
         }
         return 0;
diff --git a/target-i386/helper.c b/target-i386/helper.c
index 1c250b8..28c7646 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -555,7 +555,7 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 
         cpu_fprintf(f, "Code=");
         for (i = 0; i < DUMP_CODE_BYTES_TOTAL; i++) {
-            if (cpu_memory_rw_debug(cs, base - offs + i, &code, 1, 0) == 0) {
+            if (cpu_memory_rw_debug(cs, base - offs + i, &code, 1, MEMTX_READ) == 0) {
                 snprintf(codestr, sizeof(codestr), "%02x", code);
             } else {
                 snprintf(codestr, sizeof(codestr), "??");
@@ -1286,8 +1286,8 @@ int cpu_x86_get_descr_debug(CPUX86State *env, unsigned int selector,
     index = selector & ~7;
     ptr = dt->base + index;
     if ((index + 7) > dt->limit
-        || cpu_memory_rw_debug(cs, ptr, (uint8_t *)&e1, sizeof(e1), 0) != 0
-        || cpu_memory_rw_debug(cs, ptr+4, (uint8_t *)&e2, sizeof(e2), 0) != 0)
+        || cpu_memory_rw_debug(cs, ptr, (uint8_t *)&e1, sizeof(e1), MEMTX_READ) != 0
+        || cpu_memory_rw_debug(cs, ptr+4, (uint8_t *)&e2, sizeof(e2), MEMTX_READ) != 0)
         return 0;
 
     *base = ((e1 >> 16) | ((e2 & 0xff) << 16) | (e2 & 0xff000000));
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index ff92b1d..21ee5aa 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -2866,8 +2866,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static const uint8_t int3 = 0xcc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&int3, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, MEMTX_READ) ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&int3, 1, MEMTX_WRITE)) {
         return -EINVAL;
     }
     return 0;
@@ -2877,8 +2877,8 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t int3;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, 0) || int3 != 0xcc ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, 1)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, &int3, 1, MEMTX_READ) || int3 != 0xcc ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 1, MEMTX_WRITE)) {
         return -EINVAL;
     }
     return 0;
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 1620864..071d3db 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1433,8 +1433,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     uint32_t sc = debug_inst_opcode;
 
     if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
-                            sizeof(sc), 0) ||
-        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), 1)) {
+                            sizeof(sc), MEMTX_READ) ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), MEMTX_WRITE)) {
         return -EINVAL;
     }
 
@@ -1445,10 +1445,10 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint32_t sc;
 
-    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), 0) ||
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&sc, sizeof(sc), MEMTX_READ) ||
         sc != debug_inst_opcode ||
         cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
-                            sizeof(sc), 1)) {
+                            sizeof(sc), MEMTX_WRITE)) {
         return -EINVAL;
     }
 
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index 45e94ca..6587744 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -672,9 +672,9 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
 
     if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
-                            sizeof(diag_501), 0) ||
+                            sizeof(diag_501), MEMTX_READ) ||
         cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)diag_501,
-                            sizeof(diag_501), 1)) {
+                            sizeof(diag_501), MEMTX_WIRTE)) {
         return -EINVAL;
     }
     return 0;
@@ -684,12 +684,12 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t t[sizeof(diag_501)];
 
-    if (cpu_memory_rw_debug(cs, bp->pc, t, sizeof(diag_501), 0)) {
+    if (cpu_memory_rw_debug(cs, bp->pc, t, sizeof(diag_501), MEMTX_READ)) {
         return -EINVAL;
     } else if (memcmp(t, diag_501, sizeof(diag_501))) {
         return -EINVAL;
     } else if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,
-                                   sizeof(diag_501), 1)) {
+                                   sizeof(diag_501), MEMTX_WRITE)) {
         return -EINVAL;
     }
 
diff --git a/target-xtensa/xtensa-semi.c b/target-xtensa/xtensa-semi.c
index 370e365..c047330 100644
--- a/target-xtensa/xtensa-semi.c
+++ b/target-xtensa/xtensa-semi.c
@@ -202,7 +202,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             for (i = 0; i < ARRAY_SIZE(name); ++i) {
                 rc = cpu_memory_rw_debug(cs, regs[3] + i,
-                                         (uint8_t *)name + i, 1, 0);
+                                         (uint8_t *)name + i, 1, MEMTX_READ);
                 if (rc != 0 || name[i] == 0) {
                     break;
                 }
@@ -247,7 +247,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             if (target_tv) {
                 cpu_memory_rw_debug(cs, target_tv,
-                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
+                        (uint8_t *)target_tvv, sizeof(target_tvv), MEMTX_READ);
                 tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
                 tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
             }
@@ -282,7 +282,7 @@ void HELPER(simcall)(CPUXtensaState *env)
 
             argv.argptr[0] = tswap32(regs[3] + offsetof(struct Argv, text));
             cpu_memory_rw_debug(cs,
-                                regs[3], (uint8_t *)&argv, sizeof(argv), 1);
+                                regs[3], (uint8_t *)&argv, sizeof(argv), MEMTX_WRITE);
         }
         break;
 
-- 
2.5.5

