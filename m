Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1711314wrh;
        Sat, 27 Apr 2019 07:18:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsatyybPyqwbQEOpT9U75JNdE0JbJ/25YM3P03SrqAEATbD7aORyzhjbbyMA4C0SdMZZTT
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr11476080wmi.57.1556374684844;
        Sat, 27 Apr 2019 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556374684; cv=none;
        d=google.com; s=arc-20160816;
        b=qH1P8zC5+lKcKPQLJBQZ4UNTqrtFs9HBDicAgFkl/AuDoPvpIGybyLXGq0vf7gWeQc
         Qy3mByj88zYDJf9gsdlcKOICZdIgl6tSnlgV42dH9OHglnySkR6D8oO8SdQAkKl+cya/
         lFPmo9GS3fwTrcRmJ0SRBWBFbSM59o8x9lrVk8dmkuddNAFeI7wGp6KatsxS0UhxNekY
         U3rgG6F4y7K6dsbZTJail9uPwYzpzFElV1kRRYWl/ebGvOvoa9NZ6rztrTQoRgKorrq/
         gvhIC+gtNymsPO62LaTdML00GiemXX6aQc4hNW1biRGaLj/Q96QmTyztt1+sSa+XpA+b
         Dwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DT1qtc3oZpS4dp2sVqrIAgfjay0ppVF7VSATiOHLvzo=;
        b=cLOwBpviSEofx5SuhLU9gQ0CFPaoUgw5nKVHnR+qjduLp433dEWWopwjrzvF2yODTv
         gfQzZFnqw75rRUakGIz6/fQ9YRBqBnRyKUnQu0mhPlur8/dT3+5TXiXMdlBB4+fpAUjK
         zyWZ1JM1BH7L7jJE0/3KwxxjoIoq3DciF3Rf7DEL/FJdkLk1CO9gtcWzjdtcq/E+6Xhs
         VefFLgYoHGUwcwHUi/eCdI7oUzRDEptXinLJ/BobZubOyyi1J197yXcQuHuf3fcyNdPd
         pxR1vlxUerfDeg//J2J99FqAaVrppnXLI5UFSD/XW33P5+CIXjSHkC0SwUylTvqqrlYo
         C9cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si15375128wro.443.2019.04.27.07.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 07:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKO9T-0008H9-Sh
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 10:18:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6m-0006HI-Ua
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6m-0000Z9-0W
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKO6l-0000Yc-RP; Sat, 27 Apr 2019 10:15:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17D4A30BDA05;
	Sat, 27 Apr 2019 14:15:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BAA17DC8;
	Sat, 27 Apr 2019 14:15:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 16:14:58 +0200
Message-Id: <20190427141459.19728-3-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-1-philmd@redhat.com>
References: <20190427141459.19728-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Sat, 27 Apr 2019 14:15:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] hw/intc: Only build the xlnx-iomod-intc
 device for the MicroBlaze PMU
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Saf8OxgVK/qU

The Xilinx I/O Module Interrupt Controller is only used by the
MicroBlaze PMU, not by the AArch64 machine.
Move it from the generic ZynqMP object list to the PMU specific.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/intc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index df712c3e6c9..247e8016cb8 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,7 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) +=3D pl190.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
-common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP_PMU) +=3D xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
 common-obj-$(CONFIG_IMX) +=3D imx_avic.o imx_gpcv2.o
--=20
2.20.1

