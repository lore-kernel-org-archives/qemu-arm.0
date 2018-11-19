Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp770649wrt;
        Mon, 19 Nov 2018 04:17:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5cVSH+GnG1NfwfS+9+cNi4l3Gc69TBgs81dtFZYinIMOrJ74SFmuSIHZ0X727hv42YJWe2L
X-Received: by 2002:a25:1c5:: with SMTP id 188-v6mr19938788ybb.374.1542629879587;
        Mon, 19 Nov 2018 04:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542629879; cv=none;
        d=google.com; s=arc-20160816;
        b=0GXFd9INs5w/B4HVBva5Y+RNJskx3F0RpoB/7pu0/RE2QggBqzXh88odwhY6Um4Kry
         2+7v27BKhoGSXFZkazjvNatOlDyoWwEv80VbIY0b0rCfHFR57botRfEJI+huk1wlgVLz
         VbPbHq8cf9hEGQMVfM6IPnISAepUxxaVA4ylJRve/Zdl7VSEYsEtmHvNoE2YFOPsv97w
         9OdNff2HHCeRIbnQw9rUq7yV4feGO4+CF0HfMo0Gv97s6qOGEuIZE3AAL7ULxEc7TvMP
         74AAOGIg9LdwcI/Jg1qmiMo96LV6F+Y+2uueWzjgYCbQNO3ddtOawXoltEnqR8iFdKRZ
         nbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=ECOpDfDkhxEXBDshmg/2DrMPrBuYj6FuoALJYxnTBrM=;
        b=jZiTyhKr/e9gw5Uv2OLIBcDjRrJ6uAjyOWrYJAbcBi3LP7jvSj6B5ePAOHyqasSzP6
         HN/cw9+zEsTIdpm09hnsWlarAEsPtXTKJulLcSfNUtebV3X8JlHpcMySMBDaKoMg8TCb
         nADBrnaE/1mvi4l7mg7poUKquXbIbhd+bHE60t0IVmyAf6UwB9GlCNtG9IbBkvlXU1PH
         XAoWIIgiFcme1V8Q4QL3dGOgpEalZ6G+p3OV37m6UV21FJ9aHlfEpHgqzbuQtJpoOTRD
         YJndiT00/1COOg+3rSqdpRdYyimloFQ0ds3QxguqpGVJu/X7yxHKLFKyXHKiNnShKfOP
         pHKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189-v6si9119708ywf.352.2018.11.19.04.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 04:17:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOiV4-0000t9-VO
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 07:17:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMT-0001pO-11
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMP-00030C-No
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:04 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:14292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gOiMO-0002oU-Ne; Mon, 19 Nov 2018 07:09:01 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
	rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id
	2eec5bf2a7c73d4-90e33; Mon, 19 Nov 2018 20:08:39 +0800 (CST)
X-RM-TRANSID: 2eec5bf2a7c73d4-90e33
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id
	2ee45bf2a7bf447-10503; Mon, 19 Nov 2018 20:08:39 +0800 (CST)
X-RM-TRANSID: 2ee45bf2a7bf447-10503
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Nov 2018 20:07:58 +0800
Message-Id: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] [PATCH 00/22] QOM'ify SysBusDeviceClass->init
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
Cc: peter.maydell@linaro.org, david@redhat.com, alistair.francis@wdc.com,
	kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
	sstabellini@kernel.org, qemu-block@nongnu.org, mst@redhat.com,
	armbru@redhat.com, borntraeger@de.ibm.com,
	anthony.perard@citrix.com, marcandre.lureau@redhat.com,
	rth@twiddle.net, thuth@redhat.com, ehabkost@redhat.com,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	richard.henderson@linaro.org, chouteau@adacore.com,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au,
	kwolf@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
	mreitz@redhat.com, michael@walle.cc, qemu-ppc@nongnu.org,
	pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7wVnG/3jvRw/

The SysBusDeviceClass::init() interface is considered
as a legacy interface and there are currently some
efforts going on to get rid of it. Thus convert 
SysBusDeviceClass::init to DeviceClass::realize.

