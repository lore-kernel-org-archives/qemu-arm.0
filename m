Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1868825wrt;
        Thu, 27 Sep 2018 04:57:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV636LE7DGiES3Cg4ZWHlosSY/oQO7XVzvRBKvWMqn0h0Alnm0IEBeKkg3AS2L0P8a3Dvd3XX
X-Received: by 2002:a0c:ca06:: with SMTP id c6-v6mr7817191qvk.64.1538049461006;
        Thu, 27 Sep 2018 04:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538049461; cv=none;
        d=google.com; s=arc-20160816;
        b=J/CFkNkLnMntSJbjlZCQWTA5IJrv+1CxtZTGwapk9M+3HxW7tZjOkD7IzjBEua5dEl
         7ia4qqhQZcni7/KVFmllI9r0HAjgSKkSvxpuTNbuJPA37fyegoFTBP9rfE4wV8HE8h3o
         fGuh7Nkgs7cfZ3WCrUSREY85uFVqAQhydOo1J+l2GySAa3/1btXo+MoxmiiVUvhVH0L4
         MUwhbDrAxKHSu1scV5Z4kGuDdI8erFlUGeFaervetI2qk7Gl6NVQQ/pLXlSlo9vqPJ9j
         ZKqTNbIKaLuyY2qc62yy6EYlk/QNwc3eU2rVanhTNq+Msycg5TucjH1KIrPGCvvDTNzF
         bzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=GhkGpqb7LKe7IKzQv6Om29p/7wshxgcgiZlKGpxtP2k=;
        b=klyIVeYtTLY6wxWK929Pc82+M8dL4ftMjbXqny+5lqDRcOf3miU6O4BahQzFUxg11n
         mDMX4YriDjsgqYg41y8gT1cUFegNvoVbJ+jtYh3BPelGXNbzS0YIXEqi4csyi46uX4Mw
         /kp8GbtbmwbcLfnhPOuPN1pfNqN06qR5cNNUNkEv4YKvtAxy4S2VBALVdhjA3cKiiHYo
         qG4V/OlSVg0gqfrJBJn9o6laXFBvfBEVU/D0VXe4Bli8BqAWuAAopnW7GIZdApivACIl
         zO0tByyVbYfkuKT7mtVCSTYEGQceSJh4bgcA3Ep44ZTACZVSofbm+XgpLDcxWpSmasaN
         2+Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b16-v6si1335072qkj.70.2018.09.27.04.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 04:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5UvM-0006bm-Bh
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 07:57:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Usq-0004jP-VE
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Uso-0000wO-Dx
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:04 -0400
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15]:45858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g5Uso-0000uP-2q
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:02 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by andre.telenet-ops.be with bizsmtp
	id gbux1y00A3XaVaC01bux0o; Thu, 27 Sep 2018 13:54:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0001cj-5P; Thu, 27 Sep 2018 13:54:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0008CO-3N; Thu, 27 Sep 2018 13:54:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 27 Sep 2018 13:54:51 +0200
Message-Id: <20180927115454.31471-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:15
Subject: [Qemu-arm] [PATCH qemu v5 0/3] vfio/sysbus-fdt: Prepare for Generic
 DT Pass-Through
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
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WBeJwhYW1ler

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

Changes compared to v4 ("vfio/sysbus-fdt: Prepare for Generic DT Pass-Through",
http://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg01672.html):
  - Add Reviewed-by, Tested-by,
  - Fix path leak on error,
  - s/instantiatable/instantiable/,
  - Drop reference to commit 6f2062b9758ebc64 ("hw/arm/virt: Allow only
    supported dynamic sysbus devices").

Changes compared to v3 ("hw/arm/sysbus-fdt: Generic DT Pass-Through"),
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

This (plus the postponed "hw/arm/sysbus-fdt: Add support for instantiating
generic devices") has been tested on a Renesas Salvator-XS board with R-Car
H3 ES2.0 with SATA:

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
 hw/vfio/platform.c              | 25 +++++++++++++-
 include/hw/vfio/vfio-platform.h |  3 +-
 6 files changed, 76 insertions(+), 16 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
