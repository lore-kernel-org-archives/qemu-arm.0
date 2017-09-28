Received: by 10.223.173.107 with SMTP id p98csp333596wrc;
        Wed, 27 Sep 2017 23:44:04 -0700 (PDT)
X-Received: by 10.200.37.136 with SMTP id e8mr5390161qte.112.1506581044060;
        Wed, 27 Sep 2017 23:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506581044; cv=none;
        d=google.com; s=arc-20160816;
        b=dEoK9xrGaVGdFOTSgcUGmcVYLnDPJd3ufgZlBcP1wmUyEAgyVDafrYfvRsFGfYTD+n
         mz56rtv9+NgVaJRjsoRCFfvd4DrFm9oS7PxHKWuAD/K2JJYuhD8atjHPLbiFURz7eLiJ
         XFr3kbaefoaP5c3TFN4XlcGpcXDUJ0D1fuqsQ7vFjRGPTDhcLN5FULIaaLlxKeHoIFdf
         N6NQwzUDIOZBxFJqgOQyaohXF+QW9b/vvC+kJRAY5RgZSQjUIEQlEvV+5DNAt2uKxAlR
         /i2U15t1yA2sNOcV1zKGKuOm4dcQBBEXHkMLViU4f43LoBcgAsWrg427dz588hT+0Mc8
         DHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=bjLXDkWUc/jPKkd1DYRmYv0XxBJNzxPbm+J0WcKkOUc=;
        b=vyVMm70TzBgYJPKE/Bu3dDglLkyV6VKP/7WEOLlkN94YmiYOi/Ao7y9bL/nRsKVvIg
         9TnastZ3pIRWq53RnqPCc2kwkU8fIbctLZU76OhpDPAv3094RFc9pEC5RIu00L+g0JAQ
         o1o3eXmIT9MuU1fB4whuINRPESB/tBRNAGmfl5BhEfxU+Eu2L94vHWQ10icF307iPDgD
         A3jmLZAakw1JrbH/ROx/a0nD9Ujsw7+E8WJp7W0T5gZ2xxtoAX3W5EbpiWCU6eKzkLfs
         Rur8Cef3WJZlRnTFmg8KZbVzWMQP6whX0aILxF3cWw13d6RBVbuyD1lJoVAXkAPCpBqp
         HlIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oDH18Bdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25si887439qtj.34.2017.09.27.23.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 23:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oDH18Bdh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxSYD-000891-SC
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 02:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dxSY6-00088u-MA
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 02:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dxSY3-0007tv-G4
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 02:43:54 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37575)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dxSY3-0007tX-6p; Thu, 28 Sep 2017 02:43:51 -0400
Received: by mail-pf0-x244.google.com with SMTP id e69so648494pfg.4;
	Wed, 27 Sep 2017 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bjLXDkWUc/jPKkd1DYRmYv0XxBJNzxPbm+J0WcKkOUc=;
	b=oDH18BdhZaXVKx5mdSzCMDf+Vig5pStEkw2fFwQujZ6vAWUmjnJofYFiB+1k0ItR9K
	rsVT4nHXGaK+qY8RZ028ExsvLJMD+xcHetTKhQ0vjA+01YT4gHzjqpJfXS9KkZGzhL05
	JYm206Th/37yvkgZrvz9jKjAk+P/hDpQLXEDJGCrNrI3NYUVMpOPV+sKhdgwi5zDFUvG
	V+q2t5koCaXHxkPN6lVb+oXgH1bdbd4YudZCC6ihj7T+cev8sit9iwyw6kPxTd8eIckY
	64l2/fgYwtUYMULfecqqmlVzRRUrcXfsJ1eAaAj1PXDoaG2MRyJa4xJ9DOvj2EMey7+7
	ikuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bjLXDkWUc/jPKkd1DYRmYv0XxBJNzxPbm+J0WcKkOUc=;
	b=fY/cDMVGYsDHNHVsXf4kkPC6+I8KAGnIfkGAqHOL1sGygOttwR8Zoc2jYU0aMJRl4c
	ctWyzWWPiGALGghFADfynCPwHpspNJ2sr44Ryi5LAeuL0VqhrjV0ifazLV+HVzyUwZ+L
	+2F09mweKc1J7Tr0v1vzMQ+JWvrM0p4f+7VBKI3Mj16pdRgPK9oZJs6rwHdK3Ge9eOTH
	2vAzCNd+jrNLnQ20c7nYuX4/tFTAn7eLstk2+xtULe5L2U4oBkShUED2v3+5mL93jjCp
	OSUvMBIzGrfBwAkuFzJVg+uPJxxLS+OuKMzbeTtgLVsWEV9b3XbfoqhSkNlDmy0HReLl
	S66g==
