Received: by 10.25.44.15 with SMTP id s15csp1766616lfs;
        Wed, 12 Jul 2017 23:33:36 -0700 (PDT)
X-Received: by 10.200.36.70 with SMTP id d6mr2979282qtd.42.1499927616762;
        Wed, 12 Jul 2017 23:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499927616; cv=none;
        d=google.com; s=arc-20160816;
        b=eenEah2lwNJGwdwESyzoPjbG94Eb3qe4ZDi00H2rb6lbjTEIoVyiX+dDFZgunKQ1ug
         I0i3olBoJmiFWRoPQrmZHDRxWmzDnZgdiN6ceXjmQUGe+C1PkGOfpojkb75kb9hqwY3y
         F6l4St2Tfu2GP30//fU+9NWAh2o30Jmx9QEUtomgimz2tW/OScamOWnL/NanNi2p56dl
         OhCizxU3i06dDKZB/RZ3JE88pZqOCjPH7NRGM038s1gX0EbfeI2Wlb7yApuXS6fzCmXj
         obVCIG2+ZpozTWDgMfMSg48z6IgSOUQ8rpuUviygXZzJQGdTEO2tBOAh4Cmwg0GoO6qw
         cWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hQH+uUaiauXcUDjvhS6TO5eOFqk2zuBi8P+Z8n3X61w=;
        b=UAUIMg+7/S5CspwJdxkg0YYUXWS/TKE9LG7qd3lK9xLZU//QwSN3G6fH3cT69OwqdG
         9c/0u9/+inrBUQbAgnDggB/QweGpImW/whR8iUEcAKQQDK4nQOBXrq86qKhglcsWjWfl
         7uCOS6wrgVKMzjbYdSeoJvuPLrf8kNy+HrKfwRxtFyb0YoVSN5QhTHyDp6QYJ2fkJ2X6
         41gr33xads5d6m6cuJ5PibVNxANqxN7y0WO3mHOjzwU6B3TsiIjVd+yk3Jcttu28/tPS
         qnLX8yunee5UCYklP4cKuxID8ukb/TU3KA5GW90yRb8rJc7h4tX7id5ZbQsENgdloaSR
         bxlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BBx4GB1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o7si4070368qtg.133.2017.07.12.23.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 23:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BBx4GB1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVXgr-0005JK-S5
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 02:33:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geethasowjanya.akula@gmail.com>) id 1dVLOC-0000Gr-IF
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 13:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geethasowjanya.akula@gmail.com>) id 1dVLO9-0004Lp-B7
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 13:25:28 -0400
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geethasowjanya.akula@gmail.com>)
	id 1dVLO8-00041g-VH; Wed, 12 Jul 2017 13:25:25 -0400
Received: by mail-lf0-f51.google.com with SMTP id h22so22868296lfk.3;
	Wed, 12 Jul 2017 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hQH+uUaiauXcUDjvhS6TO5eOFqk2zuBi8P+Z8n3X61w=;
	b=BBx4GB1rh/AJBVtJXqg6GrcQfzIkIhVUUbXhlI1PfZQIeRFhGCrdMglX5UDyAXFuz/
	KCvP9c4vAS3/b1OHt1TPJZsetFjF1smzARwMVwLg2Y6TO/0GoJqDtNhY6laetd5vvct9
	W6eqzBTZiBd8i/rLd/yxqAqyizaH12rdOxFmSVhHRNzlMXhyh/wDBjCMspnxtgNr8NqN
	HPsnvUYvYHSL8zJLL+kiy4SQVMKYhmNuZsZV11W1kD79YX/uDjJQzq7vLuKa9sZJ2lDV
	3IchEc0fnpa2RBl/3hp/b3jxlNjbmUWQp7k+o01OF7RV9I010tiTANzHKn4yaT7H0lRF
	LQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hQH+uUaiauXcUDjvhS6TO5eOFqk2zuBi8P+Z8n3X61w=;
	b=pTitYLSgWVCFII7but/zY9l2D4GSYj0CXephMTRiojIaYgZKGLrRrGbmUI1pzYw8zE
	41eDTXndqNzFiS8bllnhIQVbJtGY5A0AFHHauzhiXum/iDPnD6mT8cdNp2DnVXFS0vPY
	TUjVBmM2RMyDWE3puFkAfi1TOAmsK2QmdbYQnrAvIcyDxHFQwK0qbJGqbQcMirrMR2x4
	bss8nFM25JFRWO0DIpaUVOqz1khefNcQP+vToLZDRwa8Rv7mi4YjpFcgZx8ncEsAnXpS
	07CSrb42xF7zY0gtjRi02lKn93MSiuWZ2qDnbL6ATtYO3pEY8dQehpWLZd9i+DxhOsJ4
	DZnw==
