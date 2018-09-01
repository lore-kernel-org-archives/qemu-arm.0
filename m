Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538945wrd;
        Sat, 1 Sep 2018 05:48:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbGiBfxsgnbrrCfpzYYVw3FRB5qKXn7701ciusy3rKurKh2Hcsgdbg3znw1bQtH8rje4rDv
X-Received: by 2002:ac8:6056:: with SMTP id k22-v6mr19512071qtm.94.1535806081084;
        Sat, 01 Sep 2018 05:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806081; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci64O/c+swJ6xZKAh/jyA6Plh9sPUJ3VYM5Nm8FMoFFeQ32Wdh9hyLzHHOFma7RInv
         7ETGfdquqbQVsim6BcefVYok6FX34F5lRhc8qArcXLhesVYjInTd0CUrdhiiGOCRuL/y
         /NYUQ/922etP7PN0E1DnK5W5101c4VlMItix4yA4FaAPC9URCPbV89pGdonNdvtKVlVA
         N69+21XkYTgFGcCnZ/Djz5QK4gCGBK20X4iiqmuEfXbX8VX3QyX2GfIYU32vsR/MOgOS
         J4Hv5VyQeEjKv5r4C1sOnRwTO9k1GBl/oWbGx2KiuDIz5XLXfIs/Eotxp6q+SN34b93D
         oCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=YhX1lyzhoFI2jiJq8Gm7lwq1ozGxCAMlTYtAg3/G26s=;
        b=RcSwBsO3wz0szV8KDQCUcsgxkCpgKBxDmCMSdIo5RvAnsB4p/qENAQYITEBRf31/UR
         jLCtUlouBJ4HELH+41GeCRO3zhsp9NdAS1aN3wp+NF9wDnOyLo8FyCsHxVV8gm8MRPC8
         tjaM0bc0ibOJXXAIR5gKca9pFKWRh28MDUItvI1Vv9AWMGeY2N+/9n3/gclMEKXy+jKK
         pmaGBWiDoBQ+Pz+LncR0w6F3otrkVAfxvOOpQzOoaFD8aeC0KMD6fHOuPE1FHEuQ4AK9
         69ZtPf8OxNVi1I5sR+LApSTjSC2xRgsQ+C953tbtVSirr++97ZfX0lSz0QhRD1sfhtZz
         oBcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ePMOPlCy;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=d4c3Ecvr;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=d4c3Ecvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q129-v6si317265qke.351.2018.09.01.05.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ePMOPlCy;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=d4c3Ecvr;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=d4c3Ecvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jo-00065K-II
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004gB-FZ
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J6-0007k5-7L
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J5-0007hR-Ls; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 907B3521ABA;
	Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=EP9OAu1dvp26opCYuwAgh8bOW65TUfqskncyeeJ9KUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ePMOPlCyFyvkMmimtfEnYHAboKPBDKy2Ab4C3Mg2b6ifDx+DzmsDNm4ueLAkq+mle
	d6ZNFx2vkC6E1qoYBbG+upD4DkJ8LxS7BJvCIfx3eAoIkC/Qr9tXad7IETkMph4fz6
	t+rF81CRHVwbdZQdyfd5jp/pA0yBkAXuSMM59D3k=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=d4c3Ecvr;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=d4c3Ecvr
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Io8QM9d6O92H; Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A6644521A9F; Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=EP9OAu1dvp26opCYuwAgh8bOW65TUfqskncyeeJ9KUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4c3EcvrWPm67ASwBwXVa4y2OZFaT1QqAMij6RO2E4lEaQEEZhwBQ/LAgBpnHX2o/
	B/YAhTIU3iCeAByEGWSuJjI+4NlRKWyic6ohwNy2HYgwzlzjOrzBgehTlVOFge8hmA
	SuMH/8wjhwYdRA3/znRCKVs8w0JtxRg2tnv/G4hk=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id F3DF8521AB0;
	Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=EP9OAu1dvp26opCYuwAgh8bOW65TUfqskncyeeJ9KUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4c3EcvrWPm67ASwBwXVa4y2OZFaT1QqAMij6RO2E4lEaQEEZhwBQ/LAgBpnHX2o/
	B/YAhTIU3iCeAByEGWSuJjI+4NlRKWyic6ohwNy2HYgwzlzjOrzBgehTlVOFge8hmA
	SuMH/8wjhwYdRA3/znRCKVs8w0JtxRg2tnv/G4hk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:27 +0200
Message-Id: <20180901124639.19735-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 03/15] gdbstub: add multiprocess support to 'H'
 and 'T' packets
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1on+LpEDwgxh

Add a couple of helper functions to cope with GDB threads and processes.

The gdb_get_process() function looks for a process given a pid.

The gdb_get_cpu() function returns the CPU corresponding to the (pid,
tid) pair given as parameters.

The read_thread_id() function parses the thread-id sent by the peer.
This function supports the multiprocess extension thread-id syntax.  The
return value specifies if the parsing failed, or if a special case was
encountered (all processes or all threads).

Use them in 'H' and 'T' packets handling to support the multiprocess
extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 149 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 131 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index ec3105dbc1..33fa1b9c5f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -667,10 +667,74 @@ static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
     }
 
     return pid + 1;
 }
 
