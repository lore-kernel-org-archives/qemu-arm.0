Received: by 10.223.150.237 with SMTP id u100csp3056266wrb;
        Mon, 13 Nov 2017 17:16:38 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYQuKhs5xOC3F0WFvE5gqdSyl0oqPDSkMK/vG60IHuxR3cUV1l+8V/GWgAi0yquoH257NFE
X-Received: by 10.37.54.32 with SMTP id d32mr4813287yba.357.1510622198089;
        Mon, 13 Nov 2017 17:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510622198; cv=none;
        d=google.com; s=arc-20160816;
        b=gXF7kQdP7O5jAEXaWNI5ieqMmY8dT4HX9VmqHRO5fLZcjzehZ8IPuJRFhTWjmKfghV
         XNbiNAmQyPpEFdt/haXYMVGpCBD+xo09TSNBSyV7ETd9eGv7IYfchR4LTQnVEzbJp8eP
         0PF2ZZ2ZonWySBu6Fbf6Mvm6YQjPQw5BfJxHdEos4DcLu8pDtBEupjBbIH/0gJPdP0c2
         HEzret7QWgU4TrsjmuzDtK2AVwk0X2voX9tedMW//m8pb6KK8MSG517OfUPBR8iK3SW6
         SEKY3Oll0uNEmw0pTLXFgU5rbtRsfqhv2iIOVx6P6BLWqL2SYw8pLq81AxyZvVSL0xWA
         e5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=xoZO4HrHXn7FTzq2TwuHuqgqlBRMK+o7B0YcjQMUdQo=;
        b=azsj0HeybDsS2dtXRl6xzIzkdiDjmoJU1soaHKG1vbFlBEx3W+mKCkFF2cIe00A1eR
         u69B4pN3vWZe+Szvk4DGSwTk736lJU6FVgktzh/f6NuKsN02fN8sBIqpgLDbILaohNWB
         Y2na5+ad2gPjsi8SYO7ZtqFf4i8u7cuwX/o5yqSQ0encO/FUugg7SVuANCCBdbQFXWUs
         gZQrt9bHKe3Xb+d2GL0BRwzS0flGbpz6DINUzKZaam6XJhGqVr14Lt9HQfazxPyOl9yc
         TYfUMDh1INuaz2D129ybJ8QqbM+gsKUjzQDVPR/XyE5fKq5teJjCKcpjdA/7x9jnn0PN
         JnMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si499821ybo.24.2017.11.13.17.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 17:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPq9-0002Yy-3x
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 20:16:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPpt-0002XW-WA
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 20:16:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPps-0003fr-VE
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 20:16:21 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEPpn-0003XA-Rf; Mon, 13 Nov 2017 20:16:16 -0500
Received: from 172.30.72.60 (EHLO DGGEMS407-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT86838; Tue, 14 Nov 2017 09:16:06 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Tue, 14 Nov 2017
	09:15:55 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Tue, 14 Nov 2017 09:15:49 +0800
Message-ID: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5A0A43D6.00C6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f6d9dae1e0d52a3ff7e276c6f2eae3ba
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [RFC 0/5] arm: Exclude reserved memory regions of iommu
 to avoid
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
Cc: peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdzcchZV+JpS

From: Zhu Yijun <zhuyijun@huawei.com>

With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved window and
PCI reserved window which has to be excluded from Guest iova allocations.

And on certain HiSilicon platforms (hip06/hip07), the GIC ITS and PCIe RC 
deviates from the standard implementation will reserve the hw msi regions in
the smmu-v3 driver which means these address regions will not be translated.

https://www.spinics.net/lists/linux-pci/msg65125.html

On such platforms, reserved memory regions will export like this:

root:~# cat /sys/kernel/iommu_groups/7/reserved_regions
0x00000000a8800000 0x00000000affeffff reserved
0x00000000c6000000 0x00000000c601ffff msi

However, it falls within the Qemu default virtual memory address space.

Take a look at hw/arm/virt.c:

[VIRT_MEM] =             { 0x40000000, RAMLIMIT_BYTES },
    . . .

    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                                     machine->ram_size);
memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);

So suppose we allocate 4GB mem to a VM, there is a chance that the reserved
regions will get allocated for a Guest VF DMA iova and it will fail.

This patchset create holes in the Qemu RAM address space which exclude
the sysfs exported regions.


Zhu Yijun (5):
  hw/vfio: Add function for getting reserved_region of device iommu
    group
  hw/arm/virt: Enable dynamic generation of guest RAM memory regions
  hw/arm: add scattered RAM memory region support
  hw/arm/boot: set fdt size cell of memory node from mem_list
  hw/arm/virt-acpi-build: Build srat table according to mem_list

 hw/arm/boot.c                 | 155 +++++++++++++++++++++++++++++++-----------
 hw/arm/virt-acpi-build.c      |  40 +++++++++--
 hw/arm/virt.c                 | 120 ++++++++++++++++++++++++++++++--
 hw/vfio/common.c              |  67 ++++++++++++++++++
 hw/vfio/pci.c                 |   2 +
 hw/vfio/platform.c            |   2 +
 include/exec/memory.h         |   7 ++
 include/hw/arm/arm.h          |   1 +
 include/hw/arm/virt.h         |   1 +
 include/hw/vfio/vfio-common.h |   3 +
 10 files changed, 347 insertions(+), 51 deletions(-)

-- 
1.8.3.1


