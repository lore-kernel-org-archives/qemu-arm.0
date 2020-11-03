Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4434287lfa;
        Mon, 2 Nov 2020 18:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygeMdjz9X+BL98bvPsOuHmg5BG3oGcaVOoJaA26GqgYwdK2m9FvRijBU1ofMBkpDArseF4
X-Received: by 2002:ac8:7cd:: with SMTP id m13mr17901611qth.133.1604370893435;
        Mon, 02 Nov 2020 18:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604370893; cv=none;
        d=google.com; s=arc-20160816;
        b=DEGf7lfBoCOOAEQate8dt/2LKyvfFhiuZyDUzuzg70Fps++JZJYpl262vCCYJihKYf
         qNYDoUQqEmxCd0W0DRIzmJmlPXUE2SF7IdtZff546+X6CxLvuceBeCwzMUMq6Z42XSEd
         nwX26zro2b2sVojS4cNo+nHxP/+ki3OgU75Vif9WWSL6ZzAKPsuRJ4qFuJXEgNv96mem
         BKE6Uj8w2ia+MIQBM1gVr3zrZ9TbD8WAi38lCmTDuRt2ONfuOX7PMhPeTsX52fwgP55r
         g/REwtV/blNJYqiNL6w7QC+1q+bclqcAn8d1cx0bkjwP5SlMXfG7IhX5hTyV4ncJKHI2
         GoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=u7ViRd23wL2+KxNOCm0S2yL8F1st4kUeDWlJZ/bIzFU=;
        b=0g2GB5p91HFoQsNfHKN2otRHe5RVlC3CNS3ditvxL0A0wx9GStR1gMqgOAB2iw9qAF
         0kj92z32zxzQO44bcugcxK6lkFQ6P9FYWJrwTPyP+Wzd+3CNWNbWo/iKP1mC2nLQAygU
         McmDeIl7UCVU2e8uPtEyuTiuKIB5373Ql6NvN7bzOCDQ6PY7GWO0q/5lBeQQfxjl3QWJ
         xr4canMIQedwrvzIIOn9L6oeLvl7wT/YtWUVipTRJT1nDvwJgsNJER3J2oLACqIdwPw7
         0l004H1zGFGW2i3gagMDHC+vx8XmuswemQSYQVmBOcclyXWlBs4AjnGfi5z7akRva3rD
         xMUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si7154665qkn.168.2020.11.02.18.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 18:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZm9r-0004PO-6R
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 21:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZm9W-0004Or-Jw; Mon, 02 Nov 2020 21:34:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZm9S-0006Z3-QY; Mon, 02 Nov 2020 21:34:30 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQDPf3c8lzkdTc;
 Tue,  3 Nov 2020 10:34:14 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 10:34:11 +0800
Subject: Re: [RFC PATCH v2 09/13] hw/arm/virt-acpi-build: add PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-10-fangying1@huawei.com>
 <20201029165614.mbwv26bnx6ntughx@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <a15bf72b-ad48-aa2a-d782-304159f7b11b@huawei.com>
Date: Tue, 3 Nov 2020 10:34:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201029165614.mbwv26bnx6ntughx@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dUc22u9ANKKp



On 10/30/2020 12:56 AM, Andrew Jones wrote:
> On Tue, Oct 20, 2020 at 09:14:36PM +0800, Ying Fang wrote:
>> Add the Processor Properties Topology Table (PPTT) to present CPU topology
>> information to the guest.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> I don't know why I have an s-o-b here. I guess it's because this code
> looks nearly identical to what I wrote, except for using the new and,
> IMO, unnecessary build_socket_hierarchy and build_smt_hierarchy functions.
> 
> IMHO, you should drop the last patch and just take
> 
> https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11
> 
> as it is, unless it needs to be fixed somehow
> 
> Thanks,
> drew

This patch is based on your branch however it is slightly modified.
As described in:

[RFC,v2,08/13] hw/acpi/aml-build: add processor hierarchy node structure

The wrapper function build_socket_hierarchy and build_smt_hierarchy are
introduced to make later patch much more readable and make preparations 
for cache hierarchy.

Hope it won't make you confused. I will drop your branch patch and
give details in the commit message in the next post.

Thanks,
Ying
> 
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index fae5a26741..e1f3ea50ad 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -429,6 +429,42 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                    "SRAT", table_data->len - srat_start, 3, NULL, NULL);
>>   }
>>   
>> +static void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms)
>> +{
>> +    int pptt_start = table_data->len;
>> +    int uid = 0, cpus = 0, socket;
>> +    unsigned int smp_cores = ms->smp.cores;
>> +    unsigned int smp_threads = ms->smp.threads;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
>> +        uint32_t socket_offset = table_data->len - pptt_start;
>> +        int core;
>> +
>> +        build_socket_hierarchy(table_data, 0, socket);
>> +
>> +        for (core = 0; core < smp_cores; core++) {
>> +            uint32_t core_offset = table_data->len - pptt_start;
>> +            int thread;
>> +
>> +            if (smp_threads <= 1) {
>> +                build_processor_hierarchy(table_data, 2, socket_offset, uid++);
>> +             } else {
>> +                build_processor_hierarchy(table_data, 0, socket_offset, core);
>> +                for (thread = 0; thread < smp_threads; thread++) {
>> +                    build_smt_hierarchy(table_data, core_offset, uid++);
>> +                }
>> +             }
>> +        }
>> +        cpus += smp_cores * smp_threads;
>> +    }
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + pptt_start), "PPTT",
>> +                 table_data->len - pptt_start, 2, NULL, NULL);
>> +}
>> +
>>   /* GTDT */
>>   static void
>>   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> @@ -669,6 +705,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       unsigned dsdt, xsdt;
>>       GArray *tables_blob = tables->table_data;
>>       MachineState *ms = MACHINE(vms);
>> +    bool cpu_topology_enabled = !vmc->ignore_cpu_topology;
>>   
>>       table_offsets = g_array_new(false, true /* clear */,
>>                                           sizeof(uint32_t));
>> @@ -688,6 +725,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_madt(tables_blob, tables->linker, vms);
>>   
>> +    if (cpu_topology_enabled) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_pptt(tables_blob, tables->linker, ms);
>> +    }
>> +
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>>   
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 
