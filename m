Received: by 10.25.159.19 with SMTP id i19csp102506lfe;
        Mon, 11 Jan 2016 11:57:30 -0800 (PST)
X-Received: by 10.140.16.225 with SMTP id 88mr145327660qgb.96.1452542250829;
        Mon, 11 Jan 2016 11:57:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si39688396qgj.56.2016.01.11.11.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIiao-0004I6-E4
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:57:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIia3-0003AR-Gb
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIia2-0002sG-5a
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 14:56:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIiZz-0002rN-ES; Mon, 11 Jan 2016 14:56:39 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id F0A3B8E00B;
	Mon, 11 Jan 2016 19:56:38 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1j012743; Mon, 11 Jan 2016 14:56:36 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:19 +0100
Message-Id: <1452542185-10914-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-devel] [PATCH v4 2/8] dump: qemunotes aren't commonly needed
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
X-TUID: zwA0mI0cCuqY

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