X-Gm-Message-State: AHPjjUhLHt1/GkOmf7SyVgyQ0+EBUl3vEsqYcL1Kza4l4RVjtMxOUK3h
	M1sWNRpsJ+D7t/5Ih7BgCEg=
X-Google-Smtp-Source: AOwi7QAt6YXhe7IJAvbaxgo+rQO/5N/a3RlnqqiXhikYId5jw937WHmyqf2BLZ4scFldyabBKC929A==
X-Received: by 10.101.76.207 with SMTP id n15mr3563467pgt.120.1506581029726;
	Wed, 27 Sep 2017 23:43:49 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	j68sm1427449pfa.93.2017.09.27.23.43.42
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 23:43:48 -0700 (PDT)
Date: Thu, 28 Sep 2017 12:13:12 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170928064312.GA1544@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
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
	christoffer.dall@linaro.org, wtownsen@redhat.com,
	robin.murphy@arm.com, prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JJ8LNIBxJKWU

Hi Eric,


On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
> This series implements the emulation code for ARM SMMUv3.
> 
> Changes since v6:
> - DPDK testpmd now running on guest with 2 assigned VFs
> - Changed the instantiation method: add the following option to
>   the QEMU command line
>   -device smmuv3 # for virtio/vhost use cases
>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> - splitted the series into smaller patches to allow the review
> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
>   is isolated from the rest: last 2 patches, not for upstream.
>   This is shipped for testing/bench until a better solution is found.
> - Reworked permission flag checks and event generation
> e testing:
> - in dt and ACPI modes
> - virtio-net-pci and vhost-net devices using dma ops with various
>   guest page sizes [2]
> - assigned VFs using dma ops [3]:
>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
>   with guest and host page size equal (4kB)
> 
> Known limitations:
> - no VMSAv8-32 suport
> - no nested stage support (S1 + S2)
> - no support for HYP mappings
> - register fine emulation, commands, interrupts and errors were
>   not accurately tested. Handling is sufficient to run use cases
>   described above though.
> - interrupts and event generation not observed yet.

While testing with vfio-pci, observed that the below two  Qemu command,
results in two different behaviour. Is this expected by design ?

Case 1:
# -device vfio-pci,host=0002:01:00.3 -device smmuv3,caching-mode
 Here iommu is not attached to the pci bus in Qemu backend, since
 pci_setup_iommu is not called before vfio_realize.

Case 2:
# -device smmuv3,caching-mode -device vfio-pci,host=0002:01:00.3
This works as expected, iommu is attached to the pci bus.

> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> v7: https://github.com/eauger/qemu/tree/v2.10.0-SMMU-v7
> Previous version at:
> v6: https://github.com/eauger/qemu/tree/v2.10.0-rc2-SMMU-v6
> 
> References:
> [1] [RFC v2 0/4] arm-smmu-v3 tlbi-on-map option
>     https://lkml.org/lkml/2017/8/11/426
> 
> [2] qemu cmd line excerpt:
> -device smmuv3 \
> -netdev tap,id=tap0,script=no,downscript=no,ifname=tap0,vhost=off \
> -device virtio-net-pci,netdev=tap0,mac=6a:f5:10:b1:3d:d2,iommu_platform,disable-modern=off,disable-legacy=on \
> [3] use -device smmuv3,caching-mode
> 
> 
> History:
> v6 -> v7:
> - see above
> 
> v5 -> v6:
> - Rebase on 2.10 and IOMMUMemoryRegion
> - add ACPI TLBI_ON_MAP support (VFIO integration also works in
>   ACPI mode)
> - fix block replay
> - handle implementation defined SMMU_CMD_TLBI_NH_VA_AM cmd
>   (goes along with TLBI_ON_MAP FW quirk)
> - replay systematically unmap the whole range first
> - smmuv3_map_hook does not unmap anymore and the unmap is done
>   before the replay
> - add and use smmuv3_context_device_invalidate instead of
>   blindly replaying everything
> 
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
> 
> Eric Auger (18):
>   hw/arm/smmu-common: smmu base device and datatypes
>   hw/arm/smmu-common: IOMMU memory region and address space setup
>   hw/arm/smmu-common: smmu_read/write_sysmem
>   hw/arm/smmu-common: VMSAv8-64 page table walk
>   hw/arm/smmuv3: Wired IRQ and GERROR helpers
>   hw/arm/smmuv3: Queue helpers
>   hw/arm/smmuv3: Implement MMIO write operations
>   hw/arm/smmuv3: Event queue recording helper
>   hw/arm/smmuv3: Implement translate callback
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   hw/arm/smmuv3: Implement data structure and TLB invalidation
>     notifications
>   hw/arm/smmuv3: Implement IOMMU memory region replay callback
>   hw/arm/virt: Store the PCI host controller dt phandle
>   hw/arm/sysbus-fdt: Pass the VirtMachineState to the node creation
>     functions
>   hw/arm/sysbus-fdt: Pass the platform bus base address in
>     PlatformBusFDTData
>   hw/arm/sysbus-fdt: Allow smmuv3 dynamic instantiation
>   hw/arm/smmuv3: [not for upstream] add SMMU_CMD_TLBI_NH_VA_AM handling
>   hw/arm/smmuv3: [not for upstream] Add caching-mode option
> 
> Prem Mallappa (2):
>   hw/arm/smmuv3: Skeleton
>   hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
> 
>  default-configs/aarch64-softmmu.mak |    1 +
>  hw/arm/Makefile.objs                |    1 +
>  hw/arm/smmu-common.c                |  527 ++++++++++++++++
>  hw/arm/smmu-internal.h              |  105 ++++
>  hw/arm/smmuv3-internal.h            |  584 +++++++++++++++++
>  hw/arm/smmuv3.c                     | 1181 +++++++++++++++++++++++++++++++++++
>  hw/arm/sysbus-fdt.c                 |  129 +++-
>  hw/arm/trace-events                 |   48 ++
>  hw/arm/virt-acpi-build.c            |   63 +-
>  hw/arm/virt.c                       |    6 +-
>  include/hw/acpi/acpi-defs.h         |   15 +
>  include/hw/arm/smmu-common.h        |  123 ++++
>  include/hw/arm/smmuv3.h             |   80 +++
>  include/hw/arm/sysbus-fdt.h         |    2 +
>  include/hw/arm/virt.h               |   15 +
>  target/arm/kvm.c                    |   27 +
>  target/arm/trace-events             |    3 +
>  17 files changed, 2886 insertions(+), 24 deletions(-)
>  create mode 100644 hw/arm/smmu-common.c
>  create mode 100644 hw/arm/smmu-internal.h
>  create mode 100644 hw/arm/smmuv3-internal.h
>  create mode 100644 hw/arm/smmuv3.c
>  create mode 100644 include/hw/arm/smmu-common.h
>  create mode 100644 include/hw/arm/smmuv3.h
> 
> -- 
> 2.5.5
> 
> 

-- 
Linu cherian
