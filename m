Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4350876wrs;
        Mon, 2 Sep 2019 09:27:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd+D4tKX3fAQMOLfnJWwGKA8xcr1rFKglEeqiJfHu5VsM3M34bVwLkBm0t7EmtVCvXCnbR
X-Received: by 2002:a50:8f81:: with SMTP id y1mr31440390edy.181.1567441625577;
        Mon, 02 Sep 2019 09:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567441625; cv=none;
        d=google.com; s=arc-20160816;
        b=bqDyHEWLXKu/CAzC9k25yIiVOg7Ad8tjpqAHifWmH8s3+Byx9jcq55OjTKeyLtQvpB
         cEEl5BAAy9LkdGTeJsseCfF4nahc2BMseqbQHZ4Z0OhwfF9tKBJSFAV7vSww+UHh6B3T
         p3Ckl5q/VfTcgUwL7fhiCl50jyEoQzZfRo5UzCb/7MweddjWeYsiNML4c/8dVWC6BsZg
         H7Pf5kRnfyvH3S2l3yNRrcbIW6AKqUWwItfD1bzXDCmZaDKu3i4EJkgWZ/WnMOT0yhts
         nWUYFigI/Ludkal0phFJQU6cc8UkRMNBmVI/oGtfZSbRdFR1CmRmQ6YJwm9NOEJZyJPx
         skvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=6DSTC63OuMSfHicF7HxXJkFqf+VJm4ysm/2Zly2sHpQ=;
        b=hrBf4fftIswc6PQyh2M66pbALuBhHcoBTIxlVQSAN8QphS2m8bk7kcU7ktlRD0JPec
         1KPP7xn4yvocu6gfYgCTwC4JL3LLgpRPlf0LO/z86mdiKaVFHBgRgKhfeGhOJeTuCw1s
         P5T28yPaNNDD0nV0XZ91Ya8u9erxf8Ylzj+ym4ZZzOWjAPNI0LetdpfyPb4iOeVQmiqI
         Z0hz2tY6VilijAm4MYcNuenzl9XFh4dt6JgAgXpOKzQOWCSCinz5lzv9hhG8TkbgfLxb
         QTvSyEExeIulV3uBVGuP/oVF1Wbc0t2h+aaTtOX4XcLHiOGTW9CkzO0E4WlVcBSzn2IE
         o2Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si2220039ejz.364.2019.09.02.09.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 09:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4pAW-0005QP-7Q
	for alex.bennee@linaro.org; Mon, 02 Sep 2019 12:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i4pAL-0005Q3-V2
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 12:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i4pAJ-0001lN-M0
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 12:26:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44980)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i4pAJ-0001kK-Ey; Mon, 02 Sep 2019 12:26:51 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1AD0A3C91A;
 Mon,  2 Sep 2019 16:26:49 +0000 (UTC)
