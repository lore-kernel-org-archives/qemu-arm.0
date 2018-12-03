Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6647573wrt;
        Mon, 3 Dec 2018 03:05:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WK9btlqvNoTwqeGmNueabPHdPHabah2lboKgbR5sudmFPuGnAbMUIcUDhWChaffWDiw/Je
X-Received: by 2002:a81:b61a:: with SMTP id u26mr15024832ywh.250.1543835130400;
        Mon, 03 Dec 2018 03:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835130; cv=none;
        d=google.com; s=arc-20160816;
        b=Mr+hOuCaM1m0iQTGToERzIHftkf/XE4EHejv4O5gHnyN0UkalRvvK/TVjtD3P9z2B+
         Gm7KjVXiShVxEC5Yb5MuYNmCOxpYcaazM5Bg4gyrRHO8z1HyFaYLv/5mXLadk1FYaeX9
         cqzBVlaPxDq7Q/7CeJ+UjmAf5gmODKh198oHo6OuxWFdNeDcbNgzwZRLeKhAdxSXei8o
         xqfBmC8kMNK7P0yvJv243q4d13Y4hE/VrnU0K3uKUxgdYrhMdzM0QdmgGISvKJXF7WRW
         i7DzepAZqa/cgA79zZofa0omYUl0g8mFnx4CJ50O/TSsCEr5zLHFqlCmErgoXhK/Bb7Z
         sNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UGnwbvDTCC3C3B/5TR0eTmaXMKhuqEFTu9Ac6QqCsO8=;
        b=ueB5UABJXl7iOUUQYdwMN+77NVdO5eB61fzEsksUZdnDAx/pmg0aiSE+7cI1QEKL3b
         rMdMM/+xZcI5n1DZdCJlX2UJ455dJYc8gALzfhVZlH41mmLrjVt63JxWNqDVBJac24pV
         0L0t0VHzyywxWVZmq/aDjIrhun5xdq7LNk2XfaiGfn5dktDNbEoiO071wPduCUr273ST
         0wmWhlfM1pCRPqW2MSE9mNJayelUPtdzjcaWBVtSydW9Voi66k9qteqkm+8cGTnzvnhc
         3M06fIzJyeyvRA6afrphgHJsFzbIvNOFe5l2770yaVN0lhdj3AzoUB3o/OTkNa3SmEFS
         YEsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si7405016ybn.155.2018.12.03.03.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm2b-0004kN-OA
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:05:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1f-00045b-Sb
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1b-0002Z2-7t
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:31 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:58486 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1a-0002RM-SU; Mon, 03 Dec 2018 06:04:27 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 9C7CE1F83F9329C88BA6;
	Mon,  3 Dec 2018 19:04:17 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B46cH097850;
	Mon, 3 Dec 2018 19:04:06 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319041449-14451297 ;
	Mon, 3 Dec 2018 19:04:14 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:42 +0800
Message-Id: <1543865209-50994-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:14,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:06
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wB3B46cH097850
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V11 1/8] hw/misc/pvpanic: Build the pvpanic
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
X-TUID: FFDVXLbNQ//v

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

