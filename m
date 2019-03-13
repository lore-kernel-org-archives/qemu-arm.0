Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1517344wrs;
        Wed, 13 Mar 2019 04:12:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/hmxVYfj71Zq1IXBLSmAEo6g/ta0E5Q9ZQJu+q2e/PLObyP/9jp96YjvVayrTa2N+Ut3j
X-Received: by 2002:a81:ac4f:: with SMTP id z15mr34213633ywj.59.1552475568081;
        Wed, 13 Mar 2019 04:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552475568; cv=none;
        d=google.com; s=arc-20160816;
        b=ltgslQ00B6a89NJblDE0FcteUo+qR/oThuvYlE0j/Z8wQyjdPPN05qvxhfZP/4/ak3
         QFgAJDB2prIf7NKe4CiROQb3GyQ5N5MwR3op7YgD6GU5XdmdORJdoJTTdLy8pnkzuNWp
         YaBvQws+xIPfMiH9h5UmBIKBrTq2QK7qmqE0E9CLQ1fRZT6oD/g66/FQ5AguEE+06KAS
         Vtn4ZJI3pAf0bUSerWPxXfg0Eg6+KvNlhvaft8I5wJcCB1rmYZhf0DPf1YjiZMgqqfGz
         6+HQIyY/pW0JF1I/tkEm4+0sF38rbFGX4T7iqe3f2gRrNqk3DC7RlGzhZ9fA7IrJ1lQ1
         4VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=E3WU570Cyf2c9/UGyuWzsg7eGsFob0bo1hgs+UWNrFA=;
        b=hG/QztfOKxxffRvKRDn5z9HwriKdXi3RUpD5p9dJxM94M0wihvZJm5egdPZs6aaHhw
         yU54/n17SuvwfHAlYpL40EsY1q4CYB4XrOFt41scfyMwd8960SlhzV2yp4zk4c9ryNnd
         jay/uWTE/w+92vBNCbHC8OxLXrgkK0l+JRwNWibW6Dqy1yIUq1XrY60WLUfQuLQsREUp
         3+p1XPyLkAiK3POIlgDLjZdB4IPkX38ujqEwtYq6KMUxYPVihot1UmzmOkAu/JzW9V+K
         B91gEZIDvc6ITmlGIThKgwvEyzAZduQyVXDPIFfRx2SZ1rqt7lyk/Nqiby1JZhFL9krp
         r8fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si5609117ywd.302.2019.03.13.04.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 04:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h41oV-0001F2-GF
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 07:12:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h41oM-0001El-9E
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 07:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h41oK-0002fN-Rh
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 07:12:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h41oK-0002f2-Fr; Wed, 13 Mar 2019 07:12:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A998D308626F;
	Wed, 13 Mar 2019 11:12:35 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E2B619BA;
	Wed, 13 Mar 2019 11:12:32 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
	<640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305F81@lhreml524-mbb.china.huawei.com>
	<90bf7b78-99c2-4950-32db-ebfb9048c76d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305FFC@lhreml524-mbb.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7a916709-836d-92a1-3cca-234902fca705@redhat.com>
Date: Wed, 13 Mar 2019 12:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839305FFC@lhreml524-mbb.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 13 Mar 2019 11:12:35 +0000 (UTC)
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
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VFMPO1H2rJlz

Hi Shameer,

