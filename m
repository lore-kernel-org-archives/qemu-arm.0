Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3994237lfi;
        Mon, 6 Apr 2020 06:53:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypIpKjpLMaB/HROuadBh3nUMtFUEAeHk49SzCydxJ3uMoZCMP/e+eBTZLcgN5X5FQ83pqwEV
X-Received: by 2002:a05:6214:12c1:: with SMTP id s1mr20320606qvv.150.1586181225636;
        Mon, 06 Apr 2020 06:53:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si11086556qkj.195.2020.04.06.06.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 06:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=6f1goiF8;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLSC7-00040U-V6
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBg-0003wj-4P
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBe-00022Y-E5
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56966)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1jLSBd-00021X-RP; Mon, 06 Apr 2020 09:53:14 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1F42496EF0;
 Mon,  6 Apr 2020 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1586181190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t/xyHYq5tpxUxWZ+lbSoh4xNSdXCZMO0BrX0rs1uVWc=;
 b=6f1goiF8BHPPODjikXaLkwG/dSCcSRoQ/jRhuONsS3uCrS6GAcSZhDnlzuq5oqnEeEktkl
 0o7b3Y94t813FqqxNnwCxMGFQTlesWrWfxkOxbw01mXa2VZzIPnomqOYj5zdR88V41Iuzo
 V48w9S+ZC6GaQHwqTNbv33xWrr3r+do=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/9] Clock framework API
Date: Mon,  6 Apr 2020 15:52:42 +0200
Message-Id: <20200406135251.157596-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1586181190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t/xyHYq5tpxUxWZ+lbSoh4xNSdXCZMO0BrX0rs1uVWc=;
 b=mXl7CM4/KMxBXE0wwrUYtiY20yxhO/DlN3vcXUJmTm+cBH4a1hGNrH9fBCVhC5AHmtjEyl
 CvCSKh2bhLqI4bCMwYn+reYolDuPF8tOEeP6QROkVLDQRoUewT83dtcoIvNv3ZKbQCzs3s
 X/IV1nTRV1Ed1Kq3ICbFYiRKuBYpluo=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1586181190; a=rsa-sha256; cv=none;
 b=7SR0uh/QQVEwLtuWRTpPt7Rkk2AeYh2LhhU4eWjSoYNJ8rGZmB7rNOeHtRv+ySLRFX7sU4
 iDxG8ZwPc8LRcAd/p//LkH/HpnsULvBPElKeI4rieq+K9Pv1DcduUivo6tuswC6rnVxqCt
 BpKBm9PrR3PYurjUCvtLliDJsKttFYE=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3NtMtgV23VaO

Hi all,

The series has now been fully reviewed and is ready to be merged
(obviously not for 5.0). I did this v9 to fix the small typos
Alistair spotted in the doc. I've also rebased the series on master.

This series aims to add a way to model clock distribution in qemu.
The proposed objet and qdev API allows to model the clock tree of
a platform allowing us to inspect clock configuration and detect
problems such as disabled clock or bad configured pll.

Regarding the internal represention. The precision is huge so that
it is possible (in the future) to somehow connect a ptimer with a
Clock with no loss of precision.
The consequence is that we have a ~4seconds period upper bound only.
Alternatives, allowing us to keep this precision, are to use a
floating point or to extend the integer.

The added clock api is very similar the the GPIO API for devices. We
can add input and output and connect them together.

Now that ressettable API is merged, the clock tree is properly
initialized during the machine reset.
I've tested this patchset running Xilinx's Linux on the xilinx-zynq-a9
machine. Clocks are correctly updated and we ends up with a configured
baudrate of 115601 on the console uart (for a theoretical 115200)
which is nice. "cadence_uart*" and "clock*" traces can be enabled to
see what's going on in this platform.

Any comments and suggestions are welcomed.

Damien

The patches are organised as follows:
+ Patches 1 to 4 adds the clock support in qemu
+ Patch 5 adds some documentation in docs/devel
+ Patches 6 to 8 adds the uart's clocks to the xilinx_zynq platform
  as an example for this framework. It updates the zynq's slcr clock
  controller, the cadence_uart device, and the zynq toplevel platform.
+ Patch 9 adds clock info to monitor "info qtree" command

Changes since v8:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg07039.html
 - typos in patch 5 (Alistair)

Changes since v7:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg06451.html
 - rst errors in doc
 - Alistair's comments on patch 1 and 3

Changes since v6:
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00599.html
 - switch from frequency to period based clock state
 - single Clock type (no more ClockIn and ClockOut)
 - doc converted in rst format (Peter)
 - various fixes (Peter and Philippe)
 - better migration support for zynq devices (Peter)

Thanks to the Xilinx QEMU team who sponsored this development.

Damien Hedde (9):
  hw/core/clock: introduce clock object
  hw/core/clock-vmstate: define a vmstate entry for clock state
  qdev: add clock input&output support to devices.
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr
  qdev-monitor: print the device's clock with info qtree

 docs/devel/clocks.rst          | 360 +++++++++++++++++++++++++++++++++
 docs/devel/index.rst           |   1 +
 include/hw/char/cadence_uart.h |   1 +
 include/hw/clock.h             | 225 +++++++++++++++++++++
 include/hw/qdev-clock.h        | 159 +++++++++++++++
 include/hw/qdev-core.h         |  12 ++
 hw/arm/xilinx_zynq.c           |  57 +++++-
 hw/char/cadence_uart.c         |  73 ++++++-
 hw/core/clock-vmstate.c        |  25 +++
 hw/core/clock.c                | 130 ++++++++++++
 hw/core/qdev-clock.c           | 185 +++++++++++++++++
 hw/core/qdev.c                 |  12 ++
 hw/misc/zynq_slcr.c            | 172 +++++++++++++++-
 qdev-monitor.c                 |   9 +
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   2 +
 hw/core/trace-events           |   7 +
 tests/Makefile.include         |   1 +
 18 files changed, 1412 insertions(+), 22 deletions(-)
 create mode 100644 docs/devel/clocks.rst
 create mode 100644 include/hw/clock.h
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/clock-vmstate.c
 create mode 100644 hw/core/clock.c
 create mode 100644 hw/core/qdev-clock.c

--=20
2.26.0

