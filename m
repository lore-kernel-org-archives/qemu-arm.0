Received: by 10.223.150.237 with SMTP id u100csp2395081wrb;
        Mon, 13 Nov 2017 04:31:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbttXZgbzwpUQij8q4M8pRW+0MyGmRe0dpHnI/Z1Wuia0hddK94CyNJn5LSYF6lEZK+lqSK
X-Received: by 10.129.98.213 with SMTP id w204mr5913170ywb.395.1510576277096;
        Mon, 13 Nov 2017 04:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510576277; cv=none;
        d=google.com; s=arc-20160816;
        b=Kf8lcL5j287budHTvT8Xn5gWU0DLON1xPJNySE1+NnToumtIDak8DmLnCv6YMBYwH8
         /17xOMSFgNm7v5e4APF/rSoAc+Pm9rgvdYoUVxbaymXSRHn0ThzIh777CR8pGpua3KDB
         A8wj9OfVyXkcM6Ao530hkQyC8SYDx7FFx/sg7JIiOqibkTE1lyt3V+Ksn8PxA32G9j9L
         o2TZiKqflbsugdJUU1O/onIO7ztMttjsejAjWACdNKaSo2LpMpqHVfOXRggcMJI7bSxa
         BqSv53dRvbmWsalPlf8mVqgLumknfkbByNL18kZdFhCdPk3p+yu/L92LUoBrGgeVwP3O
         fgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=xoZO4HrHXn7FTzq2TwuHuqgqlBRMK+o7B0YcjQMUdQo=;
        b=iikg6vumQJlBmGsoYVGuMQJ6eCyKUbDSUcIX7DgW9e1YGzKyNBq8W68C7zXfFT1K07
         NRr67SZovkiDjeAFerwoemOl08VrOXxccC/MPWHNUGoEOJ8gvZGl/QInD3B9UHCskCxn
         xdZpHN4Cu3g+hXOd0Dgjp51bHgsZnbHU6nrZaDO4/ROX94odQitPFQ9zlYHUxDrNFKB8
         4q7bmXd38Y2BAoBI26n0f9xpgec1fqm0bLxjPk3d3gdPBQKVX2s5Y+oapSI9b+LLkq0Y
         fKbvhC064Gc4VGYmKW57kO83ggPEBivQXLRxHvMVo4NZFb2x33PmkqGMQ61cF8hosAA9
         nmPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v134si986261ywc.335.2017.11.13.04.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 04:31:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEDtU-0007Oi-GP
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 07:31:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDs2-0006cY-1v
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDrx-0000kz-Qc
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:29:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2345)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEDrx-0000ha-85; Mon, 13 Nov 2017 07:29:41 -0500
Received: from 172.30.72.60 (EHLO DGGEMS406-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT03134; Mon, 13 Nov 2017 20:29:30 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Mon, 13 Nov 2017
	20:29:20 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Mon, 13 Nov 2017 20:29:00 +0800
Message-ID: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5A09902C.0073, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f6d9dae1e0d52a3ff7e276c6f2eae3ba
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [RFC 0/5] arm: Exclude reserved memory regions of
 iommu to avoid
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
Cc: peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mg3D75qIkSBE

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


