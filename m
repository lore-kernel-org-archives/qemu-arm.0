Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp445406wro;
        Fri, 26 Oct 2018 01:36:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fqOlW1NoX+i/bNR7eBR6jONO2qVynHMi0FEUnNmJEv5BUr/U45hkOktuiPJEstRDHHlBVU
X-Received: by 2002:ac8:5414:: with SMTP id b20-v6mr2360763qtq.144.1540542965703;
        Fri, 26 Oct 2018 01:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542965; cv=none;
        d=google.com; s=arc-20160816;
        b=hG0LXVzcXQS2GgIn1xa0yh7GoY+oyUHeeq6iXUTaBUoMkKtEfPUeN2BiEXw9MXUuuc
         1n7EdZRRNcVDQauaWgTa86334ZWVo2XCPG1r9NdFtxiXaGv9f7LgMmY5/BWRh1ih6TBB
         ScbRI571R4FsAqcTD8A7YCwfyG6x0saVLwbXxAMgVSZN/0CK5tP7HjvZfAsspj4kWDWl
         ZdaW7lHFBdrgHkoPyxmke2PMsQM1C1eumiRSTA112G6/MdMpI8yDO+MXRuOkSEGQStim
         LTDDvNVDy9BvgI0ehhPVuk/vsP23UZ9QhK6tpxbNq1JF286kHsZEeHquJ2GnGfn88rLz
         h4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=OAx0tWJtSsQdLn8G8xLRzwodDH1WwQ2swWAdA8q4uTg=;
        b=MEqLAiXN3pVgxLP6Kus7mmnZHetY5Vwn18/Onl2ios4i4qLSHXluH49TVZ2P6gbXfy
         xMVIlAQ+Mjm2D7MzjYOfynGyfSYAuYVOe7L6jBZ3hxkUlAq2XQCQfvHfx7POHgmJocYC
         CLRninNiivv1fqwo+LikbSBTpLo65zth1R+3Tqt7whBMaPPGB/Gtw8Enndo8XRAiETL1
         KxohM1mpnolcOm2sDZ2ydymB0153qr1xE5d4wYwO84sIwvS27XKY2OZ4/KJ6SkNqpWAH
         2oM29IXyAVyDGtUGKlsItZARj7U/7IAaXbkYUjAXB840370odsTpqmoU2IrZZ4JQ/Cf0
         /1Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=orY2G34F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=EfzeOY0j;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=EfzeOY0j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1-v6si8731107qtb.402.2018.10.26.01.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=orY2G34F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=EfzeOY0j;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=EfzeOY0j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxbA-0000Xh-J3
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUD-0000gN-6b
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJY-0004y8-GF
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:53 -0400
Received: from greensocs.com ([193.104.36.180]:45406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJT-0004la-Ny; Fri, 26 Oct 2018 04:17:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9CFAA441B48;
	Fri, 26 Oct 2018 10:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541840;
	bh=L3lheXRjjCXYHVz6bZsvvaoBb9o5ZwPf2un7Fgcf6EM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=orY2G34F/yzysqdJR2OBUhO5bCBaSxZ6O823QP52IH/JktBgzNJQ9nWHv/MrjuJ6w
	NKpFwhOJugo1deeG5NZEbKjIhwSumLeof6Ywf7RNOsTVDarGs6HwMpr2AIRRrOanYy
	VXW6CLioO2C8BGYffKKnccLYWj1YCBu98QpzCQR8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=EfzeOY0j;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=EfzeOY0j
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZG5xloL_VVl; Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E05A0441B49; Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541837;
	bh=L3lheXRjjCXYHVz6bZsvvaoBb9o5ZwPf2un7Fgcf6EM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EfzeOY0jnDc07yxeRB0FJlZFSWDTFUU2zA2br+5zfiToyPlrxUeXheuZNeBXLFuRw
	j8itz+yTJ4sKgqnhCLjqAp8sh6kIeNyTOJzEcWIrGVNThecTDsrcYctnoqXVnSLSx4
	dZ2I6hUNuzPShILzxz8yTRnJxQuxmyeSh283OtDA=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7C081441B47;
	Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541837;
	bh=L3lheXRjjCXYHVz6bZsvvaoBb9o5ZwPf2un7Fgcf6EM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EfzeOY0jnDc07yxeRB0FJlZFSWDTFUU2zA2br+5zfiToyPlrxUeXheuZNeBXLFuRw
	j8itz+yTJ4sKgqnhCLjqAp8sh6kIeNyTOJzEcWIrGVNThecTDsrcYctnoqXVnSLSx4
	dZ2I6hUNuzPShILzxz8yTRnJxQuxmyeSh283OtDA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:49 +0200
Message-Id: <20181026081653.24602-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 12/16] gdbstub: add support for vAttach
 packets
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
X-TUID: DWIIW7ft2Kr6

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 9c239c1760..e5eddd8e2b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1337,10 +1337,45 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
                     break;
                 }
                 goto unknown_command;
             }
             break;
+        } else if (strncmp(p, "Attach;", 7) =3D=3D 0) {
+            unsigned long pid;
+
+            p +=3D 7;
+
+            if (qemu_strtoul(p, &p, 16, &pid)) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            process =3D gdb_get_process(s, pid);
+
+            if (process =3D=3D NULL) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            cpu =3D get_first_cpu_in_process(s, process);
+
+            if (cpu =3D=3D NULL) {
+                /* Refuse to attach an empty process */
+                put_packet(s, "E22");
+                break;
+            }
+
+            process->attached =3D true;
+
+            s->g_cpu =3D cpu;
+            s->c_cpu =3D cpu;
+
+            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRA=
P,
+                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
+
+            put_packet(s, buf);
+            break;
         } else {
             goto unknown_command;
         }
     case 'k':
         /* Kill the target */
--=20
2.19.1

