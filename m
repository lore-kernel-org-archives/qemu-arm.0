Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738977wrw;
        Tue, 6 Nov 2018 03:06:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5fwzrgIAW6AvJLTebyvXAerC6VgeqFuAN+OghRb7yIq3+zI+e7dyGxayqSjBTna/hcMSqRI
X-Received: by 2002:a0c:edcb:: with SMTP id i11mr24924576qvr.95.1541502417620;
        Tue, 06 Nov 2018 03:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502417; cv=none;
        d=google.com; s=arc-20160816;
        b=IH0vha1C6ncInSZAw1a94TON7VJDkmdUikU/5EF1za8N1nK36TPE5tzQZ4hqzZGvaO
         68xyIkAeACgenoMl3rK9muWs8A/HUEWwBnvyKHNjgnPsaHlFPYe03qWWiLoiXUXZ1vZ7
         ThZ27a5ZdI5g5Lp0VgG/phQbPfzHkCzdBc6XQ5MSPIGnUl1r9OjiJmrrxHdzB1677Omu
         iRkTsg/dFQ8acfe5Giz59I1IQ2pyqyycmaAPNb5v7IpMeI6GpEqrmZw6WaCj8X9QqzNg
         CswjounNxXhVWCHvY2FpJR2TKjUH/yO7gAjKPSWwzJT1B1CDRNDNwuI+nqG7KHNeEK+1
         BeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=vkYS8yCQZTPVPigP4R/mvKkWOWkuhrQG5NhEBJDe/KY=;
        b=GJegh0h7jFgN1jIfc0x2Yp8mklAKLq99DzvJFBaTlgrHdrOfl+P1+IjgzBO4A5kC7h
         ROmptmoaJP3fO45Sr6U2o1SuOCe50HGpttDuEbxtrle/BH4g+iJ9VFEFucvRJQ0685V4
         e0yUM8TugGL5/hQTthAEb0MPtL1cwBRntGFt2LkybI93KNFWEFHwG2Lwv8RNsICsYQO9
         HRUhNyLw74O0rJ9UBicqT307MnOAuGznKZmTPUkHCRezTN3Wz5yp3+mwcJ5+WPvV/BO5
         ftO6WKOPaRfCSuF7lkng3zcnBqwIQSk1m+REAUJFTv5IItvcOHBXxFj1h/rlzgkwMA1f
         Ging==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=P+jEEtme;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LCf0CiTz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LCf0CiTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si4632182qki.14.2018.11.06.03.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=P+jEEtme;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LCf0CiTz;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LCf0CiTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzCD-0006bK-2f
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006Eo-E8
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBV-0000py-Rk
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBV-0000os-HL; Tue, 06 Nov 2018 06:06:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3B4A85C026C;
	Tue,  6 Nov 2018 12:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502373;
	bh=oEhtZP/9SjD4dnBg12InDEYfGFug7U6sbGl0KVHhliU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P+jEEtme3BeKKujxPAK6lMMqVG5MpfA5hrVlFRA/44diMrll2cNnNHpk3ozw5ZDSh
	rcUPHqUmkOQkZnTnn0BAyxOMOmXbEbMXemYLTSzjkBrPeQHRFmF4viYFpWLYqN14LJ
	V1JCEc2dZ4S0/5PBQexEEqpw+x/VS9sGgdlyC/44=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LCf0CiTz;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LCf0CiTz
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8MY5U-dQHWM; Tue,  6 Nov 2018 12:06:07 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7A8364F7670; Tue,  6 Nov 2018 12:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502366;
	bh=oEhtZP/9SjD4dnBg12InDEYfGFug7U6sbGl0KVHhliU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LCf0CiTz6LbhAS+diVeL99YiXnVAc9zIHKwZ/WXr3xsd2MyxcygthsBriJE30Y9Ew
	aHYC1p8lRs1s8GLX1akSwKOD7xJ36z9WxIBlPZelRvQLt6Y/hbHLwhlPekBjGTF3XS
	IY3Ya3u1yChwbhrJs4M63YGQwbnq6dmKcyxB+sy0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0692E5C024B;
	Tue,  6 Nov 2018 12:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502366;
	bh=oEhtZP/9SjD4dnBg12InDEYfGFug7U6sbGl0KVHhliU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LCf0CiTz6LbhAS+diVeL99YiXnVAc9zIHKwZ/WXr3xsd2MyxcygthsBriJE30Y9Ew
	aHYC1p8lRs1s8GLX1akSwKOD7xJ36z9WxIBlPZelRvQLt6Y/hbHLwhlPekBjGTF3XS
	IY3Ya3u1yChwbhrJs4M63YGQwbnq6dmKcyxB+sy0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:36 +0100
