Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1395197lfc;
        Wed, 20 Oct 2021 02:52:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1jKR1UZ14j4PGyenhogsOYj8d/aLPSoFcekk04EnTn8F1FZIHt+5codk35bXGSSUGyHHW
X-Received: by 2002:a05:6830:402c:: with SMTP id i12mr9982671ots.319.1634723550731;
        Wed, 20 Oct 2021 02:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634723550; cv=none;
        d=google.com; s=arc-20160816;
        b=E5388NY2Ve1vn06yPm14G//p0oc45AEmouOzm3QhGXwpY2nAeBmm9gOPU3ctQUcjFS
         GfxuTPAhoAbghMiaKQnyqFXcbFaZ+FWoO984WhXsVnSyqcsVpTjknpPvbGcGXv7l9K0j
         hsprHqf7LFN/uHLgkHnArs7qC14P12icIHGezfDwdJn/NjOZugGmufMl3FqA2Eo6HBP1
         33/mw2SvL1ONIZse4tvjFQ/xHoFxrINUhVC6tm45jNa16Z/tiFOeA+YTqvf3DKAhTG2J
         KTOMZvL7zd3NaeRguwhinYtiAG9BfLle94rLvj95drueaymSbN0qVYBPoL5nPYBFjpvD
         4sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=l1/NwvHQWLJgEftxtJ7SxmNSX0O8BWcBrRQofysKG7k=;
        b=XZBu1D7/Iv8vyqSUC0frUrwdJR18WVON9LzZoUVr3S5ZwSyV1Yzr4CaZBPQFr2ZTdx
         D7yPUSN7XPuGxnRVY8agq5pgt4rzUfvM1ZsAGqXAl8CDG+v1m21jtbW0PawjQklHVTub
         cY5E0Ktu9CcEEDJiJV5+UUmIhOii1mXClxWfB+G3mILN9Wq66XCxt11QNPjZNsHUABoL
         J8jtbc1WffY1e0hUHWUCEae4NrewExqxDG/huFYD+8+SCDbsOEnYtobUZ6Gwg6G4GAj7
         JKN3ieF3jbAY9NVnFl4IswB+q1uOkou1lkpajhbt8tYuw5mRH0BZmBTXiYbvYhBnwHnb
         7kRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si3038616oiw.159.2021.10.20.02.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 02:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md8Gr-0002IN-VX
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 05:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md8GJ-0001i8-Ei; Wed, 20 Oct 2021 05:51:55 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md8GH-0004vF-OF; Wed, 20 Oct 2021 05:51:55 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZ5PJ3k0yzbhGf;
 Wed, 20 Oct 2021 17:47:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 17:51:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 17:51:49 +0800
Subject: Re: [PATCH v8 7/8] hw/arm/virt-acpi-build: Generate PPTT table
To: Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-8-wangyanan55@huawei.com>
 <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d1242aa5-9809-46bf-2815-3e3b898e3798@huawei.com>
Date: Wed, 20 Oct 2021 17:51:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AzPVUF4MLnJc


On 2021/10/20 16:05, Eric Auger wrote:
> Hi
>
> On 10/14/21 3:22 PM, Yanan Wang wrote:
>> Generate PPTT table for Arm virt machines.
> Generate the Processor Properties Topology Table (PPTT) for ARM virt
> machines supporting it (>= 6.2)
Ok, much clearer. I will add it to the commit msg.

Thanks,
Yanan
.
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 6cec97352b..658a0a5d39 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -875,13 +875,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       dsdt = tables_blob->len;
>>       build_dsdt(tables_blob, tables->linker, vms);
>>   
>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>> +    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>   
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_madt(tables_blob, tables->linker, vms);
>>   
>> +    if (!vmc->no_cpu_topology) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_pptt(tables_blob, tables->linker, ms,
>> +                   vms->oem_id, vms->oem_table_id);
>> +    }
>> +
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>>   
>>
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
> Eric
>
> .

