Received: by 10.25.44.15 with SMTP id s15csp4870756lfs;
        Tue, 1 Aug 2017 06:07:45 -0700 (PDT)
X-Received: by 10.55.21.223 with SMTP id 92mr26994415qkv.199.1501592864989;
        Tue, 01 Aug 2017 06:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501592864; cv=none;
        d=google.com; s=arc-20160816;
        b=B+wsWGgGGYedThK4nglksQIf2bcCmdxSZuvvg0FRb9bhHO+bkvvYbWgt5uk99XAb25
         DRshFBOCGGOr+0HseMTwWG+Kd4hIKML9l5TFNyP/Vb3WSDHO/gfdENNCDb+SzgFJawx2
         0VMlWyrYGDiUpN3ek56gQ8oQT7gFwxjEsdFj9NPiQ1dJCb0zqipZylUtX6aCGUvawuPs
         oN1y5RbMd924b3Jvlwb39gPOb6VlBoywPeNlg5dOw4wlrd+5/E/TOsg1R+T2pH//tJUQ
         Uw9ReLUcP6dJjsfvK7FheBSnlslZDidx4V+z3rRUk0sQjgbIMhb9tYEKqP6goGrophzM
         VOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=18lSnnKcHJR6EpY0ruNDEiNJedXRxzL/uhsEXcK3rLM=;
        b=mPuLgIy/tq35EvnKkFK7G3weH+DYK6aBlVXkl95KVTDpv4sdwoB8GZTLALvt4T7mKA
         NKcjFw7oe0k0kPJ+ji0w0ZTaM7Ph0n8GD7oPdhkJzt+2AaBzb/sHk5hVELjDCDlrbWbE
         xv2Wo0xUVoqapczVbBi7OQBjqBFtmnUeT2Sn5Mg8Rx3ozsq7QF/KSDco2ha6WX5r5uYH
         lRTh6pUEVewGtqI2LAsBFWOkgOXOAAhrJSRV7VM5QViwDPi0Ur195EhLvJQuFhK6uchc
         WApMDzgWlGlWh4d1mu9IaU8DTXmAm6ZJBWAfhdw5tc5y/dOvjnL2qq0uM1BL8p4WtNWo
         2XGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si7680478qti.263.2017.08.01.06.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 06:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcWti-0006V7-Gb
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 09:07:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcWtb-0006UQ-6F
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 09:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcWtY-00019J-9Y
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 09:07:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcWtY-00018q-0V; Tue, 01 Aug 2017 09:07:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9C6DB6F5D;
	Tue,  1 Aug 2017 13:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B9C6DB6F5D
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D43317DFF;
	Tue,  1 Aug 2017 13:07:17 +0000 (UTC)
To: Tomasz Nowicki <tnowicki@caviumnetworks.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<a8fd7038-a840-8667-0db2-5765624903d3@caviumnetworks.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <50d1685e-bfa6-02ac-2650-37637745431a@redhat.com>
Date: Tue, 1 Aug 2017 15:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a8fd7038-a840-8667-0db2-5765624903d3@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 01 Aug 2017 13:07:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v5 0/8] ARM SMMUv3 Emulation Support
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, "Nair,
	Jayachandran" <Jayachandran.Nair@cavium.com>, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FBsh+v+28lsM

