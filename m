Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1626335wrh;
        Sun, 5 May 2019 11:07:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrI/4idukdiZnC2m6op31ARbwyzX+ho9qWjCt6VWKtpcOyEgN6XZ/XyHpHt3YhABBE9wvd
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr13848727wml.35.1557079661525;
        Sun, 05 May 2019 11:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557079661; cv=none;
        d=google.com; s=arc-20160816;
        b=RdMyg60YDiMwFHnCDRMHscm4NkMbL57M1qYqGy228eIB4ZJ7omvIqzXO5qUAWuUxE1
         2LVcsLBu3mTpodGQyKC1uKQOFoe/Qp6PytUZ/E+/tLP568owXF4TBGVLgmaK6SlTR2RN
         qFtWTUEhZ6MLwKbZ5hQ8BcBL2WerdMqDUskLFvuwR7lbv9poCO8hRFaIzyGtEssF66jz
         m/Y+Fn7JD02/2/jRNZcoGK9LasgSTAl/HINuE9ThxJQcMcHXbIzqzyhuzSQpoKyiqycu
         4urcCVrRxxxGea1cuSefXPuDXwZq97M+JDtDZsoKdA4UuR7BpWFJCMihtqMyj1waYgbS
         kKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=xGhfD8UY1oe+ZRpqdXXXXCeQs4H9EhSYV2XH3vHXG1Q=;
        b=xPxGXdwrn06XwadTmK08JrImlvnaguEHC+dWxZf67VGQn1OfCU9cGVvBCnNO9iawrD
         oJkvndWhWnw5i1tj40p7o+OzwgKtWFltdUOUeEY/4PJLVlVHJgY4p5otmkSKS6PLUBve
         YTWXZex65mBxvtSa2aDnumWSLsal5v7j0+2vDoAK61GD+EVpe1pQT690zIZB7eEFpcym
         SnM2tfcvhQLOyvYpUlDKW83fr0Q7QS7aD5dohVFZPaupjql655XmB5kE5HgHanRlTkU+
         rrMQiV+VZZ13kDTKRDRnnxrASdAv3HdnNb4/lu5qkz6CNq3zVD2Bh5NPtRXlpxhYKTyH
         6bUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si5598944wmb.11.2019.05.05.11.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 11:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNLY4-0005n6-LM
	for alex.bennee@linaro.org; Sun, 05 May 2019 14:07:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNLXx-0005n0-AW
	for qemu-arm@nongnu.org; Sun, 05 May 2019 14:07:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNLXw-0002Wm-DP
	for qemu-arm@nongnu.org; Sun, 05 May 2019 14:07:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39734)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hNLXw-0002VP-8H; Sun, 05 May 2019 14:07:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F823086220;
	Sun,  5 May 2019 18:07:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B74B45C28D;
	Sun,  5 May 2019 18:07:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 20:07:18 +0200
Message-Id: <20190505180719.31913-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sun, 05 May 2019 18:07:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/timer: Compile devices not target-dependent
 as common objects
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
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQWd4jgnrxy7

All these devices do not contain any target-specific code. While
most of them are arch-specific, they are shared between different
targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
multiple endianess, ...).
Put them into common-obj-y to compile them once for all targets.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/Makefile.objs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 0e9a4530f84..a92e22938cb 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.=
o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
=20
-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
-obj-$(CONFIG_SH4) +=3D sh_timer.o
-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
+common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
+common-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
+common-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
+common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
+common-obj-$(CONFIG_SH4) +=3D sh_timer.o
+common-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
+common-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
=20
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
=20
-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
+common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
=20
 common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
--=20
2.20.1

