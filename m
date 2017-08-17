Received: by 10.223.183.22 with SMTP id l22csp2172148wre;
        Thu, 17 Aug 2017 06:40:52 -0700 (PDT)
X-Received: by 10.200.43.177 with SMTP id m46mr7355846qtm.189.1502977252080;
        Thu, 17 Aug 2017 06:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502977252; cv=none;
        d=google.com; s=arc-20160816;
        b=eOVaUBSpng5aqy2+9Kk6/MH57lof4r0lHhVt0FycVBqb9z+L83IJ+3DM6OMm8Z3zgv
         YVzLjH0SQpIKR0Dnk1K466NaP9saxNj1GR1biD/P2FUOnNJhXIfud4Yo3RNftbT0/NHi
         VS8AHEPco5y7RrQezxb8904GEj7PBbzhHOQjMqXaPSasI7etJ2m4wdsJ31WRAzZW8cbT
         66EUxgWkmDc8qAGFvmz93wfAmrsb3J4Y0YWoj7qpakrv51li7d288gdatzdDEHjONzCb
         qMi/q/FGZXhIK4/CD33Xegw3RjF8LCpvBMTEAk69WUjocDHnfIJU9/KbwnqwCuTPEG7V
         i/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=CBz69l0beCrO0+Y18mCzFPSF8y9Tr6w/+AaCsOOqUjQ=;
        b=m5hREwxRIq+d4Qp20safOjqtWdl+th5Uh8IEUk6chV6sG+thy0nrZLg3/hc+5g0jf9
         GzphhrVRCkhtzCGG0+80+FAwT6VtBqg71OF2e760GF1QxmuSZWtfKOBwKHz52CkAvLB+
         7iJfHCj8jrhLxp627y8WV5LsA1DOvIrcXGz94DQux1AuIGovJIqz2A+rCobemffja95P
         DaEBvyd9ygT79tTVkrzstzHTOewbpq3g1YIc2DbowryCq3tyCXCJ7NqwCYWhYH8ka2gE
         ZxHyGeO5yd5kZ13+sHa2NlS6l3itu+UBL/yc+4BAVCuXsN5tdTsU0zJ3TXnDb/5yWHKf
         uQLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jqss9hLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k45si3271838qtk.173.2017.08.17.06.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 06:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jqss9hLg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diL2X-000433-H1
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 09:40:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1diIwv-0006zp-0O
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 07:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1diIwr-00029K-0V
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 07:26:53 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:34070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1diIwq-00027x-NT; Thu, 17 Aug 2017 07:26:48 -0400
Received: by mail-pg0-x243.google.com with SMTP id y192so9427014pgd.1;
	Thu, 17 Aug 2017 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CBz69l0beCrO0+Y18mCzFPSF8y9Tr6w/+AaCsOOqUjQ=;
	b=jqss9hLg3ypPxWH1uBvLBqUscgmqB5U+PqSKVN9zMDfShRqVeju8OaodkT7hmed54K
	zuJfCJc5tdi+6IV2+qk+zdCvHfgPyOT8Xw+1Mjw0WjbGeDwoKQb/ASGCLenDOcCyGrWd
	dqc5aEXhN0aH4lYc7eKBrqNvR87Oek8LjQqx2JnqtwmakMoP+w996amI6i0a+ujiJ2PA
	c2tRg1sym15h+z07VkSuvRMB9R0CzVWz8INZ6crF/vNpDEC0sFpj9xFHol/m9gtNxudE
	mzumnnrYP1yHXh1yk9OiCh3x8/HuQm1IPdAJPiBcOKfPO89m1VfdQv9w6U4VaiT8J0IR
	I5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CBz69l0beCrO0+Y18mCzFPSF8y9Tr6w/+AaCsOOqUjQ=;
	b=pSdRHmI5dXRgGldlDFgs36vnXGd5dFnV5xnQx9hWuGmckyjxUTMwcIV9T+0RkTSj1U
	XX4fchN9ETRpUyMoqpvCsHOHIOxN+7dW6rXayzoSKMmuv3/CCC6QhsKcVhRe/v5jOKb0
	t+sl2YbJEvuCNM/gem1xXBfLMMjg3oPAsqMpcA4mvcPGPYGUMu8Dlf3maKBIytldvI8p
	8lLVbe0fPNax76bKyR5L0jSbAUT7X95wn7aKcO+0bIt9E2lwyKrV5gTSpiGwfORStB24
	OG1wHEIgzplxSon3CZ4yC14LP8k7xqZP4I5IM2CF3cM8IwjAHqMtzBbyqjp7iUvF7fQv
	Aa8Q==