Cc: alistair.francis@wdc.com
Cc: anthony.perard@citrix.com
Cc: armbru@redhat.com
Cc: borntraeger@de.ibm.com
Cc: chouteau@adacore.com
Cc: cohuck@redhat.com
Cc: david@gibson.dropbear.id.au
Cc: david@redhat.com
Cc: edgar.iglesias@gmail.com
Cc: ehabkost@redhat.com
Cc: f4bug@amsat.org
Cc: gxt@mprc.pku.edu.cn
Cc: jan.kiszka@web.de
Cc: kraxel@redhat.com
Cc: kwolf@redhat.com
Cc: marcandre.lureau@redhat.com
Cc: marcel.apfelbaum@gmail.com
Cc: michael@walle.cc
Cc: mreitz@redhat.com
Cc: mst@redhat.com
Cc: pbonzini@redhat.com
Cc: peter.maydell@linaro.org
Cc: peter.maydell@linaro.org                                                                                                                                                                  
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: richard.henderson@linaro.org
Cc: rth@twiddle.net
Cc: sstabellini@kernel.org
Cc: thuth@redhat.com
Cc: xen-devel@lists.xenproject.org

Mao Zhongyi (22):
  musicpal: Convert sysbus init function to realize function
  block/noenand: Convert sysbus init function to realize function
  char/grlib_apbuart: Convert sysbus init function to realize function
  core/empty_slot: Convert sysbus init function to realize function
  display/g364fb: Convert sysbus init function to realize function
  dma/puv3_dma: Convert sysbus init function to realize function
  gpio/puv3_gpio: Convert sysbus init function to realize function
  milkymist-softusb: Convert sysbus init function to realize function
  input/pl050: Convert sysbus init function to realize function
  intc/puv3_intc: Convert sysbus init function to realize function
  milkymist-hpdmc: Convert sysbus init function to realize function
  milkymist-pfpu: Convert sysbus init function to realize function
  puv3_pm.c: Convert sysbus init function to realize function
  nvram/ds1225y: Convert sysbus init function to realize function
  pci-bridge/dec: Convert sysbus init function to realize function
  timer/etraxfs_timer: Convert sysbus init function to realize function
  timer/grlib_gptimer: Convert sysbus init function to realize function
  timer/puv3_ost: Convert sysbus init function to realize function
  usb/tusb6010: Convert sysbus init function to realize function
  xen_backend: Convert sysbus init function to realize function
  event-facility: Change SysBusDeviceClass *sbdc to SysBusDeviceClass
    *sbc
  core/sysbus: remove the SysBusDeviceClass::init path

 hw/arm/musicpal.c            |  9 ++++-----
 hw/block/onenand.c           | 19 ++++++++-----------
 hw/char/grlib_apbuart.c      | 11 ++++-------
 hw/core/empty_slot.c         |  9 ++++-----
 hw/core/sysbus.c             | 15 ---------------
 hw/display/g364fb.c          | 14 +++++---------
 hw/dma/puv3_dma.c            | 10 ++++------
 hw/gpio/puv3_gpio.c          | 28 +++++++++++++---------------
 hw/input/milkymist-softusb.c | 15 ++++++---------
 hw/input/pl050.c             | 10 ++++------
 hw/intc/puv3_intc.c          | 13 +++++--------
 hw/misc/milkymist-hpdmc.c    |  9 +++------
 hw/misc/milkymist-pfpu.c     | 11 ++++-------
 hw/misc/puv3_pm.c            | 10 ++++------
 hw/nvram/ds1225y.c           | 12 +++++-------
 hw/pci-bridge/dec.c          | 11 +++++------
 hw/s390x/event-facility.c    |  4 ++--
 hw/timer/etraxfs_timer.c     | 13 ++++++-------
 hw/timer/grlib_gptimer.c     | 10 ++++------
 hw/timer/puv3_ost.c          | 12 +++++-------
 hw/usb/tusb6010.c            | 13 +++++--------
 hw/xen/xen_backend.c         |  6 ++----
 include/hw/sysbus.h          |  3 ---
 23 files changed, 102 insertions(+), 165 deletions(-)

-- 
2.17.1



