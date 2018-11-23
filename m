Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1750031wrt;
        Fri, 23 Nov 2018 01:19:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vkn6pqBTxpAkreF6nMh4NzUJVWlBU2R5qbTYbX7pHyIjGobzNzBmlnGINtNkQawTTtujzf
X-Received: by 2002:a25:2b41:: with SMTP id r62-v6mr4506775ybr.369.1542964763283;
        Fri, 23 Nov 2018 01:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964763; cv=none;
        d=google.com; s=arc-20160816;
        b=KG5c9jKC3S8QrWED0P7InPgQRdXQRlJPzT5e6Ix5/3+DcaQ6kQpc3A7o+6eFlbkGgh
         eG9qO3/a7UFDmGxUCWpRslJqFhovKpwCxRr2vef3gFcamjqA7ND88ejTBWT93KwJr6oR
         3QbbQYYod6rlJh22qkwvJ22/4dPMb4DZxc3Q8oFIItleiuDRwW0IRR2HpFyZvlQl3I1q
         hN5o5eFZj3FXJlPW7dgik85tzSh38LE6MEb9SF4oHRLkYZ7afk3PRhVLYnj8B8Ls0TOC
         Y2eB20LKKlPeGTTfqL9QhrAd47alsqS1KOV0+qgFXhDQ9shJTyQ5IqU4Sj9ZwsS5cZsA
         uZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=H+Z25yv4FkFv8/kVIyhuSeF9DOpr3Iu5dP9Ks8WEBjk=;
        b=NRnJvbvG9Q/PnD63lSvgsUZKz31xOztIkIOBtDVwuocnX3ykFgNgGG7YFpDE3NqNf8
         ji8va/QgnzkQYtzXVe6MaSa1zNNr6JtF50qGkWDUCg/yWWOTXKAdZUuZTOkJyRvFPR/i
         dlSIp1OWzrnx+CD8EAMkQ1EiE+qPLQmaVjVsPAfbQq7kxd6dCoBfgBEK65To6ZmACteJ
         Z+3vXDLiZ/clP/AAw+M8TYZkgykCulPJzYamyHnyNRrnTu3znOJPj4u+rxJbtNq2NTrI
         Npr3PpNaQb/EmmK0JlHE8e4n60URl4Fz3/1w+B2hNfOG6d3YBEVJgtBn4uDle3K/DFwu
         ohNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=g1HdVsQc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hr6w+mXm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hr6w+mXm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j84-v6si140521ybc.125.2018.11.23.01.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=g1HdVsQc;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hr6w+mXm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Hr6w+mXm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7cQ-000150-7W
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:19:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oh-Mh
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7au-0000ZN-Hu
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7au-0000Xv-2K; Fri, 23 Nov 2018 04:17:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 78D8C5C025D;
	Fri, 23 Nov 2018 10:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964656;
	bh=gsmupulPFuLGf4QxZLVuHGjqeD90Ae9T8kYxMHWyEG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g1HdVsQcoI92S8s+PpsY5co7NrEPU51ZsTfHwXcQleSni4aMma2nD5qBnuaKKUAcz
	PhAxWeirtKrFfl0QJ8IqnVxofQCWeWDoTnFbKOFirUIO3xO9bcwywo1z863AAGh7mw
	e5mYKFWzP4PJHnTWHe/2A/w1S5SGTXqIOxq9Fri4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Hr6w+mXm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Hr6w+mXm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JYoTxgd91_6; Fri, 23 Nov 2018 10:17:35 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7178B5C025E; Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=gsmupulPFuLGf4QxZLVuHGjqeD90Ae9T8kYxMHWyEG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hr6w+mXmYivP92SNi3IcG1rr5qWpF3vi+o8Cc2n52upweOEERHIK7uOo72/g6FDdT
	aQ95ecxR+pkRerckl60D1RO2MhzG9n4ZG+qY3cz8ERlFmcC20JS4SYql8SRxOZYxVf
	bNaMz7Fm8E6uwPfEgd4P+jD4L0ZqIP1i3WkxgeMM=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 141E25BD1BB;
	Fri, 23 Nov 2018 10:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964654;
	bh=gsmupulPFuLGf4QxZLVuHGjqeD90Ae9T8kYxMHWyEG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hr6w+mXmYivP92SNi3IcG1rr5qWpF3vi+o8Cc2n52upweOEERHIK7uOo72/g6FDdT
	aQ95ecxR+pkRerckl60D1RO2MhzG9n4ZG+qY3cz8ERlFmcC20JS4SYql8SRxOZYxVf
	bNaMz7Fm8E6uwPfEgd4P+jD4L0ZqIP1i3WkxgeMM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:19 +0100
Message-Id: <20181123091729.29921-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 06/16] gdbstub: add multiprocess support to
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
X-TUID: Zn0U6J3seD2z

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
index 691b877aa8..728efdabee 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1548,13 +1548,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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