X-Gm-Message-State: AHYfb5jWRjxKkBD/uapC8QE7lIqadaKV571w4QGHppdhvtD9veU6D+cu
	ScmFEftjg87JCQ==
X-Received: by 10.98.82.197 with SMTP id g188mr4989014pfb.34.1502969204928;
	Thu, 17 Aug 2017 04:26:44 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	q185sm6636891pfb.119.2017.08.17.04.26.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 17 Aug 2017 04:26:43 -0700 (PDT)
Date: Thu, 17 Aug 2017 16:56:27 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170817112627.GA5417@virtx40>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
X-Mailman-Approved-At: Thu, 17 Aug 2017 09:40:41 -0400
Subject: Re: [Qemu-arm] [RFC v3 0/8] VIRTIO-IOMMU device
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, drjones@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	marc.zyngier@arm.com, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, linu.cherian@cavium.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9Ubd8DM6R3a

Hi Eric,

On Tue Aug 01, 2017 at 11:33:06AM +0200, Eric Auger wrote:
> This series implements the virtio-iommu device.
> 
> This v3 mostly is a rebase on top of v2.10-rc0 that uses
> IOMMUMmeoryRegion plus some small fixes.
> 
> This is a proof of concept based on the virtio-iommu specification
> written by Jean-Philippe Brucker [1].
> 
> The device gets instantiated using the "-device virtio-iommu-device"
> option. It currently works with ARM virt machine only, as the machine
> must handle the dt binding between the virtio-mmio "iommu" node and
> the PCI host bridge node.
> 
> ACPI booting is not yet supported.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3
> 
> References:
> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
> 
> Testing:
> - >= 4.12 guest kernel + virtio-iommu driver [2]
> - guest using a virtio-net-pci device:
>   ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on

Was trying to test this out and facing issues.
Guest and Host Kernel - git://linux-arm.org/linux-jpb.git, Branch virtio-iommu/v0.4
Qemu - As mentioned above.

Relevant Qemu command - -device virtio-iommu-device \
-netdev type=tap,id=eth0,ifname=tap0,vhost=off,script=no,downscript=no \
-device virtio-net-pci,netdev=eth0,iommu_platform,disable-modern=off,disable-legacy=on

Issue:
Though guest boots with virtio-iommu device probe succuessful,
virtio net device probe gets failed.

928763] virtio_iommu virtio0: aperture: 0x0-0xffffffffffffffff
[    0.933145] virtio_iommu virtio0: page mask: 0xfffffffffffff000
[    0.937333] virtio_iommu virtio0: probe successful

...

virtio_net: probe of virtio2 failed with error -12"


Even before this failure, i did saw couple of repeated warnings.

73085] ------------[ cut here ]------------
[    2.576330] WARNING: CPU: 0 PID: 49 at drivers/iommu/dma-iommu.c:904 iommu_dma_map_msi_msg+0x1dc/0x1f4
[    2.582963] Modules linked in:
[    2.585210] CPU: 0 PID: 49 Comm: kworker/0:1 Tainted: G        W       4.13.0-rc1-gd1949df-dirty #14
[    2.591733] Hardware name: linux,dummy-virt (DT)
[    2.595062] Workqueue: events deferred_probe_work_func
[    2.598777] task: ffff80003e0c0d80 task.stack: ffff80003e104000
[    2.603036] PC is at iommu_dma_map_msi_msg+0x1dc/0x1f4
[    2.606745] LR is at iommu_dma_map_msi_msg+0x1dc/0x1f4
....
snip
....
   2.735988] [<ffff000008658b18>] iommu_dma_map_msi_msg+0x1dc/0x1f4
