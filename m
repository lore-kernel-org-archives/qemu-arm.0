Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738418wrw;
        Tue, 6 Nov 2018 03:06:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5dPdIJgY5yJKhtjhSdrGKF/iQOCQmZ7xbOcJPLH5PlASGQO3bYh5Yij1F3yCa0B3Ap/sPSA
X-Received: by 2002:ac8:208a:: with SMTP id 10mr3427943qtd.79.1541502390185;
        Tue, 06 Nov 2018 03:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502390; cv=none;
        d=google.com; s=arc-20160816;
        b=RDoVOPBf9LCHfhwVXxAEdPp5wme7MwUj/tw/pwnLR3rdV3fEUjutf6Kr4Y/bUjMLXW
         WntcnPn1hn4Nyoa64gxBQRTF7W4EuHWgerRO3gQmcBlWvg3GY37kvWLuQgllPsX9aSkr
         FYadve9HRoMo1Xgm+aBggR00sd7TgObQB1InlLIcFQgGSqUimXFoenie9q87c111jHyP
         FhR/fU2hsRcMx3TovJTd16J4WTikODyBganbu2ymHOnc+moP0xnEG+gbbNdCpKLTKLF1
         DNltqADdL8s4f0jyiy5PR6OVqZuf85HbSXaNN4H6WYkdjEArmLDjrZ7tur54vXpFt+Ko
         IaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5sNQE/svAqAh3AgU9UjaaF8pOAs0os4P7B0VRofOxLE=;
        b=IT9kt6LirrJSEgcm6zbZgRjUSl9GJtxxCjNVIfTrlZq6Du39cyXHimfbgZmmRHCfLi
         xkxF2WpL4ORKuwWUzECPmE58XCGd9n4DBB9wJ6H4f71goCy7YWB5OYy+AKF50o3ikmLr
         16CN0PCcH1h1mBGOISmLgGRIF/tLZgND7Xkj2+qNZ6XOUNq+BgdQ4G6PeH69md5KXYjP
         YsSUCsTcsrwJEI9/xnk8+U0UVZe0RmlqUbA44SeAcbbsek13gQautSbCFbdbtHeTmj82
         jNh7MCr/YCiSWDSum6puf7ftx1UOstqc8cI119dyLKwTf76eGuO2zsg1N/D8Y8YeP2KQ
         9cYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4Xs8AEmD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wHQVAkf6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="Z/fDiGzW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si244343qvn.179.2018.11.06.03.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4Xs8AEmD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wHQVAkf6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="Z/fDiGzW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzBl-0006H7-LS
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006Er-EV
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000oc-4i
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBT-0000nc-HU; Tue, 06 Nov 2018 06:06:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 211285C9D97;
	Tue,  6 Nov 2018 12:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502370;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4Xs8AEmDU36rnytlEQksBVVV8PnxuSdNciNZipjhYTGTJw9FEmpyQiO6MDgeEO+/2
	fA34fSpc091XEGLaqnnN70py01lTB/v5GaWRtWfa9wANmolJ7qFcyPwFQyfS/PZBXy
	HVGVZJl6SYjfRFZQC0LzL9PMXwto2Sm+iWLsTK34=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wHQVAkf6;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Z/fDiGzW
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uepO-CrC8a7W; Tue,  6 Nov 2018 12:06:09 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0E14B5C026D; Tue,  6 Nov 2018 12:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502367;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wHQVAkf6wlDJR7xP8nhf8/QaLrSQXLZGgDB9SH1s8gMTGODc1wm42Hydel5svp3fR
	FYU8RmNTe7w9oqsarQsdzUqq2U7Hjsk+qgAXYbyvVm4VBuKeaWVJa9Tw6X1fURV2No
	5eb7bFP4JjJdZ9gGft16SS/pNb8mPBYSOsFKYku8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7F5865C024B;
	Tue,  6 Nov 2018 12:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502366;
	bh=oIF9dYQDZUKcoiOrfIYnR2/JYabFthPUu6QvgXLquD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z/fDiGzWwilnyLG4tgpCtjtP/uex46stNbZmldyjjb5JgOLYOQUnb4rr7tyGfeJ5I
	il1kzpirlShPqyfpsRLRRQ4/2n9cpor2i1b2M/hIcZgdrzGxtsIlWdFvoN3OtyIj1J
	wFffDifXNrg+6iBC3546/GvLTWV5cDhZo5YTOGp4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:37 +0100
Message-Id: <20181106110548.4209-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 05/16] gdbstub: add multiprocess support to
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
X-TUID: PXaslJCRTtjg

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

