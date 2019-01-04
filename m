Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp859218wrt;
        Fri, 4 Jan 2019 09:59:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN74a3toaVAEAH5YIbcxA6JTNCC+67EVvE0o7c2/fVpuLaJ5dBx4hFIi+Gv2KmPOYFfvpYko
X-Received: by 2002:a37:7d85:: with SMTP id y127mr50023348qkc.302.1546624764408;
        Fri, 04 Jan 2019 09:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546624764; cv=none;
        d=google.com; s=arc-20160816;
        b=oV+cXqB6nD794ZhKfG8LMpkm7kdL4Ck5nBAlzAxtowTrAiVMZRqzBH4Wzgthnbt1Gd
         KosMu7Bg0B+/jI3CAaJEw4MF6/QwO69xzdZEYX4k3ys/mUpHnc58+1rVE4K2YLd3IbS/
         omsd5rXS75D/ULMSdzKAdfwyiugkKDMdtqL4weEdcElSs5UW6YA3rQ9bcUknygN+WgRK
         xZ75J7jjD+s+m1pakZy8LmSUzQ5kNrPF5Zdc9Jf4pb5k7nyxocylAh7ZS57Hdt0c+eCd
         l493wHB8ka9/rf4qLe39iW73GOU0u9P86Ui+jrSeajic1P/BRNyZdqhcK020383ovww0
         Mecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=zIP5+Z6X2fjQQjaV9ieXs60FPxFvcb6+TEO7qR9ZHE8=;
        b=TUcsI4fqRWxFcbY73zUu86jh7TnZU2ZWjMDGqs6g4chldJ4enOX4tEO1ju/r/6/BFo
         VY1GWJWppKaKfyJuKXz4VZ7hqOroHyGJRlNU8h/1WgqZKnB7zBMGaKt4GTLkfdeJC1W+
         Rv7o+uokhMatHMSo6Sb99vcUlINghDPqQUGOdlAKHCKfzFhK70sWBvHuaLULDVlUqjZe
         eVhhJ+q//ClWKn4DpqEygzbCH0/a6nhCu7zRQkOlXDslAsSHLE0/+0o+2UlQNv72ipX3
         lKXIovxNT9k9jXufJuqzG9nIB4LSCNPu0stvOYV8MewYL3Hkww5NiMhY+zoN3vE2cuWG
         VXKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b62si9577631qkf.59.2019.01.04.09.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 09:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTkh-0002Of-SX
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 12:59:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTkZ-0002OF-F0
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTkW-0004CK-AN
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTkW-0004Bx-3U; Fri, 04 Jan 2019 12:59:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B6DF7F6B2;
	Fri,  4 Jan 2019 17:59:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013B55D6A6;
	Fri,  4 Jan 2019 17:58:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:31 +0100
Message-Id: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 17:59:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 00/16] hw: Remove "hw/devices.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aycz03BfE7QY

Hi,

As the first comment describes, the "hw/devices.h" contains declarations
for "Devices that have nowhere better to go."
This series remove it, creating new headers for devices covered there.
MAINTAINERS is updated.
I also included 2 cleanups while working on this, in "qemu/typedefs.h"
and "hw/net/ne2000-isa.h" header guard.

Please review.

Phil.