Hi Tomasz,
On 01/08/2017 13:01, Tomasz Nowicki wrote:
> Hi Eric,
> 
> Just letting you know that I am facing another issue with the following
> setup:
> 1. host (4.12 kernel & 64K page) and VM (4.12 kernel & 64K page)
> 2. QEMU + -netdev type=tap,ifname=tap,id=net0 -device
> virtio-net-pci,netdev=net0,iommu_platform,disable-modern=off,disable-legacy=on
> 
> 2. On VM, I allocate some huge pages and run DPDK testpmd app:
> # echo 4 > /sys/kernel/mm/hugepages/hugepages-524288kB/nr_hugepages
> # ./dpdk/usertools/dpdk-devbind.py -b vfio-pci  0000:00:02.0
> # ./dpdk/build/app/testpmd -l 0-13 -n 4 -w 0000:00:02.0 --
> --disable-hw-vlan-filter --disable-rss -i
> EAL: Detected 14 lcore(s)
> EAL: Probing VFIO support...
> EAL: VFIO support initialized
> EAL: PCI device 0000:00:02.0 on NUMA socket -1
> EAL:   probe driver: 1af4:1041 net_virtio
> EAL:   using IOMMU type 1 (Type 1)
> EAL: iommu_map_dma vaddr ffff20000000 size 80000000 iova 120000000
> EAL: Can't write to PCI bar (0) : offset (12)
> EAL: Can't read from PCI bar (0) : offset (12)
> EAL: Can't read from PCI bar (0) : offset (12)
> EAL: Can't write to PCI bar (0) : offset (12)
> EAL: Can't read from PCI bar (0) : offset (12)
> EAL: Can't write to PCI bar (0) : offset (12)
> EAL: Can't read from PCI bar (0) : offset (0)
> EAL: Can't write to PCI bar (0) : offset (4)
> EAL: Can't write to PCI bar (0) : offset (14)
> EAL: Can't write to PCI bar (0) : offset (e)
> EAL: Can't read from PCI bar (0) : offset (c)
> EAL: Requested device 0000:00:02.0 cannot be used
> EAL: No probed ethernet devices
> Interactive-mode selected
> USER1: create a new mbuf pool <mbuf_pool_socket_0>: n=251456, size=2176,
> socket=0
> 
> When VM uses *4K pages* the same setup works fine. I will work on this
> but please let me know in case you already know what is going on.

No I did not face that one. I was able to launch testpmd without such
early message. However I assigned an igbvf device to the guest and then
to DPDK. I've never tested your config.

However as stated in my cover letter at the moment DPDK is not working
for me because of storms of tlbi-on-maps. I intend to work on this as
soon as get some bandwidth, sorry.

Thanks

