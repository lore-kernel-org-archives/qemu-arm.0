Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6798938wrw;
        Thu, 15 Nov 2018 01:44:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5evHKkqpNMOqIc1nO1M4mzf+a65XgRHLTE9jARdkKBLRohR1d57WsrFppcW5ZVUMb7NEZ+g
X-Received: by 2002:a0c:d065:: with SMTP id d34mr5336140qvh.209.1542275065529;
        Thu, 15 Nov 2018 01:44:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275065; cv=none;
        d=google.com; s=arc-20160816;
        b=jYRgN0TH+B8Y9CNihKxaujjFK/19vaZ3IyDQuMuthteVMAsy4uasvQvca5Q2qaXbHK
         uKVXW08NhoOaFcx6fHT5zveopq4ZtXQDPFGTlXnYhqcAgpwWO7+jIZSrBDqeLUr6jxTA
         cv9qrp7uxuvt3DGYFjAWnEN2HrqD2pNuqYtwZEcaxuxq/A6UeWKTy8HoSFWvF0EZRIsH
         QvsC++D0SZFA3JwFTl67w3BVegc0IbK+6Ym7Z/Z+CX+9RiJ6mAtQPERRk8zd0Dc6Jp1g
         LqllOnHWqZcMgeDyus3lsfPEghqsN+3r81Jl7F7PahQR0RloIxi3D4NTpV09N5kAunxN
         W/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=slKX6+3etgn7eRdqsv8QxPUmmdGCN5U5fkjN8lJYaxA=;
        b=x5zo0+WhCf4tjXuRcxjaIoD+1unWXJo6AqWBOt2Hn8HbJmhQQx+pFpeen2W2SvKgUy
         yo+e36rWt6nU44pyZQrMcY2AOsAoVfdreSR44A1ilBFgkOYiCNKGbU9Uavl01hK0iqmz
         3/cz1TsogGqSO1eTZGqjaZ6jJ/TRG4O/pM1wvIwuMhLjrycRYY95/iJVwKWVe4Kaitcr
         ZjMZYi/QtT+S8GjyQJD70dBnXKn/qEmAPtx0wmj5vzwKydXOv8wdfau019n3zIzyf/N2
         +Q9k3WbK15c1vGz9Jr3K8COj+kGLXUvkKZt/SmNIrHHbQOgwjbgrFK5y9nxocWVNZK1s
         eYPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TvBd5XuA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fyie5kPM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fyie5kPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si13060712qtj.22.2018.11.15.01.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:44:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TvBd5XuA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fyie5kPM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fyie5kPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNECG-0008Vr-TZ
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:44:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAm-0007PJ-Md
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAk-0004lc-B1
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from greensocs.com ([193.104.36.180]:41900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAk-0004NE-17; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 17B005BD1AF;
	Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274936;
	bh=neHuSOMMGcXioIua1s7ErMLwy+7SfUXeWQVN/U4r6gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TvBd5XuAH5d7LgAeSQ7lLgPqQr8D7yeW9cPLqbENBCGOigBs8jdE2Bgw3VZ5jqXTU
	P9JeTEjgtGp/pD6yIDBBOtXLuTwhyZb/bsR4RZkSQnbCOjtpYNgp0tFnSuM3Ofb1qM
	NVEMdtyOt9Exuo7tLSn4A9xS/WPHH011SAmEnk6g=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fyie5kPM;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fyie5kPM
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqJTXebKgSDh; Thu, 15 Nov 2018 10:42:15 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id E6F605BD1BB; Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=neHuSOMMGcXioIua1s7ErMLwy+7SfUXeWQVN/U4r6gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fyie5kPMrHnc7Vx6sKKtat4BaBMMoLzCbGCsXF79EV13sohp519X1fYoje3N76JIf
	F5p7DsvTyGntHa7ZBf+ODBjrbWO0TSUzy7CKPGchEdDwzVsivWTGcjXTvtXRKwzs1N
	/Ef4ldV27Y2tDmpxLerPNKaeSGweik71dP95oyVU=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 881905BD180;
	Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=neHuSOMMGcXioIua1s7ErMLwy+7SfUXeWQVN/U4r6gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fyie5kPMrHnc7Vx6sKKtat4BaBMMoLzCbGCsXF79EV13sohp519X1fYoje3N76JIf
	F5p7DsvTyGntHa7ZBf+ODBjrbWO0TSUzy7CKPGchEdDwzVsivWTGcjXTvtXRKwzs1N
	/Ef4ldV27Y2tDmpxLerPNKaeSGweik71dP95oyVU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:57 +0100
Message-Id: <20181115094207.22846-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 06/16] gdbstub: add multiprocess support to
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
X-TUID: CP5l/ev5NPnD

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
index f1ec3481cb..d19b0137e8 100644
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

