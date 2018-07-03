Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1542836ivh;
        Tue, 3 Jul 2018 12:30:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfmEtvDWvkgNcRA0092e+sYhQJkzbUisLuVGSBV0dVSCc409CLt8V64vH0Re4iuTauRcNw6
X-Received: by 2002:a37:9d58:: with SMTP id g85-v6mr26374934qke.230.1530646212324;
        Tue, 03 Jul 2018 12:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530646212; cv=none;
        d=google.com; s=arc-20160816;
        b=mpM5V4DKm8jUZwqEVEXVIKWV+wyJy/PSXl9VOeCXHliAcpY0A6YALdXBIt/qmQgkCj
         0OyDjeDK/bh9BYOos49wps0GrBfYqChS4KBdg5wJ+GWFnqaHLjPZ3laVKkMgUjEx97Yn
         d8ZdBSmTHI6KQLEUo5RGlaZnaPgwbCNzkBGkk4U5xkkPTCK8NeJeu+7/mvdRJe6Egnnc
         wk12deEL2snahj7PjiR2h/VARL5JfZwcPFG3Pnxz90IIa2Kgp6D8kQIN1Md8hCM6mQ59
         ijfXYWREQr4KwrNkrvzDdW71kVqayHmtimcVcKqfiLIsHaqZ9SF0fKvv8qUYlRsntdhO
         +ZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Op3dGr8Zs9sJkoj5reEu/dxQTWit6R7K2W2mR0bXRFE=;
        b=xrhRMGSyWHfl1qVgcJLnbPTJWQzwRH5WlhwZHy+cQw9NjTYOW5SNpkIDG+VAQQ+M+Z
         0QfKtBubIr60lwjCOu2y1Db3sNQMMhs9pN+jz3ADaL/EqFyn+Z7zFyJmJM89Q2pFoALT
         HC2MhTObQarqkefN+1+bjNPnx8ZAcoQWaI24e5+cm3yi6re3vUOXCqFi4rjlDcfp7cl2
         xwHurBw8o2Ikf+/Ylqw9kwSl0koUxH5UB40461ker2RxOB6YiOpBPmJQvNqTt25lH9lo
         Qn+0mNNhNCBdzKO7Knu2xDMfSLwO0cAACEx9M2s9q+Q5zNaOlvqXtD54rTAgqMYVlMRq
         WHxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n18-v6si1095799qvc.270.2018.07.03.12.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 12:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faQzl-0006ZL-BN
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 15:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faQyO-0005VJ-3n
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faQyJ-0000US-O0
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:28:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58918 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faQyJ-0000UM-H7; Tue, 03 Jul 2018 15:28:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 051CA406C7AB;
	Tue,  3 Jul 2018 19:28:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FAFD2026D76;
	Tue,  3 Jul 2018 19:28:17 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-8-git-send-email-eric.auger@redhat.com>
	<b674de55-665d-9597-eebb-42983094f90c@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <19c64f9e-21ed-c070-8490-069d916fb771@redhat.com>
Date: Tue, 3 Jul 2018 21:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b674de55-665d-9597-eebb-42983094f90c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 19:28:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 19:28:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3 07/15] hw/arm/virt: Add memory hotplug
 framework
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XdRReGvK/X3K

Hi David,

On 07/03/2018 08:28 PM, David Hildenbrand wrote:
> On 03.07.2018 09:19, Eric Auger wrote:
>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> This patch adds the the memory hot-plug/hot-unplug infrastructure
>> in machvirt.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>
>> ---
>>
>> v1 -> v2:
>> - s/virt_dimm_plug|unplug/virt_memory_plug|unplug
>> - s/pc_dimm_memory_plug/pc_dimm_plug
>> - reworded title and commit message
>> - added pre_plug cb
>> - don't handle get_memory_region failure anymore
>> ---
>>  default-configs/arm-softmmu.mak |  2 ++
>>  hw/arm/virt.c                   | 68 ++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index 834d45c..28fe8f3 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -152,3 +152,5 @@ CONFIG_PCI_DESIGNWARE=y
>>  CONFIG_STRONGARM=y
>>  CONFIG_HIGHBANK=y
>>  CONFIG_MUSICPAL=y
>> +CONFIG_MEM_HOTPLUG=y
>> +
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 6fefb78..7190962 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -60,6 +60,8 @@
>>  #include "standard-headers/linux/input.h"
>>  #include "hw/arm/smmuv3.h"
>>  #include "hw/acpi/acpi.h"
>> +#include "hw/mem/pc-dimm.h"
>> +#include "hw/mem/nvdimm.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1785,6 +1787,53 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>      return ms->possible_cpus;
>>  }
>>  
>> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>> +                                 Error **errp)
>> +{
>> +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>> +
>> +    if (is_nvdimm) {
>> +        error_setg(errp, "nvdimm is not yet supported");
>> +        return;
>> +    }
>> +}
>> +
>> +static void virt_memory_plug(HotplugHandler *hotplug_dev,
>> +                             DeviceState *dev, Error **errp)
>> +{
>> +    PCDIMMDevice *dimm = PC_DIMM(dev);
>> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
>> +    MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
>> +    Error *local_err = NULL;
>> +    uint64_t align;
>> +
>> +    if (memory_region_get_alignment(mr)) {
>> +        align = memory_region_get_alignment(mr);
>> +    } else {
>> +        /* by default we align on 64KB page size */
>> +        align = SZ_64K;
>> +    }
> 
> After my latest re-factoring is applied
> 
> 1. memory_region_get_alignment(mr) will never be 0
> 2. alignment detection will be handled internally
> 
> So once you rebase to that version, just pass NULL for "*legacy_align"

Agreed. Thanks

Eric
> 
> 
