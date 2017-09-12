Received: by 10.223.172.38 with SMTP id v35csp6601435wrc;
        Mon, 11 Sep 2017 23:39:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBb3ccBz1o+KbYFqgQt4DxmoXUCgR4vDB/4FbR+8WstzlqMAFKGMZNH8pffeBs1Vikp27Qw
X-Received: by 10.55.95.71 with SMTP id t68mr8160494qkb.233.1505198360601;
        Mon, 11 Sep 2017 23:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505198360; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDhrBdQV8viZmegRMClJDV9NV4k4Ul6eBk3zD1ilQOzYa+zrO5qSY0Vg+ORK+cIyZt
         5bKeLfq6wonOi+UEJDi0/bWRlR5G9Bm6nPA0yESBEhXgAGxOtaU7Y2FranIk/Z/NSaTP
         1Yb8eND+PHUrMDUhQlwlY1bTwmDSPJZsysJ4cliC+BMmLvLvcXtTqMgs28JWonaSgKdO
         N8I+SaXsaCNK6Vy+dUkZu8XYIGhH8nPbEKjkesbMPLe67W65d8FgiIxR9mlJwbQm+HEv
         4rOm+4upANIKpgUEDgSXvRkzEZHNJe6wiioLs6/yEutH12qaWQYJTUGhlu3G16NbAKLw
         JC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=39UlDQEJNgdVaTLk7qEuLj5ZoFwG81hpvHRQZEAwIGA=;
        b=RZU3IGS2bP6oL17SVXJ3j/DdnkeGaTwl7Tgg4hA2YDouK6nleQX+KI0GYPxJ4bIXDR
         lVxjM6ATCCrCQvKHBri6qhRKYeAVzBG0y89VqFrvN761IhIKNUDWEMLe0t+IUpsu+jdg
         aTBESNOqCP75r+/XEH6+WSK+VQsriuGSxJub0wc6uncNA9Qc01xxHU150FGZusSmcaI+
         N4f7ooboZODubPEKzxBS4/8SbLOcK3/rS0Mx9cuJTP7JL+q+Wn8fWYvyTNIyMaxH6jOi
         /m6WxtUF7hqwnz/kr9KxRmErBE7f2uHWTdsY4C5l0NCQpsbR125yrRlZmfUtkwSU6TnU
         B8nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si3985958qte.356.2017.09.11.23.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 23:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dreqs-000356-C0
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 02:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dreqj-00034h-Pb
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 02:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dreqg-0000pB-JR
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 02:39:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dreqg-0000od-Bc; Tue, 12 Sep 2017 02:39:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 600F6C04B92A;
	Tue, 12 Sep 2017 06:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 600F6C04B92A
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E026C518;
	Tue, 12 Sep 2017 06:38:49 +0000 (UTC)
To: Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20170912061815.GA23124@virtx40>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c2f77265-f363-00db-fffe-97731ad0744c@redhat.com>
Date: Tue, 12 Sep 2017 08:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170912061815.GA23124@virtx40>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Sep 2017 06:39:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: auN9Cbwdg0kH

Hi Linu,

On 12/09/2017 08:18, Linu Cherian wrote:
> Hi Eric,
> 
> On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
>> This series implements the emulation code for ARM SMMUv3.
>>
>> Changes since v6:
>> - DPDK testpmd now running on guest with 2 assigned VFs
>> - Changed the instantiation method: add the following option to
>>   the QEMU command line
>>   -device smmuv3 # for virtio/vhost use cases
>>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
>> - splitted the series into smaller patches to allow the review
>> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
>>   is isolated from the rest: last 2 patches, not for upstream.
>>   This is shipped for testing/bench until a better solution is found.
>> - Reworked permission flag checks and event generation
>>
>> testing:
>> - in dt and ACPI modes
>> - virtio-net-pci and vhost-net devices using dma ops with various
>>   guest page sizes [2]
>> - assigned VFs using dma ops [3]:
>>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
>> - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
>>   with guest and host page size equal (4kB)
>>
>> Known limitations:
>> - no VMSAv8-32 suport
>> - no nested stage support (S1 + S2)
>> - no support for HYP mappings
>> - register fine emulation, commands, interrupts and errors were
>>   not accurately tested. Handling is sufficient to run use cases
>>   described above though.
>> - interrupts and event generation not observed yet.
>>
> 
> By design, shouldnt this work on hardware with smmuv2 implementations as well. 
> ie. Guest with smmuv3 emulation + Host with smmuv2 hardware.

Yes indeed. I am mostly testing with a host featuring smmuv2 at the moment.

Thanks

