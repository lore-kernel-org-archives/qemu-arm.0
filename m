Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp812282wrw;
        Sat, 10 Nov 2018 00:19:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5dn6g78HpjQYlmPevXU3UuzmQIaxmEJ+Rmp6cj+adVAgx9DnYvNgVZBKboKbYvE+YvlFeD5
X-Received: by 2002:a0c:95e8:: with SMTP id t37mr11968690qvt.163.1541837988173;
        Sat, 10 Nov 2018 00:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837988; cv=none;
        d=google.com; s=arc-20160816;
        b=THwGdEdmgBZIbznXmsxiiTsZPiN9kUYezrqje32WtWp9EoNslaOi8K+fov5y7RTXaC
         rRatC1eVVeZ6O+ABSOl2//QSVBNe4XItkti4LvJW+If3coVjjiukaBzxOQ7Htr87wEa1
         +mXtWRdblpoyeVhT/BGfQfBjYOLTMmkNLiR6qAFrmbT0r990ToeZ4Y0aJZW7kWdyWvOb
         a+SzSGXs1IiYcEMfFKwHCqeZVvPfh+fbbJ0BVh1wA5AWI+WMeME+tJD+FOsNrVQ0xhIP
         GGdaHaJ1Isrc8u2zI6+R+2zFF3a36s5nEDM3WtA1T6HO0Fsmr81fT/bB2lFX5HN5l4jj
         xgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=pjXUpgOUGeK5dTocPFrhxuE/Oqaq+JchJ8+sNY0Rkag=;
        b=aGy+b+Kc3Sb9Nk0xSF3YM1T2vRx2u8ldDqN5u2ZaDlKfQZNB79aOIB+BzKtQz7LgXp
         o2ckyPqK49IImczYrUUChZBdEjDq2WcdO0EmXKBTpAQzbjWVo0cdppOlFHSb0pCiWESZ
         Vj8fEaQgCerk2LN0tY8aB8XCwtqOsGVrKWdH7HjAVVlXx0XTZHrpGwT4KwzCkHlJzX2b
         3hhwHAEvd7DhUhOGx/Nfu3iVGBmAoTerpToCYjMoycg1d7/Qem00HjBUtqfRjtagvJya
         DSdoyRPsGzrHMOGbSB7NTFKjwsMkOq45cWfsJnNA2VM6PulKYJDrnugH85JVZ8XjN63D
         BHCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="ONxJ/5bO";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VnF4Fp1G;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VnF4Fp1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si1965944qve.22.2018.11.10.00.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:19:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="ONxJ/5bO";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VnF4Fp1G;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VnF4Fp1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOUd-0001dl-I1
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:19:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP4-00040w-1m
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP2-0000wS-CB
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:01 -0500
Received: from greensocs.com ([193.104.36.180]:43679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOz-0000TB-Bn; Sat, 10 Nov 2018 03:13:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4E95C5D19A4;
	Sat, 10 Nov 2018 09:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837611;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ONxJ/5bODy4hKL0+eazHbh0v3fv0+dzMnA6CuAd5T/o5izwNhYRnx5jW0ywx+sSJu
	54vU8wZgerY95of8ohEJ66jMQjaU0CYo/uTS7czvgWrRzGA+zuIFhseq8qaQKK+1LS
	tFZNuTtfllPX9Fq9IHoCU3XUO2f+jcFmKuawoThg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VnF4Fp1G;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VnF4Fp1G
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gh6pPo9W7AB; Sat, 10 Nov 2018 09:13:30 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6FB9A5D19A3; Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VnF4Fp1GPMGYOHF4HlqkRbHAPM61HOLBHOeLe1jdoeWTgcmQdLauaxzMGlQa4rXky
	L9EZ0ma0tp0R3mJ1x0LnPktT4ub1jAs1+zZTv7jsvqUQ3eg17T83wKoo29ONRsTqr3
	kBI7HiSsagd6fyvcNCFwyYYliTVz2oFRzRn0AFV8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 00E395D19A3;
	Sat, 10 Nov 2018 09:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=WgnMQ5pr+n/ESL8puF7jtpCC/FdzwfDNBDnQ0ACltqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VnF4Fp1GPMGYOHF4HlqkRbHAPM61HOLBHOeLe1jdoeWTgcmQdLauaxzMGlQa4rXky
	L9EZ0ma0tp0R3mJ1x0LnPktT4ub1jAs1+zZTv7jsvqUQ3eg17T83wKoo29ONRsTqr3
	kBI7HiSsagd6fyvcNCFwyYYliTVz2oFRzRn0AFV8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:45 +0100
Message-Id: <20181110081147.4027-15-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 14/16] gdbstub: gdb_set_stop_cpu: ignore
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
X-TUID: yV/ISUwA7Fb0

When gdb_set_stop_cpu() is called with a CPU associated to a process
currently not attached by the GDB client, return without modifying the
stop CPU. Otherwise, GDB gets confused if it receives packets with a
thread-id it does not know about.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 1a3353ff3c..c662ada6ff 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1787,10 +1787,19 @@ static int gdb_handle_packet(GDBState *s, const c=
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
2.19.1

