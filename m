Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548341wrt;
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XWdi0Rj+wKw/5wBCWVSSDEpYB92pkey6zmXA3c/UUTbrb0b8Tqc1at2IrHT0jsZPTQ0l6a
X-Received: by 2002:a0d:eb06:: with SMTP id u6mr22564182ywe.443.1543377024097;
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377024; cv=none;
        d=google.com; s=arc-20160816;
        b=TDvdI9Uq4hOak7c0H3ls/ZHuvJm2FpYevg4sa6m/XKHyxuOoHtFd7ZiHsdSln/2CNK
         dCmMU0p/wJ55qOxTsQcR5vY+mDTxSxCIsN215H9p99+KfuyxsG+CutO5o8spsGuwlO9u
         FkcBGECBjOU/2QrLsvHypjJFOo53voYsGLtQWp5q95N7w2QEGcX9jgta+PzDCpQmJMTq
         h9I/Nt9ex87hLkMjYbz7gpSiE7nXjhAYClM4LsvzqyOQDKo+KF+AiMt8KRxP2uci6pSY
         jk+38VALw/sh5Xlz69YS5JZZ5e0bf4zZ4z1fntGWvfUAMn+tbILsMO769DmHS39MtS2s
         LpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UGnwbvDTCC3C3B/5TR0eTmaXMKhuqEFTu9Ac6QqCsO8=;
        b=LTnKEM33VAA7X0YALOo7kUE/HmllIy1lY9NtxoJO4zzkjsCJaNV+OX408iJTU2tYhg
         2FG6Qw/YFDyxpbXWZtChicErnvnncolAjH3EcCZBTcpdYTUvpskk7KpCyiE/ZKluNev/
         7lGvD4VwZsCzGL7QGHPpzZLOIvUZQgMi+3oQVVcdbGac5yRa0v4DmPH7goM2rjzaVN/J
         TLszS3vVpzqvwo05nBwWzWwud06g18TWNfazANLeupcdQ8AgmtyPADf8JMUlIGrWn9N8
         oDvQV+o06FRpwni0jnpBe/5r4Ho3Sn2a/0f/7QAe3Vr8YbJwlLaqWC8bgUUnHqSwY/8V
         0QNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13-v6si4345999ywk.451.2018.11.27.19.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqrn-0002Yn-ER
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:50:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrX-0002Y5-7E
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrT-0003Uy-1y
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:15786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqrS-0003Lm-MU; Tue, 27 Nov 2018 22:50:02 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6120632C13B32841DF5A;
	Wed, 28 Nov 2018 11:49:55 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nnJQ058549;
	Wed, 28 Nov 2018 11:49:49 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811500920-13417618 ;
	Wed, 28 Nov 2018 11:50:09 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:44 +0800
Message-Id: <1543407172-16175-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:09,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:40
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAS3nnJQ058549
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V10 1/9] hw/misc/pvpanic: Build the pvpanic
 device in $(common-obj)
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
X-TUID: /vA3TMMHe4qN

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

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

