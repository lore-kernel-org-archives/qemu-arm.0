Received: by 10.25.44.15 with SMTP id s15csp5175054lfs;
        Tue, 25 Jul 2017 07:42:07 -0700 (PDT)
X-Received: by 10.55.148.70 with SMTP id w67mr23482330qkd.160.1500993727269;
        Tue, 25 Jul 2017 07:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500993727; cv=none;
        d=google.com; s=arc-20160816;
        b=i3m5Qm9tALmU7sLgOQGi4+bQ+YRIQsTGxtIyTXRc7Z+2QO/WOcHbCPLHEg806FY5u0
         SD/Hk7yDFtHEnjzTYgRrbfGnGCmjNkBGsLEAEUTrf/IwqaWTeZeeGwGuYw4BOKBzzq0n
         AKrctAjdUYaIWp3ptCK0SEpD6cZ12RBYAK98KdvMHMwDn15Qa4SPabVI1caj8eqnhzbp
         cv6B/Jsw7eVAUbG+H64WVuz6+imD+Sm0067Fny6FB+/2TJl78uDC7Cs7e/srnRxnnUzf
         V079+QgxnSXXLjDGz6EWvg5RsbDAFcaj2sLNP0H7tVZMo2OgHn+FlLbEEd2RcKswXR30
         I+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=28O9ihb9+9LcjWlFULYw7jaskWfQyoLpCchJuh+lz3c=;
        b=gwEpyQrioiOe5klSxborPAb12zTZckI/qzDfaRJjIHbh7InBdlWqrBXDJ1Q1ZpWHOU
         hP59fP7kkS5EtrGs82IW1JDbJK5CRYLA6JBkQ+Hn0Bg7ezq1tzCKOmYtvRuKi+iYYn+k
         iATOgpmBLmxViIOcfJsotUNHO+YZvdnWrC/vZ1Jh03FspDe+g+Xhs37hlSUYkc8DUbgE
         qp2xR2QT/zWzUlDs+hnCh9gNOWQf5UXbqbhf2TsVWL3RKVDHuTCizvSv5yPP8bBpc3ol
         6vMkP2x/6ck7h5WtikRw18HoVpSS4G+4rQC4SGnAdI88r734GcmBDpEsNWVvH5rB5ZO0
         RfMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a184si10711340qke.452.2017.07.25.07.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Jul 2017 07:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1da12C-0001pQ-IH
	for alex.bennee@linaro.org; Tue, 25 Jul 2017 10:42:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1da11U-0001Pi-DE
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 10:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1da11Q-0000dK-Aq
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 10:41:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1da11Q-0000cA-0Y; Tue, 25 Jul 2017 10:41:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11E848F28E;
	Tue, 25 Jul 2017 14:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 11E848F28E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-95.ams2.redhat.com
	[10.36.117.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DAB45C548;
	Tue, 25 Jul 2017 14:33:34 +0000 (UTC)
To: Geetha Akula <geethasowjanya.akula@gmail.com>, eric.auger.pro@gmail.com,
	Alex Williamson <alex.williamson@redhat.com>, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<CACJhume2HkAXVQ8kSCpGEfQV4NOP_=HrZCHXBNLnbm0B8dGQvw@mail.gmail.com>
	<CANHdaibKEC5=gwfSDM+XRFUFaP-jTTA9aEuWvZVeB-9+nCW2ug@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d8f680ac-ac8e-cc2f-190b-90b292bf0ce4@redhat.com>
Date: Tue, 25 Jul 2017 16:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANHdaibKEC5=gwfSDM+XRFUFaP-jTTA9aEuWvZVeB-9+nCW2ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 25 Jul 2017 14:34:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/8] ARM SMMUv3 Emulation
 Support
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
	Tomasz Nowicki <tn@semihalf.com>, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Will Deacon <will.deacon@arm.com>, peterx@redhat.com,
	Robin Murphy <robin.murphy@arm.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rqou7wAPtVzf

Hi Geetha, Tomasz,

