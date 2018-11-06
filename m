Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp751315wrw;
        Tue, 6 Nov 2018 03:19:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5fBCx7oyxdEvpUhDEjiMn62w1ERWQ0VDgeSXHW4QbOT2QbFR6JPxcy7ho1D4z/jWqI0nc+1
X-Received: by 2002:a37:b084:: with SMTP id z126mr23492955qke.154.1541503179052;
        Tue, 06 Nov 2018 03:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541503179; cv=none;
        d=google.com; s=arc-20160816;
        b=sPuRl+WirnL16d7uRPMQ5lPS5/w3UhdLtJqPjGUc2e8cILN2hY0KLfKqg//tKmpBJ2
         Mk/FTJtAF5iUkIukPX4DOu/dDQ4GbPHt8dT+/iTlGQQkhJ79rea5I6uTgUpdEyCbM0AG
         lNJxh+UrdkykBaAQc6Y7qldBFdIkpSIudVNzbilIm593e7uGjK29M9YR3xCclyqy76bo
         u+OySKQ33mMeUWq0+5NzYw8La96FtrBPqrHHZn64EMbtF02R456nfLgpsplKy2VLElhh
         dnJPKZtlo218EfnKgt/nYVie/uHAxbdGB0SSZ1IeBtRURe6roq3Z5UZiLbnfDuVYn5Ql
         dNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=K+mw18cvI1/hg8pA1YK2tECF6E6Yb6mryjYehLVujzw=;
        b=ivn0rddonRm6YAui9vQbG5o6KvtBsoE2Dn+3HQPgkQu05u/AM3Zk1Bc2FFs0+CqI95
         hLI8JKwkLy+OdzegVg6/3wblFh1MVv26F6TVZOGn8pydR1+DAUWlkMYsOaBKidY4qZrC
         1a7DGj8IqCiNMlilbwxdKNTAS9m/DvkbAFKkfhUbD80rh4zoxuuxxevTIx2tcpAaAvNX
         yljtThw8ivUEoPjyAduLWbL4vzSjR9rLW/s5G40bG7vA0I821lOoB5FRS7tGmCH+y8jk
         lC5gQxW9Q0b4DOCWCrCD8HwJRfFLMwCOgVRxZ6xkVkEbuyvFXZ2K5a6YuSRXPplPyCHu
         Zdlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=z83pVBvb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YZ9lqt4A;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YZ9lqt4A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n32si6242078qtd.130.2018.11.06.03.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:19:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=z83pVBvb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YZ9lqt4A;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YZ9lqt4A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzOU-0005s7-Ez
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:19:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC9-0006mk-KM
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzC4-0001uK-Jr
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 06:06:53 -0500
Received: from greensocs.com ([193.104.36.180]:46713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBq-0000or-SR; Tue, 06 Nov 2018 06:06:35 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 76CB65C024B;
	Tue,  6 Nov 2018 12:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502374;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=z83pVBvbA3gXyc1YMfUGwAsh3F5VgMH3CuG4a4J/9u1qi7RQoDMn5xgIGVR451Fta
	3iooGDVmEjGRAmSjwkrHb3tmBJsDCV19SN3gCcDk3x0+hFbNABfJ6c6yFAx9mVPn5t
	UnLZhFJKxWN+SJIxLbt3IDEfBvl8lJOGbdpWq8TE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=YZ9lqt4A;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=YZ9lqt4A
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvTfVx2rzk9E; Tue,  6 Nov 2018 12:06:13 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id A2931441B53; Tue,  6 Nov 2018 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502369;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YZ9lqt4ADQZdYIidB74hABQTsDBsVefcqAKWfBbK6DQnNyvS3wyh62vVlny1VHiQ+
	a7h/z6AN2i5+asv7J4IncIhR/iBB1ctpT0n0oXPaKDH+JMVdl8/LhENvcC7ooydZAd
	GChHXBQRzIePmYKVJKJMn0fUhz3We/Es5Rl4+Fuk=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3C4175C0279;
	Tue,  6 Nov 2018 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502369;
	bh=rBCCagqSrFOEU0nfuOIRvEJu5ZG6NSRyLpjqwKGgpUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YZ9lqt4ADQZdYIidB74hABQTsDBsVefcqAKWfBbK6DQnNyvS3wyh62vVlny1VHiQ+
	a7h/z6AN2i5+asv7J4IncIhR/iBB1ctpT0n0oXPaKDH+JMVdl8/LhENvcC7ooydZAd
	GChHXBQRzIePmYKVJKJMn0fUhz3We/Es5Rl4+Fuk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:43 +0100
Message-Id: <20181106110548.4209-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v4 11/16] gdbstub: add support for extended
 mode packet
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
X-TUID: 2V1Jb/t8Bhu+

Add support for the '!' extended mode packet. This is required for the
multiprocess extension.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index bd4895ac0a..4132227092 100644
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

