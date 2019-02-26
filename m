Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11342188wrx;
        Tue, 26 Feb 2019 10:00:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia7VcNFlS4NaihuXLLvOmfiXaYNaKwoIufcxw4P+sRjaDUAKumgBMAiW23E0T6+7IbK4SVs
X-Received: by 2002:a25:ccc6:: with SMTP id l189mr17092327ybf.301.1551204015788;
        Tue, 26 Feb 2019 10:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551204015; cv=none;
        d=google.com; s=arc-20160816;
        b=chTz79HA4dpIoaxNrwDl2cRrAO9gSo531xoYlcvyztfMjeHSWlH0FLA97MkH1GknW7
         6rz9iBxkrfNkvZIyeBaSEWsm/381SjHt9JoqYRXS+DY/WWZu7JYgVhSaOjjotBOQTSUu
         Qx5sIlTMxj54l3pYKLZF2MEoFoa8pkazm7veIKT6l8r3otf90W+XYf3j2wgw8/j1UMac
         KnQiWmjZBLPXFQIYAKscI25lKdynOwohTL8bZFbGObJgr8WiQTEUjbQkD3XLq/vVc7d0
         G42QRckrhn8O3DtHxP1LGu/IBCF4/FyewdJRqLsUPC/ysgVy7yNiOVQjo1PJXxb/PBB/
         Si3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gfPko6hP146zie84zO+LO8y24S/PPiqzKC42jvbKizc=;
        b=dVyYfzA3b5B9PzQQrwtIia8P94vtdUfZqGpwBZEb/dc1a7BVALo3Qr10W18VJXVIl3
         +1sdSzGUxE5EGTzAPVyTNnPJq7ouAVnpQldseq83mR5CDADz2ebwEQqeVShUyYEEZ29o
         B1tLeOaZQcuJB3/2QRV4Nmheszm0zcDQ/bs40WeM3EjSoKey+rtA6tzInGxLzdIhqPd4
         BpwLQDhee+PHLSV0mnVS/hCUAgaSaLighQWdjtA+aW6+3qAhbLZoF9mtShZuIHMPMLOC
         j0l6+xLkH+6+ArpDCfqHlhdwdDOetx5htzcP4QrrL0HTUE6SRssnXNvyMwNMO6jXXS8u
         Tpow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l77si975055ywl.243.2019.02.26.10.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 10:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyh1b-0000B8-By
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 13:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyh1U-0000Au-1v
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 13:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyh1S-0000hH-HL
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 13:00:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33244)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyh1S-0000VF-5X; Tue, 26 Feb 2019 13:00:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A64489C3F;
	Tue, 26 Feb 2019 17:59:58 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CC5600C0;
	Tue, 26 Feb 2019 17:59:51 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
	<20190226135014.31854-13-eric.auger@redhat.com>
	<20190226180841.0c30af3c@Igors-MacBook-Pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2cd3fb96-6f46-18db-cb55-5c4e30fd3bac@redhat.com>
Date: Tue, 26 Feb 2019 18:59:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190226180841.0c30af3c@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 26 Feb 2019 17:59:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v8 12/18] hw/arm/boot: Expose the PC-DIMM
 nodes in the DT
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
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4js0epnEg9H/

Hi Igor,

On 2/26/19 6:08 PM, Igor Mammedov wrote:
> On Tue, 26 Feb 2019 14:50:08 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> This patch adds memory nodes corresponding to PC-DIMM regions.
>>
>> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
>> don't need to care about NVDIMM at this stage.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> I'm having second thoughts on this one,
> maybe we should drop this patch or at least not to do this by default.
See my reply on your cover letter remark.
> In the later case it would mean some kind of property that user could use
> to turn this on which in its own turn adds more clutter to user tunables
> (which is not desirable). So I'm leaning more towards dropping this patch for now.
So what about DT support? Doesn't it make sense to support
cold-pluggable DIMMS?

Thanks

Eric
> 
>>
>> ---
>> v7 -> v8:
>> - s/NV_DIMM/NVDIMM
>> - fix indent
>> v6 -> v7:
>> - rework the error messages, use a switch/case
>> v3 -> v4:
>> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
>>
>> v1 -> v2:
>> - added qapi_free_MemoryDeviceInfoList and simplify the loop
>> ---
>>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index a830655e1a..4caaf91583 100644
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
>> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
>>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>>  }
>>  
>> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
>> +                                             uint32_t acells, uint32_t scells) {
>> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
>> +    MemoryDeviceInfo *mi;
>> +    int ret = 0;
>> +
>> +    for (info = info_list; info != NULL; info = info->next) {
>> +        mi = info->value;
>> +        switch (mi->type) {
>> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
>> +        {
>> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
>> +
>> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
>> +                                      scells, di->size, di->node);
>> +            if (ret) {
>> +                fprintf(stderr,
>> +                        "couldn't add PCDIMM /memory@%"PRIx64" node\n",
>> +                        di->addr);
>> +                goto out;
>> +            }
>> +            break;
>> +        }
>> +        default:
>> +            fprintf(stderr, "%s memory nodes are not yet supported\n",
>> +                    MemoryDeviceInfoKind_str(mi->type));
>> +            ret = -ENOENT;
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
>> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          }
>>      }
>>  
>> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
>> +    if (rc < 0) {
>> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
>> +        goto fail;
>> +    }
>> +
>>      rc = fdt_path_offset(fdt, "/chosen");
>>      if (rc < 0) {
>>          qemu_fdt_add_subnode(fdt, "/chosen");
> 
