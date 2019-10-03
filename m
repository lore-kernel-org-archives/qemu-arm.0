Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp72748wrp;
        Thu, 3 Oct 2019 16:06:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzaZKo3MLrWgMJAsnypw9DFr0Mk3tKyRRrOeJMoUgz/OXuP1Kns4RwXrxpK+7wIGqPO4Vm
X-Received: by 2002:a17:906:6a45:: with SMTP id n5mr10062172ejs.20.1570143972710;
        Thu, 03 Oct 2019 16:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570143972; cv=none;
        d=google.com; s=arc-20160816;
        b=qnE8zCmvCDsUOjn/kkNxZ6z7fpdK4aCgZxPm3sddycrHa4kvaWJGnQ/jc1kQwBL5Qh
         I/TnQRzjMfX6q28GsqjXyt90eb83+zapbVBBrT0/AseotGi7mUzrEbmWV7cGxFv15ptR
         A5wMelKGn0DNRNx2zTi3uPta2uEYQeKZ+CT7e6ffK5b4kWKMOAKZFodqKUgdM87udWm4
         /KVMxG7vrd4KDLqubi/y7Kzrpdnnc7SRLo7a79qDP9BF5hMHDtam2uiXh5gZtbO1yfQ3
         Q9bqlo4n33rVxe+FvBlJpnt9pyapnwPtpJO2I91LzxgK7LgBSruZfNcbkFxPQBMXRRd8
         PppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=e+7xwGIzaN0FIHLoGXENEqImm4705xClUz8lgjhxxx4=;
        b=ipaAp84rKBwKUhhZXiMSZk9B0HSW235hXg6N1jVt4x+RC/QgtSHiP6c6c7m6EU0pGd
         tKOIPAHCrtkQnR7qGzRvvPVgnxZGWuRNPr5JWUc06JVu83akMCAmsNJwfhixmlBkTNeA
         Lsjd4ZoOLYKnU4hj0wC9JTILDLqnypzCXGl+uKdCK6e9unzjs3SxRuJNbqziuM6WLHLQ
         O3mjMGlnVj4coJdoPrTc59fqCQXcN6e6ssVcOARtgQdlnd9ucAlpXaFLgytdALG8sdQs
         cpjtZjYoARvoCqjVwWQvqFvD5VQdwZaGq52pVJ4QI8FfZURzOaufHi+rJH7wyOvdCUix
         t00Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si1942680ejm.367.2019.10.03.16.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 16:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGAAl-0000pX-9A
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 19:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGA9B-0000nP-MZ
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGA98-0005pl-9k
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 19:04:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGA94-0005oE-I9; Thu, 03 Oct 2019 19:04:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 625AF10C0928;
 Thu,  3 Oct 2019 23:04:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91D381001B20;
 Thu,  3 Oct 2019 23:04:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] hw: Split RTC devices from hw/timer/ to hw/rtc/
Date: Fri,  4 Oct 2019 01:03:50 +0200
Message-Id: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 03 Oct 2019 23:04:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OfsElON5PVzm

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03334.=
html
- addressed review comments (described in patches 3 and 4)
- added R-b/A-b tags

Whole series now reviewed.

v1 blurb:

When working on timers, I found it confuse to have RTC devices
mixed in the hw/timer/ directory.

We can see the models use slighly different APIs:

  $ git grep '#include' hw/timer/|cut -d: -f3-|sort|uniq -c|egrep -v '^  =
    1 '|sort -rn
     33 #include "qemu/osdep.h"
     29 #include "hw/irq.h"
     28 #include "qemu/module.h"
     23 #include "migration/vmstate.h"
     21 #include "hw/sysbus.h"
     20 #include "qemu/timer.h"
     20 #include "qemu/main-loop.h"
     17 #include "qemu/log.h"
     14 #include "hw/qdev-properties.h"
     14 #include "hw/ptimer.h"
      9 #include "trace.h"
      7 #include "qapi/error.h"
      5 #include "hw/hw.h"
      3 #include "sysemu/runstate.h"
      3 #include "qemu/error-report.h"
      3 #include "hw/timer/i8254.h"
      2 #include "qemu/bitops.h"
      2 #include "hw/timer/i8254_internal.h"
      2 #include "hw/registerfields.h"
      2 #include "hw/core/cpu.h"
      2 #include "hw/arm/omap.h"
      2 #include "hw/arm/exynos4210.h"

  $ git grep '#include' hw/rtc/|cut -d: -f3-|sort|uniq -c|egrep -v '^    =
  1 '|sort -rn
     11 #include "qemu/osdep.h"
     10 #include "qemu/module.h"
      9 #include "qemu-common.h"
      8 #include "qemu/timer.h"
      8 #include "migration/vmstate.h"
      6 #include "qemu/bcd.h"
      6 #include "hw/irq.h"
      5 #include "sysemu/sysemu.h"
      5 #include "qemu/log.h"
      5 #include "hw/sysbus.h"
      4 #include "trace.h"
      4 #include "hw/qdev-properties.h"
      3 #include "qemu/cutils.h"
      3 #include "hw/i2c/i2c.h"
      2 #include "sysemu/runstate.h"
      2 #include "m48t59-internal.h"
      2 #include "hw/rtc/m48t59.h"
      2 #include "exec/address-spaces.h"

Split the RTC-related files in the new hw/rtc/ directory.

