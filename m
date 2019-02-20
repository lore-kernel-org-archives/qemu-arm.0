Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4701687wrx;
        Wed, 20 Feb 2019 07:54:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaDYuLAXwvMgHWej1D5ZM39LxPB7ymOAvMMtvobxpIZrbyQw5t8JHYV6Lt2dJlK2e6hqTPy
X-Received: by 2002:a25:cc57:: with SMTP id l84mr27377337ybf.465.1550678084267;
        Wed, 20 Feb 2019 07:54:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550678084; cv=none;
        d=google.com; s=arc-20160816;
        b=DIixYw+pFdMXfWaD5rdMJ0kTDsWCsvRpPWfy18fe2FsG0hiXP+htDSKveiGrrfkBeo
         NzWYqnDHQuRDooWOD62p20dFAZoz5Kfp8jIGU2SZZrpW1tPyPlfV8xXMREEfXKMpCQls
         9ntpQ0DiZuHOsOmkd6C5eM0bpYjxPyczQQ/rVZLwRZlzDmhZoKDhb184B0A/NoMNAQhA
         JYelnOJqX99knPPh//lfDmQtwwv9SQC6G5KpxbYfyWk3PuVq2o0ucJrSovdQCGFuUphU
         IoK7Sk1sI2UYi8kVPFJ8QDYZM1g6PJNsaDswHyO4CXliJVrPB2yg/ETjTFP+7iQsdUxm
         EFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=i1mFjVBgOJE8k/iN00AtxDLlbt3vShmkI9kssJPVcIM=;
        b=eBUWvuXNFMS8q4R+qetXu3qqMehQfvZ01OXDrWgcrrGE+H/Ft3Ihq0XA9TcwyfdEh7
         mGujopaS9Gyg3fRKVB61WhNWIX7Bvd48eA9h/2xOpSeUltucYJcLnmoa9eh1vD3////S
         Y2ihAtucQxEV61GVMj024QznisGPKe0Lfp/BT58G3KoBcaFAlITzMtJ4N1g009Pe3kwD
         ePbPlefpqRHwiXj3ueuTcszvH2iyG3RmxLnDDVV//6+Ym1Gjj39gqWPieK1klRZ4dWYi
         pKNXurN2lv+lc68FDs4Fl9SYgRK/FloyVZptqwgJ/esKj/RZdQXJBBJ7ypch8rSY0Axm
         GWww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si2984659ybk.151.2019.02.20.07.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 07:54:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwUCp-0008KP-KI
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 10:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwTpr-0005UH-H6
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 10:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwTpb-0001mD-B8
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 10:30:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwTpa-0001eE-GD; Wed, 20 Feb 2019 10:30:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52B6611DBB2;
	Wed, 20 Feb 2019 15:30:20 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C6A17144;
	Wed, 20 Feb 2019 15:30:14 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-13-eric.auger@redhat.com>
	<20190218095838.048819c5@Igors-MacBook-Pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8f8abcb6-6665-dc89-b836-6e9d131f6f44@redhat.com>
Date: Wed, 20 Feb 2019 16:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190218095838.048819c5@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 20 Feb 2019 15:30:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/18] hw/arm/boot: Expose
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3P+ibUJ/2OE

Hi Igor,

On 2/18/19 9:58 AM, Igor Mammedov wrote:
> On Tue,  5 Feb 2019 18:33:00 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> This patch add memory nodes corresponding to PC-DIMM regions.
> s/add/adds/ or s/This patch add/Add/
> 
>>
>> NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
>> don't need to care about NV-DIMM at this stage.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v3 -> v4:
>> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
>>
>> v1 -> v2:
>> - added qapi_free_MemoryDeviceInfoList and simplify the loop
>> ---
>>  hw/arm/boot.c | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 2ef367e15b..2a70e8aa82 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -19,6 +19,7 @@
>>  #include "sysemu/numa.h"
>>  #include "hw/boards.h"
>>  #include "hw/loader.h"
>> +#include "hw/mem/memory-device.h"
>>  #include "elf.h"
>>  #include "sysemu/device_tree.h"
>>  #include "qemu/config-file.h"
>> @@ -526,6 +527,34 @@ static void fdt_add_psci_node(void *fdt)
>>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>>  }
>>  
>> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
>> +                                             uint32_t acells, uint32_t scells) {
>> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
>> +    MemoryDeviceInfo *mi;
>> +    PCDIMMDeviceInfo *di;
>> +    bool is_nvdimm;
>> +    int ret = 0;
>> +
>> +    for (info = info_list; info != NULL; info = info->next) {
>> +        mi = info->value;
>> +        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
>> +        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
>> +
>> +        if (is_nvdimm) {
>> +            ret = -ENOENT; /* NV-DIMM not yet supported */
>> +        } else {
>> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
>> +                                      scells, di->size, di->node);
>> +        }
>> +        if (ret < 0) {
>> +            goto out;
>> +        }
>> +    }
>> +out:
>> +    qapi_free_MemoryDeviceInfoList(info_list);
>> +    return ret;
>> +}
>> +
>>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>                   hwaddr addr_limit, AddressSpace *as)
>>  {
>> @@ -621,6 +650,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          }
>>      }
>>  
>> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
>> +    if (rc < 0) {
>> +            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> error message is rather vague, user using nvdimms + pc-dimms on CLI won't have
> a clue that the former is not supported.
> Suggest pass in error_fatal as argument and report more specific error from
> fdt_add_hotpluggable_memory_nodes()
> 
> does this run on reboot?

Yes after a QMP system_reset I can see the DIMMS on guest in /proc/meminfo

Thanks

Eric
> 
>> +            goto fail;
>> +    }
>> +
>>      rc = fdt_path_offset(fdt, "/chosen");
>>      if (rc < 0) {
>>          qemu_fdt_add_subnode(fdt, "/chosen");
> 