+static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
+{
+    uint32_t process_idx;
+
+    if (!pid) {
+        /* 0 means any process, we take the first one */
+        pid = 1;
+    }
+
+    /* GDB PIDs are in the range [1;n] */
+    process_idx = pid - 1;
+
+    if (process_idx >= s->process_num) {
+        return NULL;
+    }
+
+    return &s->processes[process_idx];
+}
+
+static GDBProcess *gdb_get_cpu_process(const GDBState *s, CPUState *cpu)
+{
+    return gdb_get_process(s, gdb_get_cpu_pid(s, cpu));
+}
+
+static CPUState *find_cpu(uint32_t thread_id)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (cpu_gdb_index(cpu) == thread_id) {
+            return cpu;
+        }
+    }
+
+    return NULL;
+}
+
+static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
+{
+    GDBProcess *process;
+    CPUState *cpu = find_cpu(tid);
+
+    if (!tid) {
+        /* 0 means any thread, we take the first one */
+        tid = 1;
+    }
+
+    if (cpu == NULL) {
+        return NULL;
+    }
+
+    process = gdb_get_cpu_process(s, cpu);
+
+    if (process->pid != pid) {
+        return NULL;
+    }
+
+    if (!process->attached) {
+        return NULL;
+    }
+
+    return cpu;
+}
+
 static const char *get_feature_xml(const char *p, const char **newp,
                                    CPUClass *cc)
 {
     size_t len;
     int i;
@@ -923,23 +987,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
 
     cpu_synchronize_state(cpu);
     cpu_set_pc(cpu, pc);
 }
 
-static CPUState *find_cpu(uint32_t thread_id)
-{
-    CPUState *cpu;
-
-    CPU_FOREACH(cpu) {
-        if (cpu_gdb_index(cpu) == thread_id) {
-            return cpu;
-        }
-    }
-
-    return NULL;
-}
-
 static char *get_thread_id(const GDBState *s, CPUState *cpu,
                            char *buf, size_t buf_size)
 {
     if (s->multiprocess) {
         snprintf(buf, buf_size, "p%02x.%02x",
@@ -950,10 +1001,64 @@ static char *get_thread_id(const GDBState *s, CPUState *cpu,
     }
 
     return buf;
 }
 
+typedef enum GDBThreadIdKind {
+    GDB_ONE_THREAD = 0,
+    GDB_ALL_THREADS,     /* One process, all threads */
+    GDB_ALL_PROCESSES,
+    GDB_READ_THREAD_ERR
+} GDBThreadIdKind;
+
+static GDBThreadIdKind read_thread_id(const char *buf, const char **end_buf,
+                                      uint32_t *pid, uint32_t *tid)
+{
+    unsigned long p, t;
+    int ret;
+
+    if (*buf == 'p') {
+        buf++;
+        ret = qemu_strtoul(buf, &buf, 16, &p);
+
+        if (ret) {
+            return GDB_READ_THREAD_ERR;
+        }
+
+        /* Skip '.' */
+        buf++;
+    } else {
+        p = 1;
+    }
+
+    ret = qemu_strtoul(buf, &buf, 16, &t);
+
+    if (ret) {
+        return GDB_READ_THREAD_ERR;
+    }
+
+    *end_buf = buf;
+
+    if (p == -1) {
+        return GDB_ALL_PROCESSES;
+    }
+
+    if (pid) {
+        *pid = p;
+    }
+
+    if (t == -1) {
+        return GDB_ALL_THREADS;
+    }
+
+    if (tid) {
+        *tid = t;
+    }
+
+    return GDB_ONE_THREAD;
+}
+
 static int is_query_packet(const char *p, const char *query, char separator)
 {
     unsigned int query_len = strlen(query);
 
     return strncmp(p, query, query_len) == 0 &&
@@ -1058,16 +1163,18 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
     CPUClass *cc;
     const char *p;
     uint32_t thread;
+    uint32_t pid, tid;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
     uint8_t *registers;
     target_ulong addr, len;
+    GDBThreadIdKind thread_kind;
 
     trace_gdbstub_io_command(line_buf);
 
     p = line_buf;
     ch = *p++;
@@ -1271,16 +1378,22 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         else
             put_packet(s, "E22");
         break;
     case 'H':
         type = *p++;
-        thread = strtoull(p, (char **)&p, 16);
-        if (thread == -1 || thread == 0) {
+
+        thread_kind = read_thread_id(p, &p, &pid, &tid);
+        if (thread_kind == GDB_READ_THREAD_ERR) {
+            put_packet(s, "E22");
+            break;
+        }
+
+        if (thread_kind != GDB_ONE_THREAD) {
             put_packet(s, "OK");
             break;
         }
-        cpu = find_cpu(thread);
+        cpu = gdb_get_cpu(s, pid, tid);
         if (cpu == NULL) {
             put_packet(s, "E22");
             break;
         }
         switch (type) {
@@ -1296,12 +1409,12 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
              put_packet(s, "E22");
              break;
         }
         break;
     case 'T':
-        thread = strtoull(p, (char **)&p, 16);
-        cpu = find_cpu(thread);
+        read_thread_id(p, &p, &pid, &tid);
+        cpu = gdb_get_cpu(s, pid, tid);
 
         if (cpu != NULL) {
             put_packet(s, "OK");
         } else {
             put_packet(s, "E22");
-- 
2.18.0

