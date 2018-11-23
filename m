Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2195633wrt;
        Fri, 23 Nov 2018 07:40:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VJVMvMuJHDVB8j5exNWkg8uqyeP24UUbdv3kMpqo4Jq2AiErA+VAq0xLsizdEghsqVA/y1
X-Received: by 2002:ae9:dfc7:: with SMTP id t190mr13826263qkf.43.1542987655995;
        Fri, 23 Nov 2018 07:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542987655; cv=none;
        d=google.com; s=arc-20160816;
        b=Fn6iFc6CVtftb7dS0WhG5oIzp5nz4zZX5l1zJ24dPc6T5ZR2OwjWGs1mlt7foeRsfY
         0H+OEie0mi5uRSf56qOtWrSycC5eFDtKz3/d96vAesn54knedJaIfxuDRRntXfTZfes6
         U/o3qWaaxtft1BX+LUVN8AFC7aobJaltK7ZTBUnDjiowKFkCa0HeOMZNN+c/zvXV1O0B
         pcSIn6iiJRPvbnb4X9Rd5SFkKTRZtTh8eDrqkhFXlV9HjoA+7aB7DZxGUhXsIeU8FMLs
         G/OVgy28trKNt1Qz3mKrjhqRH0GjiPXq8SEr9btcPf2Hz77NuCyn2TAkNGoc4fVFiMsD
         7HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=+HP+fEhJou2qM1auGA1WGkNTQ9mgsbiQyC3cDWQgjO4=;
        b=OHvWPothYu9F3okP5Z10A5zRhGRjtY21OKFxhTJS4/hRVkMDZCP5ZCyiW6STEAkq0/
         O9+OAFvQxLnSlwgAzAxlGlQ0IBpsBFax39Bui7sLDS0g3IV81l1YeLTSf5bRvpjZH80E
         FzjSMGjjp5C8HkSuktAg09pc1bwIHJqp3oNujpwbsoeqFAecHotTnX1vBpwB06ys/ljW
         UP4lclOB/X86szmaY/uKZIG5pDfnzdiPPPGCzsuSkKxuk5cIuwEwbbZTknYqwAXMVund
         9DJZ5XjEgUW2HFO4lr3cXgTO9wI9zESZtnVRiiizVlLHtk58cS/Q7vrFGV5tqgleTCu4
         S6GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si2577143qvl.219.2018.11.23.07.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 07:40:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQDZf-0005g1-9O
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 10:40:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQF-0004vB-WC
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQ7-0005Op-64
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:31:11 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:27226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gQDQ6-0004yw-9E; Fri, 23 Nov 2018 10:31:03 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
	rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id
	2eea5bf81d2a234-0138d; Fri, 23 Nov 2018 23:30:50 +0800 (CST)
X-RM-TRANSID: 2eea5bf81d2a234-0138d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id
	2ee95bf81d22571-bd3af; Fri, 23 Nov 2018 23:30:49 +0800 (CST)
X-RM-TRANSID: 2ee95bf81d22571-bd3af
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 23:30:19 +0800
Message-Id: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] [PATCH v2 00/21] QOM'ify SysBusDeviceClass->init
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
X-TUID: IH6DyNP4N6Y/

The SysBusDeviceClass::init() interface is considered
as a legacy interface and there are currently some
efforts going on to get rid of it. Thus convert 
SysBusDeviceClass::init to DeviceClass::realize.

v2 -> v1:

- SYS_BUS_DEVICE(dev) was used in a function several
  times, so use a variable 'sbd' to replace it, like:
  SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
- remove the xen_sysdev_init() function
- drop the patch21 in v1
- fix the broken in sysbus_realize of patch22


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

Mao Zhongyi (21):
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
  xen_backend: remove xen_sysdev_init() function
  core/sysbus: remove the SysBusDeviceClass::init path

 hw/arm/musicpal.c            |  9 ++++-----
 hw/block/onenand.c           | 16 +++++++---------
 hw/char/grlib_apbuart.c      | 12 +++++-------
 hw/core/empty_slot.c         |  9 ++++-----
 hw/core/sysbus.c             | 15 +++++----------
 hw/display/g364fb.c          |  9 +++------
 hw/dma/puv3_dma.c            | 10 ++++------
 hw/gpio/puv3_gpio.c          | 29 ++++++++++++++---------------
 hw/input/milkymist-softusb.c | 16 +++++++---------
 hw/input/pl050.c             | 11 +++++------
 hw/intc/puv3_intc.c          | 11 ++++-------
 hw/misc/milkymist-hpdmc.c    |  9 +++------
 hw/misc/milkymist-pfpu.c     | 12 +++++-------
 hw/misc/puv3_pm.c            | 10 ++++------
 hw/nvram/ds1225y.c           | 12 +++++-------
 hw/pci-bridge/dec.c          | 11 +++++------
 hw/timer/etraxfs_timer.c     | 14 +++++++-------
 hw/timer/grlib_gptimer.c     | 11 +++++------
 hw/timer/puv3_ost.c          | 13 ++++++-------
 hw/usb/tusb6010.c            |  8 +++-----
 hw/xen/xen_backend.c         |  7 -------
 include/hw/sysbus.h          |  3 ---
 22 files changed, 105 insertions(+), 152 deletions(-)

-- 
2.17.1