On 12/07/2017 19:24, Geetha Akula wrote:
> Hi Eric
> 
> 
>> This series implements the emulation code for ARM SMMUv3.
>> This is the continuation of Prem's work [1].
>>
>> This v5 mainly brings VFIO integration in DT mode. On guest kernel
>> side, this requires a quirk [1] to force TLB invalidation on map.
>>
>> The following changes also are noticeable:
>> - fix SMMU_CMDQ_CONS offset
>> - adds dma-coherent dt property which fixes the unhandled command
>>   opcode bug.
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
>>   virtio-net-pci device (using dma ops). Tested with the following
>>   guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
>>   64K - 48b.
> 
> Verified patches with virtio-net-pci. Not observed any command queue
> issues like in V4 patch series.
Thank you for your comments and sorry for the delay, I was off.

Good to hear it fixes the command queue issues.

 There is a huge difference in iperf numbers
> on guest with and without SMMUv3 emulation i.e (1.5 Gbps with viommu
> and 9.0 Gbps without viommu). I think this is expected behaviour.
The perf can be definitively improved by setting the tlbi-on-map mode
for guest smmuv3 only when needed, as it is done with x86 qemu
intel-iommu,cache-mode=true explicit option.

> 
> Is there any plan to add device-iotlb and iotlb support in SMMUv3 emulation ?

What does both comprise exactly? do you mean PCI ATS support or vhost
device iotlb (ie. the use case exercised by Tomasz). Please can you
elaborate?

Thanks

Eric
> 
> 
> Thank you,
> Geetha.
> 
> 
>> - booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
>>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
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
>>   not accurately tested. Handling is sufficient to run use cases
>>   described hereafter though.
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
>>   to be split into sub patches.
>>
>> v3 -> v4 [Eric]:
>> - page table walk rewritten to allow scan of the page table within a
>>   range of IOVA. This prepares for VFIO integration and replay.
>> - configuration parsing partially reworked.
>> - do not advertise unsupported/untested features: S2, S1 + S2, HYP,
>>   PRI, ATS, ..
>> - added ACPI table generation
>> - migrated to dynamic traces
>> - mingw compilation fix
>>
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
>> - Tested with DPDK and e1000
>>
>>
>> Eric Auger (5):
>>   hw/arm/smmu-common: smmu base class
>>   hw/arm/virt: Add 2.10 machine type
>>   hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
>>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>>   hw/arm/smmuv3: VFIO integration
>>
>> Prem Mallappa (3):
>>   hw/arm/smmuv3: smmuv3 emulation model
>>   hw/arm/virt: Add SMMUv3 to the virt board
>>   hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
>>
>>  default-configs/aarch64-softmmu.mak |    1 +
>>  hw/arm/Makefile.objs                |    1 +
>>  hw/arm/smmu-common.c                |  474 +++++++++++++
>>  hw/arm/smmu-internal.h              |   89 +++
>>  hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
>>  hw/arm/smmuv3.c                     | 1256 +++++++++++++++++++++++++++++++++++
>>  hw/arm/trace-events                 |   54 ++
>>  hw/arm/virt-acpi-build.c            |   56 +-
>>  hw/arm/virt.c                       |  111 +++-
>>  include/hw/acpi/acpi-defs.h         |   15 +
>>  include/hw/arm/smmu-common.h        |  127 ++++
>>  include/hw/arm/smmuv3.h             |   87 +++
>>  include/hw/arm/virt.h               |    5 +
>>  target/arm/kvm.c                    |   28 +
>>  target/arm/trace-events             |    3 +
>>  15 files changed, 2949 insertions(+), 9 deletions(-)
>>  create mode 100644 hw/arm/smmu-common.c
>>  create mode 100644 hw/arm/smmu-internal.h
>>  create mode 100644 hw/arm/smmuv3-internal.h
>>  create mode 100644 hw/arm/smmuv3.c
>>  create mode 100644 include/hw/arm/smmu-common.h
>>  create mode 100644 include/hw/arm/smmuv3.h
>>
>> --
>> 2.5.5
