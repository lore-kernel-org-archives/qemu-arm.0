Received: by 10.223.150.237 with SMTP id u100csp2819801wrb;
        Mon, 13 Nov 2017 12:01:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYUMIrmP1E00cO7VacW/x9S6tGPvUfENdm3vz2pRXFNm8IZFE+aDKYblI8qlOTG8SJOuJ87
X-Received: by 10.129.39.129 with SMTP id n123mr6523633ywn.419.1510603311013;
        Mon, 13 Nov 2017 12:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510603311; cv=none;
        d=google.com; s=arc-20160816;
        b=HF2w+d7TCDuc2Gh/6BItPd2a/2xA10fq9ZnUg/wKlELy4/B6XRXwIpvy6sT6YC9XnA
         nk20RCYayxcG0/z+LoNViQ3DIoz+WSxR4cyIgU9EhcX7E7L/ceE0n0uIC0PT2jnhZSH4
         j0020/nXe0vQIitLar6UzNqJ+V5YqA26fMRac6K5E31dKcxORkm0n0bgqm9F7d0Ja/Sd
         8vYIQDE09v9z3QCk62h/2NHDLSKb7WRwvYZQ0k5QtHiMTeGI62RNB7Oz/Y76/bs5ShPw
         aoiADqrnsKgknhPWLnAmexZ17VJiLI14P0QIG5WFpVafTKFKSyqfvV30QHKd3n+jmmM8
         2r3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=tSBtmxu78O4fGWLxJo5rEmpICP9EdnumAOMQqaA7+34=;
        b=iU/ze5FKzG2lhEWw+F7jNeZeZZDhS90fG6w9UyhCmRLKcoOu/88BhqQ2Z+9cPWPeGs
         jlJxMpLyi6NSwAkf2MnJ5q4jCmxccCKaEZtkrdBbmQWqE68LXAVJAcjov7V1TnGT0deO
         /WGhhTkBbZMsyQn9g+G91oR4nikn0DO2Pvyw3iIt7SjgQg/eJInSwkrT1629ba11GkD1
         uSmWLhrrLhmq/JCrc6pyaGGC/J29LuHoA/R/jl97DIuZhH2F+3/a9kpCDTxkfopUfgeY
         TSNBveGBYF/tPLrEFeg1GNYOv8oeJfzhIsTII0uL5P3vdHe8DQ8uM5XcxbQRh6wRcCRl
         sQzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i201si1477215ywe.183.2017.11.13.12.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 12:01:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEKvW-0000sz-H3
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 15:01:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eEKvO-0000mz-7d
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 15:01:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eEKvL-00023k-4w
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 15:01:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eEKvK-00023T-V7; Mon, 13 Nov 2017 15:01:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D70AE80480;
	Mon, 13 Nov 2017 20:01:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B35822E4;
	Mon, 13 Nov 2017 20:01:35 +0000 (UTC)
To: zhuyijun@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <db7ef4f4-f95e-bb45-0a1a-5c40ca186956@redhat.com>
Date: Mon, 13 Nov 2017 21:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 13 Nov 2017 20:01:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/5] arm: Exclude reserved memory
 regions of iommu to avoid
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
X-TUID: 42S8hDKxQE9p

Hello Zhu,

On 13/11/2017 13:29, zhuyijun@huawei.com wrote:
> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved window and
> PCI reserved window which has to be excluded from Guest iova allocations.
> 
> And on certain HiSilicon platforms (hip06/hip07), the GIC ITS and PCIe RC 
> deviates from the standard implementation will reserve the hw msi regions in
> the smmu-v3 driver which means these address regions will not be translated.
> 
> https://www.spinics.net/lists/linux-pci/msg65125.html
> 
> On such platforms, reserved memory regions will export like this:
> 
> root:~# cat /sys/kernel/iommu_groups/7/reserved_regions
> 0x00000000a8800000 0x00000000affeffff reserved
> 0x00000000c6000000 0x00000000c601ffff msi
> 
> However, it falls within the Qemu default virtual memory address space.
> 
> Take a look at hw/arm/virt.c:
> 
> [VIRT_MEM] =             { 0x40000000, RAMLIMIT_BYTES },
>     . . .
> 
>     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>                                                      machine->ram_size);
> memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> 
> So suppose we allocate 4GB mem to a VM, there is a chance that the reserved
> regions will get allocated for a Guest VF DMA iova and it will fail.
> 
> This patchset create holes in the Qemu RAM address space which exclude
> the sysfs exported regions.
> 
> 
> Zhu Yijun (5):
>   hw/vfio: Add function for getting reserved_region of device iommu
>     group
>   hw/arm/virt: Enable dynamic generation of guest RAM memory regions
>   hw/arm: add scattered RAM memory region support
>   hw/arm/boot: set fdt size cell of memory node from mem_list
>   hw/arm/virt-acpi-build: Build srat table according to mem_list
I have not received all the patches of this series. I miss 2, 4, 5.

Looking at
https://lists.nongnu.org/archive/html/qemu-devel/2017-11/threads.html#02198,
I don't see them either.

Thanks

Eric
> 
>  hw/arm/boot.c                 | 155 +++++++++++++++++++++++++++++++-----------
>  hw/arm/virt-acpi-build.c      |  40 +++++++++--
>  hw/arm/virt.c                 | 120 ++++++++++++++++++++++++++++++--
>  hw/vfio/common.c              |  67 ++++++++++++++++++
>  hw/vfio/pci.c                 |   2 +
>  hw/vfio/platform.c            |   2 +
>  include/exec/memory.h         |   7 ++
>  include/hw/arm/arm.h          |   1 +
>  include/hw/arm/virt.h         |   1 +
>  include/hw/vfio/vfio-common.h |   3 +
>  10 files changed, 347 insertions(+), 51 deletions(-)
> 
