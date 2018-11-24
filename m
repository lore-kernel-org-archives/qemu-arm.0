Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3049039wrt;
        Sat, 24 Nov 2018 00:21:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VtlDEJb+amWadSBpzOGoLx8mRjuqiu77andje0/w0yMhMSl2Lb3s9VmYpky99IpOIo7JEh
X-Received: by 2002:a25:7b41:: with SMTP id w62-v6mr19353203ybc.82.1543047672079;
        Sat, 24 Nov 2018 00:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047672; cv=none;
        d=google.com; s=arc-20160816;
        b=CzlB6gwin6MNfJvXu9L9bBocuymT/CEWc166o1+Lj5AQf5dY4JPu7hNcMOKUVvSuoP
         16ULfXUQxWVDat9ZpS2Pao7k27hOB6vFhRdZvPHS8eE3HJhNyLkaqJhCDSmRY/Y1N3+U
         kEGjW+28KiFnoYfJPu2VvMXArzKO8o5e9UgS0GPtMdlZVSXbaTAc2yUvEPF5MxKQIypD
         03DFxhIJOluSlj+i6M5pIb6XklxiZ8N30YErBcR+tKad/kxvgxLvtQGwSzcQf9w4Qyx7
         fJi88vH8znBFy54aOA8Xd5qLGUq+bj/1TvuQ5YAK5f4ucmok2kBJV45y4jXomKpi74MH
         TqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=YPFwTLNxVrtlzDTiY5Rkk1OYHui0DZLuGXHEEwyOzP8=;
        b=IrKqSrFHwq4/rJ5tc1FWpL1PMjDPbnLwPd6gBU+HZPmmiPTaQR2vH1U8hB8pdRy3Fu
         iP6gXnbiy7vU2bvx/LRjpKi8Ubtl1KXS38Drdx7PHoIZSMruaTsYVnnbZ+3Nhr7BR4OK
         gi73hMBJJncGM8ognMdfC3jx4Sy0PYbuJNAWmIoGFzhmeIYC4MIqJMVLFZLkszyp1Amc
         jo67V4FbRfXTK2E8xJj17ZBc4w3fWBvS1nsu6jmhe6wJa9pm7Rp3YhSbQKtm2zKLc4Gs
         2kf1TJcTJQo+a7Ru02bHSEa8XoOyURuWYVt2dA5kRzYv/Tk2zoEkC3wb4wSUJhTIe1sb
         PYSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si17754743ywe.22.2018.11.24.00.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTBf-0000fC-Eq
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAt-0008VQ-3w
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT44-0005jF-Jy
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:13:23 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40484 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT44-0005ge-5I; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id EF2A23007083D855FE3D;
	Sat, 24 Nov 2018 16:12:52 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8CgQm023365;
	Sat, 24 Nov 2018 16:12:43 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416132899-12697191 ;
	Sat, 24 Nov 2018 16:13:28 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:24 +0800
Message-Id: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:29,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:23
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAO8CgQm023365
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH 01/10] hw/misc/pvpanic: Build the pvpanic device
 in $(common-obj)
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j5zD2GiW3rGx

The 'pvpanic' ISA device can be use by any machine with an ISA bus.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 680350b..c387ce4 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG=5FISA=5FTESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG=5FPCI=5FTESTDEV) +=3D pci-testdev.o
 common-obj-$(CONFIG=5FEDU) +=3D edu.o
 common-obj-$(CONFIG=5FPCA9552) +=3D pca9552.o
+common-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
=20
 common-obj-y +=3D unimp.o
 common-obj-$(CONFIG=5FFW=5FCFG=5FDMA) +=3D vmcoreinfo.o
@@ -70,7 +71,6 @@ obj-$(CONFIG=5FIOTKIT=5FSECCTL) +=3D iotkit-secctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSCTL) +=3D iotkit-sysctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSINFO) +=3D iotkit-sysinfo.o
=20
-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
 obj-$(CONFIG=5FAUX) +=3D auxbus.o
 obj-$(CONFIG=5FASPEED=5FSOC) +=3D aspeed=5Fscu.o aspeed=5Fsdmc.o
 obj-$(CONFIG=5FMSF2) +=3D msf2-sysreg.o
--=20
1.8.3.1

