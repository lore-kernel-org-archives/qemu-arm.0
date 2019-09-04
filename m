Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp662438wrp;
        Wed, 4 Sep 2019 05:48:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGMyBm12FpTm+aX13aMrt8bvsJ7VHgHz+wGr9TVPBrWd1MzUXim9v5dDcwWjWcIykiQn0V
X-Received: by 2002:a17:906:848c:: with SMTP id m12mr29040036ejx.198.1567601306532;
        Wed, 04 Sep 2019 05:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601306; cv=none;
        d=google.com; s=arc-20160816;
        b=IxU0cuq8uxzAWC84gMfv2x1t25S+WJwYPsbv+4hr3iWtBFMUkcBAWjT2rGp7tqnzDe
         yMs08DldfECfKNUMEmWC+hiWYh3jwAzzOWPAFxKgpYGpav1c4y3t2FASomzPp+kZQ2By
         +uomirN+73nz5IOGo4udiohNgvB1JIrBn0nX0+OFpwNzuzjjteUOcQAnpkihTdEunGSu
         RMMBMPVxdFeQejBKXDYJkLey7B9DMj4blcWqfoRh30h5tmMtMst9NqtanelAy86+irYv
         PLhvoDZPVMrUQ43QeHbSPrT2yCuXsX2KA6uM6PHa3TrTrI0R0kAHdz2IOUz6a+eKlh4L
         9k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ET4c4rQYUItnSBiN2eUgy60NsfGrZRnM9/IL1shBocw=;
        b=sTJw9oFy7KFw8hXaX8tSuLAo0BPATWPySMrrtF9+FyTMyQDlN0+Yx6AGrizH0aBm9C
         RssNbRD1MtXA+WB23re7AI1GX38z8IbDWGkeERyKOJh4dwiE/PVSStoPq2vBGkr6bgLP
         j8OSTmb4caHIIx1IG7znm2+191CfxEb3KKKFwvu4+AvtaV7zMKjOlTdBcS293XfVl05M
         hfAq4muULodk5pADlUqugbVgi91Wb1XoPgltqgtstJiwfUPWitRJ5lQ7azjJhKWGuxhv
         NK15I/ODlpwrpmqZWthRdvZlgORmM8jYfCAt27QASbga983QurU/OFmdyhYAY2Io8t0X
         vWFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m48si5805725edm.256.2019.09.04.05.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Uhz-0006yx-RQ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqp-0004qA-Jq
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0008RJ-FF
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rqm-0008Pl-VK; Wed, 04 Sep 2019 05:45:17 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8219896F50;
 Wed,  4 Sep 2019 09:38:45 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:34 +0200
Message-Id: <20190904093843.8765-1-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:14 -0400
Subject: [Qemu-arm] [PATCH v6 0/9] Clock framework API
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
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EtYzcNhFvpw

From: Damien Hedde <damien.hedde@greensocs.com>

This series aims to add a way to model clock distribution in qemu. This a=
llows
to model the clock tree of a platform allowing us to inspect clock
configuration and detect problems such as disabled clock or bad configure=
d
pll.

The added clock api is very similar the the gpio api for devices. We can =
add
input and output and connect them together.

Very few changes since v5 in the core patches: we were waiting for multi =
phase
ability to allow proper initialization of the clock tree. So this is almo=
st a
simple rebase on top of the current "Multi-phase reset mechanism" series.
Based-on: <20190821163341.16309-1-damien.hedde@greensocs.com>

Changes since v5:
 - drop the "-port" in file names
 - new patch 2, extracted from patch 1 (to fix some problem with linux-us=
er builds)
 - patch 3, minor modification to better match gpios api and allow non de=
vice-related clock
   (I've dropped the reviewed-by, see the patch message for the details o=
f what has changed).
 - patch 6, Philippe's comments and various improvement
 - patches 7/8/9, multi-phase reset addition and scope reduced to uart re=
f clocks

The patches are organised as follows:
+ Patches 1 to 5 adds the clock support in qemu (1, 4 and 5 are already r=
eviewed and
  also a big part of the 3)
+ Patch 6 add some documentation in docs/devel
+ Patches 7 to 9 adds the uart's clocks to the xilinx_zynq platform as an
example for this framework. It updates the zynq's slcr clock controller, =
the=20
cadence_uart device, and the zynq toplevel platform.

I've tested this patchset on the xilinx-zynq-a9 machine with the buildroo=
t's
zynq_zc706_defconfig which package the Xilinx's Linux.
Clocks are correctly updated and we ends up with a configured baudrate of=
 115601
on the console uart (for a theoretical 115200) which is nice. "cadence_ua=
rt*" and
"clock*" traces can be enabled to see what's going on in this platform.

Any comments and suggestion are welcomed.

Thanks to the Xilinx QEMU team who sponsored this development.

Damien Hedde (9):
  hw/core/clock: introduce clock objects
  hw/core/clock-vmstate: define a vmstate entry for clock state
  qdev: add clock input&output support to devices.
  qdev-monitor: print the device's clock with info qtree
  qdev-clock: introduce an init array to ease the device construction
  docs/clocks: add device's clock documentation
  hw/misc/zynq_slcr: add clock generation for uarts
  hw/char/cadence_uart: add clock support
  hw/arm/xilinx_zynq: connect uart clocks to slcr

 Makefile.objs                  |   1 +
 docs/devel/clock.txt           | 246 +++++++++++++++++++++++++++++++++
 hw/arm/xilinx_zynq.c           |  64 +++++++--
 hw/char/cadence_uart.c         |  85 ++++++++++--
 hw/char/trace-events           |   3 +
 hw/core/Makefile.objs          |   4 +-
 hw/core/clock-vmstate.c        |  25 ++++
 hw/core/clock.c                | 144 +++++++++++++++++++
 hw/core/qdev-clock.c           | 181 ++++++++++++++++++++++++
 hw/core/qdev.c                 |  32 +++++
 hw/core/trace-events           |   6 +
 hw/misc/zynq_slcr.c            | 145 ++++++++++++++++++-
 include/hw/char/cadence_uart.h |   1 +
 include/hw/clock.h             | 133 ++++++++++++++++++
 include/hw/qdev-clock.h        | 134 ++++++++++++++++++
 include/hw/qdev-core.h         |  14 ++
 qdev-monitor.c                 |  13 ++
 tests/Makefile.include         |   1 +
 18 files changed, 1210 insertions(+), 22 deletions(-)
 create mode 100644 docs/devel/clock.txt
 create mode 100644 hw/core/clock-vmstate.c
 create mode 100644 hw/core/clock.c
 create mode 100644 hw/core/qdev-clock.c
 create mode 100644 include/hw/clock.h
 create mode 100644 include/hw/qdev-clock.h

--=20
2.22.0

