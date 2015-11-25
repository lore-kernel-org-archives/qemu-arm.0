Received: by 10.182.158.201 with SMTP id ww9csp2405087obb;
        Tue, 24 Nov 2015 16:40:37 -0800 (PST)
X-Received: by 10.31.4.208 with SMTP id 199mr27974514vke.110.1448412037299;
        Tue, 24 Nov 2015 16:40:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v200si20991423vkv.160.2015.11.24.16.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1O8S-0001VY-Uo
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:40:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6V-00065x-6F
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6S-0002Nz-Ik
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1O6S-0002Nv-9I; Tue, 24 Nov 2015 19:38:32 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id ED365B5E8D;
	Wed, 25 Nov 2015 00:38:31 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP0c1s3014074; Tue, 24 Nov 2015 19:38:28 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 19:37:57 -0500
Message-Id: <1448411877-22019-7-git-send-email-drjones@redhat.com>
In-Reply-To: <1448411877-22019-1-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v2 6/6] target-arm: dump-guest-memory: add
	fpregset notes
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
X-TUID: JbbHFXND6zN/

Also refactors note init code to avoid code duplication.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target-arm/arch_dump.c | 161 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 139 insertions(+), 22 deletions(-)

diff --git a/target-arm/arch_dump.c b/target-arm/arch_dump.c
index 5debe549d721d..8d74788411d79 100644
--- a/target-arm/arch_dump.c
+++ b/target-arm/arch_dump.c
@@ -35,6 +35,16 @@ struct aarch64_user_regs {
 
 QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_regs) != 272);
 
