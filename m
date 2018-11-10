Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808218wrw;
        Sat, 10 Nov 2018 00:14:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5cOQ5OakwesFRTpP8fBqJUO64/QmUOsEb5H1d5p7YqF8fho9XYJD9HkIgrfMXS9GtBNiWJ8
X-Received: by 2002:a37:3753:: with SMTP id e80mr10928891qka.207.1541837670215;
        Sat, 10 Nov 2018 00:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837670; cv=none;
        d=google.com; s=arc-20160816;
        b=seW0m9fnj99A93+RlbTEyB0SO44AJ+faFEoJKiZxQyB6FHnfh5zD5Y79g6bN74T735
         gas5QQcJmQnHf4dw3hFX/PiovYqw593DvE28Tu0p8VcMkRIiUBnXrgp59XlGeZNGbAZ9
         ZKEq2QcLYyDNCtdZOqH/j57HHLXzWGzjGH0xLa6nLdvn6k0d80b/koTDg8scQ9fkdBrV
         LzlI2Eyu0TVnnOCWr4CjdSaaQj4DD6cLBmAEXkXq+/KweU/Ns6N0UR4/hdIoK1Dxpln9
         Qka9rJSEg8i76DUam9lpqxcay/BNbWc9yglhmT6dJMz3Un6dwVZ05CjEdJKDZf7JQ1a0
         Hkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5sNQE/svAqAh3AgU9UjaaF8pOAs0os4P7B0VRofOxLE=;
        b=iv8uwPTsSi05CP9RInd8ojTosD4HXV3IJyHM/Tq4SPGGuDr1KBNs3SfMc4UEmIRXeV
         R8dP5T+EU/qA6TLDdA39eBcULckoPbLFiZRNDmOlVfdYWPbr80VG6pQCbn2bQz3IM53W
         0shJ1B0yPqKulxNdCXI64HXnRIJEPjE5QeBEidqFwUXlIvBZJAy3/BH2/sNVLRgEz8dx
         2icpvvwnVyGcrB7Jd71e6R9K8MvbZQL3NT7w20dlVjZlro6yg49CwW/EYUbNzWK/yI/V
         IMUopaQxlcXf4cm0qijKqR7qmB32p4KlGWyShiSre6KT5Glb59vMOuGizAT63QeQ5r+b
         VxJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kEiIwfgM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vH1q5Ubo;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vH1q5Ubo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r27si2880960qkr.70.2018.11.10.00.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kEiIwfgM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vH1q5Ubo;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vH1q5Ubo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOPV-0004Cj-Ju
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lM-83
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOY-0000SG-I8
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOX-0000QH-Uy; Sat, 10 Nov 2018 03:13:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 95A96521AAD;
	Sat, 10 Nov 2018 09:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kEiIwfgM0Q5SqP9AhsD6TQPpoOWir9q36RHof7sUg72Y6nylOjgdw3HqH0z3oUbcG
	98Jn/kQ3CbE14gIfrQZoTQi+bJk2OgdAdZbJUdXo9O3AKYObP/NzvxfpW/xffx46hf
	+zp6K0LckTYDzK/6Ek8thTywcA3GG9AGeLDQ3RCA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vH1q5Ubo;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vH1q5Ubo
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpI0c3P07YhV; Sat, 10 Nov 2018 09:13:24 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6269F6FD86; Sat, 10 Nov 2018 09:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837603;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vH1q5Ubo95c4tUcos8Yys9hJ3snvJaMDAIwhhZdjhe6Flqk2HkTRjhiHrmg2fPfnB
	uJmkKK+7m2+xxEF7rRb6dN12+fMqINsRN/fhcMuXrEebvTuPdkxRc5CiziBNBkxFda
	3TAuw+tloR5OASxed9rOm5L30fi6JoTDilxiKCSg=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D5E37443258;
	Sat, 10 Nov 2018 09:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837603;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vH1q5Ubo95c4tUcos8Yys9hJ3snvJaMDAIwhhZdjhe6Flqk2HkTRjhiHrmg2fPfnB
	uJmkKK+7m2+xxEF7rRb6dN12+fMqINsRN/fhcMuXrEebvTuPdkxRc5CiziBNBkxFda
	3TAuw+tloR5OASxed9rOm5L30fi6JoTDilxiKCSg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:36 +0100
Message-Id: <20181110081147.4027-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 05/16] gdbstub: add multiprocess support to
 vCont packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6wRq5OtXJNn

Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
the CPUs in currently attached processes.

Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
iterate over CPUs of a given process.

Use them to add multiprocess extension support to vCont packets.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 598a89b3ba..ba8b1a3413 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -716,10 +716,40 @@ static CPUState *find_cpu(uint32_t thread_id)
     }
=20
     return NULL;
 }