Message-Id: <20181106110548.4209-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 04/16] gdbstub: add multiprocess support to
 'H' and 'T' packets
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
X-TUID: mCcRhCJ4Coxe

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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 152 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index d26bad4b67..598a89b3ba 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -680,10 +680,73 @@ out:
 #else
     return s->processes[0].pid;
 #endif
 }
=20
+static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
+{
+    int i;
+
+    if (!pid) {
+        /* 0 means any process, we take the first one */
+        return &s->processes[0];
+    }
+
+    for (i =3D 0; i < s->process_num; i++) {
+        if (s->processes[i].pid =3D=3D pid) {
+            return &s->processes[i];
+        }
+    }
+
+    return NULL;
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
+        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
+            return cpu;
+        }
+    }
+
+    return NULL;
+}
+
+static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t t=
id)
+{
+    GDBProcess *process;
+    CPUState *cpu =3D find_cpu(tid);
+
+    if (!tid) {
+        /* 0 means any thread, we take the first one */
+        tid =3D 1;
+    }
+
+    if (cpu =3D=3D NULL) {
+        return NULL;
+    }
+
+    process =3D gdb_get_cpu_process(s, cpu);
+
+    if (process->pid !=3D pid) {
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
@@ -936,23 +999,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulon=
g pc)
=20
     cpu_synchronize_state(cpu);
     cpu_set_pc(cpu, pc);
 }
=20
-static CPUState *find_cpu(uint32_t thread_id)
-{
-    CPUState *cpu;
-
-    CPU_FOREACH(cpu) {
-        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
-            return cpu;
-        }
-    }
-
-    return NULL;
-}
-
 static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
                            char *buf, size_t buf_size)
 {
     if (s->multiprocess) {
         snprintf(buf, buf_size, "p%02x.%02x",
@@ -962,10 +1012,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
CPUState *cpu,
     }
=20
     return buf;
 }
=20
+typedef enum GDBThreadIdKind {
+    GDB_ONE_THREAD =3D 0,
+    GDB_ALL_THREADS,     /* One process, all threads */
+    GDB_ALL_PROCESSES,
+    GDB_READ_THREAD_ERR
+} GDBThreadIdKind;
+
+static GDBThreadIdKind read_thread_id(const char *buf, const char **end_=
buf,
+                                      uint32_t *pid, uint32_t *tid)
+{
+    unsigned long p, t;
+    int ret;
+
+    if (*buf =3D=3D 'p') {
+        buf++;
+        ret =3D qemu_strtoul(buf, &buf, 16, &p);
+
+        if (ret) {
+            return GDB_READ_THREAD_ERR;
+        }
+
+        /* Skip '.' */
+        buf++;
+    } else {
+        p =3D 1;
+    }
+
+    ret =3D qemu_strtoul(buf, &buf, 16, &t);
+
+    if (ret) {
+        return GDB_READ_THREAD_ERR;
+    }
+
+    *end_buf =3D buf;
+
+    if (p =3D=3D -1) {
+        return GDB_ALL_PROCESSES;
+    }
+
+    if (pid) {
+        *pid =3D p;
+    }
+
+    if (t =3D=3D -1) {
+        return GDB_ALL_THREADS;
+    }
+
+    if (tid) {
+        *tid =3D t;
+    }
+
+    return GDB_ONE_THREAD;
+}
+
 static int is_query_packet(const char *p, const char *query, char separa=
tor)
 {
     unsigned int query_len =3D strlen(query);
=20
     return strncmp(p, query, query_len) =3D=3D 0 &&
@@ -1070,16 +1174,18 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
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
=20
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
@@ -1283,16 +1389,22 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
         else
             put_packet(s, "E22");
         break;
     case 'H':
         type =3D *p++;
-        thread =3D strtoull(p, (char **)&p, 16);
-        if (thread =3D=3D -1 || thread =3D=3D 0) {
+
+        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
+        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
+            put_packet(s, "E22");
+            break;
+        }
+
+        if (thread_kind !=3D GDB_ONE_THREAD) {
             put_packet(s, "OK");
             break;
         }
-        cpu =3D find_cpu(thread);
+        cpu =3D gdb_get_cpu(s, pid, tid);
         if (cpu =3D=3D NULL) {
             put_packet(s, "E22");
             break;
         }
         switch (type) {
@@ -1308,12 +1420,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
              put_packet(s, "E22");
              break;
         }
         break;
     case 'T':
-        thread =3D strtoull(p, (char **)&p, 16);
-        cpu =3D find_cpu(thread);
+        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
+        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
+            put_packet(s, "E22");
+            break;
+        }
+        cpu =3D gdb_get_cpu(s, pid, tid);
=20
         if (cpu !=3D NULL) {
             put_packet(s, "OK");
         } else {
             put_packet(s, "E22");
--=20
2.19.1

