Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10478728wrt;
        Thu, 6 Dec 2018 03:04:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WitgWv9/YdJ8pWyvJVbojV8fg+K64J6Wj3F+n36ljjcORA2mnl9ZzP64z1dHE3wrH40zFw
X-Received: by 2002:aed:39e8:: with SMTP id m95mr26669005qte.317.1544094295362;
        Thu, 06 Dec 2018 03:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544094295; cv=none;
        d=google.com; s=arc-20160816;
        b=Z51GhXOENBIaeApNoaJCj8F6F44BsSJaI12Yv+8tExFWoDgRp3bp5zpaMPK2tAOjai
         6jJPdPMaH1IHZmSro9gB2ZpuVJWEx4WAr+L6Bysa+ljgX154TvHkOSs7G0oDbUej7WEm
         iO53kYbpB1V1MEtRPNV4XVYLd7+9u+tA8EqJbn0E//xqvtdxuo9Vv1FZSWorJzX5i8uF
         xYL+XOpZr/P6bxuZff4U4WTMsFdilKO2HGhvj/wccqDbjnEv8DEEDdLzlNPEEqGejjmP
         +LqKT8GdZSoKZYYkRwJjDpt3IetDymoFv54kLASNuxQ2rSPwN0OhlSoGua9fX5a0/V3i
         2p9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UGnwbvDTCC3C3B/5TR0eTmaXMKhuqEFTu9Ac6QqCsO8=;
        b=pQ+JpPd8fA+Zzfb2TpCrOnMKatWqthehUtk0fwOnOKzlO5zkS2YRMU55rMv/laioBf
         78MiGUPQEGhI4RegfDlQSCliMuaB8ZfXej4ey3XHW7iG4a4dOLfCIgprFREebpYm8lh1
         RiDZT8QG8BRVgVdT5SRUIFHQNxk32aeUjPZdK/tYTuHLsRvt4x3NVMI4wHY0btpsL3fL
         u4+Nq/cvBinmLtdTqccEveA+7chJiYfdAf1ItWCm1TVSF89mLVgzQJT2l3zfhg4JB0Un
         MmrF5BHQ7CacV1sORPzpPnhKRpUdJkmNjOl4zws1QGpXDFEZeXYqV1SyLETlUNPx17Dl
         YpHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s25si29226qki.72.2018.12.06.03.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 03:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40089 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUrSg-00031p-6R
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 06:04:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSK-0002xK-EK
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSG-0000Eq-1c
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:32 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:32988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUrSF-00007O-Eh; Thu, 06 Dec 2018 06:04:27 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 8588E4D6F68FC1116B89;
	Thu,  6 Dec 2018 19:04:09 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB6B3u81072748;
	Thu, 6 Dec 2018 19:03:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120619042854-15124384 ;
	Thu, 6 Dec 2018 19:04:28 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Thu, 6 Dec 2018 19:25:56 +0800
Message-Id: <1544095560-70807-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-06 19:04:28,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-06 19:03:45
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wB6B3u81072748
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V12 1/5] hw/misc/pvpanic: Build the pvpanic
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
X-TUID: 4T894a+Z5XQU

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

