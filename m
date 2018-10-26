Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp452449wro;
        Fri, 26 Oct 2018 01:44:31 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eUYoXVUpdwm/nyNklFLm0edHRU8U6ncjFXIIvHua7CDt8N0sO81IeBDaNYg6V0dLm1EX9Y
X-Received: by 2002:aed:2d47:: with SMTP id h65-v6mr2380093qtd.227.1540543471863;
        Fri, 26 Oct 2018 01:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543471; cv=none;
        d=google.com; s=arc-20160816;
        b=Kp2faoPm3viT4ciFqrjgLV54lDxGj6v4IKZrlSbXv1MaGWfXkMYKQamVAICqnfj9Oh
         GqcQuQ6UkVN8gBeks/tZFtsWDvzFhFAaTeu0ID3ovJbR0NBNK+zwaO2khDNVYQ5kZz88
         1Zv4eTDYMXMAWr667KyeEAkf7Kusa0rllN9wF+rX/ThFqV/FjMpccVHe5EvtJADwBPp6
         yZVx8WMomakOCqEAotwUENUeFTP5lOUFA0697O2ef1hHmQLMZFQ6bPUQULy2pbfN+ung
         guWzMgL5Zs4Vf+3NT7UqL1gV2gby3agPpO9APDy00UnMObtMGid4ct4kP87bVeiPSBC8
         OP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=bYf1QqcdbyxsX5JoDldnQ83f1ivIpaBbg9dA5vMNSSY=;
        b=n6nT3mCoJHileZuDPIzfznK8SETmwbR03a087qSvhPIHKLdwsL6cYGKke1KWGNN1rG
         TKg2idNFeEjKU7X3GJZLn1vgOMIom7NzEL/ZlL0xumJwvJ/VypvXEvqcitI1k7tM3O3q
         lBuSIHCfGRzHlbDOGn45oyfg5LelrjQtEzRQFjIOQVTYPTQ5DP2lsxaGzLvD8cA1zsad
         WMgkVhzLsTNke3ae7mhpqkb1nSRXinrl3AGCyvNI94m3VieCZJVZY+R+K6RrKAxf1gOx
         W4s/IusPbwhCwpN2W6z1w3kNRP1RvRy6I9hzVTZBfkbHfe+18Ajgi1SoX7W0LS9RpfZ/
         EVHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="5Kocbv/p";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U3rZqD+F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U3rZqD+F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si145238qkg.121.2018.10.26.01.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="5Kocbv/p";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U3rZqD+F;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U3rZqD+F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxjL-00015F-B7
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:44:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUH-0000gN-EA
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJE-0004pf-H4
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:33 -0400
Received: from greensocs.com ([193.104.36.180]:45400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lP-H0; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 10C58441B4F;
	Fri, 26 Oct 2018 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541837;
	bh=tEd2P0fg10cenqbv0sIZIp+ENwFNIB8g6Mf2Gz9V6yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5Kocbv/pl11xTrZ5EK4TjMC+Y5q4feTtmgEWTR1gLMIAY0YONP3UoqpnlyDcptq9/
	o2ZUbT8qYFbfirrhKb03ZI8lJG7wpvGErU96mW8THmt5y6EKq5G0xxlLTIFDlxtmY3
	RUG5UHpfGLaUs5ZVnJAn7DeeNz8R3bZGB5Vlswyk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U3rZqD+F;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U3rZqD+F
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SW1zuAOR-HPq; Fri, 26 Oct 2018 10:17:16 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A0559441B47; Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541834;
	bh=tEd2P0fg10cenqbv0sIZIp+ENwFNIB8g6Mf2Gz9V6yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3rZqD+F7OMmALIaJnM6+T4RLKr7CQYf1dKP+I+CKW44pN4qbo6Pv4qxkqyl8/N29
	9+Qy/7hT5BvzoDbL7g184AxkZ/teCKu+Kik15pJv6V8TMHsn8j3EOLnMr1K8f1ByQO
	bRakPBpsZ1KwSf4DseiBS13Qn0BMSur6ArYV+UmQ=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2370A441B42;
	Fri, 26 Oct 2018 10:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541834;
	bh=tEd2P0fg10cenqbv0sIZIp+ENwFNIB8g6Mf2Gz9V6yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3rZqD+F7OMmALIaJnM6+T4RLKr7CQYf1dKP+I+CKW44pN4qbo6Pv4qxkqyl8/N29
	9+Qy/7hT5BvzoDbL7g184AxkZ/teCKu+Kik15pJv6V8TMHsn8j3EOLnMr1K8f1ByQO
	bRakPBpsZ1KwSf4DseiBS13Qn0BMSur6ArYV+UmQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:43 +0200
Message-Id: <20181026081653.24602-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 06/16] gdbstub: add multiprocess support to
 'sC' packets
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
X-TUID: JQxl3W22J0pW

Change the sC packet handling to support the multiprocess extension.
Instead of returning the first thread, we return the first thread of the
current process.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index d1ec245d1d..17fec8a41c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1543,13 +1543,18 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             type =3D strtoul(p, (char **)&p, 16);
             sstep_flags =3D type;
             put_packet(s, "OK");
             break;
         } else if (strcmp(p,"C") =3D=3D 0) {
-            /* "Current thread" remains vague in the spec, so always ret=
urn
-             *  the first CPU (gdb returns the first thread). */
-            put_packet(s, "QC1");
+            /* "Current thread" remains vague in the spec, so always ret=
urn the
+             * first thread of the current process (gdb returns the firs=
t
+             * thread).
+             */
+            cpu =3D get_first_cpu_in_process(s, gdb_get_cpu_process(s, s=
->g_cpu));
+            snprintf(buf, sizeof(buf), "QC%s",
+                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
+            put_packet(s, buf);
             break;
         } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
             s->query_cpu =3D first_cpu;
             goto report_cpuinfo;
         } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
--=20
2.19.1

