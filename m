Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp240579wrt;
        Fri, 7 Dec 2018 01:06:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uqt/cf+zgXb9M0th9m2fmOiemKYwBU4Ev3CjMdijozGb5Nwyz9FYYoL+sJspjlYX850oSn
X-Received: by 2002:a37:5686:: with SMTP id k128mr1017228qkb.29.1544173572466;
        Fri, 07 Dec 2018 01:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173572; cv=none;
        d=google.com; s=arc-20160816;
        b=Eeyn5IF9q6BlEl9BUBNl0nfQlZCOnKmnlOZt0tS6RRkulHwqbQuox2dR6v7fCmngFc
         D1rHBtXKqa1FbTJ5eY/sdZ9VRilc4X2C/718/y6HHm703TKlM4/pgi4TK4ES7ENAZmky
         ULQwS+2A2y11ryRYuNubt9RlDWhyutvZDO6eqCQr0B0hJhhXuLT1HtPYiqiis4YdmDC0
         XmaOajY2XSYyT6Mrjx5QrsyE8164Fx5KbegiIZnrEKn9ou0YhsFlU0o/Sl0k4ha9TsEc
         RuBmaFk5r86mpBQJSh96PJnAunVJTiNqMdWM/7y2jvXepwfpSAnFURVeAUp9xle5hZFT
         gevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=HX2PLBlZqoAcRvwJ1gRWS9vZCeNUJE9WX1is7una/Sk=;
        b=riiBCv/lvPrweOaaStLpCCrNmFmRiMx+FGQmNP1ODaEco8BS4nhxZABHi8M45/4z03
         vREiAyHr0I5w2OOg2QkRBQAwEAJ0YRBxXCI4TJ9ZMIuQdW/WoBbFoE8tMKBaupT7C0Vp
         yLkk3v71Ln+YUTxsuj51bV3DDREtiAQOj4/t2U9y8zxS7yfglZsmVLg//ZvaysHuycwE
         +kTg44BNuh1/mfzkBtLypds2jq/He2hokS1ddXJXCVepoE3TOoZdphrODT054BYK2rZf
         C99Xwz3B9uN8sAPKofEox7hC3b3CIapNNROVgxIv9+7a73a2PmjjmQe+s4aI2rSx1LEI
         yu7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qGMnhw3V;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LAFz6sz5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LAFz6sz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si1808740qvd.218.2018.12.07.01.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qGMnhw3V;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LAFz6sz5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LAFz6sz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC5L-00049x-U1
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:06:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1X-00088B-Pw
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1V-0005e1-LR
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:14 -0500
Received: from greensocs.com ([193.104.36.180]:52246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1V-0005Rs-A7; Fri, 07 Dec 2018 04:02:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2E513480036;
	Fri,  7 Dec 2018 10:01:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173311;
	bh=fTLojJdToljvuaXR6Y5DUo7NPRDCtUsKLEk8/1L5s4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qGMnhw3V5VbeAJJgjH5w8UfEdINWNpVwVvARFFIzY3Wrd+bFrnDl2oOdSZkGK9uiH
	CCXG3t+GFhrh8l2Ii02514xSH2bgwV8pXUnaLQgz3HimhUlXGdZStAgml9JmUfXMgX
	C5rd6N+9VXHyzEWEE5B82q70Z7SYi10SckIx9NyM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LAFz6sz5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LAFz6sz5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7Yf1L6AME2X; Fri,  7 Dec 2018 10:01:50 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 698F1480038; Fri,  7 Dec 2018 10:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173305;
	bh=fTLojJdToljvuaXR6Y5DUo7NPRDCtUsKLEk8/1L5s4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LAFz6sz5j9L5LiIpDtvvLm/kCN6LE6VMYsr3OApcGA8feVzeGVdxXGTfMaTp3T/Nx
	851WSxpwV26fvRq+Y4sLJSghf7p0ZynC9m/l6vfqMBTBLTYG3F0X1ahwykVcffGJgc
	yuPAQ7E+AbRL2CJrzmDBvZviXzhDMaVQLv5/u4ts=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0328C480011;
	Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173305;
	bh=fTLojJdToljvuaXR6Y5DUo7NPRDCtUsKLEk8/1L5s4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LAFz6sz5j9L5LiIpDtvvLm/kCN6LE6VMYsr3OApcGA8feVzeGVdxXGTfMaTp3T/Nx
	851WSxpwV26fvRq+Y4sLJSghf7p0ZynC9m/l6vfqMBTBLTYG3F0X1ahwykVcffGJgc
	yuPAQ7E+AbRL2CJrzmDBvZviXzhDMaVQLv5/u4ts=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:28 +0100
Message-Id: <20181207090135.7651-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 10/16] gdbstub: add multiprocess support to
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
X-TUID: GQbqQbd08HzA

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
index 4645d59d8c..48c2571ebe 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1046,24 +1046,39 @@ static int gdb_breakpoint_remove(target_ulong add=
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
@@ -1338,13 +1353,44 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

