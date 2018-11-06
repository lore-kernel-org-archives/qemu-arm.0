Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738701wrw;
        Tue, 6 Nov 2018 03:06:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5cvWhgp/T5OO0uD4TZHMpipV9SbiVueSQ7WMJTLe4Zv1wYAMUxaUmy7sRtFA922HoYf2xE7
X-Received: by 2002:a0c:920c:: with SMTP id a12mr25487816qva.190.1541502404098;
        Tue, 06 Nov 2018 03:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502404; cv=none;
        d=google.com; s=arc-20160816;
        b=EqGUmbnZlNIpEBLvOqQIwkJuS9uFbEP1S0NoIWQdRHWwN1FOS9t7wi/6FoKr2ywhR0
         9QD0fY41ws3dr0mxmY/i76rm6zB89z8LNBEVRbUpsyi9KZ8wcd+I+ePQBzhmSbXCOrK8
         4Megfph7lJ2B1f0yWqdpKEClT+IgRyvWEL68P2KdNmVgOcXUVTlXXnbh7isP0Z1LvxhG
         b0Lzs92QAV7xm2u/+CCd2vdxGgk5RVWH5pdQvIGUEMiyaKyuIt4Tt7lIfrgCIs1sUlQ/
         cdk9ERknFWfOYuineD2Dj5fSytKxWqjpx4YmfbUBwVDtWUwsUFw3RP6xnhyAe5hFsmCI
         Ql+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=IfDKJVIKDhnA0II/tCpCUIwnkS0KI2AaE/mIeBnHCls=;
        b=Jx8qFSdp6kuYYKj588k2oRhL4EBEC7ta59T10a5TAO0d19U13BCYT33omIJiZZ/Sg8
         KCG3laZCfvFESlaprGvS7cCtS4z2zHWC9v/4LFk1kMDSV/0wPcgsw6KUUQRAktsV5eUL
         8IKlvcYrNYOV4DRg55cMsLu8rxsk9PHHvmuifZnfHwOduEzt5o9oOnDtWHrkxarezDal
         +4aqRUhu583k+rTHqQDSHl5c0/sFbeIVZ8t3UD094ZhQ5nXDN48jQsa5jbx1QBwQZFmO
         Wz7IUDqv40gVsom/Akyk7UB7yykcoNrGt34Kw3FNg/l9u8BNKvK4qnRNMsAQadnDFnO8
         gOew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oLrQYy3t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="FhW5l/C3";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="FhW5l/C3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b42si1657292qvh.197.2018.11.06.03.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oLrQYy3t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="FhW5l/C3";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="FhW5l/C3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzBz-0006PM-F7
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006F1-LJ
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000pF-Tt
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBU-0000os-I7; Tue, 06 Nov 2018 06:06:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 04EDA5C0279;
	Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502371;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oLrQYy3tiWCMHdur2XD4HRwzMJR+eT30qlYEo/n0AKRtS4+Z5mXd0vsrT3gpcTa8H
	XQYixx8iNMj2xwf+eY62OLoIGi0746zr127d1dsqYR3lj4R3R9yZcVj9OwKH463fpl
	az+MBM6QIZruRpFNGhSWgUrjHHrYFVW0zVWTUcEg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FhW5l/C3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FhW5l/C3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mw99C17Zk_l4; Tue,  6 Nov 2018 12:06:10 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6FF8C5C024B; Tue,  6 Nov 2018 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502367;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FhW5l/C3RuIoonhmYMWiCjkXzI5H2SDJ0HdrbxBPWgZm76E2rkt8/HUC12t7wUxJa
	7/qtgDxBuv4U30u1eLqq4bRILCgPzwaLNUR/NM+pwQy6VRg2Mu5rBWNBEwY88/gQdu
	XjTKG1CSvw7g1x0AeLyy4+FjE+9Mp6CDipjECH+E=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0CC805C024F;
	Tue,  6 Nov 2018 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502367;
	bh=p2Mv8ssQ4PExXJBSLWQS/O2C8dspM4cwOB9TCaV84ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FhW5l/C3RuIoonhmYMWiCjkXzI5H2SDJ0HdrbxBPWgZm76E2rkt8/HUC12t7wUxJa
	7/qtgDxBuv4U30u1eLqq4bRILCgPzwaLNUR/NM+pwQy6VRg2Mu5rBWNBEwY88/gQdu
	XjTKG1CSvw7g1x0AeLyy4+FjE+9Mp6CDipjECH+E=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:38 +0100
Message-Id: <20181106110548.4209-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 06/16] gdbstub: add multiprocess support to
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
X-TUID: T50A9dDurBPY

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

