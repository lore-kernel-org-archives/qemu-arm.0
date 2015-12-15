Received: by 10.182.158.201 with SMTP id ww9csp2759025obb;
        Tue, 15 Dec 2015 14:53:34 -0800 (PST)
X-Received: by 10.140.175.196 with SMTP id v187mr25762228qhv.75.1450220014254;
        Tue, 15 Dec 2015 14:53:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s18si3331842qhb.77.2015.12.15.14.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 14:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8yTN-0007px-W8
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 17:53:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yS2-0005HA-CJ
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yS1-0001gj-2Z
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:52:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a8yS0-0001gd-RF; Tue, 15 Dec 2015 17:52:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 624948F4E1;
	Tue, 15 Dec 2015 22:52:08 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFMpNh8024186; Tue, 15 Dec 2015 17:52:03 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2015 16:51:16 -0600
Message-Id: <1450219878-5293-8-git-send-email-drjones@redhat.com>
In-Reply-To: <1450219878-5293-1-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v3 7/9] target-arm: dump-guest-memory: add
	prfpreg notes for aarch64
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
X-TUID: 9kYsEqDfy5LR

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target-arm/arch_dump.c | 79 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
index dc32d98101004..6cbba92f3d014 100644
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
 
+static int
+aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f, CPUARMState *env,
+                            int cpuid, DumpState *s)
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
+        /* For AArch4 we must always swap the vfp.regs's 2n and 2n+1
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