+/* struct user_fpsimd_state from arch/arm64/include/uapi/asm/ptrace.h */
+struct aarch64_user_vfp_state {
+    uint64_t vregs[64];
+    uint32_t fpsr;
+    uint32_t fpcr;
+    char pad[8];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
+
 /* struct elf_prstatus from include/uapi/linux/elfcore.h */
 struct aarch64_elf_prstatus {
     char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
@@ -51,10 +61,77 @@ QEMU_BUILD_BUG_ON(sizeof(struct aarch64_elf_prstatus) != 392);
 struct aarch64_note {
     Elf64_Nhdr hdr;
     char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
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
+#define AARCH64_FPREGSET_NOTE_SIZE \
+            (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
+
+static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
+                              Elf64_Word type, Elf64_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, NOTE_NAME, NOTE_NAMESZ);
+}
+
+static void arm_write_vregs(uint64_t *vregs, int num_regs,
+                            CPUARMState *env, DumpState *s)
+{
+    int i;
+
+    for (i = 0; i < num_regs; ++i) {
+        vregs[i] = cpu_to_dump64(s, env->vfp.regs[i]);
+    }
+
+    if (s->dump_info.d_endian == ELFDATA2MSB) {
+        /* We must always swap vfp.regs's 2n and 2n+1 entries when
+         * generating BE notes, because even big endian hosts use
+         * 2n+1 for the high half.
+         */
+        for (i = 0; i < num_regs/2; ++i) {
+            uint64_t tmp = vregs[2*i];
+            vregs[2*i] = vregs[2*i+1];
+            vregs[2*i+1] = tmp;
+        }
+    }
+}
+
+static int
+aarch64_write_elf64_fpregset(WriteCoreDumpFunction f, CPUARMState *env,
+                             int id, DumpState *s)
+{
+    struct aarch64_note note;
+    int ret;
+
+    aarch64_note_init(&note, s, NT_FPREGSET, sizeof(note.vfp));
+
+    if (is_a64(env)) {
+        arm_write_vregs(note.vfp.vregs, 64, env, s);
+    } else {
+        arm_write_vregs(note.vfp.vregs, 32, env, s);
+    }
+
+    note.vfp.fpsr = cpu_to_dump32(s, vfp_get_fpsr(env));
+    note.vfp.fpcr = cpu_to_dump32(s, vfp_get_fpcr(env));
+
+    ret = f(&note, AARCH64_FPREGSET_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
 
 static int
 aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
@@ -63,13 +140,8 @@ aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
     struct aarch64_note note;
     int ret, i;
 
-    memset(&note, 0, sizeof(note));
-
-    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
-    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
-    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
+    aarch64_note_init(&note, s, NT_PRSTATUS, sizeof(note.prstatus));
 
-    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
     note.prstatus.pr_pid = cpu_to_dump32(s, id);
 
     if (is_a64(env)) {
@@ -89,12 +161,12 @@ aarch64_write_elf64_note(WriteCoreDumpFunction f, CPUARMState *env,
         note.prstatus.pr_reg.pstate = cpu_to_dump64(s, cpsr_read(env));
     }
 
-    ret = f(&note, sizeof(note), s);
+    ret = f(&note, AARCH64_PRSTATUS_NOTE_SIZE, s);
     if (ret < 0) {
         return -1;
     }
 
-    return 0;
+    return aarch64_write_elf64_fpregset(f, env, id, s);
 }
 
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
@@ -105,6 +177,14 @@ struct arm_user_regs {
 
 QEMU_BUILD_BUG_ON(sizeof(struct arm_user_regs) != 72);
 
+/* struct user_vfp from arch/arm/include/asm/user.h */
+struct arm_user_vfp_state {
+    uint64_t vregs[32];
+    uint32_t fpscr;
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct arm_user_vfp_state) != 260);
+
 /* struct elf_prstatus from include/uapi/linux/elfcore.h */
 struct arm_elf_prstatus {
     char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
@@ -120,10 +200,50 @@ QEMU_BUILD_BUG_ON(sizeof(struct arm_elf_prstatus) != 148);
 struct arm_note {
     Elf32_Nhdr hdr;
     char name[QEMU_ALIGN_UP(NOTE_NAMESZ, 4)];
-    struct arm_elf_prstatus prstatus;
+    union {
+        struct arm_elf_prstatus prstatus;
+        struct arm_user_vfp_state vfp;
+    };
 } QEMU_PACKED;
 
-QEMU_BUILD_BUG_ON(sizeof(struct arm_note) != 168);
+#define ARM_NOTE_HEADER_SIZE offsetof(struct arm_note, prstatus)
+#define ARM_PRSTATUS_NOTE_SIZE \
+            (ARM_NOTE_HEADER_SIZE + sizeof(struct arm_elf_prstatus))
+#define ARM_FPREGSET_NOTE_SIZE \
+            (ARM_NOTE_HEADER_SIZE + sizeof(struct arm_user_vfp_state))
+
+static void arm_note_init(struct arm_note *note, DumpState *s,
+                          Elf32_Word type, Elf32_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, NOTE_NAME, NOTE_NAMESZ);
+}
+
+static int
+arm_write_elf32_fpregset(WriteCoreDumpFunction f, CPUARMState *env,
+                         int id, DumpState *s)
+{
+    struct arm_note note;
+    int ret;
+
+    arm_note_init(&note, s, NT_FPREGSET, sizeof(note.vfp));
+
+    arm_write_vregs(note.vfp.vregs, 32, env, s);
+
+    note.vfp.fpscr = cpu_to_dump32(s, vfp_get_fpscr(env));
+
+    ret = f(&note, ARM_FPREGSET_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
 
 static int
 arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
@@ -132,13 +252,8 @@ arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
     struct arm_note note;
     int ret, i;
 
-    memset(&note, 0, sizeof(note));
-
-    note.hdr.n_namesz = cpu_to_dump32(s, NOTE_NAMESZ);
-    note.hdr.n_descsz = cpu_to_dump32(s, sizeof(note.prstatus));
-    note.hdr.n_type = cpu_to_dump32(s, NT_PRSTATUS);
+    arm_note_init(&note, s, NT_PRSTATUS, sizeof(note.prstatus));
 
-    memcpy(note.name, NOTE_NAME, NOTE_NAMESZ);
     note.prstatus.pr_pid = cpu_to_dump32(s, id);
 
     for (i = 0; i < 16; ++i) {
@@ -146,12 +261,12 @@ arm_write_elf32_note(WriteCoreDumpFunction f, CPUARMState *env,
     }
     note.prstatus.pr_reg.regs[16] = cpu_to_dump32(s, cpsr_read(env));
 
-    ret = f(&note, sizeof(note), s);
+    ret = f(&note, ARM_PRSTATUS_NOTE_SIZE, s);
     if (ret < 0) {
         return -1;
     }
 
-    return 0;
+    return arm_write_elf32_fpregset(f, env, id, s);
 }
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
@@ -221,9 +336,11 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
-        note_size = sizeof(struct aarch64_note);
+        note_size = AARCH64_PRSTATUS_NOTE_SIZE;
+        note_size += AARCH64_FPREGSET_NOTE_SIZE;
     } else {
-        note_size = sizeof(struct arm_note);
+        note_size = ARM_PRSTATUS_NOTE_SIZE;
+        note_size += ARM_FPREGSET_NOTE_SIZE;
     }
 
     return note_size * nr_cpus;
-- 
2.4.3

