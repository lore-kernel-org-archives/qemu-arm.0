Received: by 10.223.153.116 with SMTP id x107csp387256wrb;
        Mon, 20 Nov 2017 01:42:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb3CK5w+o4oQKf0AAHmtcPz7nPtPh3KfzILji2QQf2PhJ4fuPc/3mvcUg7O8w8RZGTmHr/m
X-Received: by 10.37.183.201 with SMTP id u9mr7905274ybj.333.1511170937200;
        Mon, 20 Nov 2017 01:42:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511170937; cv=none;
        d=google.com; s=arc-20160816;
        b=0togcTsXNk6Vxufw49LSzENRuNB7hzeSo90f7z5waJjxb1YiMK9kCtHihvFqVhtxA2
         IxVqRSEh13MlWB59XHqyaiVXMgNmTtguo56szUXYGxTi0ziEZFmdNVLiz2OfhikS2TDi
         Lh1d/MMuF0Zwq2vp3faSP5YstFO4vTWAtwDVYwJNE8EW2SsVAJ1QSTDtyOY0ldsiQj73
         76typcne3/87jkyHAbWdAsbuLamhH6AgIcIb5YAptsosTxDztQpDB/GyvLZI9xq77Hf2
         b3w7KAQ0noPPtEMz0ioSkNc28UETyfNs3FX6N9Y+tLGKKp2mYeITuLVIbCvxDKaTZJkR
         XBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=qwUCwDnEXynHSRrQOzOPddH/OV768eGomR9i4MjAOnA=;
        b=tzK2hBjGkom5wybe5421XDvfpf2ML9r2HCgHaBwkrlxS/q2e+cCsvBpiwOcTIy8YGk
         h2Rcb41H2j3WMdIhV5awWGEHO+xrWu3j3Ni3QjJmWMexi81U/ZjWM8gVp/1QdVzP/4uF
         /C0VOT/UZx7ieQd998lfTwo1ijQ6hpYKuVqUekDoC/FNqPWHr5Sv0Yc3lQDSYeOt7otQ
         +orafC/HKfOWWV3YdLAwyY/3fxU4I8N0hQgqqB4wx3ls+bLZJz1b1kmo5hAv5/d1pCUQ
         l3OA8AQFPmim5R9ysRWUSXb1X/WFfmq3ypeJtM4kaVzh88mWLEccXsxVS0n36cCdVCeY
         UYhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p9si1991738ybk.401.2017.11.20.01.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 01:42:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGiam-0007VE-LW
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 04:42:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiZ3-0006gH-Cm
	for qemu-devel@nongnu.org; Mon, 20 Nov 2017 04:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiYy-0006G9-Mn
	for qemu-devel@nongnu.org; Mon, 20 Nov 2017 04:40:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eGiYx-0006Fg-UQ; Mon, 20 Nov 2017 04:40:24 -0500
Received: from 172.30.72.60 (EHLO DGGEMS401-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLE72161; Mon, 20 Nov 2017 17:40:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.27.25) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.361.1; Mon, 20 Nov 2017
	17:39:58 +0800
Message-ID: <5A12A2E6.5070103@huawei.com>
Date: Mon, 20 Nov 2017 17:39:50 +0800
From: Zhu Yijun <zhuyijun@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-6-git-send-email-zhuyijun@huawei.com>
	<20171114145150.wydvirgrrcbicvz4@kamzik.brq.redhat.com>
In-Reply-To: <20171114145150.wydvirgrrcbicvz4@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5A12A2FB.0022, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c4e5a6007b4a0d66eee048e14584ae8d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-devel] [RFC 5/5] hw/arm/virt-acpi-build: Build srat table
 according to mem_list
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7cLZ2GQbxsm

On 2017/11/14 22:51, Andrew Jones wrote:
> On Tue, Nov 14, 2017 at 09:15:54AM +0800, zhuyijun@huawei.com wrote:
>> From: Zhu Yijun <zhuyijun@huawei.com>
>>
>> In case of accessing memory holes, we build srat table by
>> traversing mem_list.
>>
>> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 40 +++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3d78ff6..e8dd7c9 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -487,7 +487,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      AcpiSratProcessorGiccAffinity *core;
>>      AcpiSratMemoryAffinity *numamem;
>>      int i, srat_start;
>> -    uint64_t mem_base;
>> +    hwaddr region_offset = 0;       /* region base addr offset */
>> +    hwaddr region_eat_size = 0;     /* region consumed size */
>> +    hwaddr node_mem_size = 0;
>> +    RAMRegion *begin_search_region = QLIST_FIRST(&vms->bootinfo.mem_list);
>> +    RAMRegion *reg;
>> +
>>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>>  
>> @@ -504,12 +509,37 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          core->flags = cpu_to_le32(1);
>>      }
>>  
>> -    mem_base = vms->memmap[VIRT_MEM].base;
>>      for (i = 0; i < nb_numa_nodes; ++i) {
>>          numamem = acpi_data_push(table_data, sizeof(*numamem));
>> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
>> -                          MEM_AFFINITY_ENABLED);
>> -        mem_base += numa_info[i].node_mem;
>> +        node_mem_size = numa_info[i].node_mem;
>> +        QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
>> +            if (reg->base != begin_search_region->base) {
>> +                continue;
>> +            }
>> +
>> +            if (node_mem_size >= (reg->size - region_offset)) {
>> +                region_eat_size = reg->size - region_offset;
>> +            } else {
>> +                region_eat_size = node_mem_size;
>> +            }
>> +
>> +            build_srat_memory(numamem, reg->base + region_offset,
>> +                              region_eat_size, i, MEM_AFFINITY_ENABLED);
>> +
>> +            node_mem_size -= region_eat_size;
>> +            region_offset += region_eat_size;
>> +            begin_search_region = reg;
>> +
>> +            /* The region is depleted */
>> +            if (reg->size == region_offset) {
>> +                region_offset = 0;
>> +                begin_search_region = QLIST_NEXT(reg, next);
>> +            }
>> +
>> +            if (node_mem_size == 0) {
>> +                break;
>> +            }
>> +        }
>>      }
>>  
>>      build_header(linker, table_data, (void *)srat, "SRAT",
>> -- 
>> 1.8.3.1
>>
>>
>>
> Same pc-dimm assigning to NUMA node comment from last patch applies to this
> one.

ok, thanks!

> Thanks,
> drew 
>
> .
>