Received: from thuth.com (ovpn-116-48.ams2.redhat.com [10.36.116.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B313DBB;
 Mon,  2 Sep 2019 16:26:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon,  2 Sep 2019 18:26:38 +0200
Message-Id: <20190902162638.28142-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 02 Sep 2019 16:26:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/misc: Mark most objects as "common" code to
 speed up compilation a litte bit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+hFD0izFhdl

Most of the code in hw/misc/ does not directly depend on CPU-specific
code. Mark it as "common" so that the code can be shared between e.g.
qemu-system-arm and qemu-system-aarch64, or between the various mips
flavours, instead of recompiling it for each and every target again
and again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/Makefile.objs | 90 +++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index e4aad707fb..a150680966 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -26,57 +26,57 @@ common-obj-$(CONFIG_PUV3) += puv3_pm.o
 
 common-obj-$(CONFIG_MACIO) += macio/
 
-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
+common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
-obj-$(CONFIG_NSERIES) += cbus.o
-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o exynos4210_rng.o
-obj-$(CONFIG_IMX) += imx_ccm.o
-obj-$(CONFIG_IMX) += imx31_ccm.o
-obj-$(CONFIG_IMX) += imx25_ccm.o
-obj-$(CONFIG_IMX) += imx6_ccm.o
-obj-$(CONFIG_IMX) += imx6ul_ccm.o
+common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
+common-obj-$(CONFIG_NSERIES) += cbus.o
+common-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o exynos4210_rng.o
+common-obj-$(CONFIG_IMX) += imx_ccm.o
+common-obj-$(CONFIG_IMX) += imx31_ccm.o
+common-obj-$(CONFIG_IMX) += imx25_ccm.o
+common-obj-$(CONFIG_IMX) += imx6_ccm.o
+common-obj-$(CONFIG_IMX) += imx6ul_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
-obj-$(CONFIG_IMX) += imx7_ccm.o
-obj-$(CONFIG_IMX) += imx2_wdt.o
-obj-$(CONFIG_IMX) += imx7_snvs.o
-obj-$(CONFIG_IMX) += imx7_gpr.o
-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
-obj-$(CONFIG_OMAP) += omap_clk.o
-obj-$(CONFIG_OMAP) += omap_gpmc.o
-obj-$(CONFIG_OMAP) += omap_l4.o
-obj-$(CONFIG_OMAP) += omap_sdrc.o
-obj-$(CONFIG_OMAP) += omap_tap.o
-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
-obj-$(CONFIG_RASPI) += bcm2835_property.o
-obj-$(CONFIG_RASPI) += bcm2835_rng.o
-obj-$(CONFIG_SLAVIO) += slavio_misc.o
-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
-obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
+common-obj-$(CONFIG_IMX) += imx7_ccm.o
+common-obj-$(CONFIG_IMX) += imx2_wdt.o
+common-obj-$(CONFIG_IMX) += imx7_snvs.o
+common-obj-$(CONFIG_IMX) += imx7_gpr.o
+common-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
+common-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
+common-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
+common-obj-$(CONFIG_OMAP) += omap_clk.o
+common-obj-$(CONFIG_OMAP) += omap_gpmc.o
+common-obj-$(CONFIG_OMAP) += omap_l4.o
+common-obj-$(CONFIG_OMAP) += omap_sdrc.o
+common-obj-$(CONFIG_OMAP) += omap_tap.o
+common-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
+common-obj-$(CONFIG_RASPI) += bcm2835_property.o
+common-obj-$(CONFIG_RASPI) += bcm2835_rng.o
+common-obj-$(CONFIG_SLAVIO) += slavio_misc.o
+common-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
+common-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
+common-obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
 obj-$(CONFIG_MIPS_CPS) += mips_cmgcr.o
 obj-$(CONFIG_MIPS_CPS) += mips_cpc.o
 obj-$(CONFIG_MIPS_ITU) += mips_itu.o
-obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
-obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
+common-obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
+common-obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
 
-obj-$(CONFIG_TZ_MPC) += tz-mpc.o
-obj-$(CONFIG_TZ_MSC) += tz-msc.o
-obj-$(CONFIG_TZ_PPC) += tz-ppc.o
-obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
+common-obj-$(CONFIG_TZ_MPC) += tz-mpc.o
+common-obj-$(CONFIG_TZ_MSC) += tz-msc.o
+common-obj-$(CONFIG_TZ_PPC) += tz-ppc.o
+common-obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
 obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
-obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
-obj-$(CONFIG_ARMSSE_CPUID) += armsse-cpuid.o
-obj-$(CONFIG_ARMSSE_MHU) += armsse-mhu.o
+common-obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
+common-obj-$(CONFIG_ARMSSE_CPUID) += armsse-cpuid.o
+common-obj-$(CONFIG_ARMSSE_MHU) += armsse-mhu.o
 
-obj-$(CONFIG_PVPANIC) += pvpanic.o
-obj-$(CONFIG_AUX) += auxbus.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_xdma.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
-obj-$(CONFIG_MSF2) += msf2-sysreg.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
+common-obj-$(CONFIG_PVPANIC) += pvpanic.o
+common-obj-$(CONFIG_AUX) += auxbus.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_xdma.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
+common-obj-$(CONFIG_MSF2) += msf2-sysreg.o
+common-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
 
-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
+common-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
-- 
2.18.1

