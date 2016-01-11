Received: by 10.25.159.19 with SMTP id i19csp103197lfe;
        Mon, 11 Jan 2016 11:59:14 -0800 (PST)
X-Received: by 10.55.71.143 with SMTP id u137mr165988748qka.1.1452542354495;
        Mon, 11 Jan 2016 11:59:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si38719493qgb.59.2016.01.11.11.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:59:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIicT-0007rj-RH
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:59:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaD-0003TR-3A
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaB-0002wD-Uj
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIia9-0002vS-4g; Mon, 11 Jan 2016 14:56:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id AA9BFC09FA81;
	Mon, 11 Jan 2016 19:56:48 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1n012743; Mon, 11 Jan 2016 14:56:46 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:23 +0100
Message-Id: <1452542185-10914-7-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-devel] [PATCH v4 6/8] target-arm: dump-guest-memory: add
	prfpreg notes for aarch64
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
X-TUID: ef191IpyZPYb

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/arch_dump.c | 79 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
index f7a4873787d07..d7b63a0d7ee91 100644
--- a/target-arm/arch_dump.c
+++ b/target-arm/arch_dump.c
@@ -45,13 +45,36 @@ struct aarch64_elf_prstatus {
 
 QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
 
+/* struct user_fpsimd_state from arch/arm64/include/uapi/asm/ptrace.h
+ *
+ * While the vregs member of user_fpsimd_state is of type __uint128_t,
+ * QEMU uses an array of uint64_t, where the high half of the 128-bit
+ * value is always in the 2n+1'th index. Thus we also break the 128-
+ * bit values into two halves in this reproduction of user_fpsimd_state.
+ */
+struct aarch64_user_vfp_state {
+    uint64_t vregs[64];
+    uint32_t fpsr;
+    uint32_t fpcr;
+    char pad[8];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
+
 struct aarch64_note {
     Elf64_Nhdr hdr;
     char name[8]; /* align_up(sizeof("CORE"), 4) */
-    struct aarch64_elf_prstatus prstatus;
+    union {
+        struct aarch64_elf_prstatus prstatus;
+        struct aarch64_user_vfp_state vfp;
+    };
 } QEMU_PACKED;
 
-QEMU_BUILD_BUG_ON(sizeof(struct aarch64_note) != 412);
+#define AARCH64_NOTE_HEADER_SIZE offsetof(struct aarch64_note, prstatus)
+#define AARCH64_PRSTATUS_NOTE_SIZE \
+            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus))
+#define AARCH64_PRFPREG_NOTE_SIZE \
+            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
 
 static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
                               const char *name, Elf64_Word namesz,
@@ -66,6 +89,42 @@ static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
     memcpy(note->name, name, namesz);
 }
 
+static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
+                                       CPUARMState *env, int cpuid,
+                                       DumpState *s)
+{
+    struct aarch64_note note;
+    int ret, i;
+
+    aarch64_note_init(&note, s, "CORE", 5, NT_PRFPREG, sizeof(note.vfp));
+
+    for (i = 0; i < 64; ++i) {
+        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
+    }
+
+    if (s->dump_info.d_endian == ELFDATA2MSB) {
+        /* For AArch64 we must always swap the vfp.regs's 2n and 2n+1
+         * entries when generating BE notes, because even big endian
+         * hosts use 2n+1 for the high half.
+         */
+        for (i = 0; i < 32; ++i) {
+            uint64_t tmp = note.vfp.vregs[2*i];
+            note.vfp.vregs[2*i] = note.vfp.vregs[2*i+1];
+            note.vfp.vregs[2*i+1] = tmp;
+        }
+    }
+
+    note.vfp.fpsr = cpu_to_dump32(s, vfp_get_fpsr(env));
+    note.vfp.fpcr = cpu_to_dump32(s, vfp_get_fpcr(env));
+
+    ret = f(&note, AARCH64_PRFPREG_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
 {
@@ -78,6 +137,7 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     aarch64_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
 
     note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+    note.prstatus.pr_fpvalid = cpu_to_dump32(s, 1);
 
     if (!is_a64(env)) {
         aarch64_sync_32_to_64(env);
@@ -95,12 +155,12 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
     note.prstatus.pr_reg.pstate = cpu_to_dump64(s, pstate);
 
-    ret = f(&note, sizeof(note), s);
+    ret = f(&note, AARCH64_PRSTATUS_NOTE_SIZE, s);
     if (ret < 0) {
         return -1;
     }
 
-    return 0;
+    return aarch64_write_elf64_prfpreg(f, env, cpuid, s);
 }
 
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
@@ -129,7 +189,9 @@ struct arm_note {
     struct arm_elf_prstatus prstatus;
 } QEMU_PACKED;
 
-QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
+#define ARM_NOTE_HEADER_SIZE offsetof(struct arm_note, prstatus)
+#define ARM_PRSTATUS_NOTE_SIZE \
+            (ARM_NOTE_HEADER_SIZE + sizeof(struct arm_elf_prstatus))
 
 static void arm_note_init(struct arm_note *note, DumpState *s,
                           const char *name, Elf32_Word namesz,
@@ -161,7 +223,7 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
     }
     note.prstatus.pr_reg.regs[16] = cpu_to_dump32(s, cpsr_read(env));
 
-    ret = f(&note, sizeof(note), s);
+    ret = f(&note, ARM_PRSTATUS_NOTE_SIZE, s);
     if (ret < 0) {
         return -1;
     }
@@ -221,9 +283,10 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
-        note_size = sizeof(struct aarch64_note);
+        note_size = AARCH64_PRSTATUS_NOTE_SIZE;
+        note_size += AARCH64_PRFPREG_NOTE_SIZE;
     } else {
-        note_size = sizeof(struct arm_note);
+        note_size = ARM_PRSTATUS_NOTE_SIZE;
     }
 
     return note_size * nr_cpus;
-- 
2.4.3

