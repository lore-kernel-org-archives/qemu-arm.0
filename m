Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2800471wrt;
        Thu, 18 Oct 2018 13:04:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62ammPlUiCC/AejC2Bo9i3O8NI3PpU2yvP3ucOYHRolqWlwyRoWBXU6INYuE6VMWzUOrE55
X-Received: by 2002:ac8:769a:: with SMTP id g26-v6mr4399795qtr.213.1539893096421;
        Thu, 18 Oct 2018 13:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893096; cv=none;
        d=google.com; s=arc-20160816;
        b=RQBkcXJ/ZzkGo+a+YiahTxWXIDtDg3ljbqw/MsJ7YhdCQI3lGnO9l6ze+p6Clv6VdV
         M0yXNUZKWarEwEb1pXExyrCiJAmv6Tyn+T3/KAFaaLE0SqXx/mTo+9z8yjZcMuqas69y
         emip4NT0FAsNfW4ctxrzlwRJdOokiWQq2Nshrlr3iEC7wJElR0qYsTZ03a82ufmJbOXL
         DuvuBL1dsLde4S0dX59gVg2wZRnln7ncvUsCt1/bVDgWB969lh/Mpf10s9A8mmmkcp3U
         LejyIdPOmWEI9X05n7uX2BwKlxkkAqJhskjUJlhJvEYQMAmARcM+q3aixRw61KJj5fo5
         uHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=dApXQnj0re3RwAGavQl+uHijgwrI/m2cQVmAB4bjKCw=;
        b=MxqjPf0esIxPNVPQDE079KqP0Wh4JXvsBJgSfunE+JcE6oHdmtEtBj8kHkQASXrdMK
         q1pYC1EkrCTivAhcUW50Vwsafg5XMUHVtYXkxGFGYqtrjjVayAjaKHV3t+TkTqB8abBv
         JMbu5AHjAH0jvPHfboFzc62U8XheOgHySmXEFwgfyr9jGStv0DLUoqS+PCUiw46xtW7q
         jtli22SiRNuM1yprdSG8R99OGQqHd9bshzp3aiJzrPqxC14eXP8Kih7ZElsChMbSWocx
         c6ncpcTPBdaw2snkKrirCz1MecNG9Vz5qI/1xi0mimErL2emwhGGk+2V4CwEdmuqB+x5
         rs5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si15104567qvi.176.2018.10.18.13.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEXP-0007P8-Pj
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:04:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEX7-0007Oo-7L
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEX3-0006bQ-GY
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEX2-0006Sv-Ib; Thu, 18 Oct 2018 16:04:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B3BB30B8F99;
	Thu, 18 Oct 2018 20:04:29 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9ABF67649;
	Thu, 18 Oct 2018 20:04:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:37 -0300
Message-Id: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 18 Oct 2018 20:04:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 00/45] Machine queue, 2018-10-18
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bkv2pNUL2vxT

The following changes since commit 09558375a634e17cea6cfbfec883ac2376d2dc=
7f:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
81016-1' into staging (2018-10-16 17:42:56 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request

for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700cc:

  numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40 -03=
00)

----------------------------------------------------------------
Machine queue, 2018-10-18

