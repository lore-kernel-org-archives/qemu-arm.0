Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3731231wrt;
        Mon, 1 Oct 2018 04:59:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63qvuepvTdHfDwEBIKbe4CuWrTTUOqEev+YoU1gWD/iYK0lHjOtfIWHk2avZn6voNjtcboO
X-Received: by 2002:a0c:ebd2:: with SMTP id k18-v6mr8053250qvq.59.1538395154892;
        Mon, 01 Oct 2018 04:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395154; cv=none;
        d=google.com; s=arc-20160816;
        b=emqG/RO1iHUnaJbicdREwWvFEs/q+i+PwSgZGx2C4LXZv/x38r4hdOuh4ZIiAUSJ8H
         tyoLF86fPi08T02/kfz+DnlEwTJ6+B1RyhrYdZds5lTIxjDUM65I8lKXIQi0SUsNotdh
         iHXPF7s1GjOBkLxilC6doVEf7BK2YM/3uRkcdXUBXlu6+tXh7jSHluj13tf/ueya2iPR
         HgewSMPpYHWsmBooBsFYLXtzKM3XuRvzmfEGV0hqmGraglTmrZIvLGROj4yXpJJZjmOA
         Fr3CDwzjeh0zLKfM8XclLtXyFHNNV3fhvw1PKXypjcitQK6KN0DkppuYM3ngd0SMzF+/
         losw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=hViCzW3JC8G38AG9/7LT+RmtT+wg+IB+NgBFcE96CHY=;
        b=JoCFCmw140vs1Wc8uoB3w1OYYtgvzs/Brhj3KYjjEabvqI1dCB2XAV0BG0KB49YQ/H
         7M2kzlzxLAbc0VJPelBvswNmoHI7AqGb//L/glWuFBvVGjP+w14mij4gRh1Dq9fKsKaj
         AquoMauga/PM7ZV1IeMYx/0NFeJSALWx0DiWeTdJm5TrFpFJd6rg0bdZiY0KglpJHXqq
         AOjOsolUpQSfc0C/C9rNuhHq+A4HWr2BhCVOFHKR6EygmUdYxOoUPqFud+t6OHeNK4QZ
         IvRo1rNJJ7i8S/QzcVB7jOQJ4QWGMX2rdImE9H+8Q9Dcf/S7IgxcTVAyGSo03oVyygjC
         Q/YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bU5X5yuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UWUjcBFg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UWUjcBFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si3137832qtj.82.2018.10.01.04.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bU5X5yuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UWUjcBFg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UWUjcBFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wr4-0003jL-AZ
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:59:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NX-KE
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpM-0005ir-RU
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005SS-EH; Mon, 01 Oct 2018 07:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C1D07511C76;
	Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=R42etYwRSrVcvW4xJWx/ZO7fMF+ds6WK3e7k/NVNk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bU5X5yuIb0i7yinhcxk2aDIdYwle8tof0SHh+REi2vgW0cJn1hfCc8gefXg+cp/Xa
	nTMDVMFVs+6RopH32jtGmqV3nMC5c8jpmqrlxm+mPqcagSvjBsL6tAbXXnMvWOcJWC
	aC5xyhUyXS8BLKlUpnpHXvnWnX79u/keQI+Xdy60=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UWUjcBFg;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UWUjcBFg
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6I_qrpbX8Vjg; Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5F000511C69; Mon,  1 Oct 2018 13:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395027;
	bh=R42etYwRSrVcvW4xJWx/ZO7fMF+ds6WK3e7k/NVNk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UWUjcBFgX4P6tFHngH+bbeAZpa829Vv/pyufgvw4GURQ+qFFfHmhq24AgPEcZ98e1
	dxDMvrEukFYmNXf3sOlaveEbE5iBtUv4EyypuMVeC/3O00Iem6szQ/wmyLVzlW5sXH
	X707BE70dhRgq8UT2ty5Zg+S+Iylpl8ufYtGTc5w=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E7DE3511C6E;
	Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395027;
	bh=R42etYwRSrVcvW4xJWx/ZO7fMF+ds6WK3e7k/NVNk1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UWUjcBFgX4P6tFHngH+bbeAZpa829Vv/pyufgvw4GURQ+qFFfHmhq24AgPEcZ98e1
	dxDMvrEukFYmNXf3sOlaveEbE5iBtUv4EyypuMVeC/3O00Iem6szQ/wmyLVzlW5sXH
	X707BE70dhRgq8UT2ty5Zg+S+Iylpl8ufYtGTc5w=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:52 +0200
Message-Id: <20181001115704.701-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 03/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5qICwvEpEeG1

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
index ac9d540fda..a21ce3ca18 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -667,10 +667,74 @@ static uint32_t gdb_get_cpu_pid(const GDBState *s, =
CPUState *cpu)
     }
=20
     return pid + 1;
 }
=20
+static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
+{
+    uint32_t process_idx;
+
+    if (!pid) {
+        /* 0 means any process, we take the first one */
+        pid =3D 1;
+    }
+
+    /* GDB PIDs are in the range [1;n] */
+    process_idx =3D pid - 1;
+
+    if (process_idx >=3D s->process_num) {
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
@@ -923,23 +987,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulon=
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
@@ -949,10 +1000,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, =
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
@@ -1057,16 +1162,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1270,16 +1377,22 @@ static int gdb_handle_packet(GDBState *s, const c=
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
@@ -1295,12 +1408,12 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
              put_packet(s, "E22");
              break;
         }
         break;
     case 'T':
-        thread =3D strtoull(p, (char **)&p, 16);
-        cpu =3D find_cpu(thread);
+        read_thread_id(p, &p, &pid, &tid);
+        cpu =3D gdb_get_cpu(s, pid, tid);
=20
         if (cpu !=3D NULL) {
             put_packet(s, "OK");
         } else {
             put_packet(s, "E22");
--=20
2.19.0

