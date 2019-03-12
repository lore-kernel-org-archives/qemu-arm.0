Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp699519wrs;
        Tue, 12 Mar 2019 09:51:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQwM1A4TJqQlY1J5vHp6X6sLRz9E7nAg7zmX7WIe0Bi2OFba5UI76AYW9/EP5zTbxecEqX
X-Received: by 2002:a5b:ccc:: with SMTP id e12mr14152232ybr.513.1552409470994;
        Tue, 12 Mar 2019 09:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552409470; cv=none;
        d=google.com; s=arc-20160816;
        b=wrFf+WM9R1Hn6uSS+a/xS9HEzeL8vcdCR30cmuhyyEsVv4gkp/RDGe0jwUp5X0irZf
         rSYKkZgVMoLM6CoCbCpxcnZjFwfXF2g7TReNnMg8fAOt+DrJOWFn5Yd4b0uHrFdxEwS1
         RKDrJhu6NHkHRLz1owgX+p25nt1xjhYeCo1segRpORLe+BjUFWntFwRbIZHjkPA/ky/H
         9fTXLnpPF+5YpWDWm/Fq/COZVcNzaYr7sLrTUvAExlc7AbLlRlO1JhOuQAZrhR8eDdjo
         Xb760wtx558eTw5Qy9oSR1TIUYhKpmEmCAjvQYBpiSwoPJ0tPGe1jQ0C8sgTXLcueNCK
         x9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=tLSRQ+ntxbY3hCoyifgdj5FnojhL/viA5F4VNBfgsOM=;
        b=bra2hNZUvOhDwiVp1Xug/3hWQ8VIqCYEDhzy2/iO1PTWdowGF2vsBHwpuAPm6r50rk
         diP2goiiNTWvZlbaQR8lY21xPNTJdFNdasAyB8Cn1fPkf71wIECQKxnJZqGFAseakq0v
         wNp0STHxyVg8D1VMOlcjLH22laTfuZY+nViUE44bqSdbRp4PyBP3xoP4aW2FPtmqY6sZ
         yZ2ug6IZAlvdLqf/9hBOPq41cDchY988JQfhnMu2ANtigfo/FONTYHSKRyzJgsfyhgCx
         CIEyTxkNkKUeaGF1/7CJBPGoIh71/NyKJsknNi0Bngj1ZzVCbNUpfFdk2XNhTrZ7S9Br
         8RHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si5128819ywb.40.2019.03.12.09.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 09:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3kcQ-0008MQ-D1
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 12:51:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3kZQ-0005Yo-Qa
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3kZO-0005lv-5L
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:48:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3kZN-0005lY-PP; Tue, 12 Mar 2019 12:48:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03C7030C7CB9;
	Tue, 12 Mar 2019 16:48:01 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92DC7600CD;
	Tue, 12 Mar 2019 16:47:58 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
	<640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305F81@lhreml524-mbb.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <90bf7b78-99c2-4950-32db-ebfb9048c76d@redhat.com>
Date: Tue, 12 Mar 2019 17:47:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839305F81@lhreml524-mbb.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 12 Mar 2019 16:48:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose
 the PC-DIMM nodes in the DT
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVBmgcpycUAq

Hi Shameer,

