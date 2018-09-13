Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp829901wrd;
        Thu, 13 Sep 2018 08:45:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZictanf4bQ84LbQiv0YnOP5PoL3tyfRoaDLS9k6C2znNDhPpBtheQkQCMRt1QNnB9cZ8ru
X-Received: by 2002:a0c:8af5:: with SMTP id 50-v6mr5748296qvw.61.1536853559014;
        Thu, 13 Sep 2018 08:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536853559; cv=none;
        d=google.com; s=arc-20160816;
        b=k3Q8wi/aWPJONzBeIqzhR17/UWtXHck8lHc+jAK23lBtw+fIoe3S4Vu+6FI1aLnO4W
         hrtSRTvlSTqWMIYEiG2GNTpNbKSx4yGUtF4cNHo2eIt6k3lF6f0zPotF3vw/QzMrHwav
         gAq/R+tcjgdhvFAO+QMOc81vyMzkj5L9GQ52YdoaysTIbnxxAbWxnKswGiFJZex2KFKM
         eoC7UpBrsvm7BpQyEKlvKryaOZjHDZi8K3t9zhbQMxU5oGCPK1+NNIuxLcyc9cYRFSUx
         kA2P0E71xYo7bMfHplTMkh8Du1py4YcV2LCZdCczkUiSvgiBYOaYsRExjuKKNwzMU5Bh
         IuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=jlhFN49rpT2OkPUUguQeBNDIQYrdprYcXPE+nMdIGsE=;
        b=vqiGjRbJfNM26nu2NmjF6lR4l/WPYKCQZk89DItOtosXuNVYik00rtEAtOA+qQDI04
         Dfyzu7LxyGO2FblsXhEnOELuRbRBmCbCCTIP3CBlQbtyulxGVcuC3J3GZkpxBkD39JkF
         DzoTpY4x93RaGRe8b53QQm7+vgqmyhCS6rzwAjY5KxDDIBGdyTJOXdVMlM37ugkuseVL
         Hvk97VQIvSO63jV3Z6UYfmbp3QI5KktksPL6cp/RClj7DYoUc6DTEjtTre+cC3rdej4d
         4jrw3jtI9SdyZuuFeXhy0yXZ28HvmlEvGxdW1fTqECeFXe0v9t9H35RbrhVLFTffoDAJ
         NuUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o56-v6si520238qta.399.2018.09.13.08.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 08:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0Toc-0007N5-Gl
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 11:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To3-00079J-F9
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To2-0002vz-27
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:23 -0400
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19]:41004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g0To1-0002jm-Bu
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:21 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by laurent.telenet-ops.be with bizsmtp
	id b3l51y00N3XaVaC013l50M; Thu, 13 Sep 2018 17:45:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-00018K-7h; Thu, 13 Sep 2018 17:45:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-0006Et-5P; Thu, 13 Sep 2018 17:45:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 13 Sep 2018 17:44:55 +0200
Message-Id: <20180913154458.23939-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:19
Subject: [Qemu-arm] [PATCH v4 0/3] vfio/sysbus-fdt: Prepare for Generic DT
 Pass-Through
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2AGqqrGLn2J

	Hi all,

This patch series prepares for exporting generic devices in DT using
vfio-platform, providing direct access from a QEMU+KVM guest to the
exported devices.

  - Patches 1-2 (submitted before by Eric Auger) make the vfio-platform
    device non-abstract, incl. matching using a compatible string.
  - Patch 3 allows dynamic vfio-platform devices again, without needing to
    create device-specific vfio types for each and every new device.

This will avoid having to write device-specific instantation methods for
each and every "simple" device using only a set of generic properties.
Devices that need more specialized handling will still be able provide
their own instantation methods.

Note that this series no longer contains "[PATCH 4/4] hw/arm/sysbus-fdt:
Add support for instantiating generic devices", following advice from Eric
Auger, as that patch needs more safeguards.  Hence this series now contains
only preparative work.

Changes compared to v4 ("hw/arm/sysbus-fdt: Generic DT Pass-Through"),
http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg05006.html):
  - Propagate g_file_get_contents() errors through errp,
  - Add Tested-by (with amd-xgbe),
  - s/From now on/Soon/ in patch description,
  - s/sysbus/vfio-platform/ in patch description,
  - Postpone "[PATCH 4/4] hw/arm/sysbus-fdt: Add support for instantiating
    generic devices".

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

Thanks!

For testing, this patch series, and the postponed "hw/arm/sysbus-fdt: Add
support for instantiating generic devices" are available in the
topic/rcar3-virt-gpio-passthrough-v4 branch of my git repository at
https://github.com/geertu/qemu.git.

This has been tested on a Renesas Salvator-XS board with R-Car H3 ES2.0
with SATA:

    -device vfio-platform,host=ee300000.sata

and GPIO (needs VFIO No-IOMMU support):

    -device vfio-platform,host=e6055400.gpio

Thanks for applying!

Auger Eric (2):
  vfio/platform: Make the vfio-platform device non-abstract
  hw/arm/sysbus-fdt: Allow device matching with DT compatible value

Geert Uytterhoeven (1):
  hw/arm/virt: Allow dynamic vfio-platform devices again

 hw/arm/sysbus-fdt.c             | 61 +++++++++++++++++++++++++--------
 hw/arm/virt.c                   |  1 +
 hw/vfio/amd-xgbe.c              |  1 +
 hw/vfio/calxeda-xgmac.c         |  1 +
 hw/vfio/platform.c              | 24 ++++++++++++-
 include/hw/vfio/vfio-platform.h |  3 +-
 6 files changed, 75 insertions(+), 16 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
