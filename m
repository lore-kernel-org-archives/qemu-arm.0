Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6797710wrw;
        Thu, 15 Nov 2018 01:42:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5dLPpAVSHkq4s40EgdLIV1QMu7EYfpfDRg5ImreAGK4d9udBlHn+gpc6HoBhBwRwpCObgNJ
X-Received: by 2002:a37:34f:: with SMTP id 76mr5228837qkd.347.1542274970376;
        Thu, 15 Nov 2018 01:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274970; cv=none;
        d=google.com; s=arc-20160816;
        b=IQh8JTL/jMZLx7zPaR7Gmj4B9aBgu2wBO0SPjvhr+pLlSos24bIh6k+kFbmyMWBMdR
         /+ygR1+RaLVjmUVc3saG0SDgCnAwCP8N2dDvmd3CINVnuZQmjN2UeBXukcPyqmND1j3q
         6FGm2yZ9z11xyXV4c1CQBqeSPViubu2b3AeX+oLlrn5oBUUE0Cd1Hbz/zs0u7Kjc0VE3
         7cJQmFrjSAodp7/DPr69XCs61h0pQLDL39jsCNu4WmK2Jm8l1I3zG0KUaDrpYp5A1soa
         NscTcLDopfuJtV60jXJNBn/8I0RwBocBl1iV+ycBYFY0ujE4szqg+VJwc45gobol3ali
         03IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=4RU7K8XftIpFnpXns/UL28N9uRyaWDCTy4k6Fr3tstE=;
        b=YVMEO3ci/DX+uUg7uz9BYcRxNMr3b92YlcvcJd85sQLea7VHPJHLx2nztW5tSnD1gL
         k6t1ZUfJnMeuQJuEoDiyufndBp5OwWVv5IxSDjdUNKxe/o/0Un0vNYOkpcYGTCGYsSIP
         TfMBjP8RXE3ILrwWMidb8wzXp6jxGbqn/SfA068lJXUY88jQRSx4EvJmIzpGMGmUPNLA
         ZTVvVmEfeYrrFz7nKApTTRnhIUVQQ66Ht+ymDqRmJ12XTLfJWDc9orowTQgDIvE65t2h
         P7nKoPN9dqVZaruaq3YU87fCtCuK29kzIET5sGxh2P1FgOR+2PIg+rF+xD7WpLerS0HQ
         EnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Wle3qshW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fOvA3+EL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=nNZINng3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g51si821507qtc.224.2018.11.15.01.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Wle3qshW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fOvA3+EL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=nNZINng3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEAj-0006sd-Mp
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:42:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAU-0006mw-QF
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAH-0004Mu-NE
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:28 -0500
Received: from greensocs.com ([193.104.36.180]:41852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAH-0004Li-0n; Thu, 15 Nov 2018 04:42:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 107185BD196;
	Thu, 15 Nov 2018 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274935;
	bh=woUz5gMr1yRY+/kHBr+hdGYA01XkDhQ/ai5lFu+hIhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wle3qshWqZdbHhvI7pq6YFmq8Yef/nOwfbQgubsq1i+daadJmkg1b9+tm3MRhlQDL
	lerwrtud1JYwKP+6hZiVqOImf6MnKgMD18BIXlEbWhUpwRERpKx1dHk0kAX9u8Ki2I
	JlMiXkfAC1jKlwaKZVEGtjmZuEk2HcviPL0qAKHo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fOvA3+EL;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nNZINng3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAuRcvF8-ecm; Thu, 15 Nov 2018 10:42:14 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 059555BD1AF; Thu, 15 Nov 2018 10:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=woUz5gMr1yRY+/kHBr+hdGYA01XkDhQ/ai5lFu+hIhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fOvA3+ELec/3T0FOgdxNmCKhB6cLI1GcoutUa2ty7wJ4ZKhMY1etk3ys4ShxT1Tud
	8C70oB1QNF7OiWW1+QqBdWJS9z1u0wwrbcTbfmAXshvlJ5s2EqxsdIBiQWaG6rmp5G
	aF6uBc1d8/6dTXPl6drzF8jUjCM6GdgYa/7M3OuU=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 92F325BD1BB;
	Thu, 15 Nov 2018 10:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274933;
	bh=woUz5gMr1yRY+/kHBr+hdGYA01XkDhQ/ai5lFu+hIhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nNZINng3jq1X0C5i3T1fGo0fi3o8LLfuMbpj3jDw3XtQ+EEXai+asIReVUsYLVIJe
	zI5Ar7u7BpO58K1bECNdmTHBbBy/vtWO65d9epcwOyemRTP1YtcUcLau67aBchrtr/
	V7uQ+9XL4Hw+26MIYUfxrppNd9msrqAyPfgyp9d8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:55 +0100
Message-Id: <20181115094207.22846-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 04/16] gdbstub: add multiprocess support to
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
X-TUID: 2gVl2KtCFmqk

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
index 4fbc05dfe3..fa2b7077b2 100644
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