On 3/12/19 5:39 PM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 12 March 2019 15:38
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> Igor Mammedov <imammedo@redhat.com>
>> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
>> shannon.zhaosl@gmail.com; qemu-devel@nongnu.org; Linuxarm
>> <linuxarm@huawei.com>; qemu-arm@nongnu.org; xuwei (O)
>> <xuwei5@huawei.com>; sebastien.boeuf@intel.com
>> Subject: Re: [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose the
>> PC-DIMM nodes in the DT
>>
>> Hi Shameer,
>>
>> On 3/12/19 4:13 PM, Shameerali Kolothum Thodi wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Igor Mammedov [mailto:imammedo@redhat.com]
>>>> Sent: 11 March 2019 14:59
>>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>>>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
>>>> eric.auger@redhat.com; peter.maydell@linaro.org;
>>>> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
>>>> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
>>>> <xuwei5@huawei.com>
>>>> Subject: Re: [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes in
>> the
>>>> DT
>>>>
>>>> On Fri, 8 Mar 2019 11:42:15 +0000
>>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>>
>>>>> This patch adds memory nodes corresponding to PC-DIMM regions.
>>>>>
>>>>> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
>>>>> don't need to care about NVDIMM at this stage.
>>>>>
>>>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> ---
>>>>>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 42 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>>> index a830655..4caaf91 100644
>>>>> --- a/hw/arm/boot.c
>>>>> +++ b/hw/arm/boot.c
>>>>> @@ -19,6 +19,7 @@
>>>>>  #include "sysemu/numa.h"
>>>>>  #include "hw/boards.h"
>>>>>  #include "hw/loader.h"
>>>>> +#include "hw/mem/memory-device.h"
>>>>>  #include "elf.h"
>>>>>  #include "sysemu/device_tree.h"
>>>>>  #include "qemu/config-file.h"
>>>>> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
>>>>>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>>>>>  }
>>>>>
>>>>> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
>>>>> +                                             uint32_t acells,
>>>> uint32_t scells) {
>>>>> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
>>>>> +    MemoryDeviceInfo *mi;
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    for (info = info_list; info != NULL; info = info->next) {
>>>>> +        mi = info->value;
>>>>> +        switch (mi->type) {
>>>>> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
>>>>> +        {
>>>>> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
>>>>> +
>>>>> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
>>>>> +                                      scells, di->size, di->node);
>>>>> +            if (ret) {
>>>>> +                fprintf(stderr,
>>>>> +                        "couldn't add PCDIMM
>> /memory@%"PRIx64"
>>>> node\n",
>>>>> +                        di->addr);
>>>>> +                goto out;
>>>>> +            }
>>>>> +            break;
>>>>> +        }
>>>>> +        default:
>>>>> +            fprintf(stderr, "%s memory nodes are not yet
>> supported\n",
>>>>> +                    MemoryDeviceInfoKind_str(mi->type));
>>>>> +            ret = -ENOENT;
>>>>> +            goto out;
>>>>> +        }
>>>>> +    }
>>>>> +out:
>>>>> +    qapi_free_MemoryDeviceInfoList(info_list);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>>                   hwaddr addr_limit, AddressSpace *as)
>>>>>  {
>>>>> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct
>>>> arm_boot_info *binfo,
>>>>>          }
>>>>>      }
>>>>>
>>>>> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
>>>> According to Eric's test, guest kernel picks this up. So it probably
>>>> should be an opt-in feature to avoid conflict with ACPI definition in DSDT.
>>>
>>> Ok. My take away from that discussion was that if we properly describe the
>>> PNP0C80 (which is what #06 of this series does) then we don't have to worry
>>> about DT entries as ACPI will "override" it.  But it looks like that is not the
>> case
>>> and describing DT will anyway cause the memory being end up in UEFI
>>> GeTMemoryMap() and results in being used as normal memory early at boot.
>>>
>>> Hi Eric,
>>>
>>> How do we verify that this is actually happening? I tried running the
>> /proc/meminfo
>>> on a Qemu build upto #06 of this series, and it reported memory including the
>>> cold plugged dimm memory.
>>>
>>> But not sure how to verify that this dimm mem is being treated as normal
>> mem on
>>> boot time or not? Please let me know.
>>
>> At the time I tested I did not have PNP0C80 build. I confirm that if you
>> remove the dt description in ACPI mode, /proc/meminfo does not report
>> the DIMMs. Now that you have #06, if you remove the DT  hotpluggables
>> memory mode generation in ACPI mode, you should see them and if I
>> understand correctly this is what you confirm. I have not tested
>> anything else at the moment.
> 
> Yes, that is what I confirmed. But the concern now is having DT memory node
> generation will result in the problem described above - UEFI GetMemoryMap().
Sorry I don't understand the stated problem. If you remove the call to
fdt_add_hotpluggable_memory_nodes when running in ACPI mode,  does the
above GetMemoryMap see the DIMMs?

Thanks

Eric
> 
> I was looking for a way to check that is a valid issue or not. I will try to look for 
> a way to verify that. Please update if you come across anything.
> 
> Thanks,
> Shameer
> 
>> Thanks
>>
>> Eric
>>>
>>> Thanks,
>>> Shameer
>>>
>>>
>>>>> +    if (rc < 0) {
>>>>> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
>>>>> +        goto fail;
>>>>> +    }
>>>>> +
>>>>>      rc = fdt_path_offset(fdt, "/chosen");
>>>>>      if (rc < 0) {
>>>>>          qemu_fdt_add_subnode(fdt, "/chosen");
>>>
>>>
