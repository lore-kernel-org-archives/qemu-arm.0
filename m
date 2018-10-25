Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp728149wro;
        Thu, 25 Oct 2018 06:48:33 -0700 (PDT)
X-Google-Smtp-Source: AJdET5er6b7NJY1IyG3tv7p7TbUmBXxdIMO5FqTbqzKIdt+GaLzfnXcZedQiyEbge6SpjFS5o/vs
X-Received: by 2002:aed:2c42:: with SMTP id f60-v6mr1549174qtd.340.1540475313026;
        Thu, 25 Oct 2018 06:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475313; cv=none;
        d=google.com; s=arc-20160816;
        b=YXYtlp/lAAIG04+BSBMDZiMTSrc6+YYeaa0ovxL+QSnXxwWvcJeiXIs/ZxKCFLwKQa
         tnnpMA3rjvJS1IPjwq3vCU2ACjYzIOJixUVChUus/gRJF/KZg323NL6Hi75xNt9GPHej
         p8w/2cVqP63VFZSkk1VldJ3lFoBFYagegOh5J5R/ARxcRXmYd53TQxR0rA+Pjk7sXmJs
         A23XcApUMd79334yZjCjpBb2uEeJReSPPrd03V4Ehruq0pRzrzdC7iK/WGVuRZk0904a
         oygzdmeEhXC1MAKe9JUEWLyqVsfSa2E6LtzkDEAtASeaVbbMvIdoaPFWH/XzwmkC8r2e
         YNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=xJDRRbgrgOlUt4WAi/7x3KCxZrBpXiTml71bA0BRFM0=;
        b=kLnxUaai5FatSzIenmriaRxW0fDoE77ZQXaL063qXTxHfnXem1o7DRzuL3IfL6N9QX
         AoT+lUh06g/ox9S3WVHp0pXIN8GCr6bRYMJXRTZVc1QfVfj3NpU6CY9cRbyvirpucmxm
         sBJ/9Ct54Ya/DSVBoSgd8J1LSDsoL6MuoeWnhtmDl8HCbgLRsyzBsU6ZY3i+OJvxvUHC
         qhTPAN/+O2PtPM+WHCdpz6RbFrFSwxsmT2aTGSRPRjXXBCbEe/Kj2uqnAlWNP7awJ+Ed
         2MnWcHlzjnYblmBeE0Of1cVh7NaVW6NokMo94iCNgqt7+cL06N6NkPqArEI+OBlEnCOP
         kZxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si251121qtd.358.2018.10.25.06.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFg00-0006IS-C6
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmu-0002Dq-Kv
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflC-0006Vb-VN
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:33:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFflC-0006Uy-L5; Thu, 25 Oct 2018 09:33:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04BF53082A24;
	Thu, 25 Oct 2018 13:33:13 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02C0F662CF;
	Thu, 25 Oct 2018 13:33:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:18 -0300
Message-Id: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 25 Oct 2018 13:33:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 00/43] Machine queue, 2018-10-25
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: qukqiNSEUyAb

Changes v1 -> v2:
* Fix 'make check' warnings (Igor)


The following changes since commit 13399aad4fa87b2878c49d02a5d3bafa6c966b=
a3:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2018-10-22=
' into staging (2018-10-23 17:20:23 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request

for you to fetch changes up to 8fa922c241e63f018f5b55c03ac494ae3d5fe594:

  net: xgmac: convert SysBus init method to a realize method (2018-10-24 =
06:44:59 -0300)

----------------------------------------------------------------
Machine queue, 2018-10-25

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
 tests/cpu-plug-test.c               |  18 ++---
 vl.c                                |  12 +++-
 hw/Makefile.objs                    |   2 +-
 hw/mem/Makefile.objs                |   4 +-
 hw/mem/trace-events                 |   5 +-
 hw/timer/trace-events               |   6 +-
 qemu-deprecated.texi                |  12 ++++
 38 files changed, 344 insertions(+), 286 deletions(-)

--=20
2.18.0.rc1.1.g3f1ff2140

