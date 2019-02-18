Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2558737wrx;
        Mon, 18 Feb 2019 10:10:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYqYscKKxR/xFNaz4SgxTocNmqyICKzkC/UnUJOkz9lZSwBTwGxMwQOCSwPeNqR2hRWBH1S
X-Received: by 2002:a5b:544:: with SMTP id r4mr19938137ybp.235.1550513445032;
        Mon, 18 Feb 2019 10:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550513445; cv=none;
        d=google.com; s=arc-20160816;
        b=dT+rC/2nnAUmgdUcqPFdDbyDAXmZfOBZ3+PdCFAX972JGO/7iQ9cXnNtfjoQ0Y9san
         2fAsizR9Ftxgi46/+5Dbuyw+vLfTY1RTFGFBLz7hQ6uI1boP9BGdYkwQDK11yJBd8kkC
         vwF6qghATbtnPJJa91oC7zle2AhM/Q9Px4WFQxj1KWwTmmTKkx+w/Ka/9S6I4v47wmOI
         R0cpP4ZgrZB2XzamjSEXiP/tABkpkiv/p6TD5Xi0g7P+fUJ11jCrfKSUn6iYESWLNZ3S
         GwfVP8qkgUbOh9VfAuTZlCbU3GSgbgfTbDFwzl8ctdDcS5xNIt6zDz7LKTNKtsARxNyh
         1m9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=qK+EN7t8B+b5dIHCJjeXYl8pCia0ZMoJYeYiVAAIDTI=;
        b=OFy8Ao+4PJnfZX6WtgxmVCK/8MywXpITawoCusn7qSnaTNAzYxuj7F9X5v2KYdCSK6
         PshTQDMrCig3AyZMgfnL1JWea2z13jjRsLKglFXovdUEspDbE5AN6HV8lztJdS9QYQb2
         biO8XqvL+jbRQlHYsCaPOWfD/kkHnHuFjBXSaNYPJouF/Ei7fA+PG2/kBxUTmVhSprA1
         qSYumLXd1M5qFUP6Kk8fBKWn5McFphgQnScsgPmUf3x0l9Wyde+A/zBLeS+iVWxODx1w
         mPyZ227aM4GcbrWFKRA1jT4tCKo9qS6HXmeJArp8T1qpgNSCLf8NW6ERkYcWFxzn8hug
         mWrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i82si7961011ybc.189.2019.02.18.10.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 10:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvnNM-0007DR-Cj
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 13:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvnN7-0007C1-D7
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 13:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvnN5-0000Z2-Iv
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 13:10:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gvnN2-0000Lw-Id; Mon, 18 Feb 2019 13:10:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E80EAC617;
	Mon, 18 Feb 2019 18:10:18 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC71260F94;
	Mon, 18 Feb 2019 18:10:14 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-12-eric.auger@redhat.com>
	<278b9b9a-f299-1ce2-2a9d-566ef406c1c7@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <791bf4ec-aa80-b296-7140-84fa1c46a06f@redhat.com>
Date: Mon, 18 Feb 2019 19:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <278b9b9a-f299-1ce2-2a9d-566ef406c1c7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 18 Feb 2019 18:10:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 11/18] hw/arm/virt: Add memory hotplug
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qeEUNGYfthKU

Hi David,

On 2/14/19 6:15 PM, David Hildenbrand wrote:
> On 05.02.19 18:32, Eric Auger wrote:
>> This patch adds the the memory hot-plug/hot-unplug infrastructure
>> in machvirt. It is still not enabled as no device memory is allocated.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>
>> ---
>> v4 -> v5:
>> - change in pc_dimm_pre_plug signature
>> - CONFIG_MEM_HOTPLUG replaced by CONFIG_MEM_DEVICE and CONFIG_DIMM
>>
>> v3 -> v4:
>> - check the memory device is not hotplugged
>>
>> v2 -> v3:
>> - change in pc_dimm_plug()'s signature
>> - add pc_dimm_pre_plug call
>>
>> v1 -> v2:
>> - s/virt_dimm_plug|unplug/virt_memory_plug|unplug
>> - s/pc_dimm_memory_plug/pc_dimm_plug
>> - reworded title and commit message
>> - added pre_plug cb
>> - don't handle get_memory_region failure anymore
>> ---
>>  default-configs/arm-softmmu.mak |  2 ++
>>  hw/arm/virt.c                   | 64 ++++++++++++++++++++++++++++++++-
>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index be88870799..dc4624794f 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -160,3 +160,5 @@ CONFIG_PCI_DESIGNWARE=y
>>  CONFIG_STRONGARM=y
>>  CONFIG_HIGHBANK=y
>>  CONFIG_MUSICPAL=y
>> +CONFIG_MEM_DEVICE=y
>> +CONFIG_DIMM=y
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f01886da22..783468ba77 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -59,6 +59,8 @@
>>  #include "qapi/visitor.h"
>>  #include "standard-headers/linux/input.h"
>>  #include "hw/arm/smmuv3.h"
>> +#include "hw/mem/pc-dimm.h"
>> +#include "hw/mem/nvdimm.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1763,6 +1765,49 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>      return ms->possible_cpus;
>>  }
>>  
>> +static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>> +                                 Error **errp)
>> +{
>> +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>> +
>> +    if (dev->hotplugged) {
>> +        error_setg(errp, "memory hotplug is not supported");
>> +    }
>> +
>> +    if (is_nvdimm) {
>> +        error_setg(errp, "nvdimm is not yet supported");
>> +        return;
>> +    }
>> +
>> +    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
>> +}
>> +
>> +static void virt_memory_plug(HotplugHandler *hotplug_dev,
>> +                             DeviceState *dev, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +    Error *local_err = NULL;
>> +
>> +    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
>> +
>> +    error_propagate(errp, local_err);
>> +}
>> +
>> +static void virt_memory_unplug(HotplugHandler *hotplug_dev,
>> +                               DeviceState *dev, Error **errp)
>> +{
>> +    pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
>> +    object_unparent(OBJECT(dev));
> 
> Please note that this will soon change with
> 
> [PATCH RFCv2 0/9] qdev: Hotplug handler chaining + virtio-pmem
> 
> What you'll have to do then is to replace the object_unparent by a
> 
> object_property_set_bool(OBJECT(dev), false, "realized", NULL);
Noted.

Thanks for the heads up!

Eric
> 
> 
