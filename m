Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp774355wru;
        Wed, 25 Jul 2018 07:38:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpedMflwgcDHP+CZHn+N8USWAWbzOgIub/WBlECIg9/9PKfHFsGfWET6dQJ18I2IU8dH81Cg
X-Received: by 2002:ac8:6681:: with SMTP id d1-v6mr20186087qtp.94.1532529506834;
        Wed, 25 Jul 2018 07:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532529506; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlDKzZMvV8KsXM2Q1jy4P8ZOOIPCLF2DgZUXwcxhv33EHqRYi1rmVR6S4SN5Of5pFp
         ciXCYAyeaIvpQW/zIEZ/JWLg1gRRpBIfzgMl/UALy/ND7sDluBbW+oVGNiHfQlt706CG
         Rp0L2pxZNE8dCpCgmg/ifNFR8sxp5ZOyfbekPpw8cd7uG5cBCerKXbHEyvOATVSTtTYw
         1UF32dQnyejXSSybWDj2UQs8ox4u+QI2TUJ0Q6AMFb/gLQSihl0iH3PSHiThsIwD8I2x
         Uzw30NGh8IOE1eSWiansCKTvO/Ifck4zuDQe660XfqaT7hPiPa7TYp3UgaktUtDcy4nG
         76Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=hQZMU1XhheBB4PA6fbIBJDmkMOlj68hl4zIBYy+IJuY=;
        b=mQnfhSWEaed7vvmiuFmm0RZVOw7g8uiAU2Mf142fCAVF4q3NtE98nCOFDTVPWUNaUm
         cSXLwOK4WRwshbzhQseD016u20iGx6IH9Rrefq/ebBN9lR04DdJ1V0zO8tjZEYC0RMau
         cdpONLwgiVoJ7JGNy6Wdl0EstljdAePUH0QsFM6vkAESu3nyjKvWihqCFiysjkvxDuZ7
         EYU+1QUYa3Z7k0QC6zjRtWBaWxgrUc4+a5R18TTRHZ48v4XuTUipuriYHR+6QZ3ga9AO
         keN//UIIVrLasn1VTvkrxhmZkZw0cKgKZa8jTSCrAtgyOBFGYzz/F1s6J7UqHQ6+KTXE
         lapg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n26-v6si1435124qtc.0.2018.07.25.07.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 07:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiKvp-0004Ql-HF
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 10:38:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKrz-00018I-Ug
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKrw-00068z-VQ
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:27 -0400
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:34208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1fiKrw-00067E-NX
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 10:34:24 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id F2aJ1y0053XaVaC012aJ9b; Wed, 25 Jul 2018 16:34:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-00051t-4m; Wed, 25 Jul 2018 16:34:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-0002Xk-2e; Wed, 25 Jul 2018 16:34:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 25 Jul 2018 16:34:09 +0200
Message-Id: <20180725143413.9728-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:14
Subject: [Qemu-devel] [PATCH v3 0/4] hw/arm/sysbus-fdt: Generic DT
 Pass-Through
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LSRU+woaqhQo

	Hi all,

This patch series allows to export generic devices in DT using
vfio-platform, providing direct access from a QEMU+KVM guest to the
exported devices.

  - Patches 1-2 (submitted before by Eric Auger) make the vfio-platform
    device non-abstract, incl. matching using a compatible string.
  - Patch 3 allows dynamic sysbus devices again, without needing to
    create device-specific vfio types for each and every new device.
  - Patch 4 adds code to instantiate device nodes for generic DT
    devices, copying a set of generic properties from the host.

This avoids having to write device-specific instantation methods for
each and every "simple" device using only a set of generic properties.
Devices that need more specialized handling can still provide their own
instantation method.

Changes compared to v2 (not submitted to the mailing list):
  - Use the compatible values from sysfs instead of user-supplied
    manufacturer and model options,
  - Replace "hw/arm/sysbus-fdt: Enable rcar-gen3-gpio dynamic
    instatiation" by generic "hw/arm/sysbus-fdt: Add support for
    instantiating generic devices",
  - Reword patch descriptions,
  - Drop RFC state,
  - Drop "vfio: No-IOMMU mode support".

Changes compared to v1 ("R-Car Gen3 GPIO Pass-Through Prototype (QEMU)",
https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg02716.html):
  - Restrict dynamic sysbus devices to TYPE_VFIO_PLATFORM, as suggested
    by Eric Auger.

For proper operation, this depends on "hw/arm/sysbus-fdt: Fix assertion
in copy_properties_from_host()"
(https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg04922.html).
Thanks!

For testing, this patch series and all prerequisites are available in
the topic/rcar3-virt-gpio-passthrough-v3 branch of my git repository at
https://github.com/geertu/qemu.git.

This has been tested on a Renesas Salvator-XS board with R-Car H3 ES2.0
with SATA:

    -device vfio-platform,host=ee300000.sata

and GPIO (needs VFIO No-IOMMU support):

    -device vfio-platform,host=e6055400.gpio

Thanks!

Auger Eric (2):
  vfio/platform: Make the vfio-platform device non-abstract
  hw/arm/sysbus-fdt: Allow device matching with DT compatible value

Geert Uytterhoeven (2):
  hw/arm/virt: Allow dynamic sysbus devices again
  hw/arm/sysbus-fdt: Add support for instantiating generic devices

 hw/arm/sysbus-fdt.c             | 163 +++++++++++++++++++++++++++++---
 hw/arm/virt.c                   |   1 +
 hw/vfio/amd-xgbe.c              |   1 +
 hw/vfio/calxeda-xgmac.c         |   1 +
 hw/vfio/platform.c              |  22 ++++-
 include/hw/vfio/vfio-platform.h |   3 +-
 6 files changed, 175 insertions(+), 16 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
