Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp237641wrt;
        Fri, 7 Dec 2018 01:03:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U8tAzqz7dPnndwAGmRCm0F3FQVoGKe9YCJ6Zndagx61DJ/hI9iG0ZI1/s5uOM1gk99EQc1
X-Received: by 2002:a0c:b093:: with SMTP id o19mr1175811qvc.49.1544173384709;
        Fri, 07 Dec 2018 01:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173384; cv=none;
        d=google.com; s=arc-20160816;
        b=kZs+ERIG4H73je9fTpglHKpeR+vwdwlJKXiIqnkJv9aMRfQ/DLWsTZ1nNeRmco11s2
         xWXJqNL8Ms6fNFvJoxkaQ9E/rbd7xHMyHVuCnKAze3PFvbUt0hRTlgPZF8tQnkrwYB2c
         qO2AvArNvt83qW/v/X/AQ5/BsqzQWzL9HZClKFOEejCLGU3ZPkX+FjdVxK9GgUYLczY5
         xFfng6XWnHnp4iYPTXOsC/QLFBmLKnmPkFOVrhU5+LAC0lFJcgWwY/Kpjoy6bT4iq0xw
         XrDrpKV8zFTZ3xNXXAdySoD/uRvmWBFs7RzowlVAhPk2wHc8FRmg3lMMDLqJZdtqqXFy
         ZOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=2kKyh2jydyTPWzaPiPlQDUm1d6FT6nLRXFa/05qVz1o=;
        b=VfNVDvHl2vnn24s5m6Mbwrggz1QgEeohYh+Hsv6VHCp/rEeG/nh+yzP7IDdr6l3CRk
         dcDEwVRuFlDG5rFyQcnYaHyBlmn/wRf5NWaK5EKtKW9V5jcfe1F9qwDE41ZJVqPi8j9A
         QdRlZoikO892JqetHIcwlkzpxAenahtmARes/k1IpQYBhIZ99VXMuSif68jpIUWO2JVI
         //8BUrO7kD9efq5jJtyJSqqwNXr7PzM3/yvTGzUy4hdElS4XlsYuaQLcXvatPQ4t3Jh1
         UyqWS1NXYWSKlWE6GTyxcCL+6GJU/1oEcYkY170PZGvxJmtWpzoax+URVPhZnmNZoDL9
         zvWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tbqNVlM0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1xQ5nNPG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1xQ5nNPG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g67si1788631qkc.228.2018.12.07.01.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:03:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tbqNVlM0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1xQ5nNPG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1xQ5nNPG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC2J-0008Hs-Kf
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:03:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1P-00083N-MG
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1J-0005YA-BH
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:07 -0500
Received: from greensocs.com ([193.104.36.180]:52160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1A-0005Oc-4i; Fri, 07 Dec 2018 04:01:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F1C8048003B;
	Fri,  7 Dec 2018 10:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=XFlt14LyZxFHZBsj389f0tAG4XXxE9SY9ZpylyKgfps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tbqNVlM09sK7ESVPK3+fDtf+L1FMavVmve0bz+Y+c9a/f2swkyokS8eUgYKebfw6/
	Jku264k35fOQyZlzW07d0T72gEzN6jGBg+MRjhSHNDRh1lyHHvuwZIaMtSa7ttkF4O
	KnZFlDsPCKqakEfv5MDkKxg/g42iQDXBhn0rPbto=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1xQ5nNPG;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1xQ5nNPG
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpvKC1QVXw3T; Fri,  7 Dec 2018 10:01:46 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D880548002B; Fri,  7 Dec 2018 10:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173302;
	bh=XFlt14LyZxFHZBsj389f0tAG4XXxE9SY9ZpylyKgfps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1xQ5nNPGoY9qYfmAdYcIm6TNPLCJ7tql+jiAYNoqXq98PUshR+80s3NgigE2kramc
	KxhkWzWngB3BQCn7hiaSRTh7nrzxvP5q1zKTzBo72M0FrGg4uNxmUcrSZydcPBRi7a
	/Xqr1iv9voAL/9xKPIa4Fc8ZuPeVh05V4Iw57K+4=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6D4F3480011;
	Fri,  7 Dec 2018 10:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173302;
	bh=XFlt14LyZxFHZBsj389f0tAG4XXxE9SY9ZpylyKgfps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1xQ5nNPGoY9qYfmAdYcIm6TNPLCJ7tql+jiAYNoqXq98PUshR+80s3NgigE2kramc
	KxhkWzWngB3BQCn7hiaSRTh7nrzxvP5q1zKTzBo72M0FrGg4uNxmUcrSZydcPBRi7a
	/Xqr1iv9voAL/9xKPIa4Fc8ZuPeVh05V4Iw57K+4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:22 +0100
Message-Id: <20181207090135.7651-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v8 04/16] gdbstub: add multiprocess support to
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
X-TUID: 0k4dg0kSQliZ

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
index 07508c2e6b..911faa225a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -685,10 +685,75 @@ out:
     /* TODO: In user mode, we should use the task state PID */
     return s->processes[s->process_num - 1].pid;
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
@@ -941,23 +1006,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulo=
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
@@ -967,10 +1019,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
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
@@ -1075,16 +1181,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1288,16 +1396,22 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1313,12 +1427,16 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

