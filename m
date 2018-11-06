Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp750052wrw;
        Tue, 6 Nov 2018 03:18:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5eR3v3w7GgqHBy1LqeYHBwJiRUtRHKzt+KW8tjqIR7jbp++ywJXS4IJv22hDW+fZlxjRpMb
X-Received: by 2002:ac8:107:: with SMTP id e7mr4318273qtg.221.1541503102672;
        Tue, 06 Nov 2018 03:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541503102; cv=none;
        d=google.com; s=arc-20160816;
        b=aV9wrEnKB0Dr9bfjdMhbKYRJ7xDIINtd9u0JTMYsJ47Rghy4/EcbP2aWEh4dlLLFYu
         vC0FQuYYhSYpSd0gPOuJTlkxsSS8pruoCZhasejBMkFTXPL1FTxvZXhsH7Vi9kCcEq/R
         gXLl+fipdWrXUOxy1hBgLuOJQlOiZ0gMJ23Env+K/svWwHWvyjC39PBpQKJga6sMAEvj
         aat6Gn+7oMX9grLUDEYgSfGBZSdM1wRRhNvEbocUqQAmE6KzBVO7WLTDVno7DMM3d+jL
         EqeF3pExZInXqPJpu+KvC4LqHECOBEvO1sb1dsnF1dEc9668UZ7sAPz/BbwUD5P4EP3l
         wmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=EVW0BNNMP+gNjzmW5jP424dnsN634vDt8JyPmQpcLEs=;
        b=zDXl2qADd0nrIuZdMq7xe5obyBRZUDmgszyLcF5+gNrcSkqBXeojOroKxftL5zFkvv
         Y9ZSUfe0GvAMOR7Gz32sEjo8LzoNW+5zgo8A2o+elPU96vGvkzCQrWDkKF78TLAtjn/U
         sI6K3sjlonUgzejfzTm32LOOcHH7vZJ1v1FuOAWgl2qp4QeTfSbhtAHH/Ne7sZMtx7yB
         MVn9mNHgFx+ISmdyiCfHEjwFd26p9ZZkpCFoNgSlItfN7S7Whhp+gY5n3wTaRV5Won2n
         7isPqe1yD6jvS3i1M9Mpwo0ZLboYzmUNonQ3GpGFpGSPGpRfib5JefdUqm5p+Uf1FvhW
         raBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o+JG0tIK;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VcvKCiMB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VcvKCiMB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si18071239qtb.89.2018.11.06.03.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=o+JG0tIK;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VcvKCiMB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VcvKCiMB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzNG-0003GQ-3o
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:18:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC5-0006jn-U5
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC0-0001cM-59
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:49 -0500
Received: from greensocs.com ([193.104.36.180]:46751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBs-0000rC-PF; Tue, 06 Nov 2018 06:06:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5235F5C025F;
	Tue,  6 Nov 2018 12:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502375;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o+JG0tIKnp+9O4yIfD9IQl81k6mQba/WPItPEPiNEF69w8TUps/l+NSd0+oPl99D2
	vUFqANGc3VPzHBPLeSB8WcdxGYTdxe0JXCnz7HrZmQQoCtFq8ji4+QdiFnvTpKAJDX
	wkFzZcmt80FArHUGPXmvUp4Q/mnvSRTzz7nf812E=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VcvKCiMB;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VcvKCiMB
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkPd5eGj574G; Tue,  6 Nov 2018 12:06:14 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 962215C026D; Tue,  6 Nov 2018 12:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502370;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VcvKCiMBw9oI7xXa2XZomltzMrJZI21jZJT8COJ8O7F3zJodzgwvT6Q8PoyJhp1Pf
	50bD3AGen89Gmzgr0UG4SvcKoWJuQh8gmfPLYOUzvfE8gkEXk8/mjKlSwdaQcq88m0
	r2YOeMpZOAo6Iawr/6aZJxfm6Y3XyXv22RIh/0CU=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 209665C0279;
	Tue,  6 Nov 2018 12:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502370;
	bh=gqBhDPpxGlbslzJ48Mohw6BqhBqD+2sU66wHvcW48ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VcvKCiMBw9oI7xXa2XZomltzMrJZI21jZJT8COJ8O7F3zJodzgwvT6Q8PoyJhp1Pf
	50bD3AGen89Gmzgr0UG4SvcKoWJuQh8gmfPLYOUzvfE8gkEXk8/mjKlSwdaQcq88m0
	r2YOeMpZOAo6Iawr/6aZJxfm6Y3XyXv22RIh/0CU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:45 +0100
Message-Id: <20181106110548.4209-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v4 13/16] gdbstub: processes initialization on
 new peer connection
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
X-TUID: EgocunIJd36v

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

