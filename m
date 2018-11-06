Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp739517wrw;
        Tue, 6 Nov 2018 03:07:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5fhA/X0BKea9YsVtEFEt0Bq3CXOE9lsMxjR/WIkTJcAbkYtN0yZ55CfMJQ77+NnA495ZY8v
X-Received: by 2002:a37:1a94:: with SMTP id l20mr24434852qkh.248.1541502448163;
        Tue, 06 Nov 2018 03:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502448; cv=none;
        d=google.com; s=arc-20160816;
        b=kq92rc2fHb064bUA+fCej5ZgYeukDGnLx2NiO6Vs8kT6cmIcq5YGrAKqLnbpNJi0PR
         vTsAPG3G2QQsdZjsfZymJcJihFnIBUf04HFTqYxQkoV7xjF8q2hMhxuc4LrZs3V3wp5y
         7VrMiKTUHwAZbiG+g+SbHaBgZfclZ80n5ioy8U9WIvIY39eLWMuKZDon42xXPHVZ5Y2f
         suXKCwQat2csyGDKS0P2e8Cm8XKKUB6R4vmxBhJoibOevXgkjgScCiG6/YDPqGKx6a/Q
         F3HWe8W5hteEUgoTrbakBOuVUK0gtOnsuWapFIKh86kN6ODvGI9SUEHjOqFC4pi8IHRV
         jjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=d/Zs7xRpuRA9kPl9XJUR4ZNO346Qzy3HJKEGnioSxYk=;
        b=ykCI3xkO0e1bNecOHlI51jmG/3hyPhpp+Stf6lvsbl7Ifzj/L8Xh0CFN9+ofCVDJf7
         c5otYDhIoEt3o/4JeEBnPoQ6Q/tzd9IFJ1LSpICPvMdeDMrqAEgTBLxmdiKQ3TmLPIww
         5yjiGBoRSBUROXEN18rtxqyccSVv2/pxW6zc8sjvEDzJdiGjSH9z9nRCj1RSDl8gr2mO
         o2BVB+UoYV9sNkdOx698MTXaavsIDCnVGOqc/i5NgbYkiGMWeaH8SOrkmEFaalKevv+C
         fWQBvrsGHHz6qIZKFgFxgqRXUxsenNxe0EiOHgLCvENkP+9zYLQQkuhuhqWCfcFZkNou
         HgxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5uvu83pN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RkYW08bu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RkYW08bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13si169569qtp.334.2018.11.06.03.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5uvu83pN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RkYW08bu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RkYW08bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzCh-00072s-Ha
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBa-0006FR-Ad
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBW-0000qi-Pi
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:18 -0500
Received: from greensocs.com ([193.104.36.180]:46712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBW-0000os-E2; Tue, 06 Nov 2018 06:06:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 205235C024F;
	Tue,  6 Nov 2018 12:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502374;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5uvu83pNvwqwXLqFYuEuz4ZRm1FMtekwLX0P8c38TxXXg/mapDaydRmGMx2Qui1kX
	yDf6+ZFWgkxODSj7Al9RCo9YRC7/B/Cp+lUaWcN1SZL8UwnMpRTzqX0TWJMOjqJzjc
	YLrFXYxUW8oQsbLQhLtg4WkLgagANBzrWhTp/UuA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RkYW08bu;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RkYW08bu
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a56G-qZrFSW; Tue,  6 Nov 2018 12:06:13 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 3C9F95C027D; Tue,  6 Nov 2018 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502369;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RkYW08buA5LqMJXtU447Ey6RafdaomH+arLEZIAZDP5wyykpp4jFjT2FfVusarawC
	0QgzMYNIKiDi8xU+ZVBHDc+/VYI0htegvArnkBKINE3XN2zpAOQmIG3U5jMuJen/WQ
	8pe8fEzGRvbxHK5mHNBE8eyQnUFX+Lk2Uxy8lMhc=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C55CB5C0276;
	Tue,  6 Nov 2018 12:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502369;
	bh=cYsacuZtqAvOWvrLvVMrJK7AgZ/b9/60aGrfdT4mrnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RkYW08buA5LqMJXtU447Ey6RafdaomH+arLEZIAZDP5wyykpp4jFjT2FfVusarawC
	0QgzMYNIKiDi8xU+ZVBHDc+/VYI0htegvArnkBKINE3XN2zpAOQmIG3U5jMuJen/WQ
	8pe8fEzGRvbxHK5mHNBE8eyQnUFX+Lk2Uxy8lMhc=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:42 +0100
Message-Id: <20181106110548.4209-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 10/16] gdbstub: add multiprocess support to
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
X-TUID: +88iXYvvTZdw

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

