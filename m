Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7113765wrx;
        Fri, 22 Feb 2019 08:05:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYN962sZpSRJukyaYFSZmId2wjGMamxPfEZ8w8DXV1m8ARngzEqAGZtbC2jQ8yTCArsasQ6
X-Received: by 2002:a81:2fcc:: with SMTP id v195mr3771035ywv.419.1550851545920;
        Fri, 22 Feb 2019 08:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550851545; cv=none;
        d=google.com; s=arc-20160816;
        b=FfBA2hDmX9dIgkOAxHT/k7mF9Exrf/PeBfiQMJ7VW/V4f9Z6/ocd+gx/sepJAD5a6p
         0SDeZbgFlPfyj2G0uR7ayBPCXeo9X7wOjTXyKfv9o6qxfESdjquK/V3YUVayEovpR0iK
         Uk4LyzQ2Dm6pAlduNVNmTKPMwz4yUvDqKqLZC2WWZt/rN9qSRd/jMj79tMhvpYMmAY0I
         WB/ljXNOl9dajc40Yhgm6apAYc4bzfd3e2x6NBBQT9SJiQGn1Vyt6HFUYXvdHgDvcS6o
         dEM+WLwZmtTT/alFDllTW5wXdme9Nq11/1x7hLhIn/D11GYHfLUWXX+Ws3IXtk5YbJkB
         3bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ZH3WJIarX9el016IS4uUa0tPbMl/Gm3w5Jirxb9TsHg=;
        b=WT4w3wtr2kg6/UhL1fvqJMq8k1Zj2z25RRcFiUfKV/B3yMURy3zYI0eW/Tx6aOlGdI
         /Bs26C38yaHSPDsypGF1zGKR8ft+beP24jwOR6GR4b2ME+lJLupAf56U0g4dkL8DyzIG
         ehPWr8nBomHczSneP3KaCu8re94Uy0e0ZPS8f7gTU/y3GlYHqjlzbk4uje6h9IxPvTEY
         MSexk1TC1b0GjWnd3dSOvDqyt/HDsZ/VQChudUlWpRWBnpRLBz4LrN4dhj83QnaCrmIK
         mhaKSYWIWOl1kXEaMWNYSsQ0tjvKTGlsVUv1PLndTeh+PmWBJaog8YLns0rB5tPY0m5a
         s7tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t80si1030484ywc.83.2019.02.22.08.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 08:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxDKb-0008H6-9O
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 11:05:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxDIe-0006wZ-Fk
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 11:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxDIY-0002dW-Aq
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 11:03:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxDIX-0002WO-Vb; Fri, 22 Feb 2019 11:03:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9595D81E10;
	Fri, 22 Feb 2019 16:03:33 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2232A601AC;
	Fri, 22 Feb 2019 16:03:29 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	shannon.zhaosl@gmail.com, peter.maydell@linaro.org, imammedo@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
Date: Fri, 22 Feb 2019 17:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 22 Feb 2019 16:03:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
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
Cc: "Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, linuxarm@huawei.com,
	xuwei5@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLe4Zr8LmXkW

Hi Shameer,

On 1/28/19 12:05 PM, Shameer Kolothum wrote:
> This series is an attempt to provide hotplug support to both
> pc-dimm and nvdimm device memory on ARM virt platform. This is
> based on Eric's recent works to support PCDIMM/NVDIMM device memory[1].
> The kernel support for arm64 memory hot add was added only
> recently by Robin[2] and hence the guest kernel should be => 5.0-rc1.
> 
> This makes use of PL061 GPIO controller to sent related ACPI events
s/sent/send
> to the Guest. The only reference I could find with respect to the GPIO
> pins usage is here[3] which says, "use PIN 3 for system_powerdown,
> reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and memory hotplug".
> Hence Pin 2 is used for PCDIMM and pin 4 for NVDIMM.
> 
> This is sanity tested on a HiSilicon ARM64 platform and appreciate
> any further testing.

I did some testing on another platform and I got the exactly the same
results as yours: PCDIMM hot plug works fine. Also after system_reset I
still can see the slots.
Hot-unplug is not supported though.
For NVDIMM, hot-add works fine and and I can see the slots using ndctl
on guest. But after system_reset, the guest does not boot properly.

> 
> This series can be applied on top of Eric's branch here[4]
> 
> Test:
> ------
> Please use a Guest kernel image >5.0-rc1 with all the mem/nvdimm
> hotplug related CONFIGs enabled.
> 
> ./qemu-system-aarch64 \
> -machine virt,gic-version=3,nvdimm \
> -m 1G,maxmem=4G,slots=4 \
> -cpu host \
> -kernel Image \
> -initrd rootfs-iperf.cpio \
> -bios QEMU_EFI.fd \
> -numa node,nodeid=0 \
> -net none \
> -nographic -enable-kvm \
> -append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"
> 
> Enter Qemu monitor,
> Add pc-dimm:
> object_add memory-backend-ram,id=mem1,size=1G
> device_add pc-dimm,id=dimm1,memdev=mem1
> 
> Add nvdimm:
> object_add memory-backend-ram,id=mem2,size=1G
> device_add nvdimm,id=dimm2,memdev=mem2
> 
> Known Issue:
> 
> It is observed that hot adding nvdimm will results in guest reboot
> failure. EDK2 fails to build the ACPI tables on reboot. Please find
> below EDK2 log on Guest reboot after nvdimm hot-add,
> 
> ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> 
> The root cause seems to be EDK2 ACPI table checksum failure
> as NFIT table is getting updated on hot-add. This needs further
> investigation.
+ Ard, Leif, Laszlo if they have any idea of what is missing/wrong.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> [1]https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg05740.html
> [2]https://patchwork.kernel.org/patch/10724455/
> [3]https://lists.gnu.org/archive/html/qemu-arm/2015-12/msg00095.html
> [4]https://github.com/eauger/qemu/tree/v3.1.0-dimm-v5
> 
> Shameer Kolothum (4):
>   hw:acpi: Make ACPI IO address space configurable
>   hw/arm/virt: Add GPIO based pcdimm hotplug ACPI event support
>   hw/arm/virt: Enable pc-dimm hotplug support
>   hw/arm/virt: Add nvdimm hotplug support
> 
>  default-configs/arm-softmmu.mak  |   1 +
>  hw/acpi/memory_hotplug.c         |  13 +++--
>  hw/arm/virt-acpi-build.c         |  45 +++++++++++++++--
>  hw/arm/virt.c                    | 105 ++++++++++++++++++++++++++++++++++++---
>  hw/i386/acpi-build.c             |   3 +-
>  include/hw/acpi/memory_hotplug.h |   6 ++-
>  include/hw/arm/virt.h            |  15 ++++++
>  7 files changed, 168 insertions(+), 20 deletions(-)
> 
