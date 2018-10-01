Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730435wrt;
        Mon, 1 Oct 2018 04:58:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62vP3BPlMkurGmOqqRL2VdRapRnvaCXrxlin9qdicQOinLj0mN3LsHw6k9Cvuu6NNfAcmhs
X-Received: by 2002:ac8:1817:: with SMTP id q23-v6mr8100852qtj.223.1538395098995;
        Mon, 01 Oct 2018 04:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395098; cv=none;
        d=google.com; s=arc-20160816;
        b=RystjvysQLOV4mgpqYXd7RgxGvoiltiRuCKaINHJX7c1d/KIdCmknb8ILjD0CUraIQ
         6q8tbZfSwM2UhnBUIGcgfVnBqOAHK1xeyoXgVbQJUoHnR3az1IlWxrWAoOyOETEUVmUo
         6I6dCNGXz2NzTkKod3Ildf/PkOKMYh2nvOJrwWimMJNavOOxhK8G2IPZFJoCm/YDTzPI
         uUuGMe6s0hJowYjzGw7BecfSo4A2K5TXQxteNpIhrCXncz8YRZ69FbS7+NlAT35JP79i
         IJyZOI9hokD1qw7p0z3gehbDnExh7is2r9hrksRX7E+AIc44Gtl5w0dsuTeeyfhdKw3Y
         BCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=w12iMncuGO9xj2ueYCzzzo5rHQ9HPXRrNiXGOeyJGAA=;
        b=faeXCggQT+WlfBQfMf0uG4ptGcPCcJxY9qD+eFgA/Lrbv/cVkvyGePGE98ROeZ7Ke8
         vhmWfbL5f9ySqiqB/dAjhsNuUUOmAysUrFpeCtegdlHltV6ooKSaMza3X8PRd1sco5eJ
         SWe6eCNNNXD0AhZ7VAdEfWWwMDd9jhkVuDKN6PZs/nbjr510myQyDwiwqRhosKyOgI2m
         2Jr07FyRIi6pSKAkUzo6KPxkuhvHU1POPSTOqBDnEyYoWIsds9aZsKmGP3R+nZ5F82GF
         CKzf0FLTNGvoyXiJI5LJmp8GhKxunj+GqtozcoGlwLw9pKLFOSbvxB40mAcJWCH+s/Cc
         Ig3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=xSc1INM1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LxrlIO0Z;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Z1llqlIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14-v6si1133722qvq.239.2018.10.01.04.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=xSc1INM1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LxrlIO0Z;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Z1llqlIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wqA-0002tp-D7
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NY-Lf
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005jq-8b
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005gc-NE; Mon, 01 Oct 2018 07:57:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0ADA7511C6E;
	Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395034;
	bh=UFouwvELHl9JcuGuuuxFHBpyox2Fhsgl1OaPcur/BDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xSc1INM1xfYRsUd0Io8JEnYVw+9qPPmehjEzdlT+ZR7CN8Q641ps1m1rSSe3bn9jd
	VokPQkV2ykacyoSreoCnLVxnfUV4jo/0XdgbZFyUDuiRj5sO/73Ezr8X4OkW3zMPAy
	mDAkjkBQN3EkgKbwwOXfxdOSnj0SGe3RpcONgaCg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LxrlIO0Z;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Z1llqlIS
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVtfJdSWOOVA; Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8AF0F511C69; Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395030;
	bh=UFouwvELHl9JcuGuuuxFHBpyox2Fhsgl1OaPcur/BDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LxrlIO0ZrUztb4VPRKf10Qm7md8269GpWKNC0Rrc/r8p5SFg7upoweQWZvlwix+Xz
	tgjzV6noJiFrVdHFSzn4+VL/t6WZPsRFK2Gu+7tghPz53T0Unx6DSHwn8NuUwwRqzD
	h3FjPGC1KRuOq4tQNrlZMPZNw4asFShRRxYobKds=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9E703511C71;
	Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=UFouwvELHl9JcuGuuuxFHBpyox2Fhsgl1OaPcur/BDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z1llqlISCAFj9PyswMyvEMZ+P5R++7QF7LpwoYMkn9Cr+BVHBfqUjr1GWcpGXE2Sp
	a4LVcObp28aX5RDH901qUoI+c5sH9LmyICjM8qQ6aWkaxzgT2LChos01eagLRbR74d
	QSU2OmkUfHXV52Lq1iEISh/ChCXU9JlHVpIpVLHo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:58 +0200
Message-Id: <20181001115704.701-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 09/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zsMTnIfYLGrg

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c1a02c34cd..299783b3b8 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1025,24 +1025,39 @@ static int gdb_breakpoint_remove(target_ulong add=
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
@@ -1317,13 +1332,44 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.0

