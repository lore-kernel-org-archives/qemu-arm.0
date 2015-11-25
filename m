Received: by 10.182.158.201 with SMTP id ww9csp2404439obb;
        Tue, 24 Nov 2015 16:38:39 -0800 (PST)
X-Received: by 10.31.142.10 with SMTP id q10mr29254850vkd.95.1448411919720;
        Tue, 24 Nov 2015 16:38:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k79si20994085vki.44.2015.11.24.16.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:38:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1O6Z-0006Dh-9b
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:38:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6Q-0005u1-0L
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6O-0002MV-6k
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1O6N-0002MP-Tf; Tue, 24 Nov 2015 19:38:28 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 94DADA35A1;
	Wed, 25 Nov 2015 00:38:27 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP0c1s2014074; Tue, 24 Nov 2015 19:38:23 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 19:37:56 -0500
Message-Id: <1448411877-22019-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1448411877-22019-1-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v2 5/6] target-arm: support QMP dump-guest-memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5RqKEjYFO6hD

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
index 0000000000000..5debe549d721d
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
+#define NOTE_NAME       "CORE"
+#define NOTE_NAMESZ     5
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
+    int pr_fpvalid;
+    char pad3[4];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
+
+struct aarch64_note {
+    Elf64_Nhdr hdr;
+    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
+    struct aarch64_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
+
+static int
+aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
+                         int id, DumpState *s)
+{
+    struct aarch64_note note;
+    int ret, i;
+
+    memset(&note, 0, sizeof(note));
+
+    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
+    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
+    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
+
+    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
+    note.prstatus.pr_pid = cpu_to_dump32(s, id);
+
+    if (is_a64(env)) {
+        for (i = 0; i < 31; ++i) {
+            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->xregs[i]);
+        }
+        note.prstatus.pr_reg.sp = cpu_to_dump64(s, env->xregs[31]);
+        note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
+        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate_read(env));
+    } else {
+        aarch64_sync_64_to_32(env);
+        for (i = 0; i < 16; ++i) {
+            note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->regs[i]);
+        }
+        note.prstatus.pr_reg.sp = note.prstatus.pr_reg.regs[13];
+        note.prstatus.pr_reg.pc = note.prstatus.pr_reg.regs[15];
+        note.prstatus.pr_reg.pstate = cpu_to_dump64(s, cpsr_read(env));
+    }
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
+    int pr_fpvalid;
+} QEMU_PACKED arm_elf_prstatus;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
+
+struct arm_note {
+    Elf32_Nhdr hdr;
+    char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
+    struct arm_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
+
+static int
+arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
+                     int id, DumpState *s)
+{
+    struct arm_note note;
+    int ret, i;
+
+    memset(&note, 0, sizeof(note));
+
+    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
+    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
+    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
+
+    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
+    note.prstatus.pr_pid = cpu_to_dump32(s, id);
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
+int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque)
+{
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    int ret;
+
+    if (arm_el_is_aa64(env, 1)) {
+        ret = aarch64_write_elf64_note(f, env, cpuid, opaque);
+    } else {
+        ret = arm_write_elf32_note(f, env, cpuid, opaque);
+    }
+    return ret;
+}
+
+int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque)
+{
+    return arm_write_elf32_note(f, &ARM_CPU(cs)->env, cpuid, opaque);
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
+    if (arm_el_is_aa64(env, 1)) {
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
index 30739fc0dfa74..db91a3f9eb467 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1428,6 +1428,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->disas_set_info = arm_disas_set_info;
 
+    cc->write_elf64_note = arm_cpu_write_elf64_note;
+    cc->write_elf32_note = arm_cpu_write_elf32_note;
+
     /*
      * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
      * the object in cpus -> dangling pointer after final
-- 
2.4.3

