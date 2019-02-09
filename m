Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292225wrq;
        Fri, 8 Feb 2019 22:40:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZDX13+VvxgIF0OPoPwfvuHypzgjCjaPCx3TIPh1u+PeHzRrAk42p63IUPcl3eeIhIEQSrP
X-Received: by 2002:a5d:6244:: with SMTP id m4mr18869712wrv.314.1549694439305;
        Fri, 08 Feb 2019 22:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694439; cv=none;
        d=google.com; s=arc-20160816;
        b=ELf/dgPhyaMQykutX+8RnZ1Dz3NbaK5EqUs2liIOmbgyfwSW7vMSBqS4osAxwN7ham
         KRAqMw+eT9VkP6vRifqcmDIUOqXddLRp7ipTbMWjpda8m2SuCNSFQ7X/S2tr8gBeaxrb
         x28+4Dx27MZTOLhwAErkhDYB11LM5W+OBM6Aqu/P0ouq6PLgMJqdxduXBgVJcJzYOrW0
         ZhpxUsf8nWqs6o9rCuvYmeV9lTbjeajLxFrCiZnImY03KB1SShyBq88QOrYfFGdEEoro
         y8hLS+sCnPiT8qze41EMXBVV7+ZiMYn3Z31EWH6JN9VQm7ocHhZ7o92O3B5Ol6zpcFZb
         yg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=44kjqtSQEpgLpbUbukKYMReAOCUkoBPs7Kwe0Wo4vx8=;
        b=p0IC3D/W3+jm26Y4EC1yRflTeEPhSdChavoqb5ISGv/zPMhowAYIqHAl/E9Gvnr6Pq
         /tA0foczGSvDbyf/qyd3dQcnbE7xuiP2C84Qc5S7AFJMhbJTbky8Y4h2C7B0UZE6LBd2
         ExUI4pgVc0BD3gEwMTmCBuh4HLsW9IJSYHu6R9Y48YBBXVYbIcCTrxgdpxVp7YBQciA4
         PM34+oQklRlFLMxNqPIOKdUfAdC9T9Nnzgxs1lf9Z8SXA17Qb4i/zy6pVEgbLnQ9yZ4p
         00HTLcTppJ2og1xVUNx3pXnqJpEqlkoLUzLzpN5AagmKy6MytP4vc15JZOBmK6OuSMqF
         z39A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z77si3626698wmc.15.2019.02.08.22.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJa-0003xI-AR
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003W0-9M
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIt-0003Oa-0q
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003BP-LX; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E59853DE0F;
	Sat,  9 Feb 2019 06:39:33 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D58E85B6A4;
	Sat,  9 Feb 2019 06:39:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:01 +0100
Message-Id: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Feb 2019 06:39:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 00/25] Kconfig dependencies for ARM machines
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ng1MbstzFR0c

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
  hw/arm: Express dependencies of nrf51 Kconfig
  hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kconfig
  hw/arm: Express dependencies of the xlnx-versal-virt machine with
    Kconfig
  hw/arm: Remove hard-enablement of the remaining PCI devices

 default-configs/aarch64-softmmu.mak |   4 -
 default-configs/arm-softmmu.mak     | 175 +++-----------------
 hw/arm/Kconfig                      | 310 ++++++++++++++++++++++++++++++=
++++++
 hw/arm/Makefile.objs                |  19 ++-
 hw/display/Kconfig                  |   3 +
 hw/i2c/Kconfig                      |   2 +-
 hw/misc/Kconfig                     |   2 +
 7 files changed, 354 insertions(+), 161 deletions(-)

--=20
1.8.3.1

