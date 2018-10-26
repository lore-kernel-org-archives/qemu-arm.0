Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp439836wro;
        Fri, 26 Oct 2018 01:29:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dqtZYqcVt9Q93UlUYvYAAmV+yK7rSWx21sQxHvYMh2r2aZA8R5pY+FBqRboqwtIu4DkXU2
X-Received: by 2002:a37:3289:: with SMTP id y131-v6mr2231091qky.325.1540542596045;
        Fri, 26 Oct 2018 01:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542596; cv=none;
        d=google.com; s=arc-20160816;
        b=cerVfvKsTa10zfaZmZ480c7w/ZpOx8fpZwRRf4TKKvDeIr5gMJIQUlcvy1nUcF77yg
         EI/Yo1cAe/FGXysta+bDDgeugBj4I8cUpfoM2kcCvL0Nbla7xYXdO0wPD2UcaeiQZFKX
         aoTavOuZl1rJGfLFqVsCyGWYMHIw3bkXs8hEgaPfMHKNM25h+swDEUW9Req7jlXO5tJM
         9RL7aZirUX9rYWG82nuk39PeF3WJ8V21nBJMHtesXQazrCWknhGMz4jmTkLTVri24SFQ
         3DezP+MdfMZs8thczgNp4YJCn9xsgYMn0jkHfUnO2JD9hf8CWGU6SkIEtN8fsVQpYRwz
         q4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=mVm68J5AA73i/xrDLZY4RRamh/navU7pZ/z4B4+ljmw=;
        b=Sr6ep285YEJ+1rJRnw1f4t35J3uQpPeCKvEstANqjTr25b61W+feVs+ozJ/8wG7wda
         HctWbLLmOoOQ/TgIbWaD5r0/vNrBvaFZ0PVkvu+rLta6T+OWxMHeXNGrNtkSaVqVjkuh
         Sy3R3DQM4jTyqgoaOxQ8x3+9rn8rM/E9KPNZ1ZNYFiRtL5eZBIJTStRJp/dKkMqRbKqi
         uigkqXQOHMX7qyTnMR4/Y0Xb6HiPRCQqTIgToxaJT3H/bJCZT33rGGVkFPEhKxm+1KT+
         MMb0hDtnujrqinSye6lsHglq1TTZkSZCuQjTFvjhbaUSK90JIVbCyqtad48nQCpHVKM3
         bU9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rYHzEfAu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rfIB1kaN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rfIB1kaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84-v6si294024qke.23.2018.10.26.01.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rYHzEfAu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rfIB1kaN;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rfIB1kaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxVD-0002k5-Gl
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxU8-0000gN-ID
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJY-0004yP-Hl
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:53 -0400
Received: from greensocs.com ([193.104.36.180]:45404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJT-0004lZ-NK; Fri, 26 Oct 2018 04:17:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CF96E441B42;
	Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=ZJZ51gb/+0GYcqwnEU5qIkiweEdjBR4mN+0UW8TXl+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rYHzEfAuk7/u/AvYFYc1pB0dCt1YqoDDq8Ad5RoVwc5uh+N5XwRRYczwtElFyA3ee
	XvNh3w/dpbZWteXc1rePrCrQ4Y2c7JHpfZrYsgZMbvXglhHkqerikOVgQOfm6zbIsQ
	Ic0iRy6fRAFdOZv8Djq8L/sIaxbZVgOcfdb8V+N4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=rfIB1kaN;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=rfIB1kaN
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eR0hpdBfr9Xa; Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9F46A441B48; Fri, 26 Oct 2018 10:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=ZJZ51gb/+0GYcqwnEU5qIkiweEdjBR4mN+0UW8TXl+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rfIB1kaN11HEzlIFO4e5rko3hlHaGoRo1d5v3X3cv4mRMzuIl4LMQCRXB8A/GzDyk
	M3eytmGrUWYoYqOzYuhlEwFG46TYmjF/HQ2XOSigpADIxIUEmZwOSVmENuE86VureK
	h+68MYvzMi0oMaCTnee04eCD+LQYaXLUhcfIEe/4=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 30C0F441B49;
	Fri, 26 Oct 2018 10:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=ZJZ51gb/+0GYcqwnEU5qIkiweEdjBR4mN+0UW8TXl+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rfIB1kaN11HEzlIFO4e5rko3hlHaGoRo1d5v3X3cv4mRMzuIl4LMQCRXB8A/GzDyk
	M3eytmGrUWYoYqOzYuhlEwFG46TYmjF/HQ2XOSigpADIxIUEmZwOSVmENuE86VureK
	h+68MYvzMi0oMaCTnee04eCD+LQYaXLUhcfIEe/4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:47 +0200
Message-Id: <20181026081653.24602-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 10/16] gdbstub: add multiprocess support to
 'D' packets
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
X-TUID: z0XtgE0Kd6qP

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 39b1766f28..4d8474204f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1036,24 +1036,39 @@ static int gdb_breakpoint_remove(target_ulong add=
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
@@ -1328,13 +1343,44 @@ static int gdb_handle_packet(GDBState *s, const c=
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

