Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp244387wrt;
        Fri, 7 Dec 2018 01:10:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W9KhDZih9niafSt3lvS99rEo34kqQQXBGe8Wm+mzgUaUEg694luWY336c0Avr9qpEiHPm0
X-Received: by 2002:ac8:2fdc:: with SMTP id m28mr1276581qta.202.1544173809981;
        Fri, 07 Dec 2018 01:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173809; cv=none;
        d=google.com; s=arc-20160816;
        b=aNVlYBB7PuZ1Wn9G1xr0H9qgNz3it+kfgBtlxHd8dNeWOYQX5P87MebO7vvnA4NMzd
         MPRYR/vo09EM3DDh2uIC+AC2GjVhomQqIHE4wjhsQ+iJ1tRy0Zg3AbXR4n27FzPL4gHE
         3Ld9pyWbrTMb89BXSVQP7L2gWl2v/Ex8Ui5s7K8SjpVL0CKjBV5Y4QhrUdmKqtjxGeoG
         Op0vjG+NhJtrEDA3yDcyxzJzvto5MG+cJSz0tN5nxrrijzyoFqaYX2Clojk0+NSAVa2c
         dtVbu45KcCfoe+ZOSm+eQbjKRBgsA6cEAM2FGeHHpFTJEZsKXy+t3o3kNda1Tpa2DgGR
         J8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=DJBSu/7gQX/vlIJ0uAp4YAl5qpRM85zw+ifd9UnTdjw=;
        b=OOHW98Z0i1I1vjbm7bjm1/UpZSFyLVfRZpCTdb6r7XaIEFBxulmq204wCpj+gSM0ce
         AvbMzXrdo9kYknrSbd2b5InDJfNLF/h2aqSYHJ/iojtT8bx8wM5WuPIDq+ZhxPk8Utkv
         huJzuEa7P0fZ5L8l0gUSnRKaQVb8w5wpNS6uAlxFHCFNvJpg9IVP6/Baf1kCZ9ToKvWy
         zb7tQFpqZosy5EdDUw4262v/36isYP0sxok5LByVWizsJRRlvpf5zzOdvyn1ovhYDsW7
         KFdlgW7LeIX+90AshTEmW3IHb2y9o5eNL1FNcKr6WqQ7W5b8EA1YLubwbLdweyL1G/gf
         O8Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zzdD56pA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yUv96e9O;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yUv96e9O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si127937qvb.136.2018.12.07.01.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zzdD56pA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yUv96e9O;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yUv96e9O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC9B-0006l7-7I
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:10:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1O-00081p-A3
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1K-0005ZB-HV
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:05 -0500
Received: from greensocs.com ([193.104.36.180]:52172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1A-0005P0-4l; Fri, 07 Dec 2018 04:01:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DB5C148003D;
	Fri,  7 Dec 2018 10:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=kB56oet04D2MbLCru1kH6fcA5mY1A7C1tONrUo4uOwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zzdD56pACnTP0Z9OCyJSXVSnk5G13h6GHF4aCSrCPc7ZecL8YSiWHNgWhb/KtQWHA
	fiYQ1Q1jdC1wEI3eznXp7cvEcsjLupqDDViLKq1RGk2/HJ/KrpaRaSfJHmvFMeN7lP
	kWFRXM8TjG0mFJQHZDVvpulBeZVr4/VCDtthtuPw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yUv96e9O;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yUv96e9O
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-MDqOoO-Gbc; Fri,  7 Dec 2018 10:01:47 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4A56948001C; Fri,  7 Dec 2018 10:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173303;
	bh=kB56oet04D2MbLCru1kH6fcA5mY1A7C1tONrUo4uOwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yUv96e9OnmvSlcrqEeN4ndARiSLqZHvkqVjDmSCwiG8srdrSrZy7NAAPTTdWGkwtV
	bkEzMCvIEdg9JyzowW3MuGThLtiVVdeJH42rfTy/tiNc6DcI0+8U24/zlUfTvbFyn9
	32VhFfQewaNc8KyslaGwO5wmJoNub1MmdM1pK83g=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id DE25E480011;
	Fri,  7 Dec 2018 10:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173303;
	bh=kB56oet04D2MbLCru1kH6fcA5mY1A7C1tONrUo4uOwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yUv96e9OnmvSlcrqEeN4ndARiSLqZHvkqVjDmSCwiG8srdrSrZy7NAAPTTdWGkwtV
	bkEzMCvIEdg9JyzowW3MuGThLtiVVdeJH42rfTy/tiNc6DcI0+8U24/zlUfTvbFyn9
	32VhFfQewaNc8KyslaGwO5wmJoNub1MmdM1pK83g=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:23 +0100
Message-Id: <20181207090135.7651-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v8 05/16] gdbstub: add multiprocess support to
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
X-TUID: 3Grpe5uwob3g

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
index 911faa225a..77b3dbb2c8 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -721,10 +721,40 @@ static CPUState *find_cpu(uint32_t thread_id)
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
@@ -750,10 +780,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uin=
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
@@ -1088,14 +1149,16 @@ static int is_query_packet(const char *p, const c=
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
@@ -1134,29 +1197,52 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
@@ -1164,10 +1250,11 @@ static int gdb_handle_vcont(GDBState *s, const ch=
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
2.19.2