* sysbus init/realize cleanups
  (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
* memory-device refactoring (David Hildenbrand)
* -smp: deprecate incorrect CPUs topology (Igor Mammedov)
* -numa parsing cleanups (Markus Armbruster)
* Fix hostmem-file memory leak (Zhang Yi)
* Typo fix (Li Qiang)

----------------------------------------------------------------

Queue for Machine Core patches


C=C3=A9dric Le Goater (11):
  net: etraxfs_eth: convert SysBus init method to a realize method
  net: etraxfs_eth: add a reset method
  net: lan9118: convert SysBus init method to a realize method
  net: lance: convert SysBus init method to a realize method
  net: milkymist_minimac2: convert SysBus init method to a realize
    method
  net: mipsnet: convert SysBus init method to a realize method
  net: opencores_eth: convert SysBus init method to a realize method
  net: smc91c111: convert SysBus init method to a realize method
  net: stellaris_enet: convert SysBus init method to a realize method
  net: stellaris_enet: add a reset method
  net: xgmac: convert SysBus init method to a realize method

David Hildenbrand (16):
  memory-device: fix alignment error message
  memory-device: fix error message when hinted address is too small
  memory-device: improve "range conflicts" error message
  pc-dimm: pass PCDIMMDevice to pc_dimm_.*plug
  memory-device: use memory device terminology in error messages
  memory-device: introduce separate config option
  memory-device: forward errors in get_region_size()/get_plugged_size()
  memory-device: document MemoryDeviceClass
  memory-device: add and use memory_device_get_region_size()
  memory-device: factor out get_memory_region() from pc-dimm
  memory-device: drop get_region_size()
  memory-device: add device class function set_addr()
  memory-device: complete factoring out pre_plug handling
  memory-device: complete factoring out plug handling
  memory-device: complete factoring out unplug handling
  memory-device: trace when pre_plugging/plugging/unplugging

Igor Mammedov (2):
  vl.c deprecate incorrect CPUs topology
  vl:c: make sure that sockets are calculated correctly in '-smp X' case

Li Qiang (1):
  machine: fix a typo

Markus Armbruster (2):
  numa: Fix QMP command set-numa-node error handling
  numa: Clean up error reporting in parse_numa()

Philippe Mathieu-Daud=C3=A9 (12):
  trace-events: Fix copy/paste typo
  hw/timer/sun4v-rtc: Convert from DPRINTF() macro to trace events
  hw/timer/sun4v-rtc: Use DeviceState::realize rather than
    SysBusDevice::init
  hw/ssi/xilinx_spi: Use DeviceState::realize rather than
    SysBusDevice::init
  hw/sh4/sh_pci: Use DeviceState::realize rather than SysBusDevice::init
  hw/pci-host/bonito: Use DeviceState::realize rather than
    SysBusDevice::init
  hw/mips/gt64xxx_pci: Convert gt64120_reset() function into Device
    reset method
  hw/mips/gt64xxx_pci: Mark as bridge device
  hw/sparc64/niagara: Model the I/O Bridge with the
    'unimplemented_device'
  hw/alpha/typhoon: Remove unuseful code
  hw/hppa/dino: Remove unuseful code
  hw/mips/malta: Remove unuseful code

Zhang Yi (1):
  hostmem-file: fixed the memory leak while get pmem path.

 default-configs/i386-softmmu.mak    |   3 +-
 default-configs/ppc64-softmmu.mak   |   3 +-
 default-configs/sparc64-softmmu.mak |   1 -
 qapi/misc.json                      |   2 +-
 include/hw/mem/memory-device.h      |  74 +++++++++++++++++---
 include/hw/mem/pc-dimm.h            |  10 +--
 include/sysemu/numa.h               |   1 -
 backends/hostmem-file.c             |  10 ++-
 hw/alpha/typhoon.c                  |  13 ----
 hw/core/machine.c                   |   2 +-
 hw/hppa/dino.c                      |   7 --
 hw/i386/pc.c                        |   6 +-
 hw/mem/memory-device.c              | 103 ++++++++++++++++++++++------
 hw/mem/nvdimm.c                     |   9 ++-
 hw/mem/pc-dimm.c                    |  84 ++++++++---------------
 hw/mips/gt64xxx_pci.c               |  18 ++---
 hw/mips/mips_malta.c                |  13 ----
 hw/net/etraxfs_eth.c                |  44 ++++++++----
 hw/net/lan9118.c                    |   9 +--
 hw/net/lance.c                      |   8 +--
 hw/net/milkymist-minimac2.c         |   9 +--
 hw/net/mipsnet.c                    |   9 +--
 hw/net/opencores_eth.c              |   8 +--
 hw/net/smc91c111.c                  |   8 +--
 hw/net/stellaris_enet.c             |  15 ++--
 hw/net/xgmac.c                      |   9 +--
 hw/pci-host/bonito.c                |   9 +--
 hw/ppc/spapr.c                      |  29 +++-----
 hw/sh4/sh_pci.c                     |  20 +++---
 hw/sparc64/niagara.c                |   4 +-
 hw/ssi/xilinx_spi.c                 |   9 +--
 hw/timer/sun4v-rtc.c                |  23 +++----
 numa.c                              |  21 +++---
 vl.c                                |  12 +++-
 hw/Makefile.objs                    |   2 +-
 hw/mem/Makefile.objs                |   4 +-
 hw/mem/trace-events                 |   5 +-
 hw/timer/trace-events               |   6 +-
 qemu-deprecated.texi                |  12 ++++
 39 files changed, 347 insertions(+), 287 deletions(-)

--=20
2.18.0.rc1.1.g3f1ff2140

