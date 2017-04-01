Received: by 10.25.15.230 with SMTP id 99csp3302588lfp;
        Fri, 31 Mar 2017 18:00:13 -0700 (PDT)
X-Received: by 10.237.62.130 with SMTP id n2mr6346813qtf.40.1491008413387;
        Fri, 31 Mar 2017 18:00:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si6059207qkh.230.2017.03.31.18.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Mar 2017 18:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cu7Ok-0006PC-Mc
	for alex.bennee@linaro.org; Fri, 31 Mar 2017 21:00:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohun106@gmail.com>) id 1cu7L3-0003de-LY
	for qemu-devel@nongnu.org; Fri, 31 Mar 2017 20:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohun106@gmail.com>) id 1cu7L2-0005ua-Gh
	for qemu-devel@nongnu.org; Fri, 31 Mar 2017 20:56:21 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:33732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mohun106@gmail.com>)
	id 1cu7Ky-0005oT-7p; Fri, 31 Mar 2017 20:56:16 -0400
Received: by mail-pg0-x242.google.com with SMTP id 79so20702184pgf.0;
	Fri, 31 Mar 2017 17:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XExy4PQwmjFvB3c39ioVHcpfP8IAbt4/cBdh2UX0/y4=;
	b=Vk97LQelbkuDJK2Y08u6mdTnVADHW6CMkVuNq2AWGoqCYknspPDq05jsExNjR/fYXw
	/V2qXyfuMU5NpGxLjep9qIZwTgNtP6PhjVXuPNuijHeHelDa+JAMZSAbnaWlFisauQk6
	RXPrZfplSeiWoNcWbk8psQki2jX8lM54EyWfFWCon+0Km0bHsy24mQ3VccmO7MjoR3QF
	hv9gZYnSFqGrj5yI+YGMtdHL9htU5hZJQZJOckSb8EmrOp0CYy6OWaKltonwfQY9OM/J
	O9cPBlOhWxXRA0ZXsN6J3w4iJh4wnp3fqO78OTLQuwJU4qpW7IdqpU88XgIi6ypf+mu0
	CtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XExy4PQwmjFvB3c39ioVHcpfP8IAbt4/cBdh2UX0/y4=;
	b=VA4qhPhjDz9B32ztRQL5VOQ7QPp9jW5CqqU8qmL55V5VjcuNvpZJlFPN05gfkZ94xQ
	+H9TXwmPsjcTkFC9bwp0q5KJ8o/CUUUFWdHJsZllhYr2uvahgoZmuGnQdaUKJLwZnDmv
	F4zGCUM2ke4fEuv3HOnOdSi9fsq915WjcIJoMFPQWbECunrixn8AEpAgaaQu86tD0Ky2
	pM3mlBsmoEzUa0VRwPnxx1KCmjHdkJ8OtCVtZPdYuPX5tRIHY6leHedDYztUvq7XH/q8
	4XbceSC1oIBbw6zABG637mpnjHHNI1bd/WQDq5WD8mNpYw3hnnAmCvMSz3o/MyHFJg+w
	WJFg==
X-Gm-Message-State: AFeK/H20gn8hD6QfqSTHWUMAXgwkQqH6/GOGJNwi8BSxbcRqk2BJugUOUsHTUCw+H827CotRpSGfRw8oThHWOg==
X-Received: by 10.98.204.88 with SMTP id a85mr5207208pfg.205.1491008175094;
	Fri, 31 Mar 2017 17:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.161.235 with HTTP; Fri, 31 Mar 2017 17:56:14 -0700 (PDT)
In-Reply-To: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
References: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
From: Radha Mohan <mohun106@gmail.com>
Date: Fri, 31 Mar 2017 17:56:14 -0700
Message-ID: <CAC8NTUVH1--3o812m5rUamLK_3tqX5p7=t-vDbrAcGsjQV0JtQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [RFC v3 0/5] SMMUv3 Emmulation Support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Drew Jones <drjones@redhat.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, edgar.iglesias@gmail.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGdZ0rTdMVrc

