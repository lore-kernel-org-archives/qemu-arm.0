Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp248223wrt;
        Fri, 7 Dec 2018 01:14:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U34XNiTnIEWicjcbRc3Cj4aZVnw8qDpVqBWa9ihk83PmoxrrVIG3tVy8nFkO0Mtk/uNITX
X-Received: by 2002:a0c:9471:: with SMTP id i46mr1222711qvi.120.1544174086881;
        Fri, 07 Dec 2018 01:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544174086; cv=none;
        d=google.com; s=arc-20160816;
        b=qNYDwlRiLTvgoYLwa1sbPaK9dCa8jcSPbjWRELcpp1YWJaOkO17wGD5sYrz5UukR4S
         vZw2SCY58jQlgONRh9xdMQbWtncih474mdM0EteP3uQzlUis4g1z6FguYd7gK7r/I3JT
         9EvEuD2w6MQinZzvy2mk0vhiQ8VSdrFt/m97FviGYSBgWVI3b/qqcBiO8UW1KW5N/VPh
         FodPN9BtWXVDP8yAvJI55Dn2dbWcq2XBXYtH7CjCEiHN9+Y+uAZZgj6YWGR/uI2IDk9v
         vjpWkuZh0pudLvFD19L3oWGordkm/jejgi7d207rFG8dTwbzHODlCitrXKz0ZC7Hgo4z
         eR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=0sa+2Z0NkBomqe1smQ7ul27CwPYKO7hH26NehIJwdUU=;
        b=adGG9B3Q5Eh9OLXfUfz8xDARVg/rcw/gMnZgz5bpzhhnjUfgk3wZ0ZVK3AaVtuUE5r
         HtSK77xhVZj3uQ6KjzJYFTKvG1yNqZCnnormi4RGC3+ym9/sK0WwjE6StI1xgU38wmwb
         v+HvFowgIO2T6j+5tv7z9Cmk/e8RbUQZAHMUBXZ4VMK+5tJzGHvstwc9YcsK4vYvksXl
         HpDwMh1xJ/3QAbyhdLtW85qdx6lYW+PjIAhWaramXQIQXJWpYoAP6RQ8HLd/xxTJ9WjR
         DgkKE3kPGPzSruQUenB0eka0mGfXWd1e3SoOLbPUOoVIXeI9H0ZDVkmP3EqF03U+KtZ4
         qXYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BSbSuxmp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKsiv8qd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKsiv8qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si161534qvc.2.2018.12.07.01.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=BSbSuxmp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKsiv8qd;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iKsiv8qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVCDe-0002ar-8Q
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:14:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1Y-00088K-JF
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1W-0005ej-L5
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:16 -0500
Received: from greensocs.com ([193.104.36.180]:52245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1W-0005Rq-AL; Fri, 07 Dec 2018 04:02:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E6A05480018;
	Fri,  7 Dec 2018 10:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173313;
	bh=NtClXFPIxg1OArVuKPjWf7LBj/Mk+I6aQK/rvdYFu8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BSbSuxmp8dbH8IVoKBFUmkhO44+fUHu5Pl/MpBR55SjBrN3iU3INaLfz/BsFFqj47
	aSj1Q23XPtpYINkjOpYMTVk1deF5AtoM0bVbNrCKmnpvaihrjDzqFR3MzN8uaFYzIF
	9TRd2cRwu4D1Y+syi6Djk7Jd4cgUDF8W6B+As3sg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=iKsiv8qd;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=iKsiv8qd
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dfIsUucce24; Fri,  7 Dec 2018 10:01:52 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B1B2E480037; Fri,  7 Dec 2018 10:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173306;
	bh=NtClXFPIxg1OArVuKPjWf7LBj/Mk+I6aQK/rvdYFu8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKsiv8qdUoN8RAZrpyjiSwm3Scm1lOPUqsutXpXYq7YkGS72rKXCgh6V2mm3GuvDH
	IYDHvPsub+V6m8M9Ss1CG1FHAaXdOp7GLTJSz987otbDBgMTtZh5Z/V8ChjvF7N4IN
	AHjqa5aIJRwMDw2AaoRScKyQNbmKqQBJ8okHvDnM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4C2BA480013;
	Fri,  7 Dec 2018 10:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173306;
	bh=NtClXFPIxg1OArVuKPjWf7LBj/Mk+I6aQK/rvdYFu8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKsiv8qdUoN8RAZrpyjiSwm3Scm1lOPUqsutXpXYq7YkGS72rKXCgh6V2mm3GuvDH
	IYDHvPsub+V6m8M9Ss1CG1FHAaXdOp7GLTJSz987otbDBgMTtZh5Z/V8ChjvF7N4IN
	AHjqa5aIJRwMDw2AaoRScKyQNbmKqQBJ8okHvDnM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:31 +0100
Message-Id: <20181207090135.7651-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 13/16] gdbstub: processes initialization on
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
X-TUID: 6vjwFe9Iq9lv

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 8601be533b..81e7742847 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2265,13 +2265,14 @@ static bool gdb_accept(void)
         close(fd);
         return false;
     }
=20
     s =3D g_malloc0(sizeof(GDBState));
-    s->c_cpu =3D first_cpu;
-    s->g_cpu =3D first_cpu;
     create_default_process(s);
+    s->processes[0].attached =3D true;
+    s->c_cpu =3D gdb_first_attached_cpu(s);
+    s->g_cpu =3D s->c_cpu;
     s->fd =3D fd;
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
     return true;
@@ -2353,12 +2354,23 @@ static void gdb_chr_receive(void *opaque, const u=
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
+        s->c_cpu =3D gdb_first_attached_cpu(s);
+        s->g_cpu =3D s->c_cpu;
+
         vm_stop(RUN_STATE_PAUSED);
         gdb_has_xml =3D false;
         break;
     default:
         break;
@@ -2543,19 +2555,17 @@ int gdbserver_start(const char *device)
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
2.19.2

