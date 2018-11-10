Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808135wrw;
        Sat, 10 Nov 2018 00:14:23 -0800 (PST)
X-Google-Smtp-Source: AJdET5dth72ql7xdCEYG7vi6jnKYWxpoLbubqqF8s9OdpZabXNM7hPjodBPwXMmFqJ2Y9pnVNUDC
X-Received: by 2002:a37:2f01:: with SMTP id v1-v6mr10640465qkh.278.1541837663535;
        Sat, 10 Nov 2018 00:14:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837663; cv=none;
        d=google.com; s=arc-20160816;
        b=Gq0oEXSzUx8CpLrpUK6PH27d7po06T9EKM+X5uIH0SwOX8wA7uGlPzb5120VafHJLA
         2dGuzrpNa1laA7d2A9PCxGQwVowpNFLPhoxvhgEkvd4JxBmJFc45/SIZFqv+pSodmo9C
         AkJg3yK2qdBVX11UXoaAofVj6SkwnBoMlca38SxkXpFIOCoGyWwbOm9GFp3sC0/sCjSY
         0r8/h3ph3G1cvZ+cY6nO9IboW20dw3LckgxCGbVrxAVZtVkqgRV8FngIRKzJqiQPoOFi
         ajDhrsUactR/4J21eQPacgM0w6YfQ6LZcGkir3XYhSBYr/TOgTPyt2fHvfMrQgGRe5v8
         Xe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=IfDKJVIKDhnA0II/tCpCUIwnkS0KI2AaE/mIeBnHCls=;
        b=jDRpHXSp07k2i0TjHvjnc7oqQjhX04sxD0A8zwH3lSjb099nTTV9iNMh1oBH3Y4Byb
         UudAx5q56Hy+fsqIjiwGO3CRVgoUVFw6GhwnPTv8VAeWFCMXSH0yqGPqtdkm9BW7mpCw
         N+EXBWBQtG1drH/4yE75F8JXeFd3NbPmSA3N82kcPE7FwOn+scqlAXNuqEChp56xqveK
         YT+fzyHyU00gshH3fvPULjOxN5q57utAAfqM8NH6CIOo6DtaITFv15BPHDWX/7mlyzly
         cw64wKyLnz9ib5/OwnCnUqRWPo5lxbZ13Sj8r5eJgAO7HVs4hgAG4r4hN+3U0z8Y0E+6
         TDCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=I2Kcdxd1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=6DMqK1nL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=6DMqK1nL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b19si678649qvm.155.2018.11.10.00.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=I2Kcdxd1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=6DMqK1nL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=6DMqK1nL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOPP-000483-0a
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lG-7Q
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOZ-0000UC-O1
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOZ-0000TA-2Q; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7957F5D19A1;
	Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837606;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I2Kcdxd1DjmBCJLrOaGwgcaEHkaE8dCoky1y7lNV8CFRuao+0BLspoEzDtliF0d2T
	aB3SRJVxpgGfk5GdDg85OfIPelco8X0XSMmU+3QL7Zyu9OR9oniqvT6A9+GSqhePVd
	dVKByyqaibrVv0AUwt3ASKl6nOPZ1yJ9P79iqPVI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6DMqK1nL;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6DMqK1nL
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRV24ZzVKG7o; Sat, 10 Nov 2018 09:13:25 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D289144325A; Sat, 10 Nov 2018 09:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837603;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6DMqK1nLb1yK9jkXAG4R6lI+0G1MpsHXLpGYwbW/xIWh5FyG2o4YaogNQq7XWMEWz
	BZrX2N5CJgffvk7acC2Zw8sKl59AiGNEQ7+6ZoySvypOsPygZJRev0CDpeSNiFEbCi
	LInNTA7/gMGWmtlo9PcmG4c8ywg1jRdAwH0YDyPk=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6C6A0443258;
	Sat, 10 Nov 2018 09:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837603;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6DMqK1nLb1yK9jkXAG4R6lI+0G1MpsHXLpGYwbW/xIWh5FyG2o4YaogNQq7XWMEWz
	BZrX2N5CJgffvk7acC2Zw8sKl59AiGNEQ7+6ZoySvypOsPygZJRev0CDpeSNiFEbCi
	LInNTA7/gMGWmtlo9PcmG4c8ywg1jRdAwH0YDyPk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:37 +0100
Message-Id: <20181110081147.4027-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 06/16] gdbstub: add multiprocess support to
 'sC' packets
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
X-TUID: OuVNNJ+DG32Z

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
index ba8b1a3413..9be83486f5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1546,13 +1546,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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

