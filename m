Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6801649wrw;
        Thu, 15 Nov 2018 01:47:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5elZpiBcWgnHJEGTGJQhW5JvljMHnRjZ54l5zDSdG30CGh2vf9V2cXLVb15GSlmqKYtbLcG
X-Received: by 2002:ac8:19e2:: with SMTP id s31mr5325349qtk.215.1542275278886;
        Thu, 15 Nov 2018 01:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275278; cv=none;
        d=google.com; s=arc-20160816;
        b=HDeal++xhZlHDn0/SYl628qK84+gtAT6ro/+GBDRaEHlwxa0sUCMMd2hmNqzJwaxzL
         8e3A6bgMDW0ESPHEiZJbta6IvIYXnZo99IYItqw0sJnQXiLJY6ab0t5Nc1k6vxzsVTS6
         rpE/yZoiVLOpm1hdS0aeAiWk8kd17iC1/kYnwisHzTpZjjoGtcl1Xpnlo+HmhIqLDNjp
         KHg3FHdsNcFJDEJpg8UbCENJk0mWFGTmzqzb6L1N1y1jKATfe50BaIszkS2AltoBaeGM
         BL0+2WG3cR+VODLyB7JRpJ4jDGBoNBjxUe4hC+MEyg9E2CbjssXJSmf90Z7CR9WvItYt
         Y4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=fuIyczgjj/ULjRuwJxQvr6suwzyKoAk4d5BP1EoEmA4=;
        b=by/Shc6K8vRT6/iEVuSLOh5KvDfJJYSB4yk6bPUT1uHYE3NZfvb5SY686fm8fwZxVB
         Mj+u63jlEaq4rClXNVl5Hze/NivLXanykKALlIJs9HHkOww1/+xh6n+kPQkEH/rMZXfN
         zmXXQ/1ojaGyzj8+2pnRS11mBYubJgOORR4CLWtNg3dHbgyufE6mtCjgzX6APhGDxD6U
         uNUl2k/JM2l1qOBys5p6AZVgMqV0rj/wzqSpHM0bn+0deHBG5N7e5hIS6TiXy85djBpz
         1TSmXqQY05LaIff7ie6WA3QVpLeFQf3AOjeXc+ytt6CY9PfXzK9eNXtw+8pcjWsxl44w
         fPtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CPAZhkg4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b4c72gY1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b4c72gY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17si9573843qkl.76.2018.11.15.01.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:47:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CPAZhkg4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b4c72gY1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b4c72gY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEFi-0002rv-CF
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:47:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEBD-0007oG-4t
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEB5-0004zB-MT
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:43:16 -0500
Received: from greensocs.com ([193.104.36.180]:41906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEB3-0004NU-Sf; Thu, 15 Nov 2018 04:43:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6892C44325E;
	Thu, 15 Nov 2018 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=EIdLDC5u0xmtQYqBAdduMjysY1VZBCN7v1PRkawPBBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CPAZhkg4Oo0nIJt0iuyllTkm77cpAeRotRtxmdzfBW7tx6yUV0SuYn21vC4VZkB7O
	YhknryzOs5ajsDpmDyc60cnNlFLIp0/1vYMxE5VEXwRmo9M2D+nggZjF1POXRLiavU
	X0ipuqkDGY5xuDOGg4JbI224x9ySEwC3GOvwrNDQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=b4c72gY1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=b4c72gY1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35_EZBPGN4FF; Thu, 15 Nov 2018 10:42:18 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6F3CC441B67; Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=EIdLDC5u0xmtQYqBAdduMjysY1VZBCN7v1PRkawPBBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b4c72gY1ICbj9h0o0ETZSfn4mdQWZxp4Txna0G6q4vRjjSah5K1pCr4SMAO74GZ84
	uwuvc56c24YDLqn3u+5YRTyBc6Ei4EgLm/b8ZHPHZjozO0dI4WYCcAme8am0sCVKfn
	+mrdIgOo7vQqGekScB/RCfJQc3ZXH6osaGH6Ued0=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id DBE905BD1BB;
	Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=EIdLDC5u0xmtQYqBAdduMjysY1VZBCN7v1PRkawPBBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b4c72gY1ICbj9h0o0ETZSfn4mdQWZxp4Txna0G6q4vRjjSah5K1pCr4SMAO74GZ84
	uwuvc56c24YDLqn3u+5YRTyBc6Ei4EgLm/b8ZHPHZjozO0dI4WYCcAme8am0sCVKfn
	+mrdIgOo7vQqGekScB/RCfJQc3ZXH6osaGH6Ued0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:04 +0100
Message-Id: <20181115094207.22846-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 13/16] gdbstub: processes initialization on
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
X-TUID: F7Lk2aOe7nM+

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 0427d1c4f0..59eed3b878 100644
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
@@ -2524,19 +2536,17 @@ int gdbserver_start(const char *device)
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

