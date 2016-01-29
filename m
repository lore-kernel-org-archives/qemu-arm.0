Received: by 10.25.159.19 with SMTP id i19csp1120756lfe;
        Fri, 29 Jan 2016 11:18:30 -0800 (PST)
X-Received: by 10.140.180.22 with SMTP id b22mr13637897qha.49.1454095110811;
        Fri, 29 Jan 2016 11:18:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16si19074493qge.70.2016.01.29.11.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 11:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPEYw-0003KQ-8h
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 14:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYN-0002ki-TA
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 14:17:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPEYJ-0004wJ-8N
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 14:17:55 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPEYI-0004vX-RL; Fri, 29 Jan 2016 14:17:51 -0500
Received: by mail-lf0-x244.google.com with SMTP id j99so2551843lfi.2;
	Fri, 29 Jan 2016 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1CS/hNalpJ2Obaqo5ex4J9Fl97AmFn4+JM+Xi7n2BI=;
	b=OJnlXqhjO3Js8NCqu83yo6qcehwdrrq++SFs2C3e+MsLn4QvOdYaWNcXVlxjbCgzaU
	al80qEaPsyR9S+jMo/KBdobWga+nkJTY3kGmj3zDXhnlS4gC/DinepMGVt0e5MYpN9kH
	BpEGXpybGN0+T6A/BPqfUN0OwB6z+41YCoI9D7KyTzhxcPG53ffwNO9iWjmlbh3eeKzN
	DnVEOnBXKZsacuze3Ie+nnHJlsgERglWroWKbDQtPMZnlOK8VM+SfqGFguFvdDMy00GF
	r6MURaI1ln7aGqtf7Cr9gCR1oWCWJpa0xoR1YaiciY1UugUMeBP28u3ioT02AgOIBSDo
	CjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1CS/hNalpJ2Obaqo5ex4J9Fl97AmFn4+JM+Xi7n2BI=;
	b=a1T8rO0bX3WLRdUojiEU8FN1eB1gzRjfvSwFAYbMogVFMI4snZGPrU6EUnYE2/nfXp
	JGjSN9PMAE8Z2zBVTjj6OLrpFcF3vLsdYV7SyA4s9FfToe7kgp1ycn55Z9s4/7NjO2nr
	MegJDmGWcESr6nTu26pZG0YKeWFQgrx93dpiMeDUxBdFsR5u1xART4+Va8G1TQdMk2EH
	dgtzGDl8GxPeBz2CffQpskaWQSB7w3XU2x5PLw/9A/tz6nKefehVdtNtW+dBKUSrGfob
	eHgS7lNTP2pHy30jtP2RWBbq0zzFfNwTCgYFJNPTO/NYe0WjG2tbr03BDgTxa29lVME7
	dk7w==
X-Gm-Message-State: AG10YORDWZ31iQgl7ggaHdg731mzK+sJS4/OSZlunCfu6zr8BLW1ccsf/bsz01xe87ATfg==
X-Received: by 10.25.3.133 with SMTP id 127mr4070493lfd.50.1454095070200;
	Fri, 29 Jan 2016 11:17:50 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	i192sm2270550lfb.14.2016.01.29.11.17.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 11:17:49 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jan 2016 22:17:31 +0300
Message-Id: <1454095052-17149-2-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
References: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PATCH v2 1/2] cpu: Add callback to check
	architectural watchpoint match
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
X-TUID: cI3qhJjgPI1r

When QEMU watchpoint matches, that is not definitely an architectural
watchpoint match yet. If it is a stop-before-access watchpoint then that
is hardly possible to ignore it after throwing a TCG exception.

A special callback is introduced to check for architectural watchpoint
match before raising a TCG exception.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---

Notes:
    Changes in v2:
     * Check moved before setting cpu->watchpoint_hit
     * Pointer to watchpoint being checked passed to debug_check_watchpoint()
       callback
     * Comment for debug_check_watchpoint() callback improved

 exec.c            | 5 +++++
 include/qom/cpu.h | 3 +++
 qom/cpu.c         | 9 +++++++++
 3 files changed, 17 insertions(+)

diff --git a/exec.c b/exec.c
index 9e076bc..a20f8ea 100644
--- a/exec.c
+++ b/exec.c
@@ -2024,6 +2024,7 @@ static const MemoryRegionOps notdirty_mem_ops = {
 static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
 {
     CPUState *cpu = current_cpu;
+    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUArchState *env = cpu->env_ptr;
     target_ulong pc, cs_base;
     target_ulong vaddr;
@@ -2050,6 +2051,10 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
                 cpu->watchpoint_hit = wp;
+                if (wp->flags & BP_CPU && !cc->debug_check_watchpoint(cpu)) {
+                    cpu->watchpoint_hit = NULL;
+                    continue;
+                }
                 tb_check_watchpoint(cpu);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
                     cpu->exception_index = EXCP_DEBUG;
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 035179c..095ba08 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -106,6 +106,8 @@ struct TranslationBlock;
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
+ * @debug_check_watchpoint: Callback for checking an architectural watchpoint
+ * match.
  * @debug_excp_handler: Callback for handling debug exceptions.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
@@ -165,6 +167,7 @@ typedef struct CPUClass {
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
+    bool (*debug_check_watchpoint)(CPUState *cpu);
     void (*debug_excp_handler)(CPUState *cpu);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
diff --git a/qom/cpu.c b/qom/cpu.c
index 8f537a4..5caa0ee 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -188,6 +188,14 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
+static bool cpu_common_debug_check_watchpoint(CPUState *cpu)
+{
+    /* If no extra check is required, QEMU watchpoint match can be considered
+     * as an architectural match.
+     */
+    return true;
+}
+
 bool target_words_bigendian(void);
 static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
 {
@@ -352,6 +360,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     k->debug_excp_handler = cpu_common_noop;
+    k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
     k->cpu_exec_enter = cpu_common_noop;
     k->cpu_exec_exit = cpu_common_noop;
     k->cpu_exec_interrupt = cpu_common_exec_interrupt;
-- 
1.9.1

