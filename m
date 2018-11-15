Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6798263wrw;
        Thu, 15 Nov 2018 01:43:32 -0800 (PST)
X-Google-Smtp-Source: AJdET5dgfHzDVflw4Bx9QgIibj0jH8XBizuAJMYRVsRNeNftbapXFt4WSCv1BkgiVWvGn3zJpKb8
X-Received: by 2002:ac8:5053:: with SMTP id h19mr5079228qtm.280.1542275012704;
        Thu, 15 Nov 2018 01:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275012; cv=none;
        d=google.com; s=arc-20160816;
        b=spHX/i98NqW8yvwrp5xnXP/oa7Jv4mXw+RLfmGLnjKDQPAnv3ss6gxr7F+fz7LyedI
         U7N0zLVzju2ylcooM8ugFqaPYeRS8ZcLnANX0LV7M6j/iqArXWLfbdoE4pkNvBl+y3Xx
         leca5f+IxbkSJ44CNngrmy0Pmxw/yO6xVoO14N8BXImaVllN1I1z7jKTmihg9JyVz/5Q
         L7xkPTO/KH5ALKzB1n4niX+tFLIKhEszSrAuUke6Ho4uX7nScopNbpFYW5trOYqggSjq
         WRxrIvf4W9FrYm24EuK+5saR9GcQRQy5R686no+aVroUVs3HfLSwFXlXcrkVb/gHpMO8
         Ycow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=2UiAaBboxoKCBvEy2iXZoUPaGNL77x6C28BJfBQ29Jg=;
        b=rzR1E3svjhNRlPFNcnvngWshvja7/i5SqvapvLTugN2ejM41ipxSYg/SaXXeK4pfzr
         A89ItH/1dJlFHYUDHJkfyyH3ttUd6AU1qJHnFVx2PfcPixPvGT9xXtuuPQEGHffFahd/
         UizQiBv/Y9JPvhdurBp/8aBPFrb0+odQHLq0gk2iQs8G/gQd+xatQ8sHNQx0nVMHDWoG
         IvbpQC+GKJh8HYTFxlNzOqfuphxUUFmUtz8/Bz4Jt6VVNvLg1RQ0TRI6omAEBrJaXTu9
         31DpX6wB3ER5FvSsJkpC0/fq/u6Hy8nIqYL3+w+DSOcRw0jK04YCCLdrJuamDa/RH1uU
         Rq8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gFIWKxx4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4wSVQ0nT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4wSVQ0nT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x45si2114952qtk.221.2018.11.15.01.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:43:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gFIWKxx4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4wSVQ0nT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4wSVQ0nT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEBQ-0007ny-42
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:43:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAl-0007Nv-JD
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAk-0004lE-4i
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:51 -0500
Received: from greensocs.com ([193.104.36.180]:41903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAj-0004NI-QQ; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id F25C36FD8A;
	Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=FMStnxZ0F50sIEZeH3i6wcynmSEJaimYI3uhMKzTQ5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gFIWKxx4IDij/WZUkQGC1RVB1p1y+Anj+KOt6RGVIfAPUaateys0zNfot/YE7VmkM
	gRPRdcp+cMyPfmNmUsttgmA4iTztEvLV5gc9iUFOJED8VKHM4qjmSvDjueCzSD5w4r
	tvD5oVM82JB4zirqB0hn1G3JHGpZHrsYxIES8mqs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4wSVQ0nT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4wSVQ0nT
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcyN7FIn4iYl; Thu, 15 Nov 2018 10:42:17 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id BC3BD441B57; Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=FMStnxZ0F50sIEZeH3i6wcynmSEJaimYI3uhMKzTQ5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4wSVQ0nT+KvyUjwW5SwW+qcSnGBjwlAMQTmASeHZvJX5q+E77f2FEVlVxRzrlPVb2
	iIqg5xeazABdXBBXqT11CZRoJkEZs+LCwzHDJ9wleKbFkhZgwrxJ5WfvZKNmh3xdC7
	l0k1gBdGyiq7AgT39A0gD9Oql6ftS9qyCgPqUdHU=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5CCEA6FD98;
	Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=FMStnxZ0F50sIEZeH3i6wcynmSEJaimYI3uhMKzTQ5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4wSVQ0nT+KvyUjwW5SwW+qcSnGBjwlAMQTmASeHZvJX5q+E77f2FEVlVxRzrlPVb2
	iIqg5xeazABdXBBXqT11CZRoJkEZs+LCwzHDJ9wleKbFkhZgwrxJ5WfvZKNmh3xdC7
	l0k1gBdGyiq7AgT39A0gD9Oql6ftS9qyCgPqUdHU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:01 +0100
Message-Id: <20181115094207.22846-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 10/16] gdbstub: add multiprocess support to
 'D' packets
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
X-TUID: LDTCq0atkghi

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 5df9929f92..eec1cf0d09 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1039,24 +1039,39 @@ static int gdb_breakpoint_remove(target_ulong add=
r, target_ulong len, int type)
     default:
         return -ENOSYS;
     }
 }
