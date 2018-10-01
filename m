Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730055wrt;
        Mon, 1 Oct 2018 04:57:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63GikldHJA0gM0dRASlrWStH1peyiy0W8/gIPPfjJ9qJKKnhJSr8IhLbrj8i8hd/LrTIl8S
X-Received: by 2002:a37:30d4:: with SMTP id w203-v6mr7662636qkw.106.1538395070852;
        Mon, 01 Oct 2018 04:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395070; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5Bp77Fa3Wj+RIVXbgJGrZGUyddPPSFRvM8roi++PlpXoa7l5d1nQBXSiyzsGbrjX/
         Z2ltyAWiV1nN+L5bUnGlT7vpBcvF8yD+HP9uicfeI7n/2AUuz4G7hi5G/H1FZeFyGEkD
         IAjsOtZyAN+txc260kyluMZyHVE3CFwYIATLL/rjlzp6B0xFD5nMMiuBOcZlu1XBXWWQ
         9GZIamXBpV0Y3/0U3LHvDXrpIz6JAmy0+4OfQfXgKH/ramLfBOaR3XZs7ObJeqTJtfEZ
         amhfEMUozOqufSkldDB24uNefNV+PQj26DTJ1o8JhBP7xyJdtGQrT5KQNuOqI83qlFnC
         iOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=3Dq0c1rECq3Mhar0Ygj4aiq+zUHH1eVhwEl23oKzyiY=;
        b=0+JE/pecFCMw+hI92LtO4zgK2PfcZL7pyzKBWhT6i1Ze7mWRZ8xJVLexU/vOwZz4Md
         Y/FSUxU4U0qpgVkXVMGYdBQ+bWbkte6X7a+by51I2TJqWLsRtHYU1hxLi+Tub4iOMliz
         WQlFLY5iSvsIfni0dQQn1Cn7tKMMjMwkpHFDg++QY+rcFfK9ixmG1D0PnHWYqHfbi+yI
         WergruIp0Ftq5SoRjVZ6WwZgHH2wJXsatFR8uz1L28ptT+1egECsjjnwbadkQyT+3kp7
         tk5oyGm7jUuF2Xsy+aKGIjDddaJQI0MPAt0RogJ5JgkboQIRd3EgrBl14cWKvSh8isbJ
         sXsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MXrj+6cc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="02g0XcS/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="02g0XcS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q25-v6si1314202qkh.272.2018.10.01.04.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=MXrj+6cc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="02g0XcS/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="02g0XcS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wpi-0002Og-85
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:57:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NW-Ja
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpM-0005iF-Dz
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpK-0005SU-9z; Mon, 01 Oct 2018 07:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A1CEF511C77;
	Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395030;
	bh=meV9yOzJ7Ab2hCvUI3L602DaBOj/Pe+XBQYESc/Rovw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MXrj+6cc9+e8jIhXs5t/KS93l51xghRMT+VoJ6INLBvoYaDWVKrgX/tK4TI2iJ0dg
	QntnjbPML6EOLwLQVZveTmGW77UMgXq8Ggw+GN8tJ43/JiOc1CqAZuAv9hEARZnMUG
	8lfURGyKaKpxfmivTMyayGhoZBtF0GMod1aXrE/k=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=02g0XcS/;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=02g0XcS/
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKa9U5-h-JZl; Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CA5CD511C6F; Mon,  1 Oct 2018 13:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395027;
	bh=meV9yOzJ7Ab2hCvUI3L602DaBOj/Pe+XBQYESc/Rovw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=02g0XcS/FZ5dvGHBElmyqWGdagym2ANJJlNuqv3MyIxywZjjy23qLVpreCJ/tBVRv
	g4zPzcyLZYnFYrWW1qLuevawrzodENNAOmHCD/sFwvY5vGmgjR5uHmPrOdSObwOnnI
	hXIOXam9kTr1K5X3QdJvrIQvHMwuucHMCFeXWxJw=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 64B7E511C6E;
	Mon,  1 Oct 2018 13:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395027;
	bh=meV9yOzJ7Ab2hCvUI3L602DaBOj/Pe+XBQYESc/Rovw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=02g0XcS/FZ5dvGHBElmyqWGdagym2ANJJlNuqv3MyIxywZjjy23qLVpreCJ/tBVRv
	g4zPzcyLZYnFYrWW1qLuevawrzodENNAOmHCD/sFwvY5vGmgjR5uHmPrOdSObwOnnI
	hXIOXam9kTr1K5X3QdJvrIQvHMwuucHMCFeXWxJw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:53 +0200
Message-Id: <20181001115704.701-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 04/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bFLHqjuyQ5nz

Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
the CPUs in currently attached processes.

Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
iterate over CPUs of a given process.

Use them to add multiprocess extension support to vCont packets.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a21ce3ca18..779cc8b241 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -704,10 +704,40 @@ static CPUState *find_cpu(uint32_t thread_id)
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
@@ -731,10 +761,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
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
@@ -1069,14 +1130,16 @@ static int is_query_packet(const char *p, const c=
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
@@ -1115,29 +1178,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
@@ -1145,10 +1231,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
2.19.0

