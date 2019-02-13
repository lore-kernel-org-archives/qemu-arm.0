Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1668083wrp;
        Wed, 13 Feb 2019 01:03:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZClJmzuHgXJhyrzsTG5UqOHzeqX4NDBLL2BP/EYwBDJzrBltiR4VcImWCkoYBlICU35GgH
X-Received: by 2002:a25:c508:: with SMTP id v8mr6311217ybe.201.1550048621006;
        Wed, 13 Feb 2019 01:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048621; cv=none;
        d=google.com; s=arc-20160816;
        b=HUzUiVOCh5gz6FtDpoCdMkTenjnh2+tDs2oIFdQdR7HI4wnt8Sj5snBpkuJaQ3PUdY
         XAEmnetOlYf2CClIfv01lVZFgmrrdv91o1PLsTiroR1+Pmbp6iKjqRuVzHinovgFXbx+
         yKLsY1jqR02widpesaQzamwnxEIV0fs35Qxs77Iyl3Cpcm/OIzzuwo3xMZM5dyVAHucl
         up0c3e4hJA2fuHE9d3L1hg+UyhAdVRDpAd/y44IdDobJxCb8zAF4nmncpHfHBxDXSqvH
         61/WxHr3tIY/wIT9PbdhsTw6s9dYQ4kuCiUNV4q0St/8tmSQBZp84kS2wwGXCm4u5ZBQ
         iS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=FMFyunLVtuaO+xohmpopvODTE6aKdjX+fENFVjKsjuQ=;
        b=E8XEDSRlpU55ScBjnkKRWznlB01+CflTpOBQFpZkwJJebKK87HeN4N4Ie3T2g8cPB3
         WkvcU8s/dikFkNGTtN9yWlnvT+y9zsf2bZh2+PXq873evBkkFYu34iXMRalrgXiUWaj4
         yT0PSSAiNCgWptDjK7XPT3xXiyWrF4CBFbZgv9/P70uKJW4AkxlxHH8zQVKvaVdY0FG0
         46ggqAQDXy7gFA4P1z6PQsepsLETtO599Fu5Wt+dpY6Jy+TSyDiJmk3twYTnOvcwzdW/
         tNWOk55CMIgQM9J4jg0d30oTujaQYJDuucKr/Mz8BxO3zOpdJICDB7qSHjHCWU6pynh4
         2Hrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x128si128767ybc.185.2019.02.13.01.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqSC-0004OH-DJ
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG7-00025E-9U
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq3n-0004tK-98
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:38:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq3n-0004s2-1A; Wed, 13 Feb 2019 03:38:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28E5EC7A3A;
	Wed, 13 Feb 2019 08:38:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31400101E843;
	Wed, 13 Feb 2019 08:38:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:37:53 +0100
Message-Id: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Feb 2019 08:38:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/25] Kconfig dependencies for ARM machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WLhzLhwS0SU1

This series reworks the default-configs/arm-softmmu.mak and
default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
dependencies instead.

Based-on: 1549562254-41157-1-git-send-email-pbonzini@redhat.com
          ("Support Kconfig in QEMU")

The first half of the patches is slightly based on the work by =C3=81kos =
Kov=C3=A1cs:

https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html

The second part has been created by looking at the sources and finding
out the dependencies the hard way via trial-and-error (i.e. by enabling
only one machine at a time and checking whether it can be compiled and
started).

NB: One thing I noticed while working on these patches: We should
tidy up the dependencies of AHCI and SDHCI. Both currently depend
on PCI, but some boards that do not have PCI also want to use them
(via sysbus devices)... but that's a clean-up for the future, this
series here is already big enough.

v2: Adressed review-feedback from v1
 - CONFIG_SDHCI and CONFIG_AHCI now select CONFIG_PCI
 - Added switches for MICROBIT and EMCRAFT_SF2

Thomas Huth (25):
  hw/arm: Express dependencies of the exynos machines with Kconfig
  hw/arm: Express dependencies of the highbank machines with Kconfig
  hw/arm: Express dependencies of integratorcp with Kconfig
  hw/arm: Express dependencies of the fsl-imx31 machine with Kconfig
  hw/arm: Express dependencies of musicpal with Kconfig
  hw/arm: Express dependencies of the OMAP machines with Kconfig
  hw/arm: Express dependencies of stellaris with Kconfig
  hw/arm: Express dependencies of realview, versatile and vexpress with
    Kconfig
  hw/arm: Express dependencies of the PXA2xx machines with Kconfig
  hw/arm: Express dependencies of xilinx-zynq with Kconfig
  hw/arm: Express dependencies of collie with Kconfig
  hw/arm: Express dependencies of the aspeed boards with Kconfig
  hw/arm: Express dependencies of the virt machine with Kconfig
  hw/arm: Express dependencies of netduino / stm32f2xx with Kconfig
  hw/arm: Express dependencies of allwinner / cubieboard with Kconfig
  hw/arm: Express dependencies of the MPS2 boards with Kconfig
  hw/arm: Express dependencies of the raspi machines with Kconfig
  hw/arm: Express dependencies of canon-a1100 with Kconfig
  hw/arm: Express dependencies of sabrelite with Kconfig
  hw/arm: Express dependencies of the MSF2 machine with Kconfig
  hw/arm: Express dependencies for remaining IMX boards with Kconfig
  hw/arm: Express dependencies of the microbit / nrf51 machine with
    Kconfig
  hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kconfig
  hw/arm: Express dependencies of the xlnx-versal-virt machine with
    Kconfig
  hw/arm: Remove hard-enablement of the remaining PCI devices

 default-configs/aarch64-softmmu.mak |   4 -
 default-configs/arm-softmmu.mak     | 177 +++-----------------
 hw/arm/Kconfig                      | 313 ++++++++++++++++++++++++++++++=
++++++
 hw/arm/Makefile.objs                |  25 ++-
 hw/display/Kconfig                  |   3 +
 hw/i2c/Kconfig                      |   2 +-
 hw/ide/Kconfig                      |   2 +-
 hw/misc/Kconfig                     |   2 +
 hw/sd/Kconfig                       |   2 +-
 9 files changed, 364 insertions(+), 166 deletions(-)

--=20
1.8.3.1

