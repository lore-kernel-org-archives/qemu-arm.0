Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730017wrt;
        Mon, 1 Oct 2018 04:57:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63shmCbtT0jbGqTOH/+2snvqFYTfyLvOF9EnW9wKjbAiDF4pHc33f0GZ0d+ANBgf0X+V5jP
X-Received: by 2002:a0c:a9d2:: with SMTP id c18-v6mr8211997qvb.191.1538395068743;
        Mon, 01 Oct 2018 04:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395068; cv=none;
        d=google.com; s=arc-20160816;
        b=K2O7J4rmjUVfgVmk1v5ZDH1n6rcONFLeF8Ax+l6DeNZebzEX6nEN4VgK9CmjhNM7pR
         1SnpACb2HOu7hbA4BAOVTIDwcIfr4nDvj2ytdjtMHRIiGTZmBBfmpz39z17QjgLDyV7e
         2cWo2ETN9R5q3jRT2S6kIPlZn6wAj6r7gyJfC2q688zT+BOQ/qG4odaCaCLOARx2xcXj
         zSkRPFHgDLtSWw2Y0+KoOZsusD0qLHv4/WaMmhNA927UFGNCjg/tjChkMmaXIawkwZMu
         QHssWuBQep0lv0n9Yd6SnbYgjas4agAce2WwqzoMfd9YyESWwNuF5EC4AsC7pXtX++s5
         3pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=NXVG+R+eQ64YZthtrIzxf/rxv2DrVKQNM5xyIyEBEFA=;
        b=AblLz4q+bplTuSdiBm+P9j10PSIQfRVrqe7RQ7XeF5u93e+AOg5+MvKjQKlwLuQ4Du
         xvm8g5gbcszOl3m476nGWQy6LwiWjfxyLQ7Tnvt86LgYm8xw5qJ9IF8seX4py5/e1WIZ
         8lm79A5/LQBSVds6+mCKZ3QmtMZeRq9ENFOOiIdWwaFAtRUkPSB1RPPYh0e3VzsQztmE
         S4yfEx6dwiBdMNtAWgMjNjY05jdG+outMEfY8Vj37CeyBB82k9DGfp3ehgx0skyTmDKG
         8ONpSlg9DxKODPepnP/a53YLatp7L/zwihTeipNST0uGLwAfkffaIRvxE9CaRHr8S4kD
         WqFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=l+66bg53;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWq0iBM0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWq0iBM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2-v6si8741232qke.69.2018.10.01.04.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=l+66bg53;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWq0iBM0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OWq0iBM0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wpg-0002OU-8W
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NR-JF
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpN-0005jN-0q
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpM-0005gZ-Gm; Mon, 01 Oct 2018 07:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 81212511C78;
	Mon,  1 Oct 2018 13:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395033;
	bh=M8REKNwH4qFmyvROFKIcRtEkSK+Yf801vnRgI3pzY/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+66bg53Qucf36Iuozr4p9qrLHroZUTcEyFqbLMLKhnvQ3mnSw5om4yxNc5cV9g0L
	cJa4fXdPlLdvkJWcvEvFN886bv4j/BecHItGl4cc71xQaEokKUx6v7wF9kG7W7dOD+
	RNMXXr+PWcnY7dQF0pt0Q9+JxZ1WB/CcmSAHxkLI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OWq0iBM0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OWq0iBM0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfxcJ3NWPSMk; Mon,  1 Oct 2018 13:57:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A54E1511C73; Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=M8REKNwH4qFmyvROFKIcRtEkSK+Yf801vnRgI3pzY/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OWq0iBM0ZUZTLTGAxVgL8xDHzmijtcmFxhrIkLOgFYekv3uKYfwPbgcUmdtjkuMRh
	5C1BbftgIrHf4vkj6uBSHJSXlKJu2ZWZT7IPvw35H73jgoUbvypmx0cqE3z9pMkH5r
	4hzQ+Ns2rNXqeVUae2GpscOyndcA/u3FPRXf/+ZQ=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3ED12511C59;
	Mon,  1 Oct 2018 13:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395029;
	bh=M8REKNwH4qFmyvROFKIcRtEkSK+Yf801vnRgI3pzY/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OWq0iBM0ZUZTLTGAxVgL8xDHzmijtcmFxhrIkLOgFYekv3uKYfwPbgcUmdtjkuMRh
	5C1BbftgIrHf4vkj6uBSHJSXlKJu2ZWZT7IPvw35H73jgoUbvypmx0cqE3z9pMkH5r
	4hzQ+Ns2rNXqeVUae2GpscOyndcA/u3FPRXf/+ZQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:57 +0200
Message-Id: <20181001115704.701-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 08/15] gdbstub: add multiprocess support to
 gdb_vm_state_change()
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
X-TUID: t4yCZpgRGnzH

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9065e8e140..c1a02c34cd 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1692,10 +1692,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
 static void gdb_vm_state_change(void *opaque, int running, RunState stat=
e)
 {
     GDBState *s =3D gdbserver_state;
     CPUState *cpu =3D s->c_cpu;
     char buf[256];
+    char thread_id[16];
     const char *type;
     int ret;
=20
     if (running || s->state =3D=3D RS_INACTIVE) {
         return;
@@ -1703,10 +1704,18 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
     /* Is there a GDB syscall waiting to be sent?  */
     if (s->current_syscall_cb) {
         put_packet(s, s->syscall_buf);
         return;
     }
+
+    if (cpu =3D=3D NULL) {
+        /* No process attached */
+        return;
+    }
+
+    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
+
     switch (state) {
     case RUN_STATE_DEBUG:
         if (cpu->watchpoint_hit) {
             switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
             case BP_MEM_READ:
@@ -1720,12 +1729,12 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
                 break;
             }
             trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
                     (target_ulong)cpu->watchpoint_hit->vaddr);
             snprintf(buf, sizeof(buf),
-                     "T%02xthread:%02x;%swatch:" TARGET_FMT_lx ";",
-                     GDB_SIGNAL_TRAP, cpu_gdb_index(cpu), type,
+                     "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
+                     GDB_SIGNAL_TRAP, thread_id, type,
                      (target_ulong)cpu->watchpoint_hit->vaddr);
             cpu->watchpoint_hit =3D NULL;
             goto send_packet;
         } else {
             trace_gdbstub_hit_break();
@@ -1763,11 +1772,11 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
         trace_gdbstub_hit_unknown(state);
         ret =3D GDB_SIGNAL_UNKNOWN;
         break;
     }
     gdb_set_stop_cpu(cpu);
-    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(c=
pu));
+    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
=20
 send_packet:
     put_packet(s, buf);
=20
     /* disable single step if it was enabled */
--=20
2.19.0

