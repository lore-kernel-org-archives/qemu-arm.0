Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1755668wrt;
        Fri, 23 Nov 2018 01:24:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5dKZr5CynTsWwierZQ12V5TLfOFufZhrzFfTv3jedcBL+wnkhYkqT5GcNIbVAvNBvS+qAGX
X-Received: by 2002:a81:b603:: with SMTP id u3mr15256377ywh.181.1542965094633;
        Fri, 23 Nov 2018 01:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965094; cv=none;
        d=google.com; s=arc-20160816;
        b=nUMgVwf6Xziiru5ck2HWCLd+yPI9DlBTDDKc2gVOr6zEs2UJFZhTEucBR/PmwIPYUR
         7K7MoISnG8+W7fJSZSxKYNjp/vsrq5O57pIYbCEVRCNT7aBsgSTQYXMwNmF3gIPhqQqZ
         Y/FOQBeI9cYgTmU19wEIxntxqzGJqxF1SSMyNSIdcnjBRts56UXbqQt2mZfpOOCdTXFR
         /jKtAhdvLZVWMDc2q4Gq4mzotCEnrpkT5Z+dm9St7eCsuSkvzZihurvjevWODCRUmcTs
         Cny8NfNvlYAo1Jc9JLH78L/sYoBi3RtN25DLEwp81TysbA6beshc1ZqDbQ+7wY9TysmY
         1jxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5z5dP5PnDz35cyRG/gSLOKouBPw6wUKZwg/fcf54jU4=;
        b=my0Cf+DGXwicErWC8uvSTWKm87sCQwcm9UjCBqreaTbF0jyZBC35ZTs4LHab3+8XvL
         KYjSgtEnj8oLdvnoBxe1sb0lkGDjIResuh5ZDhF4uP7nYZ8JZuN95ikYjARthX5ez+dT
         bac+oXIyEVXeX+t3wQc7IiXDEx/jDNIyEd7IReSiM7twR97K3INqiv3BtZj2XLSTIkWB
         phtyOKug/aaePNEXv3lrQa/fAANpIT57AIk8lVBsT9ouA4hXjAA8SIkc3tkCtkzfscLq
         CWPkw/KYUVcKuIZFoRAHhRI30zq2CyZUTgg76VYUHsr+VUK4rkVOR1IyaxCI+OQaHk8B
         +AEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rpoIhR53;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=quFOltk6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=quFOltk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65-v6si22463423ybc.479.2018.11.23.01.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rpoIhR53;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=quFOltk6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=quFOltk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7hl-0006Dh-NW
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:24:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bF-0008H8-Ed
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bE-0001LS-J5
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:18:09 -0500
Received: from greensocs.com ([193.104.36.180]:47088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bE-0000Y9-6G; Fri, 23 Nov 2018 04:18:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9710E5E7080;
	Fri, 23 Nov 2018 10:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964659;
	bh=zvSA/pYF9VdRa4k4e5/xFPygX7Qqx9RJXIi1EwcpXIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rpoIhR538dyxsOE2cCt3b61KWnjQ1zb0CTNf9ghNpB9aA47m1yPC8E0MfAIJryRhp
	3rQErRY21gONqGp6PIXs2BTkqZC30n9jw0slfe6lA70czLThN7tDfUmT+st8BFpXI4
	zEhLCSyzCp9eCGEua5WRWx8aR/HmnijC4zSElVHw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=quFOltk6;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=quFOltk6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJNL-SvQAmIX; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9FDF95E7084; Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=zvSA/pYF9VdRa4k4e5/xFPygX7Qqx9RJXIi1EwcpXIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=quFOltk6ySUanjfgOVYeE8pdXSlxDlj7RV0VNZiEJgaL1fAwwb6AwKQJV8GwU1yis
	ZC6hM/49uCYswbqGii/MTSU3e+o8HOIqUmvx+25Sy75gfjWvnozBGk3Im6KJHRxkUm
	kVNO/XEs1MF7R4wGlp72JanuPkDsUDRWg1a5P41I=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 369B45E7081;
	Fri, 23 Nov 2018 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964657;
	bh=zvSA/pYF9VdRa4k4e5/xFPygX7Qqx9RJXIi1EwcpXIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=quFOltk6ySUanjfgOVYeE8pdXSlxDlj7RV0VNZiEJgaL1fAwwb6AwKQJV8GwU1yis
	ZC6hM/49uCYswbqGii/MTSU3e+o8HOIqUmvx+25Sy75gfjWvnozBGk3Im6KJHRxkUm
	kVNO/XEs1MF7R4wGlp72JanuPkDsUDRWg1a5P41I=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:26 +0100
Message-Id: <20181123091729.29921-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 13/16] gdbstub: processes initialization on
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
X-TUID: wIShzNLVccgI

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 69471ea914..6518324d46 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2249,13 +2249,14 @@ static bool gdb_accept(void)
         close(fd);
         return false;
     }
=20
     s =3D g_malloc0(sizeof(GDBState));
-    s->c_cpu =3D first_cpu;
-    s->g_cpu =3D first_cpu;
     create_unique_process(s);
+    s->processes[0].attached =3D true;
+    s->c_cpu =3D gdb_first_attached_cpu(s);
+    s->g_cpu =3D s->c_cpu;
     s->fd =3D fd;
     gdb_has_xml =3D false;
=20
     gdbserver_state =3D s;
     return true;
@@ -2337,12 +2338,23 @@ static void gdb_chr_receive(void *opaque, const u=
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
@@ -2528,19 +2540,17 @@ int gdbserver_start(const char *device)
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

