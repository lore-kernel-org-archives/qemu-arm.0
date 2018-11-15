Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6798491wrw;
        Thu, 15 Nov 2018 01:43:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5fMR240t9VYoa2nNOux4gij+XYBlgyvRVD9hy0WN3JglCU6OnZPwCTCcYioSz9PSQEN7wP+
X-Received: by 2002:a0c:9d81:: with SMTP id s1mr5449489qvd.82.1542275030502;
        Thu, 15 Nov 2018 01:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275030; cv=none;
        d=google.com; s=arc-20160816;
        b=si/me+X2IPwXpYRgeO17xE3YUphryD8u3ChMdrRyivCc10bNUqo26QSLSmBoS0HcuJ
         bezwmbbvx1iYnk1r0vs5m5zX08YZv3bvA/8FCvIYYuIdfkcDYrgSBV19bCi27hmxZi37
         +Uu04ViwgJJz3lJ1Kbjl4oU6Gqdpx899Y8nVtzvvT8+XKVpUIpMQ9Hgeau9sAT/fjT5d
         icB4flt3k+yd5vzdveBbE9fEnEgLRcI0ng0YihMIyI1HwKGz+wtxPg9nuQBLVXWZwI3i
         t2Eb7maPBIMV+13M6J3TJt8QIsSz1m0F5uIbYmm/pO2aoe2yXBu/2PplziLUMyXdXr+Y
         aBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=rY+2+9yPpW4CwBEJ+axlPAmgCHOvrtEJseuqhKQAvUk=;
        b=JSHOKGmUlSkqPFd3lhj5ZGJwRxWw6IcsUzXHN67GOdxdvaYiIH2867r6eOySHWRF9f
         dXV0++AZuG/a/SpKaGuQ36f4ejDsy+IVD0mti4kfxbnAv04CIT5yZzpz3/XjOcI6Mkfa
         /gwVH72jRh/nYJynjrVsGVHsFlDq6OW3+1v/9ziwn41sMRpxHwLwFVtngJs13UQFHKSc
         LsKwY7K0L516OuCgt7ZbdBTS3B9SoG0iqXPy3iDiGnH3CC5AH+5ESo3eyXUblS17dJRR
         +YWcpDFh4HQuJJNCNGink0zPW49KZuwNyePMFKa3Byk6N8EgLm9CrNFVddmF5dYXh0Y0
         7ZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FUXvT8eg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="U7YjMWJ/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="U7YjMWJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m96si3753617qkh.158.2018.11.15.01.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FUXvT8eg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="U7YjMWJ/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="U7YjMWJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEBh-000830-S8
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:43:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAl-0007Ny-K2
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAk-0004lN-6b
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:51 -0500
Received: from greensocs.com ([193.104.36.180]:41901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAj-0004NM-Rc; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9FFA26FD98;
	Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274937;
	bh=UDBAOEVSGWfQh0O7xzhIy8vCKBw2kBRw29FVMs7Wq7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FUXvT8egb6bjx0mzb0X8q+ZRByIk4H2qg+e1c9/P7+hFDeLgTYOS0hpLTWhvLtev6
	jxOdEl1/yKP183YU1itVsB/lASwaBg+SyLvWVvBsI7mtzJ5PGZ8fYbOxhZvbETAjCa
	eBHGE04CidYkIbkBa588tH+2D6IyuxjQMYbsAWA4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U7YjMWJ/;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U7YjMWJ/
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YlkwEJKfnbJ; Thu, 15 Nov 2018 10:42:16 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 5955F5BD1BB; Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=UDBAOEVSGWfQh0O7xzhIy8vCKBw2kBRw29FVMs7Wq7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U7YjMWJ/fzB1iqX+waDw6daR7Kuku/eTvWSie2RYSx8DZ97nDu7iWH8a/4ZNILvAt
	LXkMBULJcCIArz3bgxD/Jsa6vdE+Mmz+TfTs6uvUIUKTyz1UMSo4TZpVXN0+sBsSkd
	OfWYgU2W0RddEIWoAiSqfdt4hpFoJHl8N+qjhOM0=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id DA5E76FD9D;
	Thu, 15 Nov 2018 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=UDBAOEVSGWfQh0O7xzhIy8vCKBw2kBRw29FVMs7Wq7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U7YjMWJ/fzB1iqX+waDw6daR7Kuku/eTvWSie2RYSx8DZ97nDu7iWH8a/4ZNILvAt
	LXkMBULJcCIArz3bgxD/Jsa6vdE+Mmz+TfTs6uvUIUKTyz1UMSo4TZpVXN0+sBsSkd
	OfWYgU2W0RddEIWoAiSqfdt4hpFoJHl8N+qjhOM0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:00 +0100
Message-Id: <20181115094207.22846-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 09/16] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G5zLubRD7KKj

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 4cbc81ae5b..5df9929f92 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1713,10 +1713,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
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
@@ -1724,10 +1725,18 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1741,12 +1750,12 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1784,11 +1793,11 @@ static void gdb_vm_state_change(void *opaque, int=
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
2.19.1

