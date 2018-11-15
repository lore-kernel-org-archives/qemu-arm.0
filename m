Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6810157wrw;
        Thu, 15 Nov 2018 01:59:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5dwLvB2EgaxzLWuv0+5QwJ2z5jOMkpQBly5a/isomZOscYkkPCE2Mw/TtMAJjF9aLlzTyg0
X-Received: by 2002:ad4:5282:: with SMTP id v2mr5461847qvr.195.1542275964383;
        Thu, 15 Nov 2018 01:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275964; cv=none;
        d=google.com; s=arc-20160816;
        b=qfwiCCu5vTUoSEzIB5AMyG2pF30ANVwHSr0p0V6G7GYmVxQ9GEwdshX6hcZL3z5xji
         Qbp90NLohR2mvkeBZFNO23n0OI0i8/VMUVRZVwDV8RKRt35Qm+NN5pNStWy0NCyNxdvi
         Fco5or6SumTm+f5FCQPNcG/o0lWEwonb6/KL/SW1fyGTCGZ5jg6cN5Eot4jT7TJ1iM1H
         DoHdWlqNA9XiKuhe8PQ9a6TH4S/ljD4sdX4Jj/EBAcRT0QViuXfC32unX7CXTZcIpV65
         kiag3v/rT51JAQK9SgHZZXCs8mNABT/B3PD+Tse9NM0LEP7E3A6bRJdrFLHgruaBV3hn
         Lbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=9fbpwIbnfz4OePeSC5LonxC+6Tn0o1+AhRrUqkczRi4=;
        b=eR+jijSbs6PlJ2Bdav2c6ycP6+vv/pjyqVwSVMiEV+5gLgx8FqlhuqkUcCdWJmsHNG
         1fGFwOOpDSKFh5vHefvMet5aw6i3qK3MeEegF3o3F54G2kXyI6kCd+xZ0JpVvC9c8rFn
         hBPz/lkGQK9bHSxkyIXcWSF+faArlwGQbplQ2X3PK7Lh55eZ/9jaqrR7yT2EumdN1jZJ
         yGm1eeVPfPG4QKaLCTBpiZRUrU07CVJFtJuh0e5vWzha6QWWAxqyMqyy4vEE8s37MM8k
         gMw0y/jOe099FKQGcrG/Fg3mqfX4mNou0WOPOVHpg0Z6NPhGcsZai8qp9CvEoKwAJk74
         dxhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iZaSiUWD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zsrHab4p;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zsrHab4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si3531070qvc.2.2018.11.15.01.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iZaSiUWD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zsrHab4p;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zsrHab4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEQl-0004Gh-SM
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:59:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEBD-0007oH-5A
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEB5-0004z1-ME
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:43:17 -0500
Received: from greensocs.com ([193.104.36.180]:41902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEB4-0004NO-0P; Thu, 15 Nov 2018 04:43:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 947F95BD1BB;
	Thu, 15 Nov 2018 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274938;
	bh=+CaC0VEimyO/GjsARvQENMrckw79wtWNMlRkaKEVcsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iZaSiUWD5UrFtZXas7jE4qD51PlcQFvbGmloNCfGdt6eTz+73nQluUt8pszDtdpUY
	fvDDlPQUfpbAJ29r3MW6Yx2HAoWAWzTKmRsemDviddIT52+L1pi9EUwgZ/NEu/tEGO
	n/aAuW8vuwRetvT1jfMWkuTqi0FK/lnAqveO3Mmk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zsrHab4p;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zsrHab4p
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtfGjt8aP9Y1; Thu, 15 Nov 2018 10:42:17 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 3E1EF400FE4; Thu, 15 Nov 2018 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274937;
	bh=+CaC0VEimyO/GjsARvQENMrckw79wtWNMlRkaKEVcsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zsrHab4p7DuItY5hu1ayplQ4WW5Q8ZjR7mocxnKJUl8l5UsMYIqJa+MPAFDflVJXw
	be4PAu6KQB5uEbfc7TXk0Z4jieB1FHtkMUPytP0tA7v3vM/BJ3EydpOwFJPlJ6D6lC
	5N/RXqUPvo17+y0jI4OIttX7R/ACqQjg+77R3w48=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C07B86FD98;
	Thu, 15 Nov 2018 10:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274937;
	bh=+CaC0VEimyO/GjsARvQENMrckw79wtWNMlRkaKEVcsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zsrHab4p7DuItY5hu1ayplQ4WW5Q8ZjR7mocxnKJUl8l5UsMYIqJa+MPAFDflVJXw
	be4PAu6KQB5uEbfc7TXk0Z4jieB1FHtkMUPytP0tA7v3vM/BJ3EydpOwFJPlJ6D6lC
	5N/RXqUPvo17+y0jI4OIttX7R/ACqQjg+77R3w48=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:02 +0100
Message-Id: <20181115094207.22846-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 11/16] gdbstub: add support for extended mode
 packet
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
X-TUID: ctxGDbnwwzff

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index eec1cf0d09..ada53ac559 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1294,10 +1294,13 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
     switch(ch) {
+    case '!':
+        put_packet(s, "OK");
+        break;
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
         snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
                  gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread=
_id)));
         put_packet(s, buf);
--=20
2.19.1

