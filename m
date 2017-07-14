Received: by 10.25.44.15 with SMTP id s15csp562251lfs;
        Fri, 14 Jul 2017 00:19:27 -0700 (PDT)
X-Received: by 10.55.157.135 with SMTP id g129mr8968789qke.241.1500016766993;
        Fri, 14 Jul 2017 00:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500016766; cv=none;
        d=google.com; s=arc-20160816;
        b=uuFC24Tn6E1COTVcOaQhKCpD76Ls70bInLc/90Dm19TlCd+NG4sSP8dElj8fXFBu85
         YeXOs6W16byGTTr2Ygr5iyy1RSsN30NRWwv6uZDJHnjfQiCktbwZt9Zd/MY7vWWMD7Pl
         OCbb9BCZG268ld84mFXycZkdLzGJuj1t9pXBpDXBRHThtCawupJcmKuGCjbTLmEXMF9P
         bsV1U4piQDKxTD16Xb3+HQmp3wvrk4ioj/iivwdKEqxNi3fC39fj7LTpfoBMtVm1A9t8
         EF8G1J1/tEfNlqdAmxGPGe842p4mBRmbO0wrcy+HMr0KFjs7FKh1IntTeAxL34WE22CC
         SS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=HlTJ2B/h0IpbQKT4XHJo32XH+rhbyfOjm+aVZ9+/DiE=;
        b=YzhZ1VVZRtuONHYmFND+epCS/3wUQsAHrFZcTk19whSKOAjuHqB7vB3+lzZaP4MksT
         Ro8Ap25nC+ZtZER3eMTrpXrXqvVMUcClXC0hZHYv/6zvYb1h4IydcpQHdynAoMJw45+3
         OtyGdEH2Gqzw3a2Ymfrd1yEUQd9Tu76SNNBn74WOPZMul+X3f93BZES4PPFOgtkTjR10
         PTZqSqGsv2TB/Ha3Zue80HBsr2seEqmmwV37hP7ptJoq5ezPHIYOgXcuTrqUIARUSUy8
         Pu94IqAdRXRD5jX4tpjsMyExDgs3iteVkdkpL+KDHcwSyOSjyHaGJ+XiXCsKnsQ+Wjow
         17Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=TMaBNXIx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h94si7041132qtd.295.2017.07.14.00.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 00:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=TMaBNXIx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVusm-0008Fh-8P
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 03:19:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVush-0008FX-Fi
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 03:19:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVuse-0006LN-B3
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 03:19:19 -0400
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:36207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tn@semihalf.com>) id 1dVuse-0006L1-04
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 03:19:16 -0400
Received: by mail-lf0-x22f.google.com with SMTP id h22so48805139lfk.3
	for <qemu-arm@nongnu.org>; Fri, 14 Jul 2017 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=semihalf-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HlTJ2B/h0IpbQKT4XHJo32XH+rhbyfOjm+aVZ9+/DiE=;
	b=TMaBNXIxnLlztnqNRCIqYT1PGSIrue+hc9ab6zXUf7ap4pGdxV4zAZFWDoI78NS4if
	EyQJmEv5ZEXDW570xWzDzvQoSoFxhkr2IR1wF4vHBb5YdhhfT//YxH+f7f5dxxPKw+4r
	JFzqOxm5xoKpqaiEbCAwvV6w+w1L3hasWpiQsWB23rVaVo//GKwxU3XnB7St+ZWY8Wax
	WniCYyXuFhufTfOhnLnQgt8ue2n8jJiWeCWuPAW8pyIJYNpmZ++epEWpeyldJCEbL+cV
	ey5LK+PXKES8IUC43haSM9S8LpAj/CPoMFki8/rxVix09mpAKbG9r+ZCnbmTvWhGTvFg
	wqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HlTJ2B/h0IpbQKT4XHJo32XH+rhbyfOjm+aVZ9+/DiE=;
	b=DNt4HnyDCvgPAIq9f4Co5rQr44a8vLnthFeumkDjdjbCYSA66rT+weI912ahly62Jm
	lrHXByJ8vSNmxLJnGG1pIJxlAi31gi3SNxCkehwQm407XjFmJpB/9zSzIgw8ZuhRlXX0
	1XTgOEvcZmcPk+3H9c93xpcSycXlxBpZO5h7bpKDpgGOzb3pehhqAxqXBRsx56W9k66T
	8qu1n59Dg5HbkFuxZK997fB5pVzTIqQe2U45mQnM2xPuWJMBvLfT/a286EzkCLL88muO
	zvcXn0CTI/LflAJ8+GvhrU3YFJoPRsEex/BaUtz0L1uL2+ArmfR1UC+n25dsUXTwHHuk
	IQBg==
X-Gm-Message-State: AIVw113euCD2XvssAVrjmo/sQ49aGSy5qd1k8X3V5s5UdpWkumTjYfDi
	rdAYyQsOPWa0uXNu
X-Received: by 10.46.14.18 with SMTP id 18mr370358ljo.41.1500016754549;
	Fri, 14 Jul 2017 00:19:14 -0700 (PDT)
