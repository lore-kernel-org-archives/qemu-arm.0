Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1752921wrt;
        Fri, 23 Nov 2018 01:22:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5ce4gf9C8/3NQK6Y/RrlGf64g5a6zdpgkXbUzCcLrIaF0+qIAiHN3scdgALU+CXacsJtHhT
X-Received: by 2002:a81:b382:: with SMTP id r124mr15269594ywh.102.1542964937979;
        Fri, 23 Nov 2018 01:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964937; cv=none;
        d=google.com; s=arc-20160816;
        b=E4HuanpaVtSEvxPRnJhkBjoHi5pEHtcn5XMXbTuyND7F4rIEq1z+P0cXSwOpsl17yt
         Yy98aOVQW2DS7JNSCiuWV3i+OTbkAq2cY8/9g/92Y5+P4jh1FhoI2NJ711aRCROz38Os
         iLjQ/51vMI/g6d9DKN8qAm82yDkPdlRgoJkI88bFbs+AN2aO72E4A5746buhYP6Dtzfr
         o+JA5zhoDy5FfPEB6R4WutCwma64FfP/zyB275Z+9tGykXfKgHg5IwUaXgNgCsFTnGoT
         iwbvYooYFLC2Gj63hV+7wz4GV1xBkxidOSWnkinA/o0/LuH1fJbbRKCVgFJQyNVq4pkY
         vnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=FgHYNdJOAJYj+6tXo7hwG4nU00mFcZdXS7rKwxjOiZY=;
        b=sIEOA9w8g5Ntk100+6+2YAmncWfDuNClWbSS0F364KOZQaK3/mnepPkFnbsleFyKam
         q++pXvSEDJ0CE+gBCNEKe9qYqinhmdXYomb7scLjdJrVyVevYCWGyDGM+nmIh7bnvOTA
         988Q2rqvk9DZ9Uo4KoGchkQ3SfJjDWrZshty0ZRLr4cr80suenmi7WhEcw5TPBmVTBBu
         vRa5xBbpDTLdfXVdX9OFe97/w9FrIjzu6eWevo+SUjeEdA5pqYezO+kvgIwEn567Mbc2
         l19DiIRete5fnaDFo2Qw6pPfuJ+pAUKYDIRBskz/O4ONQEcM8SrIzYDF+cSKjc0gb6wD
         aNYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=e7DaYj1W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kTT4IyNW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kTT4IyNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n5-v6si33538920ybk.64.2018.11.23.01.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=e7DaYj1W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kTT4IyNW;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kTT4IyNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7fF-0003DF-Bd
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:22:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bL-0008KV-K7
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bE-0001MJ-P8
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:14 -0500
Received: from greensocs.com ([193.104.36.180]:47084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bE-0000Y7-Av; Fri, 23 Nov 2018 04:18:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4CA875E7083;
	Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=Z00BqOOzxwxQiFvqeJqBI3QzAKx10rAgWiZpdnSVwVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7DaYj1WrjjQbPcr5c25MhjcKG7EP7lGKR4prndD91mW1KOIAGbAq3vPjnEU1JQQJ
	KqICnLA9/V21FixDFyPTUG4ZpiUkq8Or+7a7y1CXYW31hMCPUzMPorBHwyEI6WxgWJ
	feYCZ0MuEHezllBPOKbX1rTylUMGjBaRAKvE2N/E=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kTT4IyNW;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kTT4IyNW
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Pu_KYu25Axg; Fri, 23 Nov 2018 10:17:37 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4D9B15C026E; Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=Z00BqOOzxwxQiFvqeJqBI3QzAKx10rAgWiZpdnSVwVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kTT4IyNWHQH5ZawXbni4GnvBEcpHW5KqFT3/kulj2ugtQ2m9EGQUm6FqZp52yOrv7
	OP81OEWwS4NG3fHzotXoLCoC5ubacGZvXqvU7jTdfz9qhAoancLFpPI9RWFPAPiejS
	kqS59mW3ImfZQK1Tjvy+Nm0I0cWA61rZmXGjYbv0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E2D285BD1BB;
	Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=Z00BqOOzxwxQiFvqeJqBI3QzAKx10rAgWiZpdnSVwVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kTT4IyNWHQH5ZawXbni4GnvBEcpHW5KqFT3/kulj2ugtQ2m9EGQUm6FqZp52yOrv7
	OP81OEWwS4NG3fHzotXoLCoC5ubacGZvXqvU7jTdfz9qhAoancLFpPI9RWFPAPiejS
	kqS59mW3ImfZQK1Tjvy+Nm0I0cWA61rZmXGjYbv0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:23 +0100
Message-Id: <20181123091729.29921-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 10/16] gdbstub: add multiprocess support to
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
X-TUID: 2KNpIVJ1WSnw

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 4c4f519dd9..0cccce1f38 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1041,24 +1041,39 @@ static int gdb_breakpoint_remove(target_ulong add=
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
@@ -1333,13 +1348,44 @@ static int gdb_handle_packet(GDBState *s, const c=
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
+            s->c_cpu =3D gdb_first_attached_cpu(s);
+        }
+
+        if (pid =3D=3D gdb_get_cpu_pid(s, s->g_cpu)) {
+            s->g_cpu =3D gdb_first_attached_cpu(s);
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

