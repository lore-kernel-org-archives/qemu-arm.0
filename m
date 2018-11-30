Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3376998wrt;
        Fri, 30 Nov 2018 01:51:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XScoylfXXqkXDcIooKHYf71A7cGn9txmn/Ibg+6Mg0qfxLoW3aF3t2Ix0M7JlhSnuY9qwi
X-Received: by 2002:a0d:e8d7:: with SMTP id r206mr4879660ywe.183.1543571496457;
        Fri, 30 Nov 2018 01:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543571496; cv=none;
        d=google.com; s=arc-20160816;
        b=kBUCUwD7Py7HSvCD7KQeqLWzNLWX2ecTzWvAkNsHaE7MwvJlR8BqwWd5kW1esBd6aF
         OYinDwC/oGCx3M2lVW8BiAbEv33b1iq75NMoQwFPUxWFAnPlmhskzMuNN3ukXHyuh8L7
         3OKl1WBgJPUDxwMqiCaW9dYiKhOjxAzJxEO7WRkHBFb/6iKGjZsLNjO4uI2Sf9yK9fle
         h1Wt1xDmC26RWH6QAYvvBD0XD19zCaB+tw6qZ/JLEDHJbG6AsTx7H5FjQmwLgbxIEKFi
         X4qXG/KNle8EKEu+47DsVoMK/lfYjNbcfbsHz+256ynQixIpp4J9fw6oTrPMfbdAnJoG
         ElPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=VHZNy/PHeW0ryEqqAZ1zaewGjAjYDY0I7xwh2kGvhWo=;
        b=cCmcTgj1hr7j6cXXNZDd0E5o+aSief/kx/xH6LaiogpKlH7dmoSeDpqvxLz/EeEuhY
         RHjXnNopysyr+fA84L9Tjbo+CGLZRIkjqTBJDLzUJ/C7sqacciPoFz7QEdOGclOgZCqW
         JEcWIvAJ73++X9Wytu9wwRntiPCKPhvnMwljcTA0HFyIks19LoXcJ0iTZ8g2FsbwyqrE
         tTurEetU7inR1GJScrenyV9rdLhddNW4e2R91S/z8CYMGHKc1DhiRC+n3KBTDz9rVnei
         OhXMkhWr+Ac7hl5lqcptNAuSRo58FXma3hOC2vP0b+DKhpHBsMHqt9O445+x16ceYN11
         G1WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j187si2754918ywb.417.2018.11.30.01.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfSR-0001AE-QX
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGo-0006Gn-AX
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:39:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGn-0002bC-6Z
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:39:34 -0500
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:55557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gSfGg-0002LU-Oo; Fri, 30 Nov 2018 04:39:27 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
	rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id
	2ee55c0105362d2-a1a5b; Fri, 30 Nov 2018 17:39:02 +0800 (CST)
X-RM-TRANSID: 2ee55c0105362d2-a1a5b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[112.25.154.148])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id
	2ee75c01052eaec-48531; Fri, 30 Nov 2018 17:39:01 +0800 (CST)
X-RM-TRANSID: 2ee75c01052eaec-48531
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 17:38:31 +0800
Message-Id: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
Subject: [Qemu-arm] [PATCH v3 00/21] QOM'ify SysBusDeviceClass->init
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
Cc: peter.maydell@linaro.org, david@redhat.com, alistair.francis@wdc.com,
	kraxel@redhat.com, gxt@mprc.pku.edu.cn, sstabellini@kernel.org,
	qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com,
	borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
	anthony.perard@citrix.com, marcandre.lureau@redhat.com,
	rth@twiddle.net, thuth@redhat.com, ehabkost@redhat.com,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	richard.henderson@linaro.org, chouteau@adacore.com,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au,
	kwolf@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
	mreitz@redhat.com, michael@walle.cc, qemu-ppc@nongnu.org,
	pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VxtPdS+0QpKL

v3 -> v2:

- rebase to the HEAD
- use SysBusDevice *sbd variable in patch15

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
 hw/pci-bridge/dec.c          | 12 ++++++------
 hw/timer/etraxfs_timer.c     | 14 +++++++-------
 hw/timer/grlib_gptimer.c     | 11 +++++------
 hw/timer/puv3_ost.c          | 13 ++++++-------
 hw/usb/tusb6010.c            |  8 +++-----
 hw/xen/xen_backend.c         |  7 -------
 include/hw/sysbus.h          |  3 ---
 22 files changed, 106 insertions(+), 152 deletions(-)

-- 
2.17.1



