Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp242129wrt;
        Fri, 7 Dec 2018 01:07:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WnvmyFIgndv6IxU9fLEf6YCdZw5IM7YYFOmxBX6gBL8KHOvKGEMqrCSqebfaR4DIau2wD/
X-Received: by 2002:ac8:2a55:: with SMTP id l21mr1158695qtl.95.1544173664908;
        Fri, 07 Dec 2018 01:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173664; cv=none;
        d=google.com; s=arc-20160816;
        b=kjpSq7gzH5R8uzRwl4juWk0FiIcICS1BPFzA3VUWadT6IndGygbHW3HvYp9pP8vHQJ
         K+LwF6ADm2xH8qFkBv3mXUN4TIWyj9DekLiYKpNpdKWXk9/3D2TP9AdVo7l7+/OYZC3F
         20V5jYzPXauy6vJWXlbW8ZN9ol78PzRUm1QL8aokfUxFdCfVbtzNNWrGjWnyTa1qkuOB
         RtvskFJeWsYJ4YzAmN/tm/aHIV7EMhjMG4vyEcTpBRWL0s/nffUFJLGaT0oXfJaUqzb+
         S9MshbU7dhDOERgRD5oGLE5u8+B1BzpSVcNxKrgJQlRmTxJZrdv8swg5KKVNMEoVqpZJ
         RHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=An7HLbvmt+PYZqTlqdLanJX8zPqctCOJzjE5K22K2/c=;
        b=IxOuSJElMsreQ2d58pFIitgH1cTKc+i4oHC7CUiHwfzrh407inlcT1YvxibkN575+c
         4PL9XJIEZS/1egAet7rv+gIGwcNZsg2ME0MsR9zcGob5Rc9hbtqE/4GJo/JtzNrZqsRe
         7n0k/JRoPidse+sMIzVpjU5mo65qc3YHbn96hvqcbtXx+uaJJX7dCsnihAJvlGOGhWEa
         QEI1oAuKFhX/c/zqKmiTEsgkKrgCa3dnch1vWOc0zStazjbXHqW+cARWaF3Yo6t8yzCN
         frJZezfRDJkuxrGSQ9lzlE5ZXDHqjIkjpiktqC9qHyOLPpEAHpthxtNSkWAElhozuLbI
         doIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="jtB+/SjP";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="6U9/C7j3";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="6U9/C7j3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m29si717159qtm.216.2018.12.07.01.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="jtB+/SjP";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="6U9/C7j3";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="6U9/C7j3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC6q-0004kt-Ay
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:07:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1H-0007vA-D7
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1F-0005VV-FW
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:01:59 -0500
Received: from greensocs.com ([193.104.36.180]:52244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1B-0005Rl-AB; Fri, 07 Dec 2018 04:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0561C480031;
	Fri,  7 Dec 2018 10:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173310;
	bh=LYKjPukkF3jTxCyW8qyvQZFW8og+W5CDquv7hLZS1iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jtB+/SjPn928yoe8XlqtteIBVfR2Y5UK081kFdb5xt4YMHYb7hbnz/NPy+uBBKDZR
	yuUU7u090YsTs68EXDWAy93CsH0hzPM/ldiSz0xDhyx3Fb0iLXKMUCxS9jCXdLQnuE
	DUMIyIvhZRrfiYxa/1KQ0atfFsO5CQHzv/NdZRUI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6U9/C7j3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6U9/C7j3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKzDi0P6VMwz; Fri,  7 Dec 2018 10:01:48 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B230148002D; Fri,  7 Dec 2018 10:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173303;
	bh=LYKjPukkF3jTxCyW8qyvQZFW8og+W5CDquv7hLZS1iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6U9/C7j3J02fqbdEdlrnZshWpev16F7mFuL5188LzRi7JMXQeiDqFFrMzpD+OsbMx
	y7QLbFZAIEXZFtaByfjM2/AzFMPYUX3CxPhrRtawq5d0JBl/jQr71MfijFodTLE4Z0
	Lueu6s24wNoPadjSX2qW8djfYbBLHQbXm7sf8eJw=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4E548480011;
	Fri,  7 Dec 2018 10:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173303;
	bh=LYKjPukkF3jTxCyW8qyvQZFW8og+W5CDquv7hLZS1iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6U9/C7j3J02fqbdEdlrnZshWpev16F7mFuL5188LzRi7JMXQeiDqFFrMzpD+OsbMx
	y7QLbFZAIEXZFtaByfjM2/AzFMPYUX3CxPhrRtawq5d0JBl/jQr71MfijFodTLE4Z0
	Lueu6s24wNoPadjSX2qW8djfYbBLHQbXm7sf8eJw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:24 +0100
Message-Id: <20181207090135.7651-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v8 06/16] gdbstub: add multiprocess support to
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
X-TUID: 5D7tGaD7ViKu

Change the sC packet handling to support the multiprocess extension.
Instead of returning the first thread, we return the first thread of the
current process.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 77b3dbb2c8..bea0215f30 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1553,13 +1553,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.2

