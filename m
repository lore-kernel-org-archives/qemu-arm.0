Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1546805ivh;
        Tue, 3 Jul 2018 12:34:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd/yI4rt6O10JBBkTpr+B35BJcVhRIngcFPW0gV0gzDNBeK5gWSe/IRrRz+9lnwTN7eIf3p
X-Received: by 2002:ac8:2cf0:: with SMTP id 45-v6mr27749254qtx.236.1530646486680;
        Tue, 03 Jul 2018 12:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530646486; cv=none;
        d=google.com; s=arc-20160816;
        b=kDFH13lp+Da9uEBVK2LfBeAYUofmumAZDQ9QPeAo7u2KZwIkGAlXxdBcggiXiqKk3z
         D1JPFK1VI4rscDE2AElCSHXWJv3zSywd2dmt7nUmr8i0sBV/i01lavhquTxMBH7a/YbY
         fvtuyXMM60wv92dCw/ekjGQenFP865Ly0f439rEn+ta+5crBpTt03vJ3PxoHQkhNOHrx
         NzfYRBij0VrmJ58vyfJPhIvUrZPVuUkd2Ixk0eSGru53JMmxp08659ymcD3NH+VfLxYR
         n+TOa4GJK04/nWx7QfxWnh1YI33MpK9/nijzOoDczrsmf3V4EiVAOVLoYHyCnFdlal3h
         K1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=QznwJDj9U6JqmM6O/Yi5fLs5t4LCs1t0yNwNBrRcRwI=;
        b=krwTMh7diRKFWBB6gDRAWNY7ua9dM0T/WAJUNf08kIcBNtSG7LzzGz+fIq/xxKcp3M
         hPY6lpZnFl+eyFNx6wED1zNb4gDxkuCS4we3GueCsuJN2uBfXqmQ9uNiU4LhJLg2zmXA
         NReJtL1FzP/qu2iPdM6ZXT7i9W2i6B7IaDWAOhyPVNBxrBWOYhWBFHkM0L6ZvFPNrTtT
         /3FqjCMl0eXeqTSIbIIx2/pUAFsZO3raFHtUB/ul9Ed+pTNMiukWTuD+sRidFH5MrbSE
         V07pD3Lv7kvNK1H6MzNb+3C9FN2dK01hZpPjHMkBN34o5k7UN76TagdJAadu62CWpt7p
         0yCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si1783073qvf.115.2018.07.03.12.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 12:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faR4Y-0000rk-9c
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 15:34:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faR4R-0000r4-6c
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:34:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faR4P-0003y5-Uk
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:34:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57586 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faR4P-0003xx-PS; Tue, 03 Jul 2018 15:34:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D5B9818F6E9;
	Tue,  3 Jul 2018 19:34:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 539F176CC;
	Tue,  3 Jul 2018 19:34:30 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-8-git-send-email-eric.auger@redhat.com>
	<cc538632-e853-adbc-ec34-a2f524415406@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4dfad441-b94f-916f-025e-fc69b6375465@redhat.com>
Date: Tue, 3 Jul 2018 21:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cc538632-e853-adbc-ec34-a2f524415406@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 03 Jul 2018 19:34:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 03 Jul 2018 19:34:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: qMWx4XBtNULM

Hi David,

On 07/03/2018 08:44 PM, David Hildenbrand wrote:
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
> 
> You mention that actual hotplug is not supported, only coldplug.
> Wouldn't this be the right place to check for that? (only skimmed over
> your patches, how do you handle that?)
At the moment I don't check it. I did not look yet at ways to
discriminate both cases.

Thanks

Eric
> 
> 
