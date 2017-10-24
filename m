Received: by 10.223.161.27 with SMTP id o27csp241068wro;
        Mon, 23 Oct 2017 22:38:37 -0700 (PDT)
X-Received: by 10.37.219.12 with SMTP id g12mr9912174ybf.374.1508823517038;
        Mon, 23 Oct 2017 22:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508823517; cv=none;
        d=google.com; s=arc-20160816;
        b=OcYe9t5rNnT86/STpGiGsxT7rYud9rvvNsAVZRzWSz8XhSov4WJX7ESt54VCXJRNLc
         HWIcmZstN+qDetRK+uKqIAGv+AFGSbQR2Dn48sNwQV7WcxT/hRYIj5GNGjbofvJICJy1
         hQTLj1w09qkjFDzkZCUKTfbitZg3DnQcBdZRRfK/ieIQ4gpOJwaqRjIphLmG6HjpFuaW
         wAHzZxbY4OBUZkY/rUYbWxqSw3pBie9ie+0gZ/wS+cUFpLxc8yO3KB14wk3LYvz+4eXz
         f3/dlmaj1Yb0gnFZsFBO5m3lIC6hXsJlwhVRP4O5Ad3zZPsMjKNYKwRx+8mvYiBNmCJF
         nJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=12SIl3oXpLdlAsfzxlD/pF84P3RPRZhrEdPxtme7ISc=;
        b=uW4y/zrTOk0UwyodaG5kLRyMo+eJTOkTwzBtEo6TYaDe2nl24BiK7oJ4zf+Mi8eQaN
         9dANWnKkWLXR2tdil0CR7fIuHkPVqefj7GD3fZvALP6smstji/vXZv4nByPu20jqOoew
         Aq2DzW2F3RisdsUIW1hfIsIls+b6kgHyG8MqI11bWQRNCSI5pz1L/KoeHSgdxuNs0FyZ
         XtGv9y9r+HhCEfn+uH1AVwZBr/3yLbGEYiUUX+1trI536T373LW5mjZF4V1z1pl3jL+z
         /lAi8xLkdzx5Mpvv+Pp9i+muO+aIFGawIgmmntKYvL2WUbD2brGcuCRIj5JdYkCLpfJp
         nwqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o7awFPyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189si1533149ywc.489.2017.10.23.22.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 22:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o7awFPyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6rvA-0006J1-Gh
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 01:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e6ruy-0006Iv-Bg
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 01:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e6ruu-0006n9-B5
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 01:38:24 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:47739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1e6ruu-0006mo-3F; Tue, 24 Oct 2017 01:38:20 -0400
Received: by mail-pg0-x243.google.com with SMTP id r25so13642277pgn.4;
	Mon, 23 Oct 2017 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=12SIl3oXpLdlAsfzxlD/pF84P3RPRZhrEdPxtme7ISc=;
	b=o7awFPyIXyZyUUD393TlbTFDdPDv0anWw0i6hDhFqqcf0IN+gzhFnl6t4kBHpCD2N7
	8V8s16A9rgXtJ5fhzmepxcnLSYcq+V9al5O2dTx9MZGDiMOOjxTsuoE81/OIrrH+zSvd
	PvQUFSxFy71FzirFI+xwzaaZzQxmDdYjw/RpxCELVU+6oG41ZQlAfZ5XDfzv5LDk9M+8
	d1mipIbUUmuQLuY3b7untOK5HPxBvXwRXvtnAsKESrQKDkcIR4MRrLn5O84wOBY+IqfM
	1ZHHrndx2c/nSE6WUcphW6Uzrun8Mc+2Vc8YzWY10nUn3BTzTYj8w/2xjWLCUkNszrXP
	5nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=12SIl3oXpLdlAsfzxlD/pF84P3RPRZhrEdPxtme7ISc=;
	b=amdFLS8Bh8eGWCb1ZHD2Wxy6kgIdz2ZpZtmN3zObQQfNhVtwtwVZOTVGyzkECq3Rh5
	msHqsK3Xc/qq+AVp/JoYU9o6826cEL61dkI7/3BdSDW4UVDNVBQsQg7wvliODbv53WNT
	c81hsGAq42Kg9Rkc21nzB4IZUwNMrzQFxsIkAzsi+BkSgeLXeTrsEJsSZD4y+arVQtZ5
	XpxfbXDDS2JaxRJb/MOaAwPvGxNvdFE1gpaXL8ZiXB+FPxISw+gKd2JKM+BdDQdbQRyi
	o748nmAlklgxJfmSUjaiBNcrAhPG2t6j7KcJHPGEU/CimUGvVayyCabnMQYYZXV+TU+G
	totA==
X-Gm-Message-State: AMCzsaVnURqSoc5nxlJNW8hRvvvjDBgiACVKRWFtrERnATYCG7TFn5dk
	d8bIt/KsrHYcF0BuvuGjw64=
X-Google-Smtp-Source: ABhQp+Ql1pCuEgVxSIYQPGoXDShx3KQKtMhw2u68h3NT3nTwwWvQAfBpavcBuKIUQZhD2c3o7i/pIQ==
X-Received: by 10.98.201.87 with SMTP id k84mr15662247pfg.109.1508823498682;
	Mon, 23 Oct 2017 22:38:18 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	r77sm17241333pfk.93.2017.10.23.22.38.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 23 Oct 2017 22:38:17 -0700 (PDT)
Date: Tue, 24 Oct 2017 11:08:02 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20171024053802.GA22835@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
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
X-TUID: FP4r7vcOCA11

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
> 
> testing:
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
> 
> Best Regards
> 
> Eric
>

Was looking at options to get rid of the existing hacks we have
in this implementation (last two patches) and also to reduce the map/unmap/translation 
overhead for the guest kernel devices.

Interestingly, the nested stage translation + smmu emulation at kernel
 that we were exploring, has been already tried by Will Deacon. 
https://www.linuxplumbersconf.org/2014/ocw/system/presentations/2019/original/vsmmu-lpc14.pdf
https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg03379.html


It would be nice to understand, why this solution was not pursued atleast for vfio-pci devices.
OR
If you have already plans to do nested stage support in the future, would be interested to know 
about it.



 
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
