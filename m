Received: by 10.25.15.230 with SMTP id 99csp4086257lfp;
        Mon, 3 Apr 2017 00:34:49 -0700 (PDT)
X-Received: by 10.55.42.14 with SMTP id q14mr5307771qkh.10.1491204889833;
        Mon, 03 Apr 2017 00:34:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s23si11234572qka.239.2017.04.03.00.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Apr 2017 00:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cuwVj-0008KZ-90
	for alex.bennee@linaro.org; Mon, 03 Apr 2017 03:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cuwVd-0008KU-Gf
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 03:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cuwVa-0002TV-4v
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 03:34:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cuwVZ-0002Sm-SQ; Mon, 03 Apr 2017 03:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8753F85543;
	Mon,  3 Apr 2017 07:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8753F85543
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8753F85543
Received: from localhost.localdomain (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF4F17ABB;
	Mon,  3 Apr 2017 07:34:31 +0000 (UTC)
To: Radha Mohan <mohun106@gmail.com>
References: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
	<CAC8NTUVH1--3o812m5rUamLK_3tqX5p7=t-vDbrAcGsjQV0JtQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8ae0e957-2822-6bf9-425f-c64f2f1e8a8b@redhat.com>
Date: Mon, 3 Apr 2017 09:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAC8NTUVH1--3o812m5rUamLK_3tqX5p7=t-vDbrAcGsjQV0JtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 03 Apr 2017 07:34:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 0/5] SMMUv3 Emmulation Support
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
Cc: peter.maydell@linaro.org, Drew Jones <drjones@redhat.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	prem.mallappa@gmail.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mxmIaiX0Izif

Hi Radha,

On 01/04/2017 02:56, Radha Mohan wrote:
> Hi Eric
> 
> On Thu, Mar 30, 2017 at 12:42 PM, Eric Auger <eric.auger@redhat.com> wrote:
>> This series introduces the emulation code for ARM SMMUv3.
>> This is the continuation of Prem's work [1].
>>
>> At the moment only AArch64 translation format is supported, ie.
>> no support for AArch32 (LPAE) translation.
>>
>> stage1, stage2 and stage1 + Stage2 are supposed to work but I only
>> tested stage 1 at the moment.
>>
>> I will do the comprehensive inventory of unsupported features in
>> next version.
>>
>> As reported by Edgar, TBUs are not modeled properly and this will be
>> addressed in next respin.
>>
>> Don't spend too much time reviewing this version. This is just a rebase
>> plus some cleanups done while getting familiar with the code structure.
>> I will try to move as much in the base class and reuse Xilinx code when
>> sensible.
>>
>> Best Regards
>>
>> Eric
>>
>> Testing:
>> - booted a 4.11-rc4 guest in dt mode with virtio-pci device
>>
>> References:
>> [1] Prem's last iteration:
>> - https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html
>>
>> History:
>> v2 -> v3 [Eric]:
>> - rebased on 2.9
>> - mostly code and patch reorganization to ease the review process
>> - optional patches removed. They may be handled separately. I am currently
>>   working on ACPI enablement.
>> - optional instantiation of the smmu in mach-virt
>> - removed [2/9] (fdt functions) since not mandated
>> - start splitting main patch into base and derived object
>> - no new function feature added
>>
>> v1 -> v2 [Prem]:
>> - Adopted review comments from Eric Auger
>>         - Make SMMU_DPRINTF to internally call qemu_log
>>             (since translation requests are too many, we need control
>>              on the type of log we want)
>>         - SMMUTransCfg modified to suite simplicity
>>         - Change RegInfo to uint64 register array
>>         - Code cleanup
>>         - Test cleanups
>> - Reshuffled patches
>>
>> v0 -> v1 [Prem]:
>> - As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
>> - Reworked register access/update logic
>> - Factored out translation code for
>>         - single point bug fix
>>         - sharing/removal in future
>> - (optional) Unit tests added, with PCI test device
>>         - S1 with 4k/64k, S1+S2 with 4k/64k
>>         - (S1 or S2) only can be verified by Linux 4.7 driver
>>         - (optional) Priliminary ACPI support
>>
>> v0 [Prem]:
>> - Implements SMMUv3 spec 11.0
>> - Supported for PCIe devices,
>> - Command Queue and Event Queue supported
>> - LPAE only, S1 is supported and Tested, S2 not tested
>> - BE mode Translation not supported
>> - IRQ support (legacy, no MSI)
>>
>>
>> Eric Auger (2):
>>   hw/arm/smmu-common: smmu base class
>>   hw/arm/virt: Add 2.10 machine type
>>
>> Prem Mallappa (3):
>>   log: Add new IOMMU type
>>   hw/arm/smmuv3: smmuv3 emulation model
>>   hw/arm/virt: Add SMMUv3 to the virt board
>>
>>  default-configs/aarch64-softmmu.mak |    1 +
>>  hw/arm/Makefile.objs                |    1 +
>>  hw/arm/smmu-common.c                |  193 ++++++
>>  hw/arm/smmuv3-internal.h            |  544 +++++++++++++++++
>>  hw/arm/smmuv3.c                     | 1131 +++++++++++++++++++++++++++++++++++
>>  hw/arm/virt.c                       |  109 +++-
>>  include/hw/arm/smmu-common.h        |  151 +++++
>>  include/hw/arm/smmuv3.h             |   88 +++
>>  include/hw/arm/virt.h               |    5 +
>>  include/hw/compat.h                 |    3 +
>>  include/qemu/log.h                  |    1 +
>>  util/log.c                          |    2 +
>>  12 files changed, 2227 insertions(+), 2 deletions(-)
>>  create mode 100644 hw/arm/smmu-common.c
>>  create mode 100644 hw/arm/smmuv3-internal.h
>>  create mode 100644 hw/arm/smmuv3.c
>>  create mode 100644 include/hw/arm/smmu-common.h
>>  create mode 100644 include/hw/arm/smmuv3.h
>>
>> --
>> 2.5.5
> 
> Did a quick test with 4.10.1 guest and 4.11-rc3 host.
> 
> ~# qemu-system-aarch64 -cpu host -enable-kvm -M virt,gic_version=3
> -nographic -smp 1 -m 2048 -drive
> if=none,id=hd0,file=/root/zesty-server-cloudimg-arm64.img,id=0 -device
> virtio-blk-device,drive=hd0 -pflash /root/flash0.img -pflash
> /root/flash1.img -device vfio-pci,host=0000:13:00.1 -M virt,smmu=on
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 0
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 1000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 2000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 3000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 4000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 5000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 6000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 7000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 8000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area 9000
> ..
> ..
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
> non memory area fff000
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
> vfio_dma_map(0x1d52e600, 0x40000000, 0x0, 0xffff17e00000) = -22
> (Invalid argument)
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
> vfio_dma_map(0x1d52e600, 0x40001000, 0x0, 0xffff17e01000) = -22
> (Invalid argument)
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
> qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
> vfio_dma_map(0x1d52e600, 0x40002000, 0x0, 0xffff17e02000) = -22
> (Invalid argument)

As indicated in the cover letter I did not test with VFIO yet and I am
not really surprised it does not work. I would encourage you to test
with virtio or DPDK/OVS instead at the moment.

I reproduced the above traces and I will investigate what's wrong with
the VFIO integration

Thanks

Eric
> ..
> ..
> 
> And this goes on until I kill the qemu process.
> 
>>
>>
> 
