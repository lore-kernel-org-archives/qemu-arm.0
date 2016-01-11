Received: by 10.25.159.19 with SMTP id i19csp102575lfe;
        Mon, 11 Jan 2016 11:57:42 -0800 (PST)
X-Received: by 10.140.98.53 with SMTP id n50mr170887891qge.9.1452542261886;
        Mon, 11 Jan 2016 11:57:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x145si38809130qka.105.2016.01.11.11.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIiaz-0004fZ-G4
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:57:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaC-0003R2-6N
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaA-0002vv-Fv
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIia6-0002uY-Js; Mon, 11 Jan 2016 14:56:46 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 248996E77E;
	Mon, 11 Jan 2016 19:56:46 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1m012743; Mon, 11 Jan 2016 14:56:44 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:22 +0100
Message-Id: <1452542185-10914-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-devel] [PATCH v4 5/8] target-arm: support QMP
	dump-guest-memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: atub4KFBiQvY

Add the support needed for creating prstatus elf notes. This
allows us to use QMP dump-guest-memory.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target-arm/Makefile.objs |   3 +-
 target-arm/arch_dump.c   | 230 +++++++++++++++++++++++++++++++++++++++++++++++
 target-arm/cpu-qom.h     |   5 ++
 target-arm/cpu.c         |   3 +
 4 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 target-arm/arch_dump.c

diff --git a/target-arm/Makefile.objs b/target-arm/Makefile.objs
index 9460b409a5a1c..a80eb39743a78 100644
--- a/target-arm/Makefile.objs
+++ b/target-arm/Makefile.objs
@@ -1,5 +1,5 @@
 obj-y += arm-semi.o
-obj-$(CONFIG_SOFTMMU) += machine.o
+obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
@@ -7,6 +7,5 @@ obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
 obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o
 obj-y += gdbstub.o
-obj-$(CONFIG_SOFTMMU) += psci.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
 obj-y += crypto_helper.o
diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
new file mode 100644
index 0000000000000..f7a4873787d07
--- /dev/null
+++ b/target-arm/arch_dump.c
@@ -0,0 +1,230 @@
+/* Support for writing ELF notes for ARM architectures
+ *
+ * Copyright (C) 2015 Red Hat Inc.
+ *
+ * Author: Andrew Jones <drjones@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "cpu.h"
+#include "elf.h"
+#include "sysemu/dump.h"
+
+/* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
+struct aarch64_user_regs {
+    uint64_t regs[31];
+    uint64_t sp;
+    uint64_t pc;
+    uint64_t pstate;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
+
+/* struct elf_prstatus from include/uapi/linux/elfcore.h */
+struct aarch64_elf_prstatus {
+    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct aarch64_user_regs pr_reg;
+    uint32_t pr_fpvalid;
+    char pad3[4];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
+
+struct aarch64_note {
+    Elf64_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct aarch64_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
+
+static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
+                              const char *name, Elf64_Word namesz,
+                              Elf64_Word type, Elf64_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque)
+{
+    struct aarch64_note note;
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    DumpState *s = opaque;
+    uint64_t pstate, sp;
+    int ret, i;
+
+    aarch64_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    if (!is_a64(env)) {
+        aarch64_sync_32_to_64(env);
+        pstate = cpsr_read(env);
+        sp = 0;
+    } else {
+        pstate = pstate_read(env);
+        sp = env->xregs[31];
+    }
+
+    for (i = 0; i < 31; ++i) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
+    }
+    note.prstatus.pr_reg.sp = cpu_to_dump64(s, sp);
+    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
+    note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate);
+
+    ret = f(&note, sizeof(note), s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
+/* struct pt_regs from arch/arm/include/asm/ptrace.h */
+struct arm_user_regs {
+    uint32_t regs[17];
+    char pad[4];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
+
+/* struct elf_prstatus from include/uapi/linux/elfcore.h */
+struct arm_elf_prstatus {
+    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct arm_user_regs pr_reg;
+    uint32_t pr_fpvalid;
+} QEMU_PACKED arm_elf_prstatus;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
+
+struct arm_note {
+    Elf32_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct arm_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
+
+static void arm_note_init(struct arm_note *note, DumpState *s,
+                          const char *name, Elf32_Word namesz,
+                          Elf32_Word type, Elf32_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque)
+{
+    struct arm_note note;
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    DumpState *s = opaque;
+    int ret, i;
+
+    arm_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    for (i = 0; i < 16; ++i) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->regs[i]);
+    }
+    note.prstatus.pr_reg.regs[16] = cpu_to_dump32(s, cpsr_read(env));
+
+    ret = f(&note, sizeof(note), s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
+int cpu_get_dump_info(ArchDumpInfo *info,
+                      const GuestPhysBlockList *guest_phys_blocks)
+{
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+    CPUARMState *env = &cpu->env;
+    GuestPhysBlock *block;
+    hwaddr lowest_addr = ULLONG_MAX;
+
+    /* Take a best guess at the phys_base. If we get it wrong then crash
+     * will need '--machdep phys_offset=<phys-offset>' added to its command
+     * line, which isn't any worse than assuming we can use zero, but being
+     * wrong. This is the same algorithm the crash utility uses when
+     * attempting to guess as it loads non-dumpfile formatted files.
+     */
+    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
+        if (block->target_start < lowest_addr) {
+            lowest_addr = block->target_start;
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        info->d_machine = EM_AARCH64;
+        info->d_class = ELFCLASS64;
+        info->page_size = (1 << 16); /* aarch64 max pagesize */
+        if (lowest_addr != ULLONG_MAX) {
+            info->phys_base = lowest_addr;
+        }
+    } else {
+        info->d_machine = EM_ARM;
+        info->d_class = ELFCLASS32;
+        info->page_size = (1 << 12);
+        if (lowest_addr < UINT_MAX) {
+            info->phys_base = lowest_addr;
+        }
+    }
+
+    /* We assume the relevant endianness is that of EL1; this is right
+     * for kernels, but might give the wrong answer if you're trying to
+     * dump a hypervisor that happens to be running an opposite-endian
+     * kernel.
+     */
+    info->d_endian = (env->cp15.sctlr_el[1] & SCTLR_EE) != 0
+                     ? ELFDATA2MSB : ELFDATA2LSB;
+
+    return 0;
+}
+
+ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
+{
+    size_t note_size;
+
+    if (class == ELFCLASS64) {
+        note_size = sizeof(struct aarch64_note);
+    } else {
+        note_size = sizeof(struct arm_note);
+    }
+
+    return note_size * nr_cpus;
+}
diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 25fb1ce0f3f3d..5bd9b7bb9fa7e 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -221,6 +221,11 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
+int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque);
+int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque);
+
 /* Callback functions for the generic timer's timers. */
 void arm_gt_ptimer_cb(void *opaque);
 void arm_gt_vtimer_cb(void *opaque);
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 35a1f1266155a..27510ccd0f068 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1429,6 +1429,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->disas_set_info = arm_disas_set_info;
 
+    cc->write_elf64_note = arm_cpu_write_elf64_note;
+    cc->write_elf32_note = arm_cpu_write_elf32_note;
+
     /*
      * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
      * the object in cpus -> dangling pointer after final
-- 
2.4.3