=20
+static CPUState *get_first_cpu_in_process(const GDBState *s,
+                                          GDBProcess *process)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (gdb_get_cpu_pid(s, cpu) =3D=3D process->pid) {
+            return cpu;
+        }
+    }
+
+    return NULL;
+}
+
+static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cp=
u)
+{
+    uint32_t pid =3D gdb_get_cpu_pid(s, cpu);
+    cpu =3D CPU_NEXT(cpu);
+
+    while (cpu) {
+        if (gdb_get_cpu_pid(s, cpu) =3D=3D pid) {
+            break;
+        }
+
+        cpu =3D CPU_NEXT(cpu);
+    }
+
+    return cpu;
+}
+
 static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t t=
id)
 {
     GDBProcess *process;
     CPUState *cpu =3D find_cpu(tid);
=20
@@ -743,10 +773,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
t32_t pid, uint32_t tid)
     }
=20
     return cpu;
 }
=20
+/* Return the cpu following @cpu, while ignoring
+ * unattached processes.
+ */
+static CPUState *gdb_next_cpu(const GDBState *s, CPUState *cpu)
+{
+    cpu =3D CPU_NEXT(cpu);
+
+    while (cpu) {
+        if (gdb_get_cpu_process(s, cpu)->attached) {
+            break;
+        }
+
+        cpu =3D CPU_NEXT(cpu);
+    }
+
+    return cpu;
+}
+
+/* Return the first attached cpu */
+static CPUState *gdb_first_cpu(const GDBState *s)
+{
+    CPUState *cpu =3D first_cpu;
+    GDBProcess *process =3D gdb_get_cpu_process(s, cpu);
+
+    if (!process->attached) {
+        return gdb_next_cpu(s, cpu);
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
@@ -1081,14 +1142,16 @@ static int is_query_packet(const char *p, const c=
har *query, char separator)
  * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if t=
here is
  *         a format error, 0 on success.
  */
 static int gdb_handle_vcont(GDBState *s, const char *p)
 {
-    int res, idx, signal =3D 0;
+    int res, signal =3D 0;
     char cur_action;
     char *newstates;
     unsigned long tmp;
+    uint32_t pid, tid;
+    GDBProcess *process;
     CPUState *cpu;
 #ifdef CONFIG_USER_ONLY
     int max_cpus =3D 1; /* global variable max_cpus exists only in syste=
m mode */
=20
     CPU_FOREACH(cpu) {
@@ -1127,29 +1190,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
ar *p)
         } else if (cur_action !=3D 'c' && cur_action !=3D 's') {
             /* unknown/invalid/unsupported command */
             res =3D -ENOTSUP;
             goto out;
         }
-        /* thread specification. special values: (none), -1 =3D all; 0 =3D=
 any */
-        if ((p[0] =3D=3D ':' && p[1] =3D=3D '-' && p[2] =3D=3D '1') || (=
p[0] !=3D ':')) {
-            if (*p =3D=3D ':') {
-                p +=3D 3;
-            }
-            for (idx =3D 0; idx < max_cpus; idx++) {
-                if (newstates[idx] =3D=3D 1) {
-                    newstates[idx] =3D cur_action;
+
+        if (*p++ !=3D ':') {
+            res =3D -ENOTSUP;
+            goto out;
+        }
+
+        switch (read_thread_id(p, &p, &pid, &tid)) {
+        case GDB_READ_THREAD_ERR:
+            res =3D -EINVAL;
+            goto out;
+
+        case GDB_ALL_PROCESSES:
+            cpu =3D gdb_first_cpu(s);
+            while (cpu) {
+                if (newstates[cpu->cpu_index] =3D=3D 1) {
+                    newstates[cpu->cpu_index] =3D cur_action;
                 }
+
+                cpu =3D gdb_next_cpu(s, cpu);
             }
-        } else if (*p =3D=3D ':') {
-            p++;
-            res =3D qemu_strtoul(p, &p, 16, &tmp);
-            if (res) {
+            break;
+
+        case GDB_ALL_THREADS:
+            process =3D gdb_get_process(s, pid);
+
+            if (!process->attached) {
+                res =3D -EINVAL;
                 goto out;
             }
=20
-            /* 0 means any thread, so we pick the first valid CPU */
-            cpu =3D tmp ? find_cpu(tmp) : first_cpu;
+            cpu =3D get_first_cpu_in_process(s, process);
+            while (cpu) {
+                if (newstates[cpu->cpu_index] =3D=3D 1) {
+                    newstates[cpu->cpu_index] =3D cur_action;
+                }
+
+                cpu =3D gdb_next_cpu_in_process(s, cpu);
+            }
+            break;
+
+        case GDB_ONE_THREAD:
+            cpu =3D gdb_get_cpu(s, pid, tid);
=20
             /* invalid CPU/thread specified */
             if (!cpu) {
                 res =3D -EINVAL;
                 goto out;
@@ -1157,10 +1243,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
ar *p)
=20
             /* only use if no previous match occourred */
             if (newstates[cpu->cpu_index] =3D=3D 1) {
                 newstates[cpu->cpu_index] =3D cur_action;
             }
+            break;
         }
     }
     s->signal =3D signal;
     gdb_continue_partial(s, newstates);
=20
--=20
2.19.1

