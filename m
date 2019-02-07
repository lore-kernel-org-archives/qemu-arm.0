Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp698819wrt;
        Thu, 7 Feb 2019 07:32:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYhBSx6ITcnHXPSLYKYuJO3hft3FiYBo30znEtP5atN77kPHZrQ66hcAE26lDfDo3c1NJ6p
X-Received: by 2002:a25:40c1:: with SMTP id n184mr1340543yba.158.1549553535184;
        Thu, 07 Feb 2019 07:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549553535; cv=none;
        d=google.com; s=arc-20160816;
        b=nq9yjN9dximjq2m7NO/4Sjv8fcl3o4B9GpvjM/KO+Y6ANqn4qLVA01OegKz8w2i3C1
         fksLg3DamrvXHX9UCWX3CX1eCMecRNkWWHApyM7tp0OEKbUYf88aml3D6DRN2Al0BWgI
         qx7PywZjWOgcqb6HA/cVhar6T0vm+40aB1+Bm4oXukJ56dqhDDuq+aV5uiI3QffrY+9d
         2TeM6r2zOXrlR903LYn9id0yOYv6agMrZlKk1O2j5H308u7UzhUSFjykUoVbZElgiamz
         3mkoTlhkL3nc9whjJxXwq+SRIONdTOt270ZL1nAYE0tqbLKf5F05uRrG6WKc1OkU56fA
         LfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=CatiifzXgfKVPDOU9Ivv4c5HJq6yozfMvG/QQISYzJA=;
        b=Lervp5NOynPcNpzHVctBWkFqostpGKHRHox0Cn3Rhmc/rs8xY4ALgxfomhUgwfjEW7
         Y+PGsOBY4P5DHalILAUKRwU7q65T3mcECHdRpBjCjvXCUam9APdKX/VEq82nNMaZ4K+a
         4BEFteWVYqm+yUIIY+r4x+AmjWUNa5TWXS8mbt2R8HHVgt52J6dVgUkdZRnEAaopAYzQ
         EJaboJxEyzOK47SX6OlhKB45vZ/XVvppO77aYc5+odGnCAgCTwQmR1UZ2f1CMwA/vjNi
         mFOsFbUYrQ8Qsh5Un89fhinAD5r7XMQVVxGduupOcakdF8W/opa9q9EiQnlhXx8fLTZg
         sQAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c204si5819344yba.318.2019.02.07.07.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 07:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grlew-00021h-Mb
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 10:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1grleq-00021a-My
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1grlek-0008Sv-Mv
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 10:32:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1grlei-0008PA-MP; Thu, 07 Feb 2019 10:32:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30DDE5859C;
	Thu,  7 Feb 2019 15:25:22 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCC062998;
	Thu,  7 Feb 2019 15:25:10 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"david@redhat.com" <david@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-11-eric.auger@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392B2D8D@lhreml524-mbs.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <49dfe0ee-7afb-6639-3a4e-f4317073feba@redhat.com>
Date: Thu, 7 Feb 2019 16:25:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392B2D8D@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 07 Feb 2019 15:25:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 10/18] hw/arm/virt: Bump the 255GB initial
 RAM limit
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+o8ylAOHbZb

Hi Shameer,

On 2/7/19 4:19 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: 05 February 2019 17:33
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> imammedo@redhat.com; david@redhat.com
>> Cc: dgilbert@redhat.com; david@gibson.dropbear.id.au; drjones@redhat.com
>> Subject: [PATCH v6 10/18] hw/arm/virt: Bump the 255GB initial RAM limit
>>
>> Now we have the extended memory map (high IO regions beyond the
>> scalable RAM) and dynamic IPA range support at KVM/ARM level
>> we can bump the legacy 255GB initial RAM limit. The actual maximum
>> RAM size now depends on the physical CPU and host kernel.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c | 26 +++++++-------------------
>>  1 file changed, 7 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b90ffc2e5d..f01886da22 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -93,22 +93,9 @@
>>
>>  #define PLATFORM_BUS_NUM_IRQS 64
>>
>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>> - * address space unallocated and free for future use between 256G and 512G.
>> - * If we need to provide more RAM to VMs in the future then we need to:
>> - *  * allocate a second bank of RAM starting at 2TB and working up
>> - *  * fix the DT and ACPI table generation code in QEMU to correctly
>> - *    report two split lumps of RAM to the guest
>> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
>> - * (We don't want to fill all the way up to 512GB with RAM because
>> - * we might want it for non-RAM purposes later. Conversely it seems
>> - * reasonable to assume that anybody configuring a VM with a quarter
>> - * of a terabyte of RAM will be doing it on a host with more than a
>> - * terabyte of physical address space.)
>> - */
>> -#define RAMLIMIT_GB 255
>> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
>> +/* Legacy RAM limit in GB (< version 4.0) */
>> +#define LEGACY_RAMLIMIT_GB 255
>> +#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
>>
>>  /* Addresses and sizes of our components.
>>   * 0..128MB is space for a flash device so we can run bootrom code such as
>> UEFI.
>> @@ -149,7 +136,7 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>> -    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    [VIRT_MEM] =                { 0x40000000,
>> LEGACY_RAMLIMIT_BYTES },
>>  };
>>
>>  /*
>> @@ -1483,8 +1470,9 @@ static void machvirt_init(MachineState *machine)
>>
>>      vms->smp_cpus = smp_cpus;
>>
>> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
>> -        error_report("mach-virt: cannot model more than %dGB RAM",
>> RAMLIMIT_GB);
>> +    if (!vms->extended_memmap && machine->ram_size >
>> LEGACY_RAMLIMIT_GB) {
> 
> Just hit this while testing, should this check be against LEGACY_RAMLIMIT_BYTES?
Definitively, my mistake. Thank you for spotting that.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
>> +        error_report("mach-virt: cannot model more than %dGB RAM",
>> +                     LEGACY_RAMLIMIT_GB);
>>          exit(1);
>>      }
>>
>> --
>> 2.20.1
> 
