Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp444813wro;
        Fri, 26 Oct 2018 01:35:24 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ey+AuWyHNsEZ8bJp7mBGYJnif5drBKJhnFnTajtzgN48d5MZ0D+dnH1LhbMlKffW4fuMu+
X-Received: by 2002:a37:694:: with SMTP id 142mr2223482qkg.98.1540542923943;
        Fri, 26 Oct 2018 01:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542923; cv=none;
        d=google.com; s=arc-20160816;
        b=kJj34p3EDgOrFtbQr+Oshww069Qi4sbY2ANpvcrqCdcQWMfOHfTq97XKfuXsI37zWt
         1cMd6xvHAN2wkf5roBqk9izzUZeCXJw+PB0TP6mR2R8Uyb2gB1BwPkExFn70VHvzdhOv
         M7c1x0gvPYkRIjZ6LyezTzWi2DVQd4iU4kmoSJ9HqPnX+oTIHSL/2xA0qnLYKrm6vEXs
         e7R73zMOFekeY0pdoXO8DFFk6T+E7sckKIz4BJ0m9+5VHUc7T7G2VG0SB3HnUkzc8ajy
         dEgBIe0pDonEu5uS+6qeF7KbvJc61PllA7hH/E3pKX0Q8MCUyNOIrGVeqDobWMMPJyq0
         i/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=4+5KxU9Pex5FqKaz96NvT/gGlRmIxGkUZDMCKRbsvZw=;
        b=rv0rTuqmOV6HNHmDOsQR6K+i5NGWahw5l1RbM8G76E8uGWYJmFke1+fUYMuE7RoGxh
         78o0XuB4g2sGRclFG684KTJILSTZIEFH8b5Qwd2vVOvP1ilhJwj3U7bSsjJXv7IoAM6d
         iv3llkq3s+gX4b3Tn8K4nAlPi69np0rYDvQ+Zcw0e0PVzz+JMq1fExQCSyLaDf/RrocC
         qXNIMm30pXl1Hshkt/St4MPuW8ORQdZ/FX6UoqC8icnGzTZDHpM0N1lc3ISOnj1a31i0
         /+QDilkyEEfAbL6hcmt4kUPwVE3vA0jr6OpVv6Z7j71n97wdF1n4mSHKdeJrvZprzjv0
         DJ/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7ViYDlRe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DImW7CMD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DImW7CMD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e15-v6si1144328qtq.387.2018.10.26.01.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=7ViYDlRe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DImW7CMD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DImW7CMD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxaV-0008AD-8n
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:35:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUG-0000gX-OM
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJD-0004oP-IP
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:33 -0400
Received: from greensocs.com ([193.104.36.180]:45294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ7-0004ha-Ut; Fri, 26 Oct 2018 04:17:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 222EE441B4B;
	Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541835;
	bh=kfi+4rwqBfiuRZUcgcD1QABcY/trccxb8GYquvbc9rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7ViYDlRegu95dN6BLg4/YfPyUlhkKQIMe0wYL0DP41rZb6+JrSU08kTFFqGLeD8jg
	H0roqUDecwJDQNwA4deHFb1pOg0N0HtJu87kUM1gMqNBX9MEh0mvaT9DCZUXOJfobj
	x0TcJnOHW6bRmD66g89zNG5/bgFRDzpn4b0s6Ayk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=DImW7CMD;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=DImW7CMD
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtV8_2muA85O; Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8FCD2441B45; Fri, 26 Oct 2018 10:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541833;
	bh=kfi+4rwqBfiuRZUcgcD1QABcY/trccxb8GYquvbc9rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DImW7CMDpJSTtcDFtAmkfzTFPNwagzeg0gNtBoJ/rvvAVRfFsccXJH284V5ECwdX6
	B8wt9I7/LHGvJq7YTNlyr0wwDMnqZXNsTGse3R7neKwLkNzLGF2j3oKfNhloyYAq3l
	USD7ghDcQbkia/DpJBAokG73hvyqExI0ib/l7pm8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E86F4441B42;
	Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541833;
	bh=kfi+4rwqBfiuRZUcgcD1QABcY/trccxb8GYquvbc9rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DImW7CMDpJSTtcDFtAmkfzTFPNwagzeg0gNtBoJ/rvvAVRfFsccXJH284V5ECwdX6
	B8wt9I7/LHGvJq7YTNlyr0wwDMnqZXNsTGse3R7neKwLkNzLGF2j3oKfNhloyYAq3l
	USD7ghDcQbkia/DpJBAokG73hvyqExI0ib/l7pm8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:41 +0200
Message-Id: <20181026081653.24602-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 04/16] gdbstub: add multiprocess support to
 'H' and 'T' packets
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TFzyYMAIBado

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
index 9ca743a4c6..c437af7aca 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -677,10 +677,73 @@ out:
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
@@ -933,23 +996,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulon=
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
@@ -959,10 +1009,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
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
@@ -1067,16 +1171,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1280,16 +1386,22 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1305,12 +1417,16 @@ static int gdb_handle_packet(GDBState *s, const c=
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

