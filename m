Received: by 10.25.159.19 with SMTP id i19csp1938043lfe;
        Sun, 31 Jan 2016 08:16:09 -0800 (PST)
X-Received: by 10.55.21.28 with SMTP id f28mr23546772qkh.57.1454256969427;
        Sun, 31 Jan 2016 08:16:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si27051032qhx.101.2016.01.31.08.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Jan 2016 08:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPufY-0004Kr-OZ
	for alex.bennee@linaro.org; Sun, 31 Jan 2016 11:16:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufV-0004GY-Kj
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPufU-0000sy-K7
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:16:05 -0500
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:35921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPufR-0000sI-Vw; Sun, 31 Jan 2016 11:16:02 -0500
Received: by mail-lb0-x243.google.com with SMTP id zr1so2157178lbb.3;
	Sun, 31 Jan 2016 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Sbh3mmp93QNJ1rh6yHZ3+Qld1vYhG8I1oq4LrFX1pKo=;
	b=Vv+F8+SGMONb3l99zfOyWWXf/FlXh+ysuf2fzln5QrIGAJm6dj/vz+LX9bzFOBT/aQ
	XF7SNsgWjElolb1glM96JwqoqRpewekYlPyvsuqQaXpYoVW1LquUZp60hdNGsXt4QwAx
	zgO4DUQHe4uJSZ2+kJHNCyfFT6+t1bKX1dtzMSjsZnunGNHubbKCY1g1cfHtnaR7mS92
	2/owu/aZzPe32fRm7V3M9Z4VDH64CHVSH1ByUD5N/vYZgV2MIFN9rK2BTCJewQEbKBK0
	6ujQPuOYE2pyfy0VebsZK2Bx41EgINeBR4WuqHC8KNuDNvEk0UFJzA1r2HO3s1DFH2Bn
	ZrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Sbh3mmp93QNJ1rh6yHZ3+Qld1vYhG8I1oq4LrFX1pKo=;
	b=Djje6nYSPqtB/eGmiaDRg4DAPzY+otn673YN93KQHEGKnfrQB9hPUE3owtVUeAEMeq
	p9m3IyQvS/Cp/xaI+FfHazoorDiLXN9pOn79FRoRkPvMdB1ZcJYIwk6uhLQtcWHqQdEc
	nh1F4HT4uujvMZyrHSVLSvmYWPzjILWm7BDoRMl37jmhFoRNw9wGemT3+vFxlnUW5/w+
	HTsrNPNZQ/wSl1Jal4NlPVp9uWitI0urymsVNslGC+F0ohDWQE5WBaRsI7UKQEXrpV/2
	oNGcurlQuHIbhV8CXy3i2tCfhGvH1xr+H+61FBbQkFm92pk2cu6iJGl5sO2c0aLCQaRc
	eIdA==
X-Gm-Message-State: AG10YOQoM2iEeKdy8HyfGrZXQGyQd5NQykeTh8orrpanCB6UuT6oWFL2E+0OD2MDVgCPnQ==
X-Received: by 10.112.162.231 with SMTP id yd7mr6776339lbb.40.1454256961286;
	Sun, 31 Jan 2016 08:16:01 -0800 (PST)
Received: from sfedorov-laptop.Dlink (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	zu7sm3418454lbb.36.2016.01.31.08.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 08:15:59 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 31 Jan 2016 19:15:47 +0300
Message-Id: <1454256948-10485-2-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH v3 1/2] cpu: Add callback to check architectural
	watchpoint match
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
X-TUID: Kc2wb9t4LqPl

When QEMU watchpoint matches, that is not definitely an architectural
watchpoint match yet. If it is a stop-before-access watchpoint then that
is hardly possible to ignore it after throwing a TCG exception.

A special callback is introduced to check for architectural watchpoint
match before raising a TCG exception.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 exec.c            | 6 ++++++
 include/qom/cpu.h | 4 ++++
 qom/cpu.c         | 9 +++++++++
 3 files changed, 19 insertions(+)

diff --git a/exec.c b/exec.c
index 9e076bc..14e7c76 100644
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
@@ -2049,6 +2050,11 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
             wp->hitaddr = vaddr;
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
+                if (wp->flags & BP_CPU &&
+                    !cc->debug_check_watchpoint(cpu, wp)) {
+                    wp->flags &= ~BP_WATCHPOINT_HIT;
+                    continue;
+                }
                 cpu->watchpoint_hit = wp;
                 tb_check_watchpoint(cpu);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 035179c..984bc8d 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -64,6 +64,7 @@ typedef uint64_t vaddr;
 #define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
 
 typedef struct CPUState CPUState;
+typedef struct CPUWatchpoint CPUWatchpoint;
 
 typedef void (*CPUUnassignedAccess)(CPUState *cpu, hwaddr addr,
                                     bool is_write, bool is_exec, int opaque,
@@ -106,6 +107,8 @@ struct TranslationBlock;
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
+ * @debug_check_watchpoint: Callback: return true if the architectural
+ *       watchpoint whose address has matched should really fire.
  * @debug_excp_handler: Callback for handling debug exceptions.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
@@ -165,6 +168,7 @@ typedef struct CPUClass {
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
+    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
     void (*debug_excp_handler)(CPUState *cpu);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
diff --git a/qom/cpu.c b/qom/cpu.c
index 8f537a4..5a6a47e 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -188,6 +188,14 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
+static bool cpu_common_debug_check_watchpoint(CPUState *cpu, CPUWatchpoint *wp)
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