X-Gm-Message-State: AIVw112BSuY+lixUL/3BAqLgfyxAvUI5aowEOb1GU3QdMj2zOpY/cECa
	004qkN62sopgoylZQlIpqGmrqUTGXg==
X-Received: by 10.25.43.73 with SMTP id r70mr2561990lfr.135.1499880240827;
	Wed, 12 Jul 2017 10:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.159.204 with HTTP; Wed, 12 Jul 2017 10:24:00 -0700 (PDT)
In-Reply-To: <CACJhume2HkAXVQ8kSCpGEfQV4NOP_=HrZCHXBNLnbm0B8dGQvw@mail.gmail.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<CACJhume2HkAXVQ8kSCpGEfQV4NOP_=HrZCHXBNLnbm0B8dGQvw@mail.gmail.com>
From: Geetha Akula <geethasowjanya.akula@gmail.com>
Date: Wed, 12 Jul 2017 22:54:00 +0530
Message-ID: <CANHdaibKEC5=gwfSDM+XRFUFaP-jTTA9aEuWvZVeB-9+nCW2ug@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com, 
	Alex Williamson <alex.williamson@redhat.com>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
X-Mailman-Approved-At: Thu, 13 Jul 2017 02:33:23 -0400
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
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Will Deacon <will.deacon@arm.com>, peterx@redhat.com,
	Robin Murphy <robin.murphy@arm.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8l2p+M6Wdkgt

Hi Eric


> This series implements the emulation code for ARM SMMUv3.
> This is the continuation of Prem's work [1].
>
> This v5 mainly brings VFIO integration in DT mode. On guest kernel
> side, this requires a quirk [1] to force TLB invalidation on map.
>
> The following changes also are noticeable:
> - fix SMMU_CMDQ_CONS offset
> - adds dma-coherent dt property which fixes the unhandled command
>   opcode bug.
> - implements block PTE
>
> The smmu is instantiated when passing the smmu option to machvirt:
> "-M virt-2.10,smmu"
>
> As I haven't split the code yet so that it can be easily reviewable
> I don't expect deep reviews at this stage. Also the implementation may
> be largely sub-optimal.
>
> Tested Use Cases:
> - booted a guest in dt and acpi mode with an iommu_platform
>   virtio-net-pci device (using dma ops). Tested with the following
>   guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
>   64K - 48b.

Verified patches with virtio-net-pci. Not observed any command queue
issues like in V4 patch series. There is a huge difference in iperf numbers
on guest with and without SMMUv3 emulation i.e (1.5 Gbps with viommu
and 9.0 Gbps without viommu). I think this is expected behaviour.

Is there any plan to add device-iotlb and iotlb support in SMMUv3 emulation ?


Thank you,
Geetha.


> - booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
>
> Unfortunately I have not been able to run DPDK testpmd yet on guest side.
> The problem I see is the user space driver dma-maps a huge area
> and this causes plenty of CMDQ_OP_TLBI_NH_VA commands to be sent
> (tlbi-on-map) which are sent for each page whereas the dma-map covers a
> huge page. I will work on this issue for next version.
>
> Known limitations:
> - no VMSAv8-32 suport
> - no nested stage support (S1 + S2)
> - no support for HYP mappings
> - register fine emulation, commands, interrupts and errors were
>   not accurately tested. Handling is sufficient to run use cases
>   described hereafter though.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> v5: https://github.com/eauger/qemu/tree/v2.9-SMMU-v5
> v4: https://github.com/eauger/qemu/tree/v2.9-SMMU-v4
>
> References:
> [1] [RFC 0/2] arm-smmu-v3 tlbi-on-map option
> [2] Prem's last iteration:
> - https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html
>
> History:
> v4 -> v5:
> - initial_level now part of SMMUTransCfg
> - smmu_page_walk_64 takes into account the max input size
> - implement sys->iommu_ops.replay and sys->iommu_ops.notify_flag_changed
> - smmuv3_translate: bug fix: don't walk on bypass
> - smmu_update_qreg: fix PROD index update
> - I did not yet address Peter's comments as the code is not mature enough
>   to be split into sub patches.
>
> v3 -> v4 [Eric]:
> - page table walk rewritten to allow scan of the page table within a
>   range of IOVA. This prepares for VFIO integration and replay.
> - configuration parsing partially reworked.
> - do not advertise unsupported/untested features: S2, S1 + S2, HYP,
>   PRI, ATS, ..
> - added ACPI table generation
> - migrated to dynamic traces
> - mingw compilation fix
>
> v2 -> v3 [Eric]:
> - rebased on 2.9
> - mostly code and patch reorganization to ease the review process
> - optional patches removed. They may be handled separately. I am currently
>   working on ACPI enablement.
> - optional instantiation of the smmu in mach-virt
> - removed [2/9] (fdt functions) since not mandated
> - start splitting main patch into base and derived object
> - no new function feature added
>
> v1 -> v2 [Prem]:
> - Adopted review comments from Eric Auger
>         - Make SMMU_DPRINTF to internally call qemu_log
>             (since translation requests are too many, we need control
>              on the type of log we want)
>         - SMMUTransCfg modified to suite simplicity
>         - Change RegInfo to uint64 register array
>         - Code cleanup
>         - Test cleanups
> - Reshuffled patches
>
> v0 -> v1 [Prem]:
> - As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
> - Reworked register access/update logic
> - Factored out translation code for
>         - single point bug fix
>         - sharing/removal in future
> - (optional) Unit tests added, with PCI test device
>         - S1 with 4k/64k, S1+S2 with 4k/64k
>         - (S1 or S2) only can be verified by Linux 4.7 driver
>         - (optional) Priliminary ACPI support
>
> v0 [Prem]:
> - Implements SMMUv3 spec 11.0
> - Supported for PCIe devices,
> - Command Queue and Event Queue supported
> - LPAE only, S1 is supported and Tested, S2 not tested
> - BE mode Translation not supported
> - IRQ support (legacy, no MSI)
> - Tested with DPDK and e1000
>
>
> Eric Auger (5):
>   hw/arm/smmu-common: smmu base class
>   hw/arm/virt: Add 2.10 machine type
>   hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   hw/arm/smmuv3: VFIO integration
>
> Prem Mallappa (3):
>   hw/arm/smmuv3: smmuv3 emulation model
>   hw/arm/virt: Add SMMUv3 to the virt board
>   hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
>
>  default-configs/aarch64-softmmu.mak |    1 +
>  hw/arm/Makefile.objs                |    1 +
>  hw/arm/smmu-common.c                |  474 +++++++++++++
>  hw/arm/smmu-internal.h              |   89 +++
>  hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
>  hw/arm/smmuv3.c                     | 1256 +++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events                 |   54 ++
>  hw/arm/virt-acpi-build.c            |   56 +-
>  hw/arm/virt.c                       |  111 +++-
>  include/hw/acpi/acpi-defs.h         |   15 +
>  include/hw/arm/smmu-common.h        |  127 ++++
>  include/hw/arm/smmuv3.h             |   87 +++
>  include/hw/arm/virt.h               |    5 +
>  target/arm/kvm.c                    |   28 +
>  target/arm/trace-events             |    3 +
>  15 files changed, 2949 insertions(+), 9 deletions(-)
>  create mode 100644 hw/arm/smmu-common.c
>  create mode 100644 hw/arm/smmu-internal.h
>  create mode 100644 hw/arm/smmuv3-internal.h
>  create mode 100644 hw/arm/smmuv3.c
>  create mode 100644 include/hw/arm/smmu-common.h
>  create mode 100644 include/hw/arm/smmuv3.h
>
> --
> 2.5.5