=20
+static inline void gdb_cpu_breakpoint_remove_all(CPUState *cpu)
+{
+    cpu_breakpoint_remove_all(cpu, BP_GDB);
+#ifndef CONFIG_USER_ONLY
+    cpu_watchpoint_remove_all(cpu, BP_GDB);
+#endif
+}
+
+static void gdb_process_breakpoint_remove_all(const GDBState *s, GDBProc=
ess *p)
+{
+    CPUState *cpu =3D get_first_cpu_in_process(s, p);
+
+    while (cpu) {
+        gdb_cpu_breakpoint_remove_all(cpu);
+        cpu =3D gdb_next_cpu_in_process(s, cpu);
+    }
+}
+
 static void gdb_breakpoint_remove_all(void)
 {
     CPUState *cpu;
=20
     if (kvm_enabled()) {
         kvm_remove_all_breakpoints(gdbserver_state->c_cpu);
         return;
     }
=20
     CPU_FOREACH(cpu) {
-        cpu_breakpoint_remove_all(cpu, BP_GDB);
-#ifndef CONFIG_USER_ONLY
-        cpu_watchpoint_remove_all(cpu, BP_GDB);
-#endif
+        gdb_cpu_breakpoint_remove_all(cpu);
     }
 }
=20
 static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
 {
@@ -1331,13 +1346,44 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
         exit(0);
     case 'D':
         /* Detach packet */
-        gdb_breakpoint_remove_all();
-        gdb_syscall_mode =3D GDB_SYS_DISABLED;
-        gdb_continue(s);
+        pid =3D 1;
+
+        if (s->multiprocess) {
+            unsigned long lpid;
+            if (*p !=3D ';') {
+                put_packet(s, "E22");
+                break;
+            }
+
+            if (qemu_strtoul(p + 1, &p, 16, &lpid)) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            pid =3D lpid;
+        }
+
+        process =3D gdb_get_process(s, pid);
+        gdb_process_breakpoint_remove_all(s, process);
+        process->attached =3D false;
+
+        if (pid =3D=3D gdb_get_cpu_pid(s, s->c_cpu)) {
+            s->c_cpu =3D gdb_first_cpu(s);
+        }
+
+        if (pid =3D=3D gdb_get_cpu_pid(s, s->g_cpu)) {
+            s->g_cpu =3D gdb_first_cpu(s);
+        }
+
+        if (s->c_cpu =3D=3D NULL) {
+            /* No more process attached */
+            gdb_syscall_mode =3D GDB_SYS_DISABLED;
+            gdb_continue(s);
+        }
         put_packet(s, "OK");
         break;
     case 's':
         if (*p !=3D '\0') {
             addr =3D strtoull(p, (char **)&p, 16);
--=20
2.19.1

