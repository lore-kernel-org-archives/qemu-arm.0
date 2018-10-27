Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1768456wro;
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5evKv+zlZx+nuMF4fDmjRTbDiUPZYCYEElA/m9dG9CHF7S+ZQvalF8plQ2PFWs21UeJ3p2I
X-Received: by 2002:ac8:50b:: with SMTP id u11-v6mr6200720qtg.366.1540634241047;
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540634241; cv=none;
        d=google.com; s=arc-20160816;
        b=s95QjtAy9BWMzS/WXqwm9uHyL7tTPyPdiXAXc9uvPDgOAE9j+OgwhLWWSbFqSPcaoi
         30poeRwRLXoT1RXd2+viIBKmY4pZ/coWAYjZ9WdErPECMNTjaqAxTzDhifQgHQefCUoE
         SD8x8NAb+njoxd2ylV9DgiLOXknLPRG2Uh59ib6IQiQ5AnIM2DxLX1R4PHgME6q4wCio
         RgD7DKvuZ6wyT8tpZyQrQ9HnEze3obwfqYdipDD4LJzYbzU/uevwkv/vxoBKOY/ZLN7G
         LnnbaBo3SEBgQVqgji0SGx8lfI2zcv+gmHDXkwVdjSIzD5pv6E+ev+LBqNULbK2D0IcZ
         DmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oLKEEKxuTpqSnlYbbxwMM0laDcQ3UHLpXlsElKthKf4=;
        b=EshvlPVsBB7mUo5xPoqOk0PghpD+qdYgkfQIVi3lBfOhHoxCY4JneYAYrejg4AqYzY
         TuWuxzZngDMOGcHq6ftHD0U7LvVaHhmtHWX0JmWn50wFOW8/9vHqDNxw5O9tE7MeFEtI
         VS5/2+UvUDZ0KTwgyoXcYk1xZtWy6GRrNaoLQc0iK7KlSi5RX1RvmYD+4Rp5PKtOQbf0
         UlvA4X4Z+YA/btE8wTRww3iC3NuSDf+uUfFPmOGMIoRGAlzXDCD8Z7tP6RDNT1m0XH9I
         V+icmM8yhx8GYBOdpDqOUZrojxMY++qpl0S+qS7d2S6Mdbus2zPxq0Dyy27UAbID/hYd
         eYDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k20-v6si4117126qkg.114.2018.10.27.02.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGLLM-000690-Ge
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 05:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL3-00067i-Mm
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL0-0003Rw-Fz
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:01 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:48118 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gGLKz-0003IL-Vr; Sat, 27 Oct 2018 05:56:58 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 50232C67FFBEFE72A7FB;
	Sat, 27 Oct 2018 17:56:49 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9R9uhpK070656;
	Sat, 27 Oct 2018 17:56:43 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102717573019-7044941 ;
	Sat, 27 Oct 2018 17:57:30 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Sun, 28 Oct 2018 02:07:26 +0800
Message-Id: <1540663650-106694-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-27 17:57:30,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-27 17:56:23
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9R9uhpK070656
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V5 1/5] hw/misc/pvpanic: Build the pvpanic device
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
X-TUID: B10OssGldm79

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

