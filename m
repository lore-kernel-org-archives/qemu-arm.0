Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730704wrt;
        Mon, 1 Oct 2018 04:58:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60zsdqt2+Tzt4IAcrolvkcjhsgWRPoixrJT4YpA2VDsgSHt8ObheaGUe6XVgCifQMtNWcY1
X-Received: by 2002:ac8:185d:: with SMTP id n29-v6mr8449050qtk.10.1538395119624;
        Mon, 01 Oct 2018 04:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395119; cv=none;
        d=google.com; s=arc-20160816;
        b=Kxyjq0oMXgc7o9jvUcGZblkAgxHeuujcBoeKofZoWswO30R779CfwWKRPfU/Qfz7NC
         Km5Qdz+q6WIoLD/ZnTcNouMModYY6Ds8kHs8MAc5XLoWHUDrUKmbOF8E66bPcz76fARn
         2c+SVx55k7JZMk+eYbfONt/ymzCgz4vUvkcbeNZ/62jdznTTiR8q4LMVYrNQNjg7wrmD
         huz4hhJdcDeep+gvqBcQ6y6AqzZWCt+R92u4GOg+9ttbTEH8eII8FWWCELq0pjVS1/Ti
         aEhLI6v5kBmi9F5FegrLE3T4bzW/GrqF8BVpMEfzZG4aCFZona+1krUjO/nLcjPNuhYM
         qeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5ZzEYrtTIOlVT/tL9/mZAB8EcwUK7QIWhb7lF9yTf7E=;
        b=NJxRPTpGvf3OgqK8zXrUqC/l0UaHsA//vpfvjK0+R/zBiQ31F8d0xXETnfQjx9/B9/
         kft6BJMKEo2j3TiSFVmcCkg4d/2XVhjtWWUXmoCyvJabN2RS3YhJueLh+RbjG/Gstpbb
         UAIM2tuDuLZ0qXNdNKKcZQvHB0yZ5QG1F8qaCcHlXccJVVrzsZs4/Je/j6h8pbjUbIs7
         Mpm/TiJqypeu6cwfiuwGp+UZ8SSCaewdTU1BgSkCDAa1v3b2vOu3PvwXC82fNWmEzj1l
         pgM5pvS2f1wx/33QnmF94uNwrOLB/rioJWRnWn100ZWdQ3UywZysWZ9Qu0WMY3XuFjBe
         3g0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vekiIom0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tNHvpBTB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tNHvpBTB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9-v6si1604485qtn.115.2018.10.01.04.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vekiIom0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tNHvpBTB;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=tNHvpBTB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wqV-0003Fo-3N
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NT-JT
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpK-0005g0-Ax
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpF-0005SV-W2; Mon, 01 Oct 2018 07:57:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 74D85511C79;
	Mon,  1 Oct 2018 13:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395031;
	bh=PnGrRRbiD++Gs8LrhEYq/EHRNpXoblJ2ZYiJIwiIGEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vekiIom0JfZn6L8I3bGollRHvMp6Ak495ktLYvixAKb3t7xFF0KHmEpDGveZSdWDb
	9PKfbrAUBZ8YmtrFmwpPjFdwyxKEbqZRvgUy4rpyoTaKgyjOXARl967ofhEGUWCObe
	jxpGEvhgpBAR89RwIKHemYs0bivAkFQgiWGI1muQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tNHvpBTB;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tNHvpBTB
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 995cjeUtqhgG; Mon,  1 Oct 2018 13:57:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5C8D3511C6E; Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=PnGrRRbiD++Gs8LrhEYq/EHRNpXoblJ2ZYiJIwiIGEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tNHvpBTB/6TBGRnMxgWPP6bYjgOdUwAx503L7bHe5n8h/EE5yfDguMhkWFCGuoeAJ
	B8yDIWuNuwBzFG2mmhhYH9PhkDKLEtJtaLOmPYwfqWDQZjXS/A0RF2HpFb0b3RQcE0
	TZVe27fiP6HC6plzog6RYKbjb1CTR2R0QozaX1x0=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CB6B0511C70;
	Mon,  1 Oct 2018 13:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=PnGrRRbiD++Gs8LrhEYq/EHRNpXoblJ2ZYiJIwiIGEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tNHvpBTB/6TBGRnMxgWPP6bYjgOdUwAx503L7bHe5n8h/EE5yfDguMhkWFCGuoeAJ
	B8yDIWuNuwBzFG2mmhhYH9PhkDKLEtJtaLOmPYwfqWDQZjXS/A0RF2HpFb0b3RQcE0
	TZVe27fiP6HC6plzog6RYKbjb1CTR2R0QozaX1x0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:54 +0200
Message-Id: <20181001115704.701-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 05/15] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/nS82/RHtQz

Change the sC packet handling to support the multiprocess extension.
Instead of returning the first thread, we return the first thread of the
current process.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 gdbstub.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 779cc8b241..3242f0d261 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1530,13 +1530,18 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.0