Philippe Mathieu-Daud=C3=A9 (16):
  hw/arm/aspeed: Use TYPE_TMP105/TYPE_PCA9552 instead of hardcoded
    string
  hw: Remove unused 'hw/devices.h' include
  hw/devices: Remove unused TC6393XB_RAM definition
  hw/devices: Move TC6393XB declarations into a new header
  hw/devices: Move Blizzard declarations into a new header
  hw/devices: Move CBus declarations into a new header
  hw/devices: Move Gamepad declarations into a new header
  MAINTAINERS: Add missing entries for the TI touchscreen devices
  hw/devices: Move TI touchscreen declarations into a new header
  typedefs: Remove MouseTransformInfo
  typedefs: Remove PS2State
  hw/devices: Move LAN9118 declarations into a new header
  hw/net/ne2000-isa: Add guards to the header
  hw/net/lan9118: Export TYPE_LAN9118 and use it instead of hardcoded
    string
  hw/devices: Move SMSC 91C111 declaration into a new header
  RFC hw/net/smc91c111: Convert init helper into an inline function

 MAINTAINERS                              |  8 +++
 hw/alpha/typhoon.c                       |  1 -
 hw/arm/allwinner-a10.c                   |  1 -
 hw/arm/aspeed.c                          | 13 +++--
 hw/arm/collie.c                          |  1 -
 hw/arm/cubieboard.c                      |  1 -
 hw/arm/exynos4_boards.c                  |  3 +-
 hw/arm/gumstix.c                         |  2 +-
 hw/arm/highbank.c                        |  1 -
 hw/arm/integratorcp.c                    |  2 +-
 hw/arm/kzm.c                             |  2 +-
 hw/arm/mainstone.c                       |  2 +-
 hw/arm/mps2-tz.c                         |  4 +-
 hw/arm/mps2.c                            |  2 +-
 hw/arm/musicpal.c                        |  1 -
 hw/arm/nrf51_soc.c                       |  1 -
 hw/arm/nseries.c                         |  4 +-
 hw/arm/palm.c                            |  2 +-
 hw/arm/realview.c                        |  3 +-
 hw/arm/spitz.c                           |  1 -
 hw/arm/stellaris.c                       |  2 +-
 hw/arm/tosa.c                            |  2 +-
 hw/arm/versatilepb.c                     |  2 +-
 hw/arm/vexpress.c                        |  2 +-
 hw/arm/virt.c                            |  1 -
 hw/arm/z2.c                              |  1 -
 hw/display/blizzard.c                    |  2 +-
 hw/display/sm501.c                       |  1 -
 hw/display/tc6393xb.c                    |  2 +-
 hw/hppa/dino.c                           |  1 -
 hw/input/stellaris_input.c               |  2 +-
 hw/input/tsc2005.c                       |  2 +-
 hw/input/tsc210x.c                       |  4 +-
 hw/intc/allwinner-a10-pic.c              |  1 -
 hw/lm32/lm32_boards.c                    |  1 -
 hw/lm32/milkymist.c                      |  1 -
 hw/microblaze/petalogix_ml605_mmu.c      |  1 -
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 -
 hw/misc/cbus.c                           |  2 +-
 hw/net/dp8393x.c                         |  1 -
 hw/net/lan9118.c                         |  3 +-
 hw/net/smc91c111.c                       | 19 +-------
 hw/ppc/virtex_ml507.c                    |  1 -
 hw/sh4/r2d.c                             |  1 -
 hw/tricore/tricore_testboard.c           |  1 -
 hw/usb/tusb6010.c                        |  1 -
 include/hw/arm/omap.h                    |  6 +--
 include/hw/devices.h                     | 62 ------------------------
 include/hw/display/blizzard.h            | 21 ++++++++
 include/hw/display/tc6393xb.h            | 25 ++++++++++
 include/hw/input/gamepad.h               | 11 +++++
 include/hw/input/ps2.h                   |  2 +
 include/hw/input/ti_uwire_tsc.h          | 28 +++++++++++
 include/hw/misc/cbus.h                   | 31 ++++++++++++
 include/hw/net/lan9118.h                 | 23 +++++++++
 include/hw/net/ne2000-isa.h              |  6 +++
 include/hw/net/smc91c111.h               | 41 ++++++++++++++++
 include/qemu/typedefs.h                  |  3 --
 include/ui/console.h                     |  4 +-
 59 files changed, 236 insertions(+), 140 deletions(-)
 delete mode 100644 include/hw/devices.h
 create mode 100644 include/hw/display/blizzard.h
 create mode 100644 include/hw/display/tc6393xb.h
 create mode 100644 include/hw/input/gamepad.h
 create mode 100644 include/hw/input/ti_uwire_tsc.h
 create mode 100644 include/hw/misc/cbus.h
 create mode 100644 include/hw/net/lan9118.h
 create mode 100644 include/hw/net/smc91c111.h

--=20
2.17.2

