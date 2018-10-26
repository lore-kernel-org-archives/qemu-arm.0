Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp451541wro;
        Fri, 26 Oct 2018 01:43:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cjy/At2BSGEurqZi5lq/efM+EWKBagv13tyyVe1iMRZLsgk6WLLJDLT4pqRJOpy0ZQ29In
X-Received: by 2002:a0c:c78c:: with SMTP id k12-v6mr2280466qvj.235.1540543405181;
        Fri, 26 Oct 2018 01:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543405; cv=none;
        d=google.com; s=arc-20160816;
        b=IoLoFPAxRC2u5hpVb5o4kgtRkGxdOfp8U0iMK5IhkVe8b5ek1fYN2SeKgNp7BnMj1t
         nriFPX2Na5RPpxPPGK/15J/MkadG2sv3Waf+n9xbiDrKpzbZZq7hxmG2f7HiRv+w3lXz
         1gslJZgWi958mygrNu9ldebMFtrK1ZPF235Ohn7LjfbByPj79Um4NttTM61OwuCF4yjd
         W9DUTQYRLNxGUWdqgLpCPkmBc0UpaRKNKeR9590nEW0zXhmkL4OHwzyeF5eQeTBBcufs
         hpOxvGIIPYuel7c+FKMW/HCKvazLkqe8svYxM/syO91LbnWsM4eBBKIPNL7d0PdJeGAs
         BI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=EvwcSbV5lkD71FJS/jFa/5Bbs5rNR81Qc7iUdZc/WWo=;
        b=vMWBXOSL81Wca1K99BJxFTKVJRsBmjBWOfawVi3KxPj5vd5OwKSFsP2MQ5OoeDy6VM
         FrfUVxvMVRpqyyYuxsfLA+3+PqxxTrBdghJ0F2/FQRg898aP9bRWSZGpXc41+Bz68m3G
         sSDa77C5fXLK+NlBHwIv9J9xZtMt2f/JhHQaCd9978KIXprtBkzg6OPXW7qBfHaz08He
         6lX9ae8CVFk7XY6WQTPKJPMrqF6DFQvC2zkbZ8PeSjUHleN9EeYfhCSGisM4mY9ZZGIY
         ZcP0OhPxoWTYHYC+lqxdApTJfxPuLPlCOwt9LRpmuZzjc/LUVi8hvLx2M4ZKm7htsRzZ
         U/bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pn1w3Xgn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZcG29Jd2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gT6miJT7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si7215468qve.184.2018.10.26.01.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Pn1w3Xgn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZcG29Jd2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gT6miJT7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxiG-0007TF-MC
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUL-0000gN-0x
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJD-0004ok-OF
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:33 -0400
Received: from greensocs.com ([193.104.36.180]:45295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ7-0004hZ-Um; Fri, 26 Oct 2018 04:17:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F384E441B4D;
	Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=nBv+pEnI6n0XuM/9Ux9lAAB28PeFXmf8egJR1vkQ/WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pn1w3XgnR+2eHCPga75qkfyGheccxH0AbYtIRE70oYi95PyGsx3RbpQk4kgm0A+Bq
	5JQ3AePX1sufmUkiPpDmPbzZ7M+SLmPEtQHjOCxlLH0mT6obtslqf7FJIV5cK8wMW8
	QoIk1xaYUKPBLeivGi53MNpXUN4UqELyRM6U7SQU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ZcG29Jd2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gT6miJT7
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY5pT2dCRQ4z; Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 1DC3E441B49; Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541834;
	bh=nBv+pEnI6n0XuM/9Ux9lAAB28PeFXmf8egJR1vkQ/WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZcG29Jd23wHph5UdSFU5ol/LFoANMcwrrpf1LCb+gtlKc5089DMzKGeTkKnoCQHWI
	RjDrwA3iM1CrTVey6VnO4u6+9FvQnyO/LD9YANf1Ji+s+VHlMzpawOIidCFDnliNld
	V/X5pj91R54M8KuFkvxq59FK84DK/+17HYssQx+c=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 96C7A441B42;
	Fri, 26 Oct 2018 10:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541833;
	bh=nBv+pEnI6n0XuM/9Ux9lAAB28PeFXmf8egJR1vkQ/WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gT6miJT7HfUFsMS23XBktbOqVnuyu/DlNv21vyKaD5jXXNdNvoFdjc0ydZUnerzk3
	UxN4Ko+4K3GxQljxkYRJeSLsv//2t55SlDI5fWDXFZ2QE/OGF8RKDJvSZn6R+heqRN
	lh5dJVLrloDJGbAICCwpEhHhN0ku60IWgnY8hxx0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:42 +0200
Message-Id: <20181026081653.24602-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 05/16] gdbstub: add multiprocess support to
 vCont packets
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
X-TUID: jyPLav3Xav67

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
index c437af7aca..d1ec245d1d 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -713,10 +713,40 @@ static CPUState *find_cpu(uint32_t thread_id)
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
@@ -740,10 +770,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
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
@@ -1078,14 +1139,16 @@ static int is_query_packet(const char *p, const c=
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
@@ -1124,29 +1187,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
@@ -1154,10 +1240,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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

