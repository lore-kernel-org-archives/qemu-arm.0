Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp627629wrs;
        Tue, 12 Mar 2019 08:38:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8Mg0xePMO3jl4NWjA2f7GjBYcb5g5DhOoV79kJRHFVT4bFV580zbR/05F7nrnwu/QxQK7
X-Received: by 2002:a25:4643:: with SMTP id t64mr33323494yba.462.1552405112625;
        Tue, 12 Mar 2019 08:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552405112; cv=none;
        d=google.com; s=arc-20160816;
        b=P/RDP9BiV1kFC2izUaFYBFQmXvSXQfVJBXvS5mRoayMS89ElLIlTsCtpl7jpU9jNYa
         7uu2Yo1X9al4QyRVFl/v/Y68AG4gAvF/Sinr71o0fsMT7VVAL9C2iLMGef2lFbmxcFe5
         ty9DX0opQSntIoAGDNW77WRt3yk5bTntCBUMoZfE721tLWzNyBbULayNGSNyV3PEcg/O
         xovR6HrfcfP6+3J4ODXRFJRIY/jDwkwfLfB+Zk875eairZA7/GpSGSDJJ4Sq6eK9TZzP
         W1fPXE2XXYLdke/Sy3WI6DGfvR5fYNi5+vRDJu4wXwEfNEQM4UUSOrgukl7RQvbQWAQP
         9vLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=r4p/IXv5lMvj36ljGtx0JSyztJr0FJ1+6Vre0ev9bJI=;
        b=EOdN44MQIioLcdMwg+vqUIuZXlf7wmPd/woGT+hj8Bx6XWBVzi60EKP2+DvyZ7fgVP
         Ye8MTJ0kTTK9a4BhcSxlEd7KZFXrl2UNY4uxFHZRU7yPngsa6C/qpGQ5fimmmEPLijzt
         SSPojdhyeMmXkbcHUXnMunBIghWw/mNbTnoTc6fLr5zLp6oFX8S3D1iFJ9+Ub5FQlyAO
         h6pl4xUt3eXnVVq841ZbGTiH8sGvLlz/kxEKVFpnjTyx/ONUUQBC93JFPBOgY3yHMDMP
         Mah18f2xZrxVWEFrUGcY+c7wS+Kmed1uHCbevyqacLY6VhwStbJ9XOy78pTW7MLhu9Kk
         wL/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si5220113yba.308.2019.03.12.08.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 08:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3jU8-0007cM-3i
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 11:38:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3jTv-0007cA-H7
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3jTu-0006uv-Cw
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:38:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3jTu-0006uI-1w; Tue, 12 Mar 2019 11:38:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0F32307CDEA;
	Tue, 12 Mar 2019 15:38:15 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 653EB60C79;
	Tue, 12 Mar 2019 15:38:13 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
Date: Tue, 12 Mar 2019 16:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 12 Mar 2019 15:38:16 +0000 (UTC)
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
X-TUID: 2aIhfrODSe3N

Hi Shameer,

On 3/12/19 4:13 PM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Igor Mammedov [mailto:imammedo@redhat.com]
>> Sent: 11 March 2019 14:59
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org;
>> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
>> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
>> <xuwei5@huawei.com>
>> Subject: Re: [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes in the
>> DT
>>
>> On Fri, 8 Mar 2019 11:42:15 +0000
>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>
>>> This patch adds memory nodes corresponding to PC-DIMM regions.
>>>
>>> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
>>> don't need to care about NVDIMM at this stage.
>>>
>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 42 insertions(+)
>>>
>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>> index a830655..4caaf91 100644
>>> --- a/hw/arm/boot.c
>>> +++ b/hw/arm/boot.c
>>> @@ -19,6 +19,7 @@
>>>  #include "sysemu/numa.h"
>>>  #include "hw/boards.h"
>>>  #include "hw/loader.h"
>>> +#include "hw/mem/memory-device.h"
>>>  #include "elf.h"
>>>  #include "sysemu/device_tree.h"
>>>  #include "qemu/config-file.h"
>>> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
>>>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>>>  }
>>>
>>> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
>>> +                                             uint32_t acells,
>> uint32_t scells) {
>>> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
>>> +    MemoryDeviceInfo *mi;
>>> +    int ret = 0;
>>> +
>>> +    for (info = info_list; info != NULL; info = info->next) {
>>> +        mi = info->value;
>>> +        switch (mi->type) {
>>> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
>>> +        {
>>> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
>>> +
>>> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
>>> +                                      scells, di->size, di->node);
>>> +            if (ret) {
>>> +                fprintf(stderr,
>>> +                        "couldn't add PCDIMM /memory@%"PRIx64"
>> node\n",
>>> +                        di->addr);
>>> +                goto out;
>>> +            }
>>> +            break;
>>> +        }
>>> +        default:
>>> +            fprintf(stderr, "%s memory nodes are not yet supported\n",
>>> +                    MemoryDeviceInfoKind_str(mi->type));
>>> +            ret = -ENOENT;
>>> +            goto out;
>>> +        }
>>> +    }
>>> +out:
>>> +    qapi_free_MemoryDeviceInfoList(info_list);
>>> +    return ret;
>>> +}
>>> +
>>>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>                   hwaddr addr_limit, AddressSpace *as)
>>>  {
>>> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct
>> arm_boot_info *binfo,
>>>          }
>>>      }
>>>
>>> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
>> According to Eric's test, guest kernel picks this up. So it probably
>> should be an opt-in feature to avoid conflict with ACPI definition in DSDT.
> 
> Ok. My take away from that discussion was that if we properly describe the
> PNP0C80 (which is what #06 of this series does) then we don't have to worry
> about DT entries as ACPI will "override" it.  But it looks like that is not the case
> and describing DT will anyway cause the memory being end up in UEFI
> GeTMemoryMap() and results in being used as normal memory early at boot.
> 
> Hi Eric,
> 
> How do we verify that this is actually happening? I tried running the /proc/meminfo
> on a Qemu build upto #06 of this series, and it reported memory including the
> cold plugged dimm memory.
> 
> But not sure how to verify that this dimm mem is being treated as normal mem on
> boot time or not? Please let me know.

At the time I tested I did not have PNP0C80 build. I confirm that if you
remove the dt description in ACPI mode, /proc/meminfo does not report
the DIMMs. Now that you have #06, if you remove the DT  hotpluggables
memory mode generation in ACPI mode, you should see them and if I
understand correctly this is what you confirm. I have not tested
anything else at the moment.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> 
>>> +    if (rc < 0) {
>>> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
>>> +        goto fail;
>>> +    }
>>> +
>>>      rc = fdt_path_offset(fdt, "/chosen");
>>>      if (rc < 0) {
>>>          qemu_fdt_add_subnode(fdt, "/chosen");
> 
> 
