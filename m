Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749478wrt;
        Fri, 23 Nov 2018 01:18:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5eXbCf9rSmW+d2srifO9vBKCIbQsK+1EFj3mx3zfE97RWysUM5g6LMe+qh37NSWpVVwWw9b
X-Received: by 2002:a81:36d8:: with SMTP id d207-v6mr15520950ywa.71.1542964725640;
        Fri, 23 Nov 2018 01:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964725; cv=none;
        d=google.com; s=arc-20160816;
        b=SvrfRURib9zKM6tO+I9jTvCKD1VbHp/7dOeniRm9mnmkPHHk8SWRY1nivcoYhiNsyw
         DB1LZn6uhljyYB3GtsgjUX4yceKm+TR2qB3NAILLS7HrqAXSWhQWZn+lU/BE2UJJIr3w
         RApNVgCcyxvwJt27pMDyz8vFCpZ7hmTFao57f0Ih9uK1JQSy8UO3i9xJAZ/KVeXpXdkW
         +8QYJTTDAlMqVVybRVeSWiqaldusk9Il5jTep3wv+qAnXEeOL1d5851J2CT185myNeoa
         rg7zfn7XfK00YRgIIETtx73N2Xb5R7H3/Cnb7PXIMXFKMskVG9ICeAxs6r7tNWbxmXXY
         QhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=UcRt7/69NW9YMPIqEveMgLc4v0fmJTGU7odQMQYpwas=;
        b=hdjEMWJ/9oD2GZmnjzmEHO6EUDT/ZPQ9OJcoSeaHzDGtkqnpzeY5kct1QImPI2HfD3
         qdyM71WVc2VFcIZifSudJ8CHNOhA84OkunOC2JtNYJMgfaSVDS3Gba5DWjMjrQgn7j2B
         zjkRvpl/UnlgzsiVICgTqyXruf8vk3C5661ZhqcWoeu7O1dKUlol1XQmsdwUyNnibVXF
         u/e1sFzwrmdxD2ROQIpwDRsJIS4Fil5idjRBbvVWX/IHcJL4YzI54cxK6VEOGht5C/H1
         e5zrLqwhCjAHSdIED70BAIdPZzTRaKb3x11GawbLi+anrCvNps33RonMrHBsxf+vBjC7
         MJZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GSLU2dKn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="lJ4R/AiT";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbWChZ+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3-v6si33081459ywr.0.2018.11.23.01.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=GSLU2dKn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="lJ4R/AiT";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbWChZ+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bo-0000Hp-1U
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oe-Mp
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000Zc-LC
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Xy-58; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 39D405C0259;
	Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=WGwApLbecnlIWPCTr31Qe7wkqbNbnQf6q5Yo5WQ1aIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GSLU2dKncUyVP2JsnCEsMJaUPFyCXuqaAvxrppJA3ye1j0IS0CnI3ReNKNgKSknIe
	r4wT547JDOqYPCrFMdVi8OSoqM2tV0aNSDj1yO6WbqiHX1JGZ5ML7SIWIq31LJi3Ky
	+GmykpA5YNwA26kISSCGX9Jy9cb6+KfdHSti/iHE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=lJ4R/AiT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=dbWChZ+6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFMFmygzAPcl; Fri, 23 Nov 2018 10:17:35 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 19A2B5C025D; Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=WGwApLbecnlIWPCTr31Qe7wkqbNbnQf6q5Yo5WQ1aIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJ4R/AiTSbiFy84gjHamHNTFbJw/7oVpwIjy6lXpBwO3t/oFLWJ9N3Jg1prcvJIpR
	wgDoL+/odwtkZE3duxpisZ1T03+gk/6TBPX9zyW5eTN4tgJICS8Bf3xoUxnPDIP9yA
	LWfGIAxWYjL2I0eIiV4hbjkGc4StAPcrOQVLk/YU=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 84F2B5C025C;
	Fri, 23 Nov 2018 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964653;
	bh=WGwApLbecnlIWPCTr31Qe7wkqbNbnQf6q5Yo5WQ1aIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dbWChZ+6HxGil4m3JVdvmZumwXXhz13bnKxWGN5uiIyeTK/Fu6InkyCPv3IznfoI2
	MQiY02HWNydUU0EGDVQv3yQrsoOzGZgjjjqbOm5osWr631R600vLlzVUv77WqA7v2X
	fLatAU3TbNtMDScUNK+zrgGH+2nmDiMlS81eYREk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:18 +0100
Message-Id: <20181123091729.29921-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 05/16] gdbstub: add multiprocess support to
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
X-TUID: 3uDr+Y7nzMXZ

Add the gdb_first_attached_cpu() and gdb_next_attached_cpu() to iterate
over all the CPUs in currently attached processes.

Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
iterate over CPUs of a given process.

Use them to add multiprocess extension support to vCont packets.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 64a1db21b5..691b877aa8 100644
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
     CPUState *cpu;
=20
@@ -745,10 +775,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
t32_t pid, uint32_t tid)
     }
=20
     return cpu;
 }
=20
+/* Return the cpu following @cpu, while ignoring
+ * unattached processes.
+ */
+static CPUState *gdb_next_attached_cpu(const GDBState *s, CPUState *cpu)
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
+static CPUState *gdb_first_attached_cpu(const GDBState *s)
+{
+    CPUState *cpu =3D first_cpu;
+    GDBProcess *process =3D gdb_get_cpu_process(s, cpu);
+
+    if (!process->attached) {
+        return gdb_next_attached_cpu(s, cpu);
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
@@ -1083,14 +1144,16 @@ static int is_query_packet(const char *p, const c=
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
@@ -1129,29 +1192,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
+            cpu =3D gdb_first_attached_cpu(s);
+            while (cpu) {
+                if (newstates[cpu->cpu_index] =3D=3D 1) {
+                    newstates[cpu->cpu_index] =3D cur_action;
                 }
+
+                cpu =3D gdb_next_attached_cpu(s, cpu);
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
@@ -1159,10 +1245,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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