Hi Eric

On Thu, Mar 30, 2017 at 12:42 PM, Eric Auger <eric.auger@redhat.com> wrote:
> This series introduces the emulation code for ARM SMMUv3.
> This is the continuation of Prem's work [1].
>
> At the moment only AArch64 translation format is supported, ie.
> no support for AArch32 (LPAE) translation.
>
> stage1, stage2 and stage1 + Stage2 are supposed to work but I only
> tested stage 1 at the moment.
>
> I will do the comprehensive inventory of unsupported features in
> next version.
>
> As reported by Edgar, TBUs are not modeled properly and this will be
> addressed in next respin.
>
> Don't spend too much time reviewing this version. This is just a rebase
> plus some cleanups done while getting familiar with the code structure.
> I will try to move as much in the base class and reuse Xilinx code when
> sensible.
>
> Best Regards
>
> Eric
>
> Testing:
> - booted a 4.11-rc4 guest in dt mode with virtio-pci device
>
> References:
> [1] Prem's last iteration:
> - https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html
>
> History:
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
>
> Eric Auger (2):
>   hw/arm/smmu-common: smmu base class
>   hw/arm/virt: Add 2.10 machine type
>
> Prem Mallappa (3):
>   log: Add new IOMMU type
>   hw/arm/smmuv3: smmuv3 emulation model
>   hw/arm/virt: Add SMMUv3 to the virt board
>
>  default-configs/aarch64-softmmu.mak |    1 +
>  hw/arm/Makefile.objs                |    1 +
>  hw/arm/smmu-common.c                |  193 ++++++
>  hw/arm/smmuv3-internal.h            |  544 +++++++++++++++++
>  hw/arm/smmuv3.c                     | 1131 +++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c                       |  109 +++-
>  include/hw/arm/smmu-common.h        |  151 +++++
>  include/hw/arm/smmuv3.h             |   88 +++
>  include/hw/arm/virt.h               |    5 +
>  include/hw/compat.h                 |    3 +
>  include/qemu/log.h                  |    1 +
>  util/log.c                          |    2 +
>  12 files changed, 2227 insertions(+), 2 deletions(-)
>  create mode 100644 hw/arm/smmu-common.c
>  create mode 100644 hw/arm/smmuv3-internal.h
>  create mode 100644 hw/arm/smmuv3.c
>  create mode 100644 include/hw/arm/smmu-common.h
>  create mode 100644 include/hw/arm/smmuv3.h
>
> --
> 2.5.5

Did a quick test with 4.10.1 guest and 4.11-rc3 host.

~# qemu-system-aarch64 -cpu host -enable-kvm -M virt,gic_version=3
-nographic -smp 1 -m 2048 -drive
if=none,id=hd0,file=/root/zesty-server-cloudimg-arm64.img,id=0 -device
virtio-blk-device,drive=hd0 -pflash /root/flash0.img -pflash
/root/flash1.img -device vfio-pci,host=0000:13:00.1 -M virt,smmu=on
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 0
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 1000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 2000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 3000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 4000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 5000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 6000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 7000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 8000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area 9000
..
..
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: iommu map to
non memory area fff000
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
vfio_dma_map(0x1d52e600, 0x40000000, 0x0, 0xffff17e00000) = -22
(Invalid argument)
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
vfio_dma_map(0x1d52e600, 0x40001000, 0x0, 0xffff17e01000) = -22
(Invalid argument)
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1: VFIO_MAP_DMA: -22
qemu-system-aarch64: -device vfio-pci,host=0000:13:00.1:
vfio_dma_map(0x1d52e600, 0x40002000, 0x0, 0xffff17e02000) = -22
(Invalid argument)
..
..

And this goes on until I kill the qemu process.

>
>
