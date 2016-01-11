Received: by 10.25.159.19 with SMTP id i19csp102977lfe;
        Mon, 11 Jan 2016 11:58:38 -0800 (PST)
X-Received: by 10.140.129.203 with SMTP id 194mr93820896qhb.57.1452542318239;
        Mon, 11 Jan 2016 11:58:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62si23883510qhc.82.2016.01.11.11.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIibt-00072B-UG
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:58:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaG-0003ZA-AT
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaE-0002xJ-Fr
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIiaE-0002x3-8t; Mon, 11 Jan 2016 14:56:54 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id AEEBE1304;
	Mon, 11 Jan 2016 19:56:53 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1p012743; Mon, 11 Jan 2016 14:56:51 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:25 +0100
Message-Id: <1452542185-10914-9-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v4 8/8] target-arm: dump-guest-memory: add vfp
	notes for arm
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
X-TUID: Sskaio99p24i

gdb won't actually dump these with 'info all-registers' since
it first tries to confirm that it should by checking the VFP
hwcap in the .auxv note. Well, we don't generate an .auxv note.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/arch_dump.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
index d7b63a0d7ee91..f45125ffe6b0b 100644
--- a/target-arm/arch_dump.c
+++ b/target-arm/arch_dump.c
@@ -183,15 +183,28 @@ struct arm_elf_prstatus {
 
 QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
 
+/* struct user_vfp from arch/arm/include/asm/user.h */
+struct arm_user_vfp_state {
+    uint64_t vregs[32];
+    uint32_t fpscr;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_user_vfp_state) != 260);
+
 struct arm_note {
     Elf32_Nhdr hdr;
-    char name[8]; /* align_up(sizeof("CORE"), 4) */
-    struct arm_elf_prstatus prstatus;
+    char name[8]; /* align_up(sizeof("LINUX"), 4) */
+    union {
+        struct arm_elf_prstatus prstatus;
+        struct arm_user_vfp_state vfp;
+    };
 } QEMU_PACKED;
 
 #define ARM_NOTE_HEADER_SIZE offsetof(struct arm_note, prstatus)
 #define ARM_PRSTATUS_NOTE_SIZE \
             (ARM_NOTE_HEADER_SIZE + sizeof(struct arm_elf_prstatus))
+#define ARM_VFP_NOTE_SIZE \
+            (ARM_NOTE_HEADER_SIZE + sizeof(struct arm_user_vfp_state))
 
 static void arm_note_init(struct arm_note *note, DumpState *s,
                           const char *name, Elf32_Word namesz,
@@ -206,17 +219,40 @@ static void arm_note_init(struct arm_note *note, DumpState *s,
     memcpy(note->name, name, namesz);
 }
 
+static int arm_write_elf32_vfp(WriteCoreDumpFunction f, CPUARMState *env,
+                               int cpuid, DumpState *s)
+{
+    struct arm_note note;
+    int ret, i;
+
+    arm_note_init(&note, s, "LINUX", 6, NT_ARM_VFP, sizeof(note.vfp));
+
+    for (i = 0; i < 32; ++i) {
+        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
+    }
+
+    note.vfp.fpscr = cpu_to_dump32(s, vfp_get_fpscr(env));
+
+    ret = f(&note, ARM_VFP_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
 {
     struct arm_note note;
     CPUARMState *env = &ARM_CPU(cs)->env;
     DumpState *s = opaque;
-    int ret, i;
+    int ret, i, fpvalid = !!arm_feature(env, ARM_FEATURE_VFP);
 
     arm_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
 
     note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+    note.prstatus.pr_fpvalid = cpu_to_dump32(s, fpvalid);
 
     for (i = 0; i < 16; ++i) {
         note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->regs[i]);
@@ -226,6 +262,8 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
     ret = f(&note, ARM_PRSTATUS_NOTE_SIZE, s);
     if (ret < 0) {
         return -1;
+    } else if (fpvalid) {
+        return arm_write_elf32_vfp(f, env, cpuid, s);
     }
 
     return 0;
@@ -280,6 +318,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 
 ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 {
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+    CPUARMState *env = &cpu->env;
     size_t note_size;
 
     if (class == ELFCLASS64) {
@@ -287,6 +327,9 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
+        if (arm_feature(env, ARM_FEATURE_VFP)) {
+            note_size += ARM_VFP_NOTE_SIZE;
+        }
     }
 
     return note_size * nr_cpus;
-- 
2.4.3

