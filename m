Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749056wrt;
        Fri, 23 Nov 2018 01:18:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UHmOCIwY0S1lBVydvIJ9cK/np3FjMcgvaUAGUy8Eh6cLsl+TDVSXP2UBkX0qtyNzDVXoBd
X-Received: by 2002:a5b:b8f:: with SMTP id l15-v6mr14416613ybq.78.1542964699585;
        Fri, 23 Nov 2018 01:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964699; cv=none;
        d=google.com; s=arc-20160816;
        b=kVKxNm9vm7K33YR3qdfQvnlcUBq0Tyeoh+jykw8YgSx3kk53Wln+a5Zk/tHdtBxWbA
         Cta2vaLS772UvsErT87YhFxbKDOKytP/vgombTgSqO0IoQbfPBYHkxFlvoySKmS4rhcc
         2WVW5XHI762OBHsXRwuNvKI7ls/v9SlRKdFtfSBeMlro4WoxV8nsJI1A5/hLW+TIoGW9
         M34T95Zq9J8jrR75ri219d3XlNgcPL1c/jpyiJy0HW7GDcKB40P12imPU15qltavdiTD
         jgEG0MgG4hX30FG4vEXac/PxxkA/pjSBhUUTTn2S78dnwZNt/jwFoFkDi8IGrrYbKxlO
         Wexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=11BwHePfdUGNW0KrDR64uCCr8Gy1zXorIVtZyVK7Y/M=;
        b=MYrLILslMC9EoKvkBg94WYdq79Oy4P6WARW4XIHnr95oE5YGcz2UIY+hph0FjvoNMB
         cMm8vO9idqpeNiPvFvCs/1YoM+MWAXnrg9YobDOBbsJO5zjWWATl9aogNz6Eh2F85rKx
         6QAHhB0tJF2VKC1NtdpjENX5qEpNTxQ9gYJSRV+IK29ntcgYNhzC3R4JiCzOE4K13P6H
         7EbezcXn5IKBeYVyFsaFjjWQnEFvLExfSXqSJBKxTKWcOPi2ALgwkgQV5QoidDE5619u
         /K2b+mt0Vgep7bVIvewULS1QgW9YhyHdqyOwfeTHxGEbmaYyAGmgLMHtjOrlJPVnpG5K
         LYJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ry5ycpug;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1cxBHMf/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1cxBHMf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si11846282ywd.123.2018.11.23.01.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ry5ycpug;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1cxBHMf/";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="1cxBHMf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bJ-0007tK-4H
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oa-MJ
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000Zi-Lq
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Y5-6G; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DEDBC5E7081;
	Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=re3gB/1E0+SoOuecR3sYWQp0WTraPxbjQZHZwSWxwKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ry5ycpug84qk+Q+QEs5YRAv9/mEeZ9I1/esX0JbAttb0RNGgMvt8ZLa4tjE8aUBfb
	iQMamhdY8pNne4OPRk73sf5pkJnze0Yt30EY6qvoMZBA6o2KVItu7TF+ugY4pHbwyV
	4V+xUQ8diJwe4FgR4TLYrQCxZDWtgnZA4EoE/mDQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1cxBHMf/;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1cxBHMf/
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0agJa5V0Ji29; Fri, 23 Nov 2018 10:17:37 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D2CBF5BD1B4; Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=re3gB/1E0+SoOuecR3sYWQp0WTraPxbjQZHZwSWxwKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1cxBHMf/GMby47/7yWO7/0j2zIGHeHoWFjR5GCe+slE9nsuw1TWGtT0qx/GQpdl0A
	SXDjpUVYtb5uEsC4MdHXwdpn/4Xk9dDO56lfaG1ipTrMRIcFuF3fZ3vMyOJ7x5IOCJ
	cncoIukw9vdtRummNq5cnm1ILmpaP0AqptjhSbLE=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4EE2B5BD1BB;
	Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=re3gB/1E0+SoOuecR3sYWQp0WTraPxbjQZHZwSWxwKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1cxBHMf/GMby47/7yWO7/0j2zIGHeHoWFjR5GCe+slE9nsuw1TWGtT0qx/GQpdl0A
	SXDjpUVYtb5uEsC4MdHXwdpn/4Xk9dDO56lfaG1ipTrMRIcFuF3fZ3vMyOJ7x5IOCJ
	cncoIukw9vdtRummNq5cnm1ILmpaP0AqptjhSbLE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:22 +0100
Message-Id: <20181123091729.29921-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 09/16] gdbstub: add multiprocess support to
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
X-TUID: zcXWt4NK+uTs

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 2be333bbd1..4c4f519dd9 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1717,10 +1717,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
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
@@ -1728,10 +1729,18 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1745,12 +1754,12 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1788,11 +1797,11 @@ static void gdb_vm_state_change(void *opaque, int=
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

