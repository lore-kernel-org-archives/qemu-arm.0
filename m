Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp236878wrt;
        Fri, 7 Dec 2018 01:02:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XbXLyUcpEVKUYpGWUNyoJqmfSjAr4aXFMvBYOVtbMiJ9H0GcgkNBYI45BzAQjq8YPX9EgQ
X-Received: by 2002:a37:3753:: with SMTP id e80mr1028879qka.207.1544173337829;
        Fri, 07 Dec 2018 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173337; cv=none;
        d=google.com; s=arc-20160816;
        b=tan3csHnpLNpi9XhpFhsCfabMpuvVeTWkgxQvFM5V4HHkTlbl0HJ9ywbmCwdYO8pLz
         P4BZSwxG/7v2AqxGdpn6cCRz5DCE6kjoIao+sCuvM489YAbS3sfEC4nec2jIsrhrysCq
         qc7rO/A9uN+tBIGEsIB845n7qeOzFipTMpoDxIzH8Ee/9caHA6iBx+k/a4PCBdJlyP6y
         KLw54/SND3rH2L78i/KBBYpPjzq2zL1U6aHlWYnqsgUzJDvEIoZGTA3C4QEJXYyqPXwk
         j5ElqDemB6po6uCIzeOq9CAksnTur5DsGzNklGO1Tb5KRni/9DE5xa7z40Gy6lOAkrtU
         DUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=rl6KXFhUd1l4Ltw+4ALTjIi/Ri8lQd4xr002bFirThs=;
        b=rcO4zsqnhMHwOJsrkh9581PMSPGgyTPvNwi9c1annENqfV4gmTWSUkFCmKQ8kkTOg9
         Nmkxf4sFUAdp6FdipuUu775L3vzcrNqo+8jwOzEqC/vXcwzlSCH5z8ClgC2rTNq6UDy+
         beiX/Jk97KdU6Ic5v4XZ8O+/g57ZOFCI2qfDcCfJTcuiE5DGn0tEsc7U5Q5D180xgNdN
         07KGE6ecsDdFOKBaXR1/BOflq3Kchwwo8aATxCpz0YCj9whAZLogXGq1pBJ1dyOYdfb2
         73N+GEjS1019nRNgThiJ9LzMR71EzR+jm2tKZsdGgzSER9eND5/Gcpa4g71YmXYqIyXn
         uU5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a6bjMqJO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Rp0oTYW1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=V7qNrk6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t62si1713045qkc.212.2018.12.07.01.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:02:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=a6bjMqJO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Rp0oTYW1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=V7qNrk6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC1Z-0007tj-5F
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1E-0007rz-B0
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1B-0005SO-OW
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:01:56 -0500
Received: from greensocs.com ([193.104.36.180]:52245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Rq-7p; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CF85B480032;
	Fri,  7 Dec 2018 10:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173310;
	bh=p6jKllSk1N89qZ5kxsijOyj3jCEF8rBu8QqbfZyaa78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a6bjMqJOACVUFsSzdXAkKsw/i3TzFSkrEylKojjkLN7wDl18XDTX1t5bNkTMqIQyc
	KTNKBKKLw4olG7i+dVJvAv5xpXSXrmPf9fp0hTMcf1NsdpDsPt2kQKEZMsvFFo2UMY
	QUzmw/yUuDf2IxIL1+ZmQ3zeEfKuOKSAYqG+QUxs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Rp0oTYW1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=V7qNrk6b
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioCa8pdvdKO2; Fri,  7 Dec 2018 10:01:50 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id F3C3C480036; Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173305;
	bh=p6jKllSk1N89qZ5kxsijOyj3jCEF8rBu8QqbfZyaa78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rp0oTYW1YokZ8Upw3B1yzdrsqEWaj+baCSPWjwc3+ppLfkLt5huKBzT5JhlvQ/ab4
	/K/OeUxkC6NO7Q2K6miujJt0JMGTtFh12wLokfERtP5qKroZ87P26GjcX2f3nfJ1pR
	kDNgRQuixxzepx3wkb0HzIQniarV4VQTDw/09twI=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 90EAC480011;
	Fri,  7 Dec 2018 10:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173304;
	bh=p6jKllSk1N89qZ5kxsijOyj3jCEF8rBu8QqbfZyaa78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V7qNrk6bhJmpuqeFLnMygVGYg74RMKYmesP6exDjwaKCP8EfYpUSf69zd9jioPZEC
	1wqsX+d1YgyPWlTW2upx4wFlpTmAlTIfwfgABV6dYSqB8IgL0fpcSHp1ckvJucbwT/
	5ujCXTBihaYqQWhK5gMNvB1waH4nA4EnbPhwatvA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:27 +0100
Message-Id: <20181207090135.7651-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 09/16] gdbstub: add multiprocess support to
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
X-TUID: 7pn6b4ItDCRo

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
index c66bf37b49..4645d59d8c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1722,10 +1722,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
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
@@ -1733,10 +1734,18 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1750,12 +1759,12 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1793,11 +1802,11 @@ static void gdb_vm_state_change(void *opaque, int=
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
2.19.2