Eric
> 
> Thanks,
> Tomasz
> 
> 
> On 09.07.2017 22:51, Eric Auger wrote:
>> This series implements the emulation code for ARM SMMUv3.
>> This is the continuation of Prem's work [1].
>>
>> This v5 mainly brings VFIO integration in DT mode. On guest kernel
>> side, this requires a quirk [1] to force TLB invalidation on map.
>>
>> The following changes also are noticeable:
>> - fix SMMU_CMDQ_CONS offset
>> - adds dma-coherent dt property which fixes the unhandled command
>>    opcode bug.
>> - implements block PTE
>>
>> The smmu is instantiated when passing the smmu option to machvirt:
>> "-M virt-2.10,smmu"
>>
>> As I haven't split the code yet so that it can be easily reviewable
>> I don't expect deep reviews at this stage. Also the implementation may
>> be largely sub-optimal.
>>
>> Tested Use Cases:
>> - booted a guest in dt and acpi mode with an iommu_platform
>>    virtio-net-pci device (using dma ops). Tested with the following
>>    guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
>>    64K - 48b.
>> - booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
>>    - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>>    - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
>>
>> Unfortunately I have not been able to run DPDK testpmd yet on guest side.
>> The problem I see is the user space driver dma-maps a huge area
>> and this causes plenty of CMDQ_OP_TLBI_NH_VA commands to be sent
>> (tlbi-on-map) which are sent for each page whereas the dma-map covers a
>> huge page. I will work on this issue for next version.
>>
>> Known limitations:
>> - no VMSAv8-32 suport
>> - no nested stage support (S1 + S2)
>> - no support for HYP mappings
>> - register fine emulation, commands, interrupts and errors were
>>    not accurately tested. Handling is sufficient to run use cases
>>    described hereafter though.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> v5: https://github.com/eauger/qemu/tree/v2.9-SMMU-v5
>> v4: https://github.com/eauger/qemu/tree/v2.9-SMMU-v4
>>
>> References:
>> [1] [RFC 0/2] arm-smmu-v3 tlbi-on-map option
>> [2] Prem's last iteration:
>> - https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html
>>
>> History:
>> v4 -> v5:
>> - initial_level now part of SMMUTransCfg
>> - smmu_page_walk_64 takes into account the max input size
>> - implement sys->iommu_ops.replay and sys->iommu_ops.notify_flag_changed
>> - smmuv3_translate: bug fix: don't walk on bypass
>> - smmu_update_qreg: fix PROD index update
>> - I did not yet address Peter's comments as the code is not mature enough
>>    to be split into sub patches.
>>
>> v3 -> v4 [Eric]:
>> - page table walk rewritten to allow scan of the page table within a
>>    range of IOVA. This prepares for VFIO integration and replay.
>> - configuration parsing partially reworked.
>> - do not advertise unsupported/untested features: S2, S1 + S2, HYP,
>>    PRI, ATS, ..
>> - added ACPI table generation
>> - migrated to dynamic traces
>> - mingw compilation fix
>>
>> v2 -> v3 [Eric]:
>> - rebased on 2.9
>> - mostly code and patch reorganization to ease the review process
>> - optional patches removed. They may be handled separately. I am
>> currently
>>    working on ACPI enablement.
>> - optional instantiation of the smmu in mach-virt
>> - removed [2/9] (fdt functions) since not mandated
>> - start splitting main patch into base and derived object
>> - no new function feature added
>>
>> v1 -> v2 [Prem]:
>> - Adopted review comments from Eric Auger
>>          - Make SMMU_DPRINTF to internally call qemu_log
>>              (since translation requests are too many, we need control
>>               on the type of log we want)
>>          - SMMUTransCfg modified to suite simplicity
>>          - Change RegInfo to uint64 register array
>>          - Code cleanup
>>          - Test cleanups
>> - Reshuffled patches
>>
>> v0 -> v1 [Prem]:
>> - As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
>> - Reworked register access/update logic
>> - Factored out translation code for
>>          - single point bug fix
>>          - sharing/removal in future
>> - (optional) Unit tests added, with PCI test device
>>          - S1 with 4k/64k, S1+S2 with 4k/64k
>>          - (S1 or S2) only can be verified by Linux 4.7 driver
>>          - (optional) Priliminary ACPI support
>>
>> v0 [Prem]:
>> - Implements SMMUv3 spec 11.0
>> - Supported for PCIe devices,
>> - Command Queue and Event Queue supported
>> - LPAE only, S1 is supported and Tested, S2 not tested
>> - BE mode Translation not supported
>> - IRQ support (legacy, no MSI)
>> - Tested with DPDK and e1000
>>
>>
>> Eric Auger (5):
>>    hw/arm/smmu-common: smmu base class
>>    hw/arm/virt: Add 2.10 machine type
>>    hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
>>    target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>>    hw/arm/smmuv3: VFIO integration
>>
>> Prem Mallappa (3):
>>    hw/arm/smmuv3: smmuv3 emulation model
>>    hw/arm/virt: Add SMMUv3 to the virt board
>>    hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
>>
>>   default-configs/aarch64-softmmu.mak |    1 +
>>   hw/arm/Makefile.objs                |    1 +
>>   hw/arm/smmu-common.c                |  474 +++++++++++++
>>   hw/arm/smmu-internal.h              |   89 +++
>>   hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
>>   hw/arm/smmuv3.c                     | 1256
>> +++++++++++++++++++++++++++++++++++
>>   hw/arm/trace-events                 |   54 ++
>>   hw/arm/virt-acpi-build.c            |   56 +-
>>   hw/arm/virt.c                       |  111 +++-
>>   include/hw/acpi/acpi-defs.h         |   15 +
>>   include/hw/arm/smmu-common.h        |  127 ++++
>>   include/hw/arm/smmuv3.h             |   87 +++
>>   include/hw/arm/virt.h               |    5 +
>>   target/arm/kvm.c                    |   28 +
>>   target/arm/trace-events             |    3 +
>>   15 files changed, 2949 insertions(+), 9 deletions(-)
>>   create mode 100644 hw/arm/smmu-common.c
>>   create mode 100644 hw/arm/smmu-internal.h
>>   create mode 100644 hw/arm/smmuv3-internal.h
>>   create mode 100644 hw/arm/smmuv3.c
>>   create mode 100644 include/hw/arm/smmu-common.h
>>   create mode 100644 include/hw/arm/smmuv3.h
>>
