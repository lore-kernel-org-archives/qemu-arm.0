Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4111639wrt;
        Mon, 4 Feb 2019 15:18:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaT//AL/Jolf/+vPuprUMMzyr4mz6ebHZc6LBNf/CNusubfgIsHB3CtShAiSfFqqr/vLo3C
X-Received: by 2002:a0d:c242:: with SMTP id e63mr1634142ywd.10.1549322335605;
        Mon, 04 Feb 2019 15:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322335; cv=none;
        d=google.com; s=arc-20160816;
        b=mrn0XilqiMa7iYdIfByJ4LxPRYRDXkPLRMuRz963kEhj8oIcxdqYupec0zvdPlGyCN
         v1D+22JammU4TTwVtfglTHjVbQvon8GocupVT1twk9US7dL01fYcBJ7hcLx1wYHjvvuy
         Q4FyLwYOk6GIlJGP6iBJZ41YnXOrQMMVlqIRgRWMs84Wp4jdGAiQgqwvWCklQvKsIFM6
         XG08mvN2TP/ohSjMqjc/hh9Z3uCzu6K5VtTF+3lqiOZPy6+29Q734Q2ni5wDu8q5HxEy
         JkxjVbTLE5AdKNDJB34uwL9STJVUpGYytMpTA11rj7FyPIyyN1jR7MTEmRfGyC99P6H7
         NvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=iyv5cDk4qMaUf6uNoIwKxhbyAYax94Wk6i0ptVDyJXg=;
        b=l6XeMsFJmd5CxqKq7tzzJuHYxo8Cl03Jo3+oZwXEVTK3Slp/1F/qOjxZhC4wRPGNaI
         A3H4aKM05ixOCQ7hHTkjEP1wCGwypKv1pX1T8RfyHadl/mF8tklcHkpz1kIpE8D0cF83
         1DpkC6yEBF647ImjdHrzPLfhpzU3WjV9XkjzHVJ6w1hwDeprjKHYptr82gdtSKPPNBa/
         ZFp6HApPDTpEjgk8eGq6lKGduqCVrKj9ngX0p5ca3XwJFqKIlcddL/N5zV31pRqKGYFt
         o1YljTnCRoJRt35cbksTPCxSrjj5VzPQZOEO76ObUJiyANgKi5zoDYznZylaQJXWl6VB
         ZYbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s187si940811ywb.290.2019.02.04.15.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnVu-0000X8-Nd
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVg-0000Wy-IV
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVd-00007b-7y
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:18:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:29899)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnVc-0008Ua-TA; Mon, 04 Feb 2019 18:18:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D877C01DDF3;
	Mon,  4 Feb 2019 23:18:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82FC112A5D;
	Mon,  4 Feb 2019 23:18:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:04 +0100
Message-Id: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 04 Feb 2019 23:18:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/11] hw: Remove "hw/devices.h"
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
	BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vl2yNyt+/pL

Hi,

As his first comment describes itself, the "hw/devices.h" contains
declarations for "Devices that have nowhere better to go."
This series remove it, creating new headers for devices covered there.
MAINTAINERS is updated.
I also included 2 cleanups while working on this, in "qemu/typedefs.h"
and "hw/net/ne2000-isa.h" header guard.

v2:
- added R-b, T-b tags
- addressed many review comments from Thomas

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00611.html

Phil.

Philippe Mathieu-Daud=C3=A9 (11):
  hw/arm/aspeed: Use TYPE_TMP105/TYPE_PCA9552 instead of hardcoded
    string
  hw: Remove unused 'hw/devices.h' include
  hw/devices: Move TC6393XB declarations into a new header
  hw/devices: Move Blizzard declarations into a new header
  hw/devices: Move CBus declarations into a new header
  hw/devices: Move Gamepad declarations into a new header
  hw/devices: Move TI touchscreen declarations into a new header
  hw/devices: Move LAN9118 declarations into a new header
  hw/net/ne2000-isa: Add guards to the header
  hw/net/lan9118: Export TYPE_LAN9118 and use it instead of hardcoded
    string
  hw/devices: Move SMSC 91C111 declaration into a new header

 MAINTAINERS                              |  7 +++
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
 hw/net/smc91c111.c                       |  2 +-
 hw/ppc/virtex_ml507.c                    |  1 -
 hw/sh4/r2d.c                             |  1 -
 hw/tricore/tricore_testboard.c           |  1 -
 hw/usb/tusb6010.c                        |  1 -
 include/hw/arm/omap.h                    |  6 +--
 include/hw/devices.h                     | 63 ------------------------
 include/hw/display/blizzard.h            | 22 +++++++++
 include/hw/display/tc6393xb.h            | 26 ++++++++++
 include/hw/input/gamepad.h               | 21 ++++++++
 include/hw/input/tsc2xxx.h               | 38 ++++++++++++++
 include/hw/misc/cbus.h                   | 32 ++++++++++++
 include/hw/net/lan9118.h                 | 21 ++++++++
 include/hw/net/ne2000-isa.h              |  6 +++
 include/hw/net/smc91c111.h               | 19 +++++++
 include/qemu/typedefs.h                  |  1 -
 57 files changed, 230 insertions(+), 120 deletions(-)
 delete mode 100644 include/hw/devices.h
 create mode 100644 include/hw/display/blizzard.h
 create mode 100644 include/hw/display/tc6393xb.h
 create mode 100644 include/hw/input/gamepad.h
 create mode 100644 include/hw/input/tsc2xxx.h
 create mode 100644 include/hw/misc/cbus.h
 create mode 100644 include/hw/net/lan9118.h
 create mode 100644 include/hw/net/smc91c111.h

--=20
2.20.1

