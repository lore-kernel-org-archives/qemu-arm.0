Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3740481wrt;
        Mon, 1 Oct 2018 05:07:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63g2oZ3vAjhp/M9rH8n1V5wFQCNByUUcA0Jbq75V1mVBVr/IuRCD5+M3onZYfNw7nqI7r6r
X-Received: by 2002:a0c:a162:: with SMTP id d89-v6mr7772153qva.198.1538395643137;
        Mon, 01 Oct 2018 05:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395643; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEWcfncGAoPyfTuhy6KLnJdbPul7F7bYOPIqSpC4zItcYtT40G/GZQpNkbd90+4Gtf
         JS4YUswrRGu27NFZ6wjHDBSJcwL0iXvv7vaTZeGbqrj3QmCwnE7+9FryYpI3TrO3bJEP
         oBmchW7EKZMAoPvI0UPVF7MWa/Nf3beF4yHn5pxFuy+83EBTyO+KLdRbzoYRWO7D1gDE
         MkLFZu/TftVqJ6NPUEwZjUrvpXfLUQBIisX4dVU8fNqdt2MrqmuvXCM7FIxXM3dQskuT
         LseydT+A2xyFX1AomrKHtm6Wla2thbLUUDRAyQfy0WVf1niIn6OkM6jKIw/ShvS/+qxY
         hh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=PrvzgekEMVwETRWBt1si0lS+VYRREYBeuySBL+DS/78=;
        b=ihVJBWKIfamApDHXoOJM+qflYnAHCtrIksEUozCPTXu3U5Sq2hX0DHE2w18nnK+Bn0
         46qB9C7P/Lrdm/2NftiMS3kRUrHiWuS8hfuWnfU8GRJctZEEJTN2A/Si4S/x8Wa7pjtd
         +YaQNNFIQaOaVlHA9vwFYtngsdxF612lct3eQVKbhmGztwAOpz3ALz4YqWtuezFBOvhL
         vpa6S7TXNrsyfFDpwzDHr0taWlD7cQ6QFTp/IMcWryh4rRiMoVynAgEqUPuCsFQ0qFkL
         2v0o+SjtHhl2tKw3cIGAbRNVR9pt4b9Rkk0RGH/qr4SxzI1FGM9JRrqhtvZ00Rg5tA82
         wW+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SSlA1nAD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FIilloBC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FIilloBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si2509206qth.269.2018.10.01.05.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 05:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SSlA1nAD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FIilloBC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FIilloBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wyw-0003rC-9R
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 08:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpl-0002iB-Ka
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wph-0005yr-CO
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:53 -0400
Received: from greensocs.com ([193.104.36.180]:40137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wph-0005iX-1T; Mon, 01 Oct 2018 07:57:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2A97B511C70;
	Mon,  1 Oct 2018 13:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395035;
	bh=OBMgwVCanW8NF8EnxIwMHmdqrAqfS5WPbtNyVCqqbbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SSlA1nADzAFBbpI9Vin7FWurRPOETsokWws0emGuGqaSv8IJsC0v21ntJaLTg6QEI
	E8sU4a6jd/C96poTlsXbw2pyDC2ipWOt6ZE4hx22GTl9V16FVl90xnD58IFqFiogjs
	auiHXGfagEBYI7zzCikIYQAbtBg/uMp0C2m3Yw9E=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FIilloBC;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FIilloBC
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxzaOMl4-Tg1; Mon,  1 Oct 2018 13:57:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E21DC511C75; Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395031;
	bh=OBMgwVCanW8NF8EnxIwMHmdqrAqfS5WPbtNyVCqqbbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIilloBCap28Cy2p26lBvzRJSn8e++ltAlQ6vpNXl+ZMuSIuxtBQatx6n+Io/MmBA
	UVBHF0bMmbZImSfwNOcbqFwKv1YLw+3eYL8XQC7Sgvp6qGAj8B0vw4akWXuCc3IG6N
	PMIvEbTQ000jaLBRWW2X7H1RCX1/eFLQg56I44x0=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 69E2D511C6F;
	Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395031;
	bh=OBMgwVCanW8NF8EnxIwMHmdqrAqfS5WPbtNyVCqqbbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIilloBCap28Cy2p26lBvzRJSn8e++ltAlQ6vpNXl+ZMuSIuxtBQatx6n+Io/MmBA
	UVBHF0bMmbZImSfwNOcbqFwKv1YLw+3eYL8XQC7Sgvp6qGAj8B0vw4akWXuCc3IG6N
	PMIvEbTQ000jaLBRWW2X7H1RCX1/eFLQg56I44x0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:57:01 +0200
Message-Id: <20181001115704.701-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 12/15] gdbstub: processes initialization on
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJYEqV2QV5iS

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b6de821025..c27a3edf1d 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2221,13 +2221,14 @@ static bool gdb_accept(void)
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
@@ -2309,12 +2310,23 @@ static void gdb_chr_receive(void *opaque, const u=
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
@@ -2474,19 +2486,17 @@ int gdbserver_start(const char *device)
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
2.19.0