[    2.740429] [<ffff00000858846c>] its_irq_compose_msi_msg+0x5c/0x68
[    2.744869] [<ffff00000811e3f4>] irq_chip_compose_msi_msg+0x5c/0x74
[    2.749378] [<ffff000008123d04>] msi_domain_activate+0x24/0x4c
[    2.753577] [<ffff0000081202fc>] __irq_domain_activate_irq+0x48/0x54
[    2.758151] [<ffff00000812231c>] irq_domain_activate_irq+0x2c/0x48
[    2.762593] [<ffff0000081242cc>] msi_domain_alloc_irqs+0x150/0x214
[    2.767038] [<ffff0000085c4edc>] pci_msi_setup_msi_irqs+0x5c/0x68
[    2.771560] [<ffff0000085c5544>] __pci_enable_msix+0x41c/0x4c0
[    2.775778] [<ffff0000085c5d1c>] pci_alloc_irq_vectors_affinity+0xac/0x160
[    2.780709] [<ffff0000085ff6e4>] vp_find_vqs_msix+0x148/0x440
[    2.784848] [<ffff0000085ffa8c>] vp_find_vqs+0xb0/0x1b8
[    2.788624] [<ffff0000085fe798>] vp_modern_find_vqs+0x50/0xa8
[    2.792768] [<ffff000008723454>] init_vqs+0x394/0x600
[    2.796417] [<ffff000008723b50>] virtnet_probe+0x3c4/0x77c
[    2.800370] [<ffff0000085fa738>] virtio_dev_probe+0x198/0x230
[    2.804507] [<ffff00000866aa38>] driver_probe_device+0x298/0x440
[    2.808827] [<ffff00000866ae00>] __device_attach_driver+0x9c/0x140
[    2.813269] [<ffff0000086686c8>] bus_for_each_drv+0x68/0xa8
[    2.817283] [<ffff00000866a5e4>] __device_attach+0xcc/0x15c
[    2.821299] [<ffff00000866aec8>] device_initial_probe+0x24/0x30
[    2.825558] [<ffff00000866994c>] bus_probe_device+0x9c/0xa4
[    2.829574] [<ffff000008667328>] device_add+0x378/0x5c8
[    2.833344] [<ffff0000086675a0>] device_register+0x28/0x34
[    2.837302] [<ffff0000085fa22c>] register_virtio_device+0xbc/0x10c
[    2.841747] [<ffff0000085ff2cc>] virtio_pci_probe+0xdc/0x14c
[    2.845822] [<ffff0000085abf8c>] local_pci_probe+0x50/0xb4
[    2.849784] [<ffff0000085acd8c>] pci_device_probe+0x168/0x178
[    2.853926] [<ffff00000866aa38>] driver_probe_device+0x298/0x440
[    2.858243] [<ffff00000866ae00>] __device_attach_driver+0x9c/0x140
[    2.862681] [<ffff0000086686c8>] bus_for_each_drv+0x68/0xa8
[    2.866692] [<ffff00000866a5e4>] __device_attach+0xcc/0x15c
[    2.870707] [<ffff00000866aec8>] device_initial_probe+0x24/0x30
[    2.874966] [<ffff00000866994c>] bus_probe_device+0x9c/0xa4
[    2.878982] [<ffff000008669f68>] deferred_probe_work_func+0xa0/0xec
[    2.883487] [<ffff0000080db09c>] process_one_work+0x160/0x384
[    2.887623] [<ffff0000080db4b4>] worker_thread+0x1f4/0x3d8
[    2.891577] [<ffff0000080e1b48>] kthread+0x10c/0x138
[    2.895165] [<ffff0000080833b0>] ret_from_fork+0x10/0x20


Am i missing something ?


> 
> History:
> v2 -> v3:
> - rebase on top of 2.10-rc0 and especially
>   [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
> - add mutex init
> - fix as->mappings deletion using g_tree_ref/unref
> - when a dev is attached whereas it is already attached to
>   another address space, first detach it
> - fix some error values
> - page_sizes = TARGET_PAGE_MASK;
> - I haven't changed the unmap() semantics yet, waiting for the
>   next virtio-iommu spec revision.
> 
> v1 -> v2:
> - fix redifinition of viommu_as typedef
> 
> 
> Eric Auger (8):
>   update-linux-headers: import virtio_iommu.h
>   linux-headers: Update for virtio-iommu
>   virtio_iommu: add skeleton
>   virtio-iommu: Decode the command payload
>   virtio_iommu: Add the iommu regions
>   virtio-iommu: Implement the translation and commands
>   hw/arm/virt: Add 2.10 machine type
>   hw/arm/virt: Add virtio-iommu the virt board
> 
>  hw/arm/virt.c                                 | 116 ++++-
>  hw/virtio/Makefile.objs                       |   1 +
>  hw/virtio/trace-events                        |  14 +
>  hw/virtio/virtio-iommu.c                      | 670 ++++++++++++++++++++++++++
>  include/hw/arm/virt.h                         |   5 +
>  include/hw/virtio/virtio-iommu.h              |  61 +++
>  include/standard-headers/linux/virtio_ids.h   |   1 +
>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
>  linux-headers/linux/virtio_iommu.h            |   1 +
>  scripts/update-linux-headers.sh               |   3 +
>  10 files changed, 1005 insertions(+), 9 deletions(-)
>  create mode 100644 hw/virtio/virtio-iommu.c
>  create mode 100644 include/hw/virtio/virtio-iommu.h
>  create mode 100644 include/standard-headers/linux/virtio_iommu.h
>  create mode 100644 linux-headers/linux/virtio_iommu.h
> 
> -- 
> 2.5.5
> 
> 

-- 
Linu cherian
