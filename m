Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp447019wro;
        Fri, 26 Oct 2018 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fiXnORGbybQCLdm5XU1trU+pa+7oN5SuHK4f97vPGkwbo8jEzxyu4mgGkdGs/luLVnO0UT
X-Received: by 2002:a0c:e091:: with SMTP id l17mr2349029qvk.144.1540543079323;
        Fri, 26 Oct 2018 01:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543079; cv=none;
        d=google.com; s=arc-20160816;
        b=ljDj/BZpZpWG9TpvNkJvTLU3VFal2TLs7EXT4vA/ZwUJoW/jMa38xaJ4o/p/j9nxOk
         BA+9juF1LwuurdKdmYHWaF7mvHpkTaPJmYdQrxMuWNX8cEqhtLDp8+5VrAAO5CYAHTsG
         mjuNpHaMsgMlnt8bPKKmBPszG4oArUOC4DwR+ytzB9KYOgO2HxJjUjgpQFaPQYtdrBkX
         PDepsxnYPcwx68cFnYf0F+1ZXNIrA9jbySdcPn4bPFhSTBOP0Cunv3E93wSVooh351Qt
         6rhoFlHdH7KO5l4SUN8IbLg8VA5wzfWjtxJJjB5KCF2GnCFW0UxxTnUA3/ZEUopo0Hym
         qTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=GTK3nYMizcnjXPNbS67CNVMl31A4MChq+/4kOwZgVYw=;
        b=vOkzPsgfm7+IgWuPpnh7qo6/YvKfeHWC1ESEpbMAT4RsnUv1Mkgp45tnepwxJv9JTt
         nTn/Ovq+y4wUQhUF16IE17Z7kXjNz2oAO5NuWPxI68pd6BjufR6QVJl8z7d9MP06dBOg
         7Nppvix83w6ZIozHk6NXiGj7oGcx1HDCG6Flp+YdPuHou3Mgvob3bo6MrpUU9DY+3y6c
         aeP+2TgWvDLW4j/5XyAgu/dpts2bPlWfabTSJlyBpcMev9zSPkfhRQOen5l+OcB7/bgo
         FHXliCFToKPT91yIWgglRqNIGgmwXMmLXJCQnWxsahC560deeEA8CgROcJjC+X34L3Ww
         rYZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Xjhu3rGQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Lv9BWhGQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Lv9BWhGQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3-v6si5766773qka.127.2018.10.26.01.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Xjhu3rGQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Lv9BWhGQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Lv9BWhGQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxd0-0002Pa-Oo
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:37:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUN-0000LS-6l
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJC-0004nS-LX
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:17:31 -0400
Received: from greensocs.com ([193.104.36.180]:45409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lc-GG; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C6EEB441B49;
	Fri, 26 Oct 2018 10:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541840;
	bh=BihBqIDZ9GGhR6yGrLTs+q1njikFDNZXrheaOwYcMtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xjhu3rGQyMvmw1AWFtMokInf+aKnKVZ2/j2+SW2PCWoEh0DLYx3p1OdKd9aD64o43
	+qkJS4BPedxjUjW2fRlKNvUUdpiL8Lg5TR//7K0PMvhutnb/RHhuXd+iz4JxsOK0nl
	4Fs9CYiS28BHMiBdrG0elQjIg3J78PrZ2cTWJ0Y0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Lv9BWhGQ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Lv9BWhGQ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCgoeseR5jE5; Fri, 26 Oct 2018 10:17:20 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 68650441B45; Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=BihBqIDZ9GGhR6yGrLTs+q1njikFDNZXrheaOwYcMtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lv9BWhGQLK7ixObPInvQF6iAkzgVIPMmY6Myx6z+KTI8r90j7IXjSU2Nm3WVv7zON
	/+20HiVlX/bf3eYRdf1y8stEBc5APGQUc7UKhc00toe6Aux4nlCpZykQFMTUJzUUG0
	3WyPHxnV/N6Mc+CUxf7KEU94g5FvZ0Ef1Py27qYM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E4C7F441B47;
	Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=BihBqIDZ9GGhR6yGrLTs+q1njikFDNZXrheaOwYcMtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lv9BWhGQLK7ixObPInvQF6iAkzgVIPMmY6Myx6z+KTI8r90j7IXjSU2Nm3WVv7zON
	/+20HiVlX/bf3eYRdf1y8stEBc5APGQUc7UKhc00toe6Aux4nlCpZykQFMTUJzUUG0
	3WyPHxnV/N6Mc+CUxf7KEU94g5FvZ0Ef1Py27qYM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:50 +0200
Message-Id: <20181026081653.24602-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 13/16] gdbstub: processes initialization on
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
X-TUID: YlihR4DaI5IG

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index e5eddd8e2b..b3461eff9e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2242,13 +2242,14 @@ static bool gdb_accept(void)
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
@@ -2330,12 +2331,23 @@ static void gdb_chr_receive(void *opaque, const u=
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
@@ -2509,19 +2521,17 @@ int gdbserver_start(const char *device)
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

