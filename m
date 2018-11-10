Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808119wrw;
        Sat, 10 Nov 2018 00:14:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5dEDc5fgy3iRW6kYpMplKJXmVssKLy5SLE/7aOjTU5nvvFhYLx2tFjLFwjSbzS0xVo52okx
X-Received: by 2002:a37:93c3:: with SMTP id v186-v6mr11195445qkd.186.1541837662276;
        Sat, 10 Nov 2018 00:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837662; cv=none;
        d=google.com; s=arc-20160816;
        b=TLoBTa5WxxrfYFQv62VHRS8XdGGc0kAaqF26cCbvdTO7982nXAc/1h1yZfXqso7JjY
         qtVrZiEmL3LxhR0Lt/2uaj5JJUPKw81t5LLjfBtRBkjGvQA4MnVGxtjogBwj3NLPRzs/
         XoKNz2otv187YZRmOCrqyefXwJU0wC199eowpN9MijlhbXIk4h/cXT7tehlPadDAVq1F
         gqaiqulMjQTTbJ/9La894jTcHERCevKGZVGb7TT42vTxjHzoXPQ6Cdfz0E8DlladMBDP
         QKgZtVoHpH5xpEMTh3ImSkN++vwD5WVigIjH4ny/4W81y7E6v99G1PgczVhyuQeIxvIh
         GEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=d/Zs7xRpuRA9kPl9XJUR4ZNO346Qzy3HJKEGnioSxYk=;
        b=A4/1Fh8PYWiZaQhklfor8C8mTp/iFCnzEYiCUIANPltS+0CaXwRV/dzlP9Sw4YQ8Fl
         kl5YJMRgJTDJ2qKbFzGvoR/Qr4P+EnvXR7apb5DsQMvFIMMkWywiUVRUu4qhfw98Eg4/
         sLj9RGWPqyqfWkcbuef74nxDr3s3V0uJZR4pniIEcE8aIgArpEWwGRkRz9dbgkrv9p/1
         13GaOONahISyPzjx871kC4ZCmcEMPMiY3I+AOnuytAFNEBCWuBs1Xkgw3tGdROru1pCY
         vBdyR72VXi7v0va3o3aMTj+Ig4tmuvH7RR9vQcMkPEEjBrNnCRpamPWo6CtmMBdak+Ie
         O2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="Pnfd/RBd";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HqKUD92F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HqKUD92F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si1571371qku.235.2018.11.10.00.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="Pnfd/RBd";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HqKUD92F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HqKUD92F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOPN-00045a-LE
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lJ-7R
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOb-0000VW-4T
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOZ-0000TI-2w; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 882865D19AD;
	Sat, 10 Nov 2018 09:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837609;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pnfd/RBdLOiXhi161ueCWjw++N3DpE1bTuD8rD34zx6W/Tqu/SBD3c/Yum5Nja9Gf
	TkxhUW3sScQjY7GMcUYO86+tTlIPrTon9bFiI4jI+2DijpyZYxs/l/bLNaBja1x0bX
	hTWuXBVeqDK0BcWencfDXM38l6F7qWJA822/YMrA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=HqKUD92F;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=HqKUD92F
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiFfZPx__lsB; Sat, 10 Nov 2018 09:13:28 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9B68ADFFF5; Sat, 10 Nov 2018 09:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HqKUD92FDOOeyEXItE0cGLmNuLpXCZ3wOFrLdsEVPk/8/jEGoqCy+eQdAWQS6Xzy3
	EE6Y+zDajy1xbXYf63ub9jHafrVrPywQ4Tm0vtnw2/EFFPX3cJV4aDh+44lt+kPRwd
	af7/WtA7AWO4eHpmhQ/5+GpN5GRvHWMGsBXA/wRY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2E20CDFFF5;
	Sat, 10 Nov 2018 09:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HqKUD92FDOOeyEXItE0cGLmNuLpXCZ3wOFrLdsEVPk/8/jEGoqCy+eQdAWQS6Xzy3
	EE6Y+zDajy1xbXYf63ub9jHafrVrPywQ4Tm0vtnw2/EFFPX3cJV4aDh+44lt+kPRwd
	af7/WtA7AWO4eHpmhQ/5+GpN5GRvHWMGsBXA/wRY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:41 +0100
Message-Id: <20181110081147.4027-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 10/16] gdbstub: add multiprocess support to
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
X-TUID: RpL6R1PuTgjA

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index decf56c610..bd4895ac0a 100644
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

