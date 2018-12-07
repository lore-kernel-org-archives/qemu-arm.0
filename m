Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp258231wrt;
        Fri, 7 Dec 2018 01:27:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U088pxseDs5jtIFW3DM7Qz7UnUO8026/jplvcNjImFaDhEqL9dpFwzi2SHSkhDTV+6V5v3
X-Received: by 2002:ac8:f6f:: with SMTP id l44mr1302067qtk.158.1544174845370;
        Fri, 07 Dec 2018 01:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544174845; cv=none;
        d=google.com; s=arc-20160816;
        b=wEjdH3xxfY3CnO53VsYzpxotm8WJeZ/3hqdqEbWaJ4xIZoQJXVmXv+UmSKptRDCFyn
         d/e/SnZnGquvY0W9Gtddpjb3inTN7ManN47mvxsGFIkRxnAM7VJBa05HOhmtppfptjyy
         etUwmYm1C4J01sRak/QHt6QOkfsTZCbwxe4F1T2qQ9OPtAtv40JurzR/KzaamkKkr2Qx
         Tcd1/YVikIDKC63UY94yIoRLKZk2v41XKEqR89Opr8Sn1pcomuFIzEJcSLIAb009DI/1
         LN2cev0RviIreSwGovXBc2+F9Jz6roHBmnRh0yN37SodlP/DSfe58ZM7vgPM174fIBcf
         YMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=+bJK/fj3EX6Ozb20StfHw2UqLKkyy3mhwu/bh0+9570=;
        b=dnP25bLUQI9EXZa6RTLX8gRVnRmM1k2I1xCzVCGCkYRUoPl+uCOF/3dObmq1Tmit5T
         +Ebeh4+tascacphcJ7DzfGFyOWm0XqSssH2uOvcUDFfC6aZGin6IPpSN7cY80YXEF3eI
         H1Kk/ztEsJVsnrZmcIEXYzjPjTZiS2oVbgbILo5XnaV9gOVEeOwB9kzn7U96e3lMkkpx
         aDa9xcMQQvavR4GtHaJP0DG6m2MixTY8AlBN85fEqJR4kWx4H6wIJ5jpNCm8RGtpqdpI
         ilkCH/cBsJZRVMWrZTn21HDuXqWSkcMydoRR9OneQWCsDvMlr6b2xXz6cJ4QmH+FCkmJ
         7vvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rA56IWwg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WIXn2w0l;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WIXn2w0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si1738199qve.86.2018.12.07.01.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rA56IWwg;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WIXn2w0l;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=WIXn2w0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVCPs-0001iX-Py
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:27:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1c-0008CU-4W
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1W-0005eL-9P
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:20 -0500
Received: from greensocs.com ([193.104.36.180]:52242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1V-0005Ri-Ty; Fri, 07 Dec 2018 04:02:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9820F480011;
	Fri,  7 Dec 2018 10:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173313;
	bh=RPkbYyBWNUGrWYZaWMQlv7h8yEdRqMYHulS2VqaUjoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rA56IWwgBHr9j59Zek0LLjpcfD5GLTWuwhG3i876jGpEqfW0heTiLt7PiiIColDDI
	X4qpNQghpRT/9h1ak8PQ4sIUfN80GusUcGmvOAKRlIxybhrrg2PVXQOAfiBrIeXa37
	reYn8eh/fZ+ojqr6lZaRMfSQjw3XS7AwWMlUd2X8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=WIXn2w0l;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=WIXn2w0l
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcsXwgtsNnOg; Fri,  7 Dec 2018 10:01:52 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 337B248003C; Fri,  7 Dec 2018 10:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=RPkbYyBWNUGrWYZaWMQlv7h8yEdRqMYHulS2VqaUjoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WIXn2w0lWY5USmn6nfhFCZ9WYVZQ2DlB03KTTF/9puLw1BXdvMiPpGTycDBznDynu
	F7Y8EdBOWg7l6btgUcUnL2zz+ZcObfcmZTNf6lLOaBhVCHEa+N2rH0q39QU7m0Uve6
	55O+MKNu6m3tIkMCpSkJc3pB3TULuRpjiEfgrH24=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B5077480013;
	Fri,  7 Dec 2018 10:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=RPkbYyBWNUGrWYZaWMQlv7h8yEdRqMYHulS2VqaUjoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WIXn2w0lWY5USmn6nfhFCZ9WYVZQ2DlB03KTTF/9puLw1BXdvMiPpGTycDBznDynu
	F7Y8EdBOWg7l6btgUcUnL2zz+ZcObfcmZTNf6lLOaBhVCHEa+N2rH0q39QU7m0Uve6
	55O+MKNu6m3tIkMCpSkJc3pB3TULuRpjiEfgrH24=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:32 +0100
Message-Id: <20181207090135.7651-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 14/16] gdbstub: gdb_set_stop_cpu: ignore
 request when process is not attached
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
X-TUID: v6S/DJLhZYs3

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB gets confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 81e7742847..48b49195f7 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1796,10 +1796,19 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     return RS_IDLE;
 }
=20
 void gdb_set_stop_cpu(CPUState *cpu)
 {
+    GDBProcess *p =3D gdb_get_cpu_process(gdbserver_state, cpu);
+
+    if (!p->attached) {
+        /* Having a stop CPU corresponding to a process that is not atta=
ched
+         * confuses GDB. So we ignore the request.
+         */
+        return;
+    }
+
     gdbserver_state->c_cpu =3D cpu;
     gdbserver_state->g_cpu =3D cpu;
 }
=20
 #ifndef CONFIG_USER_ONLY
--=20
2.19.2

