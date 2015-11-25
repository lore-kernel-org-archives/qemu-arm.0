Received: by 10.182.158.201 with SMTP id ww9csp2404301obb;
        Tue, 24 Nov 2015 16:38:18 -0800 (PST)
X-Received: by 10.31.157.144 with SMTP id g138mr18777319vke.71.1448411898554;
        Tue, 24 Nov 2015 16:38:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si20895092vkd.39.2015.11.24.16.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:38:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1O6E-0005ai-6o
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:38:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6C-0005Wy-Ee
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O6B-0002G1-9i
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1O6B-0002Fq-1s; Tue, 24 Nov 2015 19:38:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B72BD258A0;
	Wed, 25 Nov 2015 00:38:14 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP0c1rx014074; Tue, 24 Nov 2015 19:38:11 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 19:37:53 -0500
Message-Id: <1448411877-22019-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1448411877-22019-1-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v2 2/6] dump: qemunotes aren't commonly needed
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
X-TUID: ABjNMs9u5woH

Only one of three architectures implementing qmp-dump-guest-memory write
qemu notes. And, another architecture (arm/aarch64) is coming, which
won't use them either. Make the common implementation truly common.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 qom/cpu.c                   | 4 ++--
 target-ppc/arch_dump.c      | 6 ------
 target-ppc/cpu-qom.h        | 2 --
 target-ppc/translate_init.c | 1 -
 target-s390x/arch_dump.c    | 6 ------
 target-s390x/cpu-qom.h      | 2 --
 target-s390x/cpu.c          | 1 -
 7 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/qom/cpu.c b/qom/cpu.c
index fb80d13a3f491..8f537a470f3c4 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -130,7 +130,7 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
                                            CPUState *cpu, void *opaque)
 {
-    return -1;
+    return 0;
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -159,7 +159,7 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
                                            CPUState *cpu, void *opaque)
 {
-    return -1;
+    return 0;
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
diff --git a/target-ppc/arch_dump.c b/target-ppc/arch_dump.c
index 5acafc68a4e39..816dbc21340d9 100644
--- a/target-ppc/arch_dump.c
+++ b/target-ppc/arch_dump.c
@@ -278,9 +278,3 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     return ppc64_write_all_elf64_notes("CORE", f, cpu, cpuid, opaque);
 }
-
-int ppc64_cpu_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                   CPUState *cpu, void *opaque)
-{
-    return 0;
-}
diff --git a/target-ppc/cpu-qom.h b/target-ppc/cpu-qom.h
index bc20504b3d55a..7d5e2b36a997c 100644
--- a/target-ppc/cpu-qom.h
+++ b/target-ppc/cpu-qom.h
@@ -125,8 +125,6 @@ int ppc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
-int ppc64_cpu_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                   CPUState *cpu, void *opaque);
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 #ifndef CONFIG_USER_ONLY
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index e88dc7fc7aa38..4ab2d927b01bb 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -9712,7 +9712,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_ppc_cpu;
 #if defined(TARGET_PPC64)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = ppc64_cpu_write_elf64_qemunote;
 #endif
 #endif
     cc->cpu_exec_enter = ppc_cpu_exec_enter;
diff --git a/target-s390x/arch_dump.c b/target-s390x/arch_dump.c
index dab63eb44f270..549a99b357e3f 100644
--- a/target-s390x/arch_dump.c
+++ b/target-s390x/arch_dump.c
@@ -246,9 +246,3 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 
     return (elf_note_size) * nr_cpus;
 }
-
-int s390_cpu_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                  CPUState *cpu, void *opaque)
-{
-    return 0;
-}
diff --git a/target-s390x/cpu-qom.h b/target-s390x/cpu-qom.h
index 491c1b8769669..029a44af246cc 100644
--- a/target-s390x/cpu-qom.h
+++ b/target-s390x/cpu-qom.h
@@ -91,8 +91,6 @@ void s390_cpu_dump_state(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                               int cpuid, void *opaque);
 
-int s390_cpu_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                  CPUState *cpu, void *opaque);
 hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 int s390_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
index 189a2afc0fe1f..e5a3f65029075 100644
--- a/target-s390x/cpu.c
+++ b/target-s390x/cpu.c
@@ -353,7 +353,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_s390_cpu;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = s390_cpu_write_elf64_qemunote;
     cc->cpu_exec_interrupt = s390_cpu_exec_interrupt;
     cc->debug_excp_handler = s390x_cpu_debug_excp_handler;
 #endif
-- 
2.4.3

