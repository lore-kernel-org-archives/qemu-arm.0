Received: by 10.25.21.156 with SMTP id 28csp829155lfv;
        Wed, 3 Aug 2016 09:25:08 -0700 (PDT)
X-Received: by 10.55.158.16 with SMTP id h16mr741534qke.111.1470241508665;
        Wed, 03 Aug 2016 09:25:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si2616121qkc.178.2016.08.03.09.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUyyh-0005Qk-OL
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywp-000493-1q
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywk-0006hX-5C
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywX-0006f6-TB; Wed, 03 Aug 2016 12:22:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E88D636FB;
	Wed,  3 Aug 2016 16:22:53 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoah009808; Wed, 3 Aug 2016 12:22:51 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:35 +0100
Message-Id: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 03 Aug 2016 16:22:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/5] Global fix / workaround usage of
 qemu_chr_fe_write
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
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVF77Aa7RI95

This series does a global fix and/or workaround for bad usage of
qemu_chr_fe_write(). Essentially only about 4/5 places in the code
got the usage correct, by handling errors. Everything else would
silently loose data if used with a chardev backend that can return
EAGAIN. One specific instance of that bug was highlighted when I
fixed the socket backend, such that in connect mode, it would be
non-blocking. https://bugs.launchpad.net/qemu/+bug/1586756

The "correct" fix is to check for short writes, or EAGAIN and
then schedule an event callback to re-try the write later. A
couple of places do that correctly (for example hw/char/serial.c
and hw/char/virtioconsole.c).  Changing existing serial port
impls todo this though is a fair amount of amount, so as a
temporary fix, this series changes all the broken code to simply
use qemu_chr_fe_write_all() instead. Thus we at least stop
silently loosing data, albeit at the cost of blocking the guest
execution while we wait. So we still need to do a proper fix
in all these devices models at some point, hence I've left
comments in the code as a reminder.

This series also includes a patch to virtio-console I sent
previously, but with a fixed commit message that more accurately
describes what is going on.

Daniel P. Berrange (5):
  virtio-console: set frontend open permanently for console devs
  impi: check return of qemu_chr_fe_write() for errors
  sclpconsole: remove bogus check for -EAGAIN
  hw: replace most use of qemu_chr_fe_write with qemu_chr_fe_write_all
  char: convert qemu_chr_fe_write to qemu_chr_fe_write_all

 backends/rng-egd.c          |  4 +++-
 gdbstub.c                   |  4 +++-
 hw/arm/omap2.c              |  8 +++++---
 hw/arm/pxa2xx.c             |  4 +++-
 hw/arm/strongarm.c          |  4 +++-
 hw/char/bcm2835_aux.c       |  4 +++-
 hw/char/debugcon.c          |  4 +++-
 hw/char/digic-uart.c        |  2 ++
 hw/char/escc.c              |  4 +++-
 hw/char/etraxfs_ser.c       |  4 +++-
 hw/char/exynos4210_uart.c   |  4 +++-
 hw/char/grlib_apbuart.c     |  4 +++-
 hw/char/imx_serial.c        |  4 +++-
 hw/char/ipoctal232.c        |  4 +++-
 hw/char/lm32_juart.c        |  2 ++
 hw/char/lm32_uart.c         |  2 ++
 hw/char/mcf_uart.c          |  4 +++-
 hw/char/parallel.c          |  4 +++-
 hw/char/pl011.c             |  4 +++-
 hw/char/sclpconsole-lm.c    | 22 ++++++----------------
 hw/char/sclpconsole.c       |  2 ++
 hw/char/sh_serial.c         |  4 +++-
 hw/char/spapr_vty.c         |  5 +++--
 hw/char/stm32f2xx_usart.c   |  2 ++
 hw/char/virtio-console.c    | 46 +++++++++++++++++++++++++++++++++++++++++----
 hw/char/xilinx_uartlite.c   |  4 +++-
 hw/ipmi/ipmi_bmc_extern.c   |  8 ++++++--
 hw/usb/ccid-card-passthru.c |  7 +++++--
 hw/usb/dev-serial.c         |  4 +++-
 qemu-char.c                 | 18 ++++++++++++------
 slirp/slirp.c               |  4 +++-
 31 files changed, 146 insertions(+), 54 deletions(-)

-- 
2.7.4

