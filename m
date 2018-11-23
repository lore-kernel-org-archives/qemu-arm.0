Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1755911wrt;
        Fri, 23 Nov 2018 01:25:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V01AljS28QmK/hzdVlVKZNHTb3D0nTqI+hfANXS4jRuwGbcj4hTIjmlMDl5o64Lw4O0sLc
X-Received: by 2002:a25:9c47:: with SMTP id x7-v6mr14570882ybo.316.1542965112281;
        Fri, 23 Nov 2018 01:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965112; cv=none;
        d=google.com; s=arc-20160816;
        b=RelIg2Uz07BcH4pJnuBeQGiOr67c9kQO8SmLTE/FlOD74XD7cM5Q5hEviiucmZTwu4
         /Ix9UQjA5FbJPOqfCyjtWrQIeQttN3FDKk1nH/vHstOZUXocUEHoVHfSW4lqgt5baGCv
         2oIb6Mc5Frf5TVMEO8VqwRrz6DO+M1owpB8GHb461VlCH7nVwxqRlBkHK2TlGi2BE44l
         UdAYPesrCz6OHNJNnq3zDYzt+YoG6t+NqOIlzJhNxvJ1UyOxh8+l12YZ2l26Gv9H0WnN
         OThE0OkKzHW5ZlIkKo0ByegzqXkZcyXrlpkdluPZVz5l6RjNomYhsBGdn/xfdGuRL+1I
         rDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=sXfgta7uWuxkIoCRQxIG+ev9OErA1WUbhCXFiSbYTlY=;
        b=CB58DEguIblcKntIQxdBFMKusiVhWOBeTgJoCHknnHWC/UiSil+HQy2PLyyHMZBOqx
         nSVdxFQoQgPmKIWCzyXUcSORYcbO6MJln26m1cnmSUkX5ZSmD4Z+ZVJUU/uFqrpofdtF
         so7OMMFMMthQRKXs0/11LwWwun7/0fviTlG9niTVJ5ByXeUCvhkzz+tT6uNmC/WJW8pS
         IxzGvmeX7jRUFpe5mNNby0KDbPC3+WaZhbR7cxZH2iSvbQSsa0desVWRfCAPtsSJa7I+
         4inyUF2lWK5nyvt1KQNDU71Cv9K7vJ/IA10Rbeo5+7Yt5FBsqphSwIiGNPAN0j3Cyqlv
         QMBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fmY2jqYw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=i5ZI9EV+;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=i5ZI9EV+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i206-v6si33964993ybb.135.2018.11.23.01.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fmY2jqYw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=i5ZI9EV+;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=i5ZI9EV+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7i3-0006Rk-LF
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:25:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oZ-Ls
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7at-0000Wn-Gb
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7ar-0000Lh-2g; Fri, 23 Nov 2018 04:17:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5C2A95C0269;
	Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=ldSn2FV2r8RMD86lKEPCfAC/mylO38/xsILt3UOkORk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fmY2jqYwZyBy2RPsYVzfXYFe4gfm4wI7d+dTNw/ZsBD+vvjrrxLQw494kErwN7Vc7
	n6G7Ww9AvB9U37L16W1pZqkGv2bxDk3xowDLAA4E6cHdi7A9Gb8NGJsruK6jbbaYO0
	ydW42dSJi7N1Ihhy0nB17Y8oMtiF6fNhPzlsWFYw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=i5ZI9EV+;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=i5ZI9EV+
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0LfWF7hETgM; Fri, 23 Nov 2018 10:17:34 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 821035C0259; Fri, 23 Nov 2018 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964653;
	bh=ldSn2FV2r8RMD86lKEPCfAC/mylO38/xsILt3UOkORk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i5ZI9EV+1QGXq9gYwXY1oB53Fo2rPUD26RvrDtsR9pGYhdsvgnFHOx8KJ6qeNAEEf
	JCA+ZX810ei4pFmphlI6WjR5Nt8/wsiMfKkLcZe5xkbkg3URf0AJ1weOHSNw17vPFU
	uNodd1ymmkGgw4H3R3qMWvxQ1KuWFpyLIWvRM4IM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0C3895C024E;
	Fri, 23 Nov 2018 10:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964653;
	bh=ldSn2FV2r8RMD86lKEPCfAC/mylO38/xsILt3UOkORk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i5ZI9EV+1QGXq9gYwXY1oB53Fo2rPUD26RvrDtsR9pGYhdsvgnFHOx8KJ6qeNAEEf
	JCA+ZX810ei4pFmphlI6WjR5Nt8/wsiMfKkLcZe5xkbkg3URf0AJ1weOHSNw17vPFU
	uNodd1ymmkGgw4H3R3qMWvxQ1KuWFpyLIWvRM4IM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:17 +0100
Message-Id: <20181123091729.29921-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 04/16] gdbstub: add multiprocess support to
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
X-TUID: ikuk7+31+dhu

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 154 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 136 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 4fbc05dfe3..64a1db21b5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -680,10 +680,75 @@ out:
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
+    CPUState *cpu;
+
+    if (!tid) {
+        /* 0 means any thread, we take the first one */
+        tid =3D 1;
+    }
+
+    cpu =3D find_cpu(tid);
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
@@ -936,23 +1001,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulo=
ng pc)
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
@@ -962,10 +1014,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
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
@@ -1070,16 +1176,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1283,16 +1391,22 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1308,12 +1422,16 @@ static int gdb_handle_packet(GDBState *s, const c=
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