Eric
> 
> Or Is there any known limitations for this ?
> 
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> v7: https://github.com/eauger/qemu/tree/v2.10.0-SMMU-v7
>> Previous version at:
>> v6: https://github.com/eauger/qemu/tree/v2.10.0-rc2-SMMU-v6
>>
>> References:
>> [1] [RFC v2 0/4] arm-smmu-v3 tlbi-on-map option
>>     https://lkml.org/lkml/2017/8/11/426
>>
>> [2] qemu cmd line excerpt:
>> -device smmuv3 \
>> -netdev tap,id=tap0,script=no,downscript=no,ifname=tap0,vhost=off \
>> -device virtio-net-pci,netdev=tap0,mac=6a:f5:10:b1:3d:d2,iommu_platform,disable-modern=off,disable-legacy=on \
>> [3] use -device smmuv3,caching-mode
>>
>>
>> History:
>> v6 -> v7:
>> - see above
>>
>> v5 -> v6:
>> - Rebase on 2.10 and IOMMUMemoryRegion
>> - add ACPI TLBI_ON_MAP support (VFIO integration also works in
>>   ACPI mode)
>> - fix block replay
>> - handle implementation defined SMMU_CMD_TLBI_NH_VA_AM cmd
>>   (goes along with TLBI_ON_MAP FW quirk)
>> - replay systematically unmap the whole range first
>> - smmuv3_map_hook does not unmap anymore and the unmap is done
>>   before the replay
>> - add and use smmuv3_context_device_invalidate instead of
>>   blindly replaying everything
>>
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
>>
>> Eric Auger (18):
>>   hw/arm/smmu-common: smmu base device and datatypes
>>   hw/arm/smmu-common: IOMMU memory region and address space setup
>>   hw/arm/smmu-common: smmu_read/write_sysmem
>>   hw/arm/smmu-common: VMSAv8-64 page table walk
>>   hw/arm/smmuv3: Wired IRQ and GERROR helpers
>>   hw/arm/smmuv3: Queue helpers
>>   hw/arm/smmuv3: Implement MMIO write operations
>>   hw/arm/smmuv3: Event queue recording helper
>>   hw/arm/smmuv3: Implement translate callback
>>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>>   hw/arm/smmuv3: Implement data structure and TLB invalidation
>>     notifications
>>   hw/arm/smmuv3: Implement IOMMU memory region replay callback
>>   hw/arm/virt: Store the PCI host controller dt phandle
>>   hw/arm/sysbus-fdt: Pass the VirtMachineState to the node creation
>>     functions
>>   hw/arm/sysbus-fdt: Pass the platform bus base address in
>>     PlatformBusFDTData
>>   hw/arm/sysbus-fdt: Allow smmuv3 dynamic instantiation
>>   hw/arm/smmuv3: [not for upstream] add SMMU_CMD_TLBI_NH_VA_AM handling
>>   hw/arm/smmuv3: [not for upstream] Add caching-mode option
>>
>> Prem Mallappa (2):
>>   hw/arm/smmuv3: Skeleton
>>   hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
>>
>>  default-configs/aarch64-softmmu.mak |    1 +
>>  hw/arm/Makefile.objs                |    1 +
>>  hw/arm/smmu-common.c                |  527 ++++++++++++++++
>>  hw/arm/smmu-internal.h              |  105 ++++
>>  hw/arm/smmuv3-internal.h            |  584 +++++++++++++++++
>>  hw/arm/smmuv3.c                     | 1181 +++++++++++++++++++++++++++++++++++
>>  hw/arm/sysbus-fdt.c                 |  129 +++-
>>  hw/arm/trace-events                 |   48 ++
>>  hw/arm/virt-acpi-build.c            |   63 +-
>>  hw/arm/virt.c                       |    6 +-
>>  include/hw/acpi/acpi-defs.h         |   15 +
>>  include/hw/arm/smmu-common.h        |  123 ++++
>>  include/hw/arm/smmuv3.h             |   80 +++
>>  include/hw/arm/sysbus-fdt.h         |    2 +
>>  include/hw/arm/virt.h               |   15 +
>>  target/arm/kvm.c                    |   27 +
>>  target/arm/trace-events             |    3 +
>>  17 files changed, 2886 insertions(+), 24 deletions(-)
>>  create mode 100644 hw/arm/smmu-common.c
>>  create mode 100644 hw/arm/smmu-internal.h
>>  create mode 100644 hw/arm/smmuv3-internal.h
>>  create mode 100644 hw/arm/smmuv3.c
>>  create mode 100644 include/hw/arm/smmu-common.h
>>  create mode 100644 include/hw/arm/smmuv3.h
>>
>> -- 
>> 2.5.5
>>
>>
> 