Philippe Mathieu-Daud=C3=A9 (14):
  hw/timer: Compile devices not target-dependent as common object
  hw: Move PL031 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move MC146818 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move M48T59 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move M41T80 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move sun4v hypervisor RTC from hw/timer/ to hw/rtc/ subdirectory
  hw: Move TWL92230 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move DS1338 device from hw/timer/ to hw/rtc/ subdirectory
  hw: Move Xilinx ZynqMP RTC from hw/timer/ to hw/rtc/ subdirectory
  hw: Move Exynos4210 RTC from hw/timer/ to hw/rtc/ subdirectory
  hw: Move Aspeed RTC from hw/timer/ to hw/rtc/ subdirectory
  hw/rtc/mc146818: Include mc146818rtc_regs.h a bit less
  hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h" include
  hw/rtc/aspeed_rtc: Remove unused includes

 MAINTAINERS                                  | 20 +++----
 Makefile.objs                                |  1 +
 hw/Kconfig                                   |  1 +
 hw/Makefile.objs                             |  1 +
 hw/alpha/dp264.c                             |  2 +-
 hw/arm/musca.c                               |  2 +-
 hw/hppa/machine.c                            |  2 +-
 hw/i386/acpi-build.c                         |  2 +-
 hw/i386/pc.c                                 |  2 +-
 hw/i386/pc_q35.c                             |  2 +-
 hw/mips/mips_fulong2e.c                      |  2 +-
 hw/mips/mips_jazz.c                          |  2 +-
 hw/mips/mips_malta.c                         |  2 +-
 hw/mips/mips_r4k.c                           |  2 +-
 hw/ppc/pnv.c                                 |  2 +-
 hw/ppc/ppc405_boards.c                       |  2 +-
 hw/ppc/prep.c                                |  4 +-
 hw/rtc/Kconfig                               | 23 ++++++++
 hw/rtc/Makefile.objs                         | 13 +++++
 hw/{timer =3D> rtc}/aspeed_rtc.c               |  2 +-
 hw/{timer =3D> rtc}/ds1338.c                   |  0
 hw/{timer =3D> rtc}/exynos4210_rtc.c           |  0
 hw/{timer =3D> rtc}/m41t80.c                   |  0
 hw/{timer =3D> rtc}/m48t59-internal.h          |  0
 hw/{timer =3D> rtc}/m48t59-isa.c               |  4 +-
 hw/{timer =3D> rtc}/m48t59.c                   |  2 +-
 hw/{timer =3D> rtc}/mc146818rtc.c              |  3 +-
 hw/{timer =3D> rtc}/pl031.c                    |  2 +-
 hw/{timer =3D> rtc}/sun4v-rtc.c                |  2 +-
 hw/rtc/trace-events                          | 19 +++++++
 hw/{timer =3D> rtc}/twl92230.c                 |  0
 hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.c          |  3 +-
 hw/sparc/sun4m.c                             |  2 +-
 hw/sparc64/niagara.c                         |  2 +-
 hw/sparc64/sun4u.c                           |  2 +-
 hw/timer/Kconfig                             | 24 ---------
 hw/timer/Makefile.objs                       | 35 ++++--------
 hw/timer/hpet.c                              |  3 +-
 hw/timer/trace-events                        | 18 -------
 include/hw/arm/aspeed_soc.h                  |  2 +-
 include/hw/arm/xlnx-zynqmp.h                 |  2 +-
 include/hw/{timer =3D> rtc}/aspeed_rtc.h       |  9 ++--
 include/hw/rtc/m48t59.h                      | 57 ++++++++++++++++++++
 include/hw/{timer =3D> rtc}/mc146818rtc.h      | 13 +++--
 include/hw/{timer =3D> rtc}/mc146818rtc_regs.h |  5 +-
 include/hw/{timer =3D> rtc}/pl031.h            |  5 +-
 include/hw/rtc/sun4v-rtc.h                   | 19 +++++++
 include/hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.h  |  6 +--
 include/hw/timer/m48t59.h                    | 32 -----------
 include/hw/timer/sun4v-rtc.h                 |  1 -
 tests/rtc-test.c                             |  2 +-
 51 files changed, 208 insertions(+), 155 deletions(-)
 create mode 100644 hw/rtc/Kconfig
 create mode 100644 hw/rtc/Makefile.objs
 rename hw/{timer =3D> rtc}/aspeed_rtc.c (99%)
 rename hw/{timer =3D> rtc}/ds1338.c (100%)
 rename hw/{timer =3D> rtc}/exynos4210_rtc.c (100%)
 rename hw/{timer =3D> rtc}/m41t80.c (100%)
 rename hw/{timer =3D> rtc}/m48t59-internal.h (100%)
 rename hw/{timer =3D> rtc}/m48t59-isa.c (98%)
 rename hw/{timer =3D> rtc}/m48t59.c (99%)
 rename hw/{timer =3D> rtc}/mc146818rtc.c (99%)
 rename hw/{timer =3D> rtc}/pl031.c (99%)
 rename hw/{timer =3D> rtc}/sun4v-rtc.c (98%)
 create mode 100644 hw/rtc/trace-events
 rename hw/{timer =3D> rtc}/twl92230.c (100%)
 rename hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.c (99%)
 rename include/hw/{timer =3D> rtc}/aspeed_rtc.h (80%)
 create mode 100644 include/hw/rtc/m48t59.h
 rename include/hw/{timer =3D> rtc}/mc146818rtc.h (63%)
 rename include/hw/{timer =3D> rtc}/mc146818rtc_regs.h (96%)
 rename include/hw/{timer =3D> rtc}/pl031.h (93%)
 create mode 100644 include/hw/rtc/sun4v-rtc.h
 rename include/hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.h (95%)
 delete mode 100644 include/hw/timer/m48t59.h
 delete mode 100644 include/hw/timer/sun4v-rtc.h

--=20
2.20.1