Received: from [192.168.2.100] (user-94-254-147-63.play-internet.pl.
	[94.254.147.63]) by smtp.googlemail.com with ESMTPSA id
	99sm1826632lfp.46.2017.07.14.00.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 00:19:13 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tn@semihalf.com>
Message-ID: <0686a7f3-1ca5-f63e-01a1-a7982073b517@semihalf.com>
Date: Fri, 14 Jul 2017 09:19:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22f
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
	robin.murphy@arm.com, will.deacon@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Trt5IyHg8Ile

Hi Eric,

With fixes in comments that I made, I was able to run VM with 
virtio-blk-pci and virtio-net-pci devices.

I have tried vhost-net as well but I am seeing outgoing packets payload 
corrupted from host perspective, tcpdump on host tun i/f shows zeroes in 
packet payload. However, tcpdump in VM shows that packets are fine. Have 
you seen anything like that? Packets incoming to VM are fine though. I 
will keep debugging on my side too.

Thanks,
Tomasz

On 09.07.2017 22:51, Eric Auger wrote:
> This series implements the emulation code for ARM SMMUv3.
> This is the continuation of Prem's work [1].
> 
> This v5 mainly brings VFIO integration in DT mode. On guest kernel
> side, this requires a quirk [1] to force TLB invalidation on map.
> 
> The following changes also are noticeable:
> - fix SMMU_CMDQ_CONS offset
> - adds dma-coherent dt property which fixes the unhandled command
>    opcode bug.
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
>    virtio-net-pci device (using dma ops). Tested with the following
>    guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
>    64K - 48b.
> - booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
>    - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>    - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
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
>    not accurately tested. Handling is sufficient to run use cases
>    described hereafter though.
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
>    to be split into sub patches.
> 
> v3 -> v4 [Eric]:
> - page table walk rewritten to allow scan of the page table within a
>    range of IOVA. This prepares for VFIO integration and replay.
> - configuration parsing partially reworked.
> - do not advertise unsupported/untested features: S2, S1 + S2, HYP,
>    PRI, ATS, ..
> - added ACPI table generation
> - migrated to dynamic traces
> - mingw compilation fix
> 
> v2 -> v3 [Eric]:
> - rebased on 2.9
> - mostly code and patch reorganization to ease the review process
> - optional patches removed. They may be handled separately. I am currently
>    working on ACPI enablement.
> - optional instantiation of the smmu in mach-virt
> - removed [2/9] (fdt functions) since not mandated
> - start splitting main patch into base and derived object
> - no new function feature added
> 
> v1 -> v2 [Prem]:
> - Adopted review comments from Eric Auger
>          - Make SMMU_DPRINTF to internally call qemu_log
>              (since translation requests are too many, we need control
>               on the type of log we want)
>          - SMMUTransCfg modified to suite simplicity
>          - Change RegInfo to uint64 register array
>          - Code cleanup
>          - Test cleanups
> - Reshuffled patches
> 
> v0 -> v1 [Prem]:
> - As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
> - Reworked register access/update logic
> - Factored out translation code for
>          - single point bug fix
>          - sharing/removal in future
> - (optional) Unit tests added, with PCI test device
>          - S1 with 4k/64k, S1+S2 with 4k/64k
>          - (S1 or S2) only can be verified by Linux 4.7 driver
>          - (optional) Priliminary ACPI support
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
>    hw/arm/smmu-common: smmu base class
>    hw/arm/virt: Add 2.10 machine type
>    hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
>    target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>    hw/arm/smmuv3: VFIO integration
> 
> Prem Mallappa (3):
>    hw/arm/smmuv3: smmuv3 emulation model
>    hw/arm/virt: Add SMMUv3 to the virt board
>    hw/arm/virt-acpi-build: Add smmuv3 node in IORT table
> 
>   default-configs/aarch64-softmmu.mak |    1 +
>   hw/arm/Makefile.objs                |    1 +
>   hw/arm/smmu-common.c                |  474 +++++++++++++
>   hw/arm/smmu-internal.h              |   89 +++
>   hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
>   hw/arm/smmuv3.c                     | 1256 +++++++++++++++++++++++++++++++++++
>   hw/arm/trace-events                 |   54 ++
>   hw/arm/virt-acpi-build.c            |   56 +-
>   hw/arm/virt.c                       |  111 +++-
>   include/hw/acpi/acpi-defs.h         |   15 +
>   include/hw/arm/smmu-common.h        |  127 ++++
>   include/hw/arm/smmuv3.h             |   87 +++
>   include/hw/arm/virt.h               |    5 +
>   target/arm/kvm.c                    |   28 +
>   target/arm/trace-events             |    3 +
>   15 files changed, 2949 insertions(+), 9 deletions(-)
>   create mode 100644 hw/arm/smmu-common.c
>   create mode 100644 hw/arm/smmu-internal.h
>   create mode 100644 hw/arm/smmuv3-internal.h
>   create mode 100644 hw/arm/smmuv3.c
>   create mode 100644 include/hw/arm/smmu-common.h
>   create mode 100644 include/hw/arm/smmuv3.h
> 

