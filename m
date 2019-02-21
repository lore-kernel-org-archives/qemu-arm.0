Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5750432wrx;
        Thu, 21 Feb 2019 05:15:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY8sMazOF3m8aSayyEEiJtlmRSML3jK9QwFKezvrkGr/SURQKujFLSBb7G/iaJjg6MA3PQU
X-Received: by 2002:a5b:3cb:: with SMTP id t11mr21868373ybp.107.1550754916058;
        Thu, 21 Feb 2019 05:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550754916; cv=none;
        d=google.com; s=arc-20160816;
        b=BKT+HLUkJJXi7BF800wY2m4T8UpEJPHO2n455zDdbAr0VZIb8KpqbHP0QA2S5MVyjq
         l/zyp4XSySCbcf6nYefTmprQPlX6AUyfkY33tT+/sGaCV3oJzMio7rn0RV8Jx5kZvZ5N
         mNdtx1R7xMZsnT1xyT61Y4HPwUdoLcFUxrQRIIJ7BluVECbZD+fNEBL1acit2VRcgYbx
         rGPXXGU7vUk9ULaR7NrTgPQ9dEyZqKerP265r8oYEOZ4bNrZ4kfFMsbuTHMm/KUpCorc
         6P8bV15f76/DlezoxybxdihJc0uUgKcfhw0AwdDyD02khhp+9SQYirtchhximTQAfKOU
         dhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=w0yLDj0in1xNuRU9ZfR8n/fveYkRpCZxOpLkyMtpb7o=;
        b=RpOgFGJGu7Zy2ohhs+ntumBVhZxrp5nHtasXyAnYGLdBrmI+YRS4AqvYB/IEAbENXx
         m0l3zUtcE7mK7RV4PD8Q9CSPatjV4vDnj+fehQpoYDYlbM3UtuIONtMea1WbxEGFRxfZ
         ACjV0m5spYK69JGEGqlZkpg7EHQPXB0bQ3pfaMLDwbN6ONfN/lXzJ0mhLk/54hH1VN7S
         cuXvw/VmkxGZT7EqUCAU+XRfmwaFVsYTgwSJ2BL8eHUN9bnrW2N/CX/XOacA+Ubs99Kz
         /qTPkcAlx19eQGhamrLnT3DSIV7pJl23ShvS19G0S9YFCTeCVrqYRjWAxEPBPyIngCU7
         KPZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62si11535032ywa.134.2019.02.21.05.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 05:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwoC3-00089a-Cp
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 08:15:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwoBj-0007FV-EH
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 08:14:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwo5D-0000OE-Dn
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 08:08:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59806)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwo5D-0000Jn-4A; Thu, 21 Feb 2019 08:08:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C40930043ED;
	Thu, 21 Feb 2019 13:08:00 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 341F51001DD2;
	Thu, 21 Feb 2019 13:07:54 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
	<852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
	<20190221103610.0c2add1c@redhat.com>
	<e264b964-baa6-11e2-8e45-3238d412ca32@redhat.com>
	<4a921c15-43b8-e7dd-2a76-6b9e0fc7f084@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8758bd54-03f4-02b5-386d-ef3c3aee25f9@redhat.com>
Date: Thu, 21 Feb 2019 14:07:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <4a921c15-43b8-e7dd-2a76-6b9e0fc7f084@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 21 Feb 2019 13:08:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 14/18] hw/arm/virt: Allocate
 device_memory
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, dgilbert@redhat.com,
	shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S5atSO/gHONc

Hi David,

On 2/21/19 1:44 PM, David Hildenbrand wrote:
> On 21.02.19 13:37, Auger Eric wrote:
>> Hi Igor,
>>
>> On 2/21/19 10:36 AM, Igor Mammedov wrote:
>>> On Tue, 19 Feb 2019 16:53:22 +0100
>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>
>>>> Hi Igor,
>>>>
>>>> On 2/18/19 10:31 AM, Igor Mammedov wrote:
>>>>> On Tue,  5 Feb 2019 18:33:02 +0100
>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>   
>>>>>> The device memory region is located after the initial RAM.
>>>>>> its start/size are 1GB aligned.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>>
>>>>>> ---
>>>>>> v4 -> v5:
>>>>>> - device memory set after the initial RAM
>>>>>>
>>>>>> v3 -> v4:
>>>>>> - remove bootinfo.device_memory_start/device_memory_size
>>>>>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>>>>>> ---
>>>>>>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 36 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 783468ba77..b683902991 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -61,6 +61,7 @@
>>>>>>  #include "hw/arm/smmuv3.h"
>>>>>>  #include "hw/mem/pc-dimm.h"
>>>>>>  #include "hw/mem/nvdimm.h"
>>>>>> +#include "hw/acpi/acpi.h"
>>>>>>  
>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>>>>> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>>>>>>      g_free(nodename);
>>>>>>  }
>>>>>>  
>>>>>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>>>>>> +{
>>>>>> +    MachineState *ms = MACHINE(vms);
>>>>>> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;  
>>>>> should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
>>>>> see enforce_aligned_dimm usage and associated commit for more details  
>>>> I don't understand the computation done in pc machine. eventually we are
>>>> likely to have more device memory than requested by the user. Why don't
>>>> we check (machine->maxram_size - machine->ram_size) >=
>>>> machine->ram_slots * GiB
>>>> instead of adding 1GiB/slot to the initial user requirements?
>>>>
>>>> Also machine->maxram_size - machine->ram_size is checked to be aligned
>>>> with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
>>>> PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
>>>> boundary as I do in this patch?
>>> See commit 085f8e88b for explanation,
>>> What we are basically are doing there is sizing hotpluggbale address space
>>> to allow max possible huge page aligned DIMM to be successfully plugged in
>>> even if address space if fragmented.
>> In v7, I also added ram_slots * GiB to (maxram_size - ram_size).
>>
> 
> Depending on the way the system handles it, this might be confusing for
> the end user and has to be documented somewhere.
> 
> E.g. if there are certain memory limits (say 2TB) and the user specifies
> something like "maxmem=2TB,slots=20" it might be confusing if he gets an
> error like "more than 2TB are not supported".
I Agree. On ARM we also intend to put high IO regions above the RAM so
if we overshoot the host limit, we warn the user the memory map requires
more PA bits than the host can support and the end user is invited to
lower maxmem/slots.

Thanks

Eric
> 
>> Thanks
>>
>> Eric
