Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp555469wro;
        Thu, 25 Oct 2018 04:13:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fK345Jh67NEIu4QnijGvwSRkFSQ0ci2wpJ/VzSvp9XHSc8IqkMgFEUma9SiYI50oRCivl/
X-Received: by 2002:a37:ae06:: with SMTP id x6-v6mr915787qke.238.1540466000086;
        Thu, 25 Oct 2018 04:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466000; cv=none;
        d=google.com; s=arc-20160816;
        b=cwm7AGbIZ5u6e10P51dYh58fcuvGJ1M/sMkuaNwejqo2H/UAOJy/HAWej5xzIA8GWO
         T5TggB3VjcJsnQ66Yjxi1A4SzxFr1C2CyyLjYw/pkhAygUX0YyUJhtP0ago1jVvkklj6
         KyhZ5sLfZjpNE8G3yzSBHqikdBYFOssJdP6/iZ/L8mFKw1wU06Bf5XGHScCxeMBhUd08
         kSd/2EL4Rfe9HYmBukfI7OkSn1ZAUpeouNN7MqImB1DLNB+XXSEfPy9R4/p/Stph3Nfe
         d+KhRhj4propKn7tpp0Sq3WrsHETExMUlgVNBpuc/h84KUu6o9k728UDhPaKQ4snF6x7
         +K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oLKEEKxuTpqSnlYbbxwMM0laDcQ3UHLpXlsElKthKf4=;
        b=GvVZm1G21PCMILURo3Qmuhu+IX1sYYlRWHdw7netjs19roiBUhHc4ak18xMkIAfahl
         tVSXXQkdVRPBGVjd5mf2dT2qE8DvLImqVo1KCuiRKjA3mwfYoCOroZwMbDzyCRRMIlmv
         HvvtOtW7OSCkybB9SP4cXTLOVk2bAbexca4vEn5hanPO5nVwaDkMukJCCrDpJ5RVCQxu
         f7OgQ8RG9YwkW5LZUkWCrzP2fklHFCtMulKTgig1WAkvzPubl1BAts4yJ9zIlX+/RHaZ
         ZMjdxqWQjG1C+6voE4uVgJeZPXSh3JyL/RqLpfMj7bfNE8ikDm7QlqnZco8Dafjf99R0
         rPIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k14si2488304qvp.85.2018.10.25.04.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFdZn-0006Gb-HA
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZQ-0006DP-6t
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZK-0000Yr-HC
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:12:55 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:43336 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZI-0000Qy-52; Thu, 25 Oct 2018 07:12:48 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id E3C37305AA589F7C8229;
	Thu, 25 Oct 2018 19:12:28 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCIHL015289;
	Thu, 25 Oct 2018 19:12:18 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519124982-6703127 ;
	Thu, 25 Oct 2018 19:12:49 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:13 +0800
Message-Id: <1540495397-88089-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:49,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:06
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9PBCIHL015289
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V4 1/5] hw/misc/pvpanic: Build the pvpanic device
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: seQQXLMR6+5M

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The 'pvpanic' ISA device can be use by any machine with an ISA bus.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 6d50b03..24997d6 100644
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
 obj-$(CONFIG=5FHYPERV=5FTESTDEV) +=3D hyperv=5Ftestdev.o
 obj-$(CONFIG=5FAUX) +=3D auxbus.o
 obj-$(CONFIG=5FASPEED=5FSOC) +=3D aspeed=5Fscu.o aspeed=5Fsdmc.o
--=20
1.8.3.1

