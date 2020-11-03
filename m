Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4426095lfa;
        Mon, 2 Nov 2020 18:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0GKYqwD1nNcSYHYBqNeFchoavGh6KQhwbPz92Et4KYRdoI53RBlMx/6uBGY7+xJjqA6m9
X-Received: by 2002:ac8:6b8d:: with SMTP id z13mr17275582qts.41.1604369871482;
        Mon, 02 Nov 2020 18:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604369871; cv=none;
        d=google.com; s=arc-20160816;
        b=xQp70avurlxDhA/KY5clD/bbKwXpoUAxlpi+uG1xBSZ5261HCB5MuhDADAmiBfANcA
         +7beonXc8X4uaGRJJX5ddYbrFAd9Hj08d9zsEX3UqRUD/4GsKLQ4hNAnWClGjGP5WKYu
         ABJ6qbVZw/schvgqf+Itx0KK82c6E2wDTkRQIK3RJMNmPY8zuZ4wQPyU4l8ITG+4AxGO
         7uyD6PrAer1Y3VyIBm/7Xzuip/DLMs2eJzTtMsR41QzPHQW2KzGm/+Y32XpWSfZ+gSRo
         KwjkmSarcPfUNH9VMPNVEFfLOybM8O5jppd7M/hzvat3AalUTPqGPDSKDTocz/unjVZd
         1Hqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=U/IFe3TiQZkYedYqmSFZTUSTn9CDh08U/jzyWBcqfzU=;
        b=xkF/5b5oN8qmQQNLoGTHAoK1X4IcT4c81YMyQYjzq6IVbraYh/jsdUoDiTogingGQq
         yX8rN+qpVDHLb/w1Bflw18v0rwBMuRRD87KUhEUnhfQL8NpmKCWupiO1bAVQZoG+4jMm
         QID8sXGcWRP1IP1rMpQcpb3WLUR7e5SmFa20kv7XysAdjpIgcoIQYBGjynBz9aY8gbAt
         gIa8iXbOg7EApAhU4/VUvq/HMZBqWCUgiV7i7Ier52QPINiN80ESh0Ghy3eULg3YaUH4
         zZkV3dmQLMAwsWP0WUcxr/lEdaECYViRWf02YdtEamUnaqc5aLyk3cns51pqKgxckmjP
         KebA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si10695900qkf.89.2020.11.02.18.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 18:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZltO-0000XS-U4
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 21:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZlsM-0000WI-9k; Mon, 02 Nov 2020 21:16:48 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZlsC-0004fk-5D; Mon, 02 Nov 2020 21:16:45 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CQD185FYkz71jM;
 Tue,  3 Nov 2020 10:16:28 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 10:16:22 +0800
Subject: Re: [RFC PATCH v2 08/13] hw/acpi/aml-build: add processor hierarchy
 node structure
To: Andrew Jones <drjones@redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-9-fangying1@huawei.com>
 <20201029172458.kgeab6rkjrb6wtyw@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <cc8fc8d7-3b7e-fac5-0b1d-3a1aa5674642@huawei.com>
Date: Tue, 3 Nov 2020 10:16:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201029172458.kgeab6rkjrb6wtyw@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:47:30
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
 Henglong Fan <fanhenglong@huawei.com>, alistair.francis@wdc.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7/EViMAJ7Bn



On 10/30/2020 1:24 AM, Andrew Jones wrote:
> On Tue, Oct 20, 2020 at 09:14:35PM +0800, Ying Fang wrote:
>> Add the processor hierarchy node structures to build ACPI information
>> for CPU topology. Three helpers are introduced:
>>
>> (1) build_socket_hierarchy for socket description structure
>> (2) build_processor_hierarchy for processor description structure
>> (3) build_smt_hierarchy for thread (logic processor) description structure
> 
> I see now the reason to introduce three functions is because the last
> patch adds different private resources. You should point that plan out
> in this commit message.

Yes, the private resources are used to describe cache hierarchy
and it is variable among different topology level. I will point it
out in the commit message to avoid any confusion.

Thanks,
Ying

> 
> Thanks,
> drew
> 
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
>> ---
>>   hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
>>   include/hw/acpi/aml-build.h |  7 +++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 3792ba96ce..da3b41b514 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1770,6 +1770,43 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
>>                    table_data->len - slit_start, 1, NULL, NULL);
>>   }
>>   
>> +/*
>> + * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
>> + */
>> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, 0);          /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);         /* Length, no private resources */
>> +    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
>> +    build_append_int_noprefix(tbl, 1, 4);  /* Flags: Physical package */
>> +    build_append_int_noprefix(tbl, parent, 4);  /* Parent */
>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
>> +}
>> +
>> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
>> +                               uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, 0);          /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);         /* Length, no private resources */
>> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
>> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
>> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
>> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
>> +}
>> +
>> +void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
>> +{
>> +    build_append_byte(tbl, 0);            /* Type 0 - processor */
>> +    build_append_byte(tbl, 20);           /* Length, add private resources */
>> +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
>> +    build_append_int_noprefix(tbl, 0x0e, 4);    /* Processor is a thread */
>> +    build_append_int_noprefix(tbl, parent , 4); /* parent */
>> +    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
>> +    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
>> +}
>> +
>>   /* build rev1/rev3/rev5.1 FADT */
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id)
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index fe0055fffb..56474835a7 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -437,6 +437,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>>   
>>   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
>>   
>> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
>> +
>> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
>> +                               uint32_t parent, uint32_t id);
>> +
>> +void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
>> +
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 
