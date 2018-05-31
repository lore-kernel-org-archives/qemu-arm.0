Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp6323327wre;
        Thu, 31 May 2018 13:16:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLeB9Wnkjbv08T31S7URktTAuILkLjozIgWOOWuhEqeS4v2BVopMYHJAGqsXQN9Z9qPqmWO
X-Received: by 2002:a37:1314:: with SMTP id d20-v6mr7702668qkh.422.1527797777478;
        Thu, 31 May 2018 13:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527797777; cv=none;
        d=google.com; s=arc-20160816;
        b=M6R4w4G7F77CLzdBME1qH/LPrj8jz7UNk7virAmmmz5LRXBO0ZA9TJfUbrgG9U0fdL
         cgpFf5JYc/fXmUxiaxS0wLG/e30QRk96cvGFdbZa6cehPZWovQSO5GyAAEVAMoawRL5N
         3IibkvZ6o8xC3zMlPavgGYYW6pj9NBN+Qam0BKWv/nGykBSRrxUsx+NOrFl03m9IKHKF
         ZkoygmBp0FcadOtwF4DC96wp3t76delaOIvLao9iMftrWZ33xv11bUj81fmYEpsZhzA+
         s8nPQ4WVIpNvuoQyQuB+NhbmM6Wu2e+sKbs36QdaSN0Xq6M29Timl89UIiLgsYc4R6WD
         SSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=vH6YAtdzZBvJKAKjj1VKAVOTNoiJiPIz7Lgu6qm+2hQ=;
        b=vAh6YP+gqD+0uvodmSQA9emMjVBT8MnU56CCiNpYD8OjOC3JeQCyNjuKXwtCnQhSPQ
         dBFJR5XfoZv3cDk6cUPvNkjEJe20Z2Z0kOWu7jhPvcRcnfdJO7eMoONZqGEYSdl+xIWE
         WFgevGKjnSAf/GdRqCTjXgoHkBfoH4Iv7yxt2MeD8rL35Xf3zbfYX8o+qeqILwMqBqSI
         Ao6oDRWGIoN+Q4lKlijp78ZepLodjiNcD7TkQEUeCkLjnvJdzyaWsJ36K+6AJZSq+1jy
         wune3PeizzDvV2dUlljpt6nZjRGdl8Pqgf42Rv8iH089i59Afl9beDtAw+Mmb20kOrGn
         /CCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22-v6si1011276qtc.359.2018.05.31.13.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 13:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOTzd-0003Mj-13
	for alex.bennee@linaro.org; Thu, 31 May 2018 16:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOTzT-0003Lb-03
	for qemu-arm@nongnu.org; Thu, 31 May 2018 16:16:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOTzO-0007i8-6f
	for qemu-arm@nongnu.org; Thu, 31 May 2018 16:16:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39034 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOTzO-0007h2-0h; Thu, 31 May 2018 16:16:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C255640704B2;
	Thu, 31 May 2018 20:16:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EDCC84433;
	Thu, 31 May 2018 20:15:57 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
	<20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <27825c1d-07a2-f03e-477a-03e3d778ac35@redhat.com>
Date: Thu, 31 May 2018 22:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 20:16:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 20:16:00 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes
 to accommodate non-contiguous mem
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
Cc: peter.maydell@linaro.org, jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org, linuxarm@huawei.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xjzeZtegOIrC

Hi Shameer,

On 05/28/2018 07:02 PM, Andrew Jones wrote:
> On Wed, May 16, 2018 at 04:20:25PM +0100, Shameer Kolothum wrote:
>> This is in preparation for the next patch where initial ram is split
>> into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
>> iova regions are non-contiguous.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index c7c6a57..8d17b40 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      AcpiSratProcessorGiccAffinity *core;
>>      AcpiSratMemoryAffinity *numamem;
>>      int i, srat_start;
>> -    uint64_t mem_base;
>> +    uint64_t mem_base, mem_sz, mem_len;
>>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>>  
>> @@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          core->flags = cpu_to_le32(1);
>>      }
>>  
>> -    mem_base = vms->memmap[VIRT_MEM].base;
>> +    mem_base = vms->bootinfo.loader_start;
>> +    mem_sz = vms->bootinfo.loader_start;
> 
> mem_sz = vms->bootinfo.ram_size;
> 
> Assuming the DT generator was correct, meaning bootinfo.ram_size will
> be the size of the non-pluggable dimm.
> 
> 
>>      for (i = 0; i < nb_numa_nodes; ++i) {
>>          numamem = acpi_data_push(table_data, sizeof(*numamem));
>> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
>> +        mem_len = MIN(numa_info[i].node_mem, mem_sz);
>> +        build_srat_memory(numamem, mem_base, mem_len, i,
>>                            MEM_AFFINITY_ENABLED);
>> -        mem_base += numa_info[i].node_mem;
>> +        mem_base += mem_len;
>> +        mem_sz -= mem_len;
>> +        if (!mem_sz) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    /* Create table for initial pc-dimm ram, if any */
>> +    if (vms->bootinfo.dimm_mem) {
>> +        numamem = acpi_data_push(table_data, sizeof(*numamem));
>> +        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
>> +                          vms->bootinfo.dimm_mem->size,
>> +                          vms->bootinfo.dimm_mem->node,
>> +                          MEM_AFFINITY_ENABLED);
If my understanding is correct the SRAT table is built only if
nb_numa_nodes > 0. I don't get how the PC-DIMM region is exposed if NUMA
nodes are not set?

Thanks

Eric
>> +
>>      }
>>  
>>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
>> -- 
>> 2.7.4
>>
>>
>>
> 
