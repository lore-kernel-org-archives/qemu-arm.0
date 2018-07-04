Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp444877wrq;
        Wed, 4 Jul 2018 04:47:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdDdKokyRqEqcMvo6DO4ZKxX8VHwjYEf62YiNeUvf8ecwkSgtdDYwV01VdJ9Oc+noN9Dsp+
X-Received: by 2002:ac8:3473:: with SMTP id v48-v6mr1229655qtb.400.1530704867903;
        Wed, 04 Jul 2018 04:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530704867; cv=none;
        d=google.com; s=arc-20160816;
        b=Mdt9Izt+qWwLSJ9AbiI6+fcRLKeqPuNUzNBI2obVElOqBK34EwwMmQKL32M28FqGXa
         LiDEmDZhSvY0AYfXY9uL60pMS52Ds8hsx+Pial/5jAGXIOdygkVvZPh/l4BRKaeiaVx+
         3lPq4swxz9i6mJnFplKxd5g4hrAdqChP9Xut9VOhctOVOSgj68Xkto1pXt4wR9SSRpzQ
         J6rO1hYy6ZK/VTCQk96pLaQPFgwSXHYkUom5LFYJWQrkGm2MdMoJzUb+1e53aE9CNhw9
         uxkxnC6GEx5Odsc9ZOQng74/ZCaZNMnKG/hceQm7Cb9I1AlEqLQSiD+Ib913fACL/Tg2
         QPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:arc-authentication-results;
        bh=YKIIUf0yC71Oa3pToR2O5aHXYKM0Bxlz7Njj1km5QyU=;
        b=f8HIgH0tQ5KOJeVFjHBO4h3wo58dtn8RUnTaFksyy8CIMu5kQklfEOrgQg2eGwwmqF
         xY4DDsn3hKRFnABK12SUrGekYVFI3jnaazaujnVIZfiuMBw1Q7HoExdztO8dPr6jyFeD
         Gv8SwRyXqbuPF4eJTvrOCut/Nf1wuL2OUQ+Jlgnjv6DjRHyNX4gaMVlqnaWACV4IxPKk
         jZrMK+RLTerFmI54ezCK8Nop01AAb4GGwJXfuoJwDpnfbQW/bqh2tsBh1M284HNJBQrO
         3IJLS5urkenzsFI0qWHXq0U+omxCG/Cp8sYB9XvHpaTij/Uz88uDgowAh1tb+g/PIN5g
         zvDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52-v6si3538522qtu.189.2018.07.04.04.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 04:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fagGB-0006Yr-FZ
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 07:47:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fagG3-0006Yh-L2
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 07:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fagFz-0001y1-Nf
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 07:47:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38906 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1fagFz-0001ws-HO; Wed, 04 Jul 2018 07:47:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93CFB4070496;
	Wed,  4 Jul 2018 11:47:34 +0000 (UTC)
Received: from [10.36.117.192] (ovpn-117-192.ams2.redhat.com [10.36.117.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56EAF20180EB;
	Wed,  4 Jul 2018 11:47:32 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-8-git-send-email-eric.auger@redhat.com>
	<cc538632-e853-adbc-ec34-a2f524415406@redhat.com>
	<4dfad441-b94f-916f-025e-fc69b6375465@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <30bba021-8537-8ef3-13ac-197cff7445cb@redhat.com>
Date: Wed, 4 Jul 2018 13:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4dfad441-b94f-916f-025e-fc69b6375465@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 11:47:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 11:47:34 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
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
X-TUID: aCLSA5mHAYer

On 03.07.2018 21:34, Auger Eric wrote:
> Hi David,
> 
> On 07/03/2018 08:44 PM, David Hildenbrand wrote:
>> On 03.07.2018 09:19, Eric Auger wrote:
>>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>>
>>> This patch adds the the memory hot-plug/hot-unplug infrastructure
>>> in machvirt.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>
>>> ---
>>>
>>> v1 -> v2:
>>> - s/virt_dimm_plug|unplug/virt_memory_plug|unplug
>>> - s/pc_dimm_memory_plug/pc_dimm_plug
>>> - reworded title and commit message
>>> - added pre_plug cb
>>> - don't handle get_memory_region failure anymore
>>> ---
>>>  default-configs/arm-softmmu.mak |  2 ++
>>>  hw/arm/virt.c                   | 68 ++++++++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 69 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 834d45c..28fe8f3 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -152,3 +152,5 @@ CONFIG_PCI_DESIGNWARE=y
>>>  CONFIG_STRONGARM=y
>>>  CONFIG_HIGHBANK=y
>>>  CONFIG_MUSICPAL=y
>>> +CONFIG_MEM_HOTPLUG=y
>>> +
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 6fefb78..7190962 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -60,6 +60,8 @@
>>>  #include "standard-headers/linux/input.h"
>>>  #include "hw/arm/smmuv3.h"
>>>  #include "hw/acpi/acpi.h"
>>> +#include "hw/mem/pc-dimm.h"
>>> +#include "hw/mem/nvdimm.h"
>>>  
>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>> @@ -1785,6 +1787,53 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>      return ms->possible_cpus;
>>>  }
>>>  
>>> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>> +                                 Error **errp)
>>> +{
>>> +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>>> +
>>> +    if (is_nvdimm) {
>>> +        error_setg(errp, "nvdimm is not yet supported");
>>> +        return;
>>> +    }
>>
>> You mention that actual hotplug is not supported, only coldplug.
>> Wouldn't this be the right place to check for that? (only skimmed over
>> your patches, how do you handle that?)
> At the moment I don't check it. I did not look yet at ways to
> discriminate both cases.

Looking at dev->hotplugged should be enough I guess.

> 
> Thanks
> 
> Eric
>>
>>


-- 

Thanks,

David / dhildenb