On 3/12/19 5:56 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 12 March 2019 16:48
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
>> On 3/12/19 5:39 PM, Shameerali Kolothum Thodi wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>>> Sent: 12 March 2019 15:38
>>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>>>> Igor Mammedov <imammedo@redhat.com>
>>>> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
>>>> shannon.zhaosl@gmail.com; qemu-devel@nongnu.org; Linuxarm
>>>> <linuxarm@huawei.com>; qemu-arm@nongnu.org; xuwei (O)
>>>> <xuwei5@huawei.com>; sebastien.boeuf@intel.com
>>>> Subject: Re: [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose the
>>>> PC-DIMM nodes in the DT
>>>>
>>>> Hi Shameer,
>>>>
>>>> On 3/12/19 4:13 PM, Shameerali Kolothum Thodi wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Igor Mammedov [mailto:imammedo@redhat.com]
>>>>>> Sent: 11 March 2019 14:59
>>>>>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>
>>>>>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
>>>>>> eric.auger@redhat.com; peter.maydell@linaro.org;
>>>>>> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
>>>>>> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei
>> (O)
>>>>>> <xuwei5@huawei.com>
>>>>>> Subject: Re: [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes
>> in
>>>> the
>>>>>> DT
>>>>>>
>>>>>> On Fri, 8 Mar 2019 11:42:15 +0000
>>>>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>>>>
>>>>>>> This patch adds memory nodes corresponding to PC-DIMM regions.
>>>>>>>
>>>>>>> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
>>>>>>> don't need to care about NVDIMM at this stage.
>>>>>>>
>>>>>>> Signed-off-by: Shameer Kolothum
>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> ---
>>>>>>>  hw/arm/boot.c | 42
>> ++++++++++++++++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 42 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>>>>> index a830655..4caaf91 100644
>>>>>>> --- a/hw/arm/boot.c
>>>>>>> +++ b/hw/arm/boot.c
>>>>>>> @@ -19,6 +19,7 @@
>>>>>>>  #include "sysemu/numa.h"
>>>>>>>  #include "hw/boards.h"
>>>>>>>  #include "hw/loader.h"
>>>>>>> +#include "hw/mem/memory-device.h"
>>>>>>>  #include "elf.h"
>>>>>>>  #include "sysemu/device_tree.h"
>>>>>>>  #include "qemu/config-file.h"
>>>>>>> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
>>>>>>>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>>>>>>>  }
>>>>>>>
>>>>>>> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
>>>>>>> +                                             uint32_t acells,
>>>>>> uint32_t scells) {
>>>>>>> +    MemoryDeviceInfoList *info, *info_list =
>> qmp_memory_device_list();
>>>>>>> +    MemoryDeviceInfo *mi;
>>>>>>> +    int ret = 0;
>>>>>>> +
>>>>>>> +    for (info = info_list; info != NULL; info = info->next) {
>>>>>>> +        mi = info->value;
>>>>>>> +        switch (mi->type) {
>>>>>>> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
>>>>>>> +        {
>>>>>>> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
>>>>>>> +
>>>>>>> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
>>>>>>> +                                      scells, di->size,
>> di->node);
>>>>>>> +            if (ret) {
>>>>>>> +                fprintf(stderr,
>>>>>>> +                        "couldn't add PCDIMM
>>>> /memory@%"PRIx64"
>>>>>> node\n",
>>>>>>> +                        di->addr);
>>>>>>> +                goto out;
>>>>>>> +            }
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +        default:
>>>>>>> +            fprintf(stderr, "%s memory nodes are not yet
>>>> supported\n",
>>>>>>> +                    MemoryDeviceInfoKind_str(mi->type));
>>>>>>> +            ret = -ENOENT;
>>>>>>> +            goto out;
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +out:
>>>>>>> +    qapi_free_MemoryDeviceInfoList(info_list);
>>>>>>> +    return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>>>>                   hwaddr addr_limit, AddressSpace *as)
>>>>>>>  {
>>>>>>> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct
>>>>>> arm_boot_info *binfo,
>>>>>>>          }
>>>>>>>      }
>>>>>>>
>>>>>>> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
>>>>>> According to Eric's test, guest kernel picks this up. So it probably
>>>>>> should be an opt-in feature to avoid conflict with ACPI definition in DSDT.
>>>>>
>>>>> Ok. My take away from that discussion was that if we properly describe the
>>>>> PNP0C80 (which is what #06 of this series does) then we don't have to
>> worry
>>>>> about DT entries as ACPI will "override" it.  But it looks like that is not the
>>>> case
>>>>> and describing DT will anyway cause the memory being end up in UEFI
>>>>> GeTMemoryMap() and results in being used as normal memory early at
>> boot.
>>>>>
>>>>> Hi Eric,
>>>>>
>>>>> How do we verify that this is actually happening? I tried running the
>>>> /proc/meminfo
>>>>> on a Qemu build upto #06 of this series, and it reported memory including
>> the
>>>>> cold plugged dimm memory.
>>>>>
>>>>> But not sure how to verify that this dimm mem is being treated as normal
>>>> mem on
>>>>> boot time or not? Please let me know.
>>>>
>>>> At the time I tested I did not have PNP0C80 build. I confirm that if you
>>>> remove the dt description in ACPI mode, /proc/meminfo does not report
>>>> the DIMMs. Now that you have #06, if you remove the DT  hotpluggables
>>>> memory mode generation in ACPI mode, you should see them and if I
>>>> understand correctly this is what you confirm. I have not tested
>>>> anything else at the moment.
>>>
>>> Yes, that is what I confirmed. But the concern now is having DT memory node
>>> generation will result in the problem described above - UEFI
>> GetMemoryMap().
>> Sorry I don't understand the stated problem. If you remove the call to
>> fdt_add_hotpluggable_memory_nodes when running in ACPI mode,  does the
>> above GetMemoryMap see the DIMMs?
> 
> That is what I am also trying to verify :). How do we verify the GetMemoryMap() sees
> the DIMMs or not? As I said, I have tested it with patch upto #06(means no 
> fdt_add_hotpluggable_memory_nodes) and checked /proc/meminfo which has
> the dimm memory included in the total memory it reports.
> 
> But not sure how you will verify whether GetMemoryMap() see the dimm or not.
> 
> Thanks,
> Shameer
>  
>> Thanks
>>
>> Eric
>>>
>>> I was looking for a way to check that is a valid issue or not. I will try to look for
>>> a way to verify that. Please update if you come across anything.

OK I get it. Thank you for your patience! Maybe actual status can be
checked in /sys/devices/system/memory/memoryX/*?

Thanks

Eric
>>>
>>> Thanks,
>>> Shameer
>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>>
>>>>> Thanks,
>>>>> Shameer
>>>>>
>>>>>
>>>>>>> +    if (rc < 0) {
>>>>>>> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
>>>>>>> +        goto fail;
>>>>>>> +    }
>>>>>>> +
>>>>>>>      rc = fdt_path_offset(fdt, "/chosen");
>>>>>>>      if (rc < 0) {
>>>>>>>          qemu_fdt_add_subnode(fdt, "/chosen");
>>>>>
>>>>>
