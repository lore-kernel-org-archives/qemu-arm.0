Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411308wrt;
        Mon, 26 Nov 2018 03:33:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5colLJ+NmbEYCM7qoXDTLRvnxbmgQW1dMymFSujznZYSc/33NgE8ntOsFFg4ltVk3KWjyfI
X-Received: by 2002:a0d:c405:: with SMTP id g5-v6mr28524231ywd.375.1543232008587;
        Mon, 26 Nov 2018 03:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232008; cv=none;
        d=google.com; s=arc-20160816;
        b=keeKJkgR+QG3f4HjOu9NXFMg0eyuqIwglbhkBUvDtIxUUve/fX7uo4MGSixa+C1HmN
         kkI9CfVcFgNnnjk7Yp/g8VtFRXCF3dY3yPKpzgKOY0NXzUxAGbAKMVGSoeKap7VSHgq7
         xpsMbQpA1VHlT27ONfL8PCqD/L+Vy6TtMAEhv/dySGV59M3/nGxpUlzIM/7+R8paZYJb
         BUMktaOrSyOnas0VFqNiOJWhopx4gOJQARicqUBJTle83bO1/rZXBt4cKEyWoJJtv7us
         VuTVmNctN8HHg35ueQJaQwSWlPQmWBx9tWai6yQlSNRG82IRLSP7Y/fTfSJz7bdve703
         dn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UGnwbvDTCC3C3B/5TR0eTmaXMKhuqEFTu9Ac6QqCsO8=;
        b=CJ3TZvM58QHbeGWgZ9X7BYux7M/j7a0ted3z2+ttw+3HwwLqQgeq/k/1WLaHo9HDFJ
         0Tx6xYVGWPPzzZUOP9LUphEohNx2drnNCyd/euAzkoN0BpXskgMkwjAD5/BgQDn9gpmi
         B2MIRCLCIsd5I+nWsyLvCQAWKw030qRo8Gwk5vCTQzQ2ae8IHB2zyHSGRUILWB1Uy/Qx
         EKiR/77TZKj1R++TCvATC5cvsePhoi0ioP1Uc6crnNJ3z+rAsXOrMdqxihly8rAky8an
         VASufuWo7P1N3Krn4kcxyqKF7tw7tts8Mi3XvS2KnqD41bvwC0wMzBW7Mgq5x7e/1Cso
         8BIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si36337ywe.117.2018.11.26.03.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF8q-0000Et-27
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0000DY-5X
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8U-0001qR-HE
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:14 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:30190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8U-0001lQ-4V; Mon, 26 Nov 2018 06:33:06 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id DAD8F7662A6CD862AC6D;
	Mon, 26 Nov 2018 19:32:58 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWrcc031645;
	Mon, 26 Nov 2018 19:32:53 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330091-13057763 ;
	Mon, 26 Nov 2018 19:33:00 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:54 +0800
Message-Id: <1543262162-6351-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:00,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:52
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAQBWrcc031645
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V9 1/9] hw/misc/pvpanic: Build the pvpanic device
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
X-TUID: rTmE9nU7i3dg

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

