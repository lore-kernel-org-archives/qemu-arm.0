Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp813434wrw;
        Sat, 10 Nov 2018 00:21:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5dequfRNj4gdj4hOj1Rqv477/gw7i3bUHns7uLw8fcaK1/fhsXqVxZoo9GNe2/3vqRXB49O
X-Received: by 2002:a37:10d4:: with SMTP id 81mr10828394qkq.19.1541838094345;
        Sat, 10 Nov 2018 00:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541838094; cv=none;
        d=google.com; s=arc-20160816;
        b=tWexhXnQJpSwMF16SM8nWy3ITzraW13LigYdfuHS0wBkAlTK9JtVvgnne3AH+tHU/O
         PJWWrxVavkcoJZqu3BEJMoUkN9YhBqnwpCKmgAzgORVNWegAAOlb5BKH6iOnD0D3Oc4D
         AQfbm95smMP945pONzHWAeKXBXKNl9MoyaCaS4wpqOnwqTpc4It72qIlexLgBc39qnj5
         GdxsdnBoiy8r0/4ybmYpuCTG2mEbyTWGttQXqEtfkcsoEifHTNlMHK4Usgwki8m2ZCRq
         8qP77eiVDGXtkC5VlZRDmchJQQa0QF2MEb4Ov73mUZRkFE38shFSUibq7uhIpS3W7bBn
         yzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=EVW0BNNMP+gNjzmW5jP424dnsN634vDt8JyPmQpcLEs=;
        b=YLXbFWIgXw0rZGcLqJAJYspHVdTqNFzZ96zeow5W/Pl5YeXzOQk99SiFG28DuhUaOF
         jVFYdimIQLqKy12E/aSyIG0vLVC8CEvpdDUEPDzrAGQSHu3dspobOYBVb8TDvAbCqyWz
         Ocv/Gk7klET0XLo1ZzavZtS4XNhhVZEoLhdtC7njO/2v8GeGm0N6aVMwkz8TRXrndavv
         H2SBqBc0qlGlUeUoZTs8qB2P883bduvaREwFmhuUIGxySwHZ4xvnxX5KIrp6fqm8DNCT
         1VKl0HHHTYNwY8Iu0YStkD3tsDqZ5feR38uLOTqQel5DEY3DL1bP/9nI9galPqdZnGY8
         0MvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mgUbuZCO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hUHvms5r;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hUHvms5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l45si3133173qtc.21.2018.11.10.00.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:21:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mgUbuZCO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hUHvms5r;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hUHvms5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOWL-0002xs-O6
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:21:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP4-00040x-1q
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP0-0000vK-Le
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:01 -0500
Received: from greensocs.com ([193.104.36.180]:43688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOy-0000Td-NW; Sat, 10 Nov 2018 03:13:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AA3975D19A2;
	Sat, 10 Nov 2018 09:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837610;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mgUbuZCO2S5ncjOazgjbu1BCuvwDKQpTYduP1EbY3eIi5ixNAmpJDuwYwS88leFG8
	uE7mpv6K3L8FvcN1/9qk1ySBMNmtXQeJgZ14YTXM+FYRAdutjDyLNCIbZ62Y4oqFg4
	lVjD3wJoxI//88wBgrqehu5UvV2e0WqQWDCkY8hM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hUHvms5r;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hUHvms5r
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFpPmQqoF6kk; Sat, 10 Nov 2018 09:13:29 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id F00255D19A4; Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hUHvms5rxbQPhfKE7X61KIGOfCyh2Tq1LD/Qg9igtxRGJvQtQl9y7++Bww/QA0u6a
	5eiN8eemV1+4YoFKeJaRc2WN6w5v54TIF0ciZPjyHkmq9oInZ1Njpvy+jzAxvnNu3u
	52zOpElHuu5EsvIJR2EZNRhllFju7k1yLEEfQ7Vw=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8ABA15D19A3;
	Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hUHvms5rxbQPhfKE7X61KIGOfCyh2Tq1LD/Qg9igtxRGJvQtQl9y7++Bww/QA0u6a
	5eiN8eemV1+4YoFKeJaRc2WN6w5v54TIF0ciZPjyHkmq9oInZ1Njpvy+jzAxvnNu3u
	52zOpElHuu5EsvIJR2EZNRhllFju7k1yLEEfQ7Vw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:44 +0100
Message-Id: <20181110081147.4027-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 13/16] gdbstub: processes initialization on
 new peer connection
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
X-TUID: BVsXqP+gcQSl

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index ba365808db..1a3353ff3c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2245,13 +2245,14 @@ static bool gdb_accept(void)
         close(fd);
         return false;
     }
=20
     s =3D g_malloc0(sizeof(GDBState));
-    s->c_cpu =3D first_cpu;
-    s->g_cpu =3D first_cpu;
     create_unique_process(s);
+    s->processes[0].attached =3D true;
+    s->c_cpu =3D gdb_first_cpu(s);
+    s->g_cpu =3D s->c_cpu;
     s->fd =3D fd;
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
     return true;
@@ -2333,12 +2334,23 @@ static void gdb_chr_receive(void *opaque, const u=
int8_t *buf, int size)
     }
 }
=20
 static void gdb_chr_event(void *opaque, int event)
 {
+    int i;
+    GDBState *s =3D (GDBState *) opaque;
+
     switch (event) {
     case CHR_EVENT_OPENED:
+        /* Start with first process attached, others detached */
+        for (i =3D 0; i < s->process_num; i++) {
+            s->processes[i].attached =3D !i;
+        }
+
+        s->c_cpu =3D gdb_first_cpu(s);
+        s->g_cpu =3D s->c_cpu;
+
         vm_stop(RUN_STATE_PAUSED);
         gdb_has_xml =3D false;
         break;
     default:
         break;
@@ -2513,19 +2525,17 @@ int gdbserver_start(const char *device)
         mon_chr =3D s->mon_chr;
         cleanup_processes(s);
         memset(s, 0, sizeof(GDBState));
         s->mon_chr =3D mon_chr;
     }
-    s->c_cpu =3D first_cpu;
-    s->g_cpu =3D first_cpu;
=20
     create_processes(s);
=20
     if (chr) {
         qemu_chr_fe_init(&s->chr, chr, &error_abort);
         qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_r=
eceive,
-                                 gdb_chr_event, NULL, NULL, NULL, true);
+                                 gdb_chr_event, NULL, s, NULL, true);
     }
     s->state =3D chr ? RS_IDLE : RS_INACTIVE;
     s->mon_chr =3D mon_chr;
     s->current_syscall_cb =3D NULL;
=20
--=20
2.19.1

