Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1551609lfc;
        Wed, 20 Oct 2021 05:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO2+IQ4Mg1OPXeQzv9X5NlE1orKaonY8EpkqvxrlaEK70Nb0vBEnmuNdcHBUjelO+kuXkZ
X-Received: by 2002:a9d:6159:: with SMTP id c25mr10401382otk.286.1634734407975;
        Wed, 20 Oct 2021 05:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634734407; cv=none;
        d=google.com; s=arc-20160816;
        b=KHt1BJxQE2u5ZBG6uDsPf7Q12+jclY/Z7ya6ijJ5LvaxXjPP7luCQfpzN5Z9A7Gle2
         Gc5VSzhNr4LJUqJJoAlItv/wkDNfdQ7+BrW1ThIjzpV6QkEIPhbN0H27uut4pc2sKKDr
         oMfpPDUk2BvwTuS91QVPE7GQBTOO/0+RWlQs2/AxUdai7DAX0el8sJVGXtNpyLhzhunK
         x/Z10xFaSaM/eLTPGT+RiPSYTW/qXPtA0N7QDNL1OtJ/LaHqMRJgvGIlTdRym3GNWsn4
         RAkPRbwiop3wOrjI+i6NXuZr88T78m2LfU/cfFb7UGCPl21hOzE54gSAMJXndDgPO/9b
         TKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ip8nXZ//v6fBZZ1wdJ/voCFJrUKRs5lkvU6v2TpDfws=;
        b=nWz3AoJ8pm2QhonHviLJ1wY7ziwDJaMgwXYArlyUD5So5IlPbjsVD0RsFYGvw3iH+b
         lQbWaPbr7lKmeXvt+UHdWxQAlYbMIkVhEtwJ+0Uz+TgDylav4C1Jskuo+MW5h1Yip7UZ
         /8vFPhXzI7av6cwC0FOPhxMqsCSqUCQlxNAEyd/03rCGqRbaHXkCAyhAAAY3GzF3BJMs
         YMPwhD9yJ/b3ocKcz9nM3KtHuudLB3T5Q9jawBtw9Ee68tM4hWfCn/xmGCH/DaqPCKOG
         S2YT8jvPk2QshOfAfwBqHsbgwLEo4z+nOPuAVnjkAmwAhXzq4stGWJvhe//2+oHBkYwW
         tRLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v42si1278341ott.5.2021.10.20.05.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 05:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdB5z-00022C-5Y
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 08:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdB5j-0001zJ-8h; Wed, 20 Oct 2021 08:53:11 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdB5f-0001Xp-4p; Wed, 20 Oct 2021 08:53:10 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HZ9VC1VQ9z8tk2;
 Wed, 20 Oct 2021 20:51:47 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 20:53:01 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 20:53:00 +0800
Subject: Re: [PATCH v8 5/8] hw/acpi/aml-build: Add PPTT table
To: Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-6-wangyanan55@huawei.com>
 <316edbd3-2235-efb1-7176-e3f477aec6a4@redhat.com>
 <1f4eaecf-8718-fc8a-5366-7e32945b9953@huawei.com>
 <2651e5c8-8cd0-e912-2f62-f7393bf49aa3@redhat.com>
 <9c51d6bf-8ed4-6aff-c503-f123190efcae@huawei.com>
 <f6c0dc0b-aad7-bfe9-c355-9879ce6a798e@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <97c13d4a-d464-015d-d901-cf93534cf0d6@huawei.com>
Date: Wed, 20 Oct 2021 20:53:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f6c0dc0b-aad7-bfe9-c355-9879ce6a798e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
X-TUID: S1/AW85t3NxH


On 2021/10/20 20:43, Eric Auger wrote:
> Hi,
> On 10/20/21 2:27 PM, wangyanan (Y) wrote:
>> Hi Eric,
>>
>> On 2021/10/20 19:11, Eric Auger wrote:
>>> Hi Yanan,
>>> On 10/20/21 11:51 AM, wangyanan (Y) wrote:
>>>> Hi Eric,
>>>>
>>>> On 2021/10/20 16:02, Eric Auger wrote:
>>>>> Hi,
>>>>>
>>>>> On 10/14/21 3:22 PM, Yanan Wang wrote:
>>>>>> From: Andrew Jones <drjones@redhat.com>
>>>>>>
>>>>>> Add the Processor Properties Topology Table (PPTT) used to
>>>>>> describe CPU topology information to ACPI guests.
>>>>>>
>>>>>> Note, a DT-boot Linux guest with a non-flat CPU topology will
>>>>>> see socket and core IDs being sequential integers starting
>>>>>> from zero, which is different from ACPI-boot Linux guest,
>>>>>> e.g. with -smp 4,sockets=2,cores=2,threads=1
>>>>>>
>>>>>> a DT boot produces:
>>>>>>
>>>>>>     cpu:  0 package_id:  0 core_id:  0
>>>>>>     cpu:  1 package_id:  0 core_id:  1
>>>>>>     cpu:  2 package_id:  1 core_id:  0
>>>>>>     cpu:  3 package_id:  1 core_id:  1
>>>>>>
>>>>>> an ACPI boot produces:
>>>>>>
>>>>>>     cpu:  0 package_id: 36 core_id:  0
>>>>>>     cpu:  1 package_id: 36 core_id:  1
>>>>>>     cpu:  2 package_id: 96 core_id:  2
>>>>>>     cpu:  3 package_id: 96 core_id:  3
>>>>>>
>>>>>> This is due to several reasons:
>>>>>>
>>>>>>     1) DT cpu nodes do not have an equivalent field to what the PPTT
>>>>>>        ACPI Processor ID must be, i.e. something equal to the MADT CPU
>>>>>>        UID or equal to the UID of an ACPI processor container. In both
>>>>>>        ACPI cases those are platform dependant IDs assigned by the
>>>>>>        vendor.
>>>>>>
>>>>>>     2) While QEMU is the vendor for a guest, if the topology specifies
>>>>>>        SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>>>>>>        core-id the same value as a package-id, thus it is not possible
>>>>>>        to have package-id=0 and core-id=0. This is because package and
>>>>>>        core containers must be in the same ACPI namespace and therefore
>>>>>>        must have unique UIDs.
>>>>>>
>>>>>>     3) ACPI processor containers are not mandatorily required for PPTT
>>>>>>        tables to be used and, due to the limitations of which IDs are
>>>>>>        selected described above in (2), they are not helpful for QEMU,
>>>>>>        so we don't build them with this patch. In the absence of them,
>>>>>>        Linux assigns its own unique IDs. The maintainers have chosen
>>>>>> not
>>>>>>        to use counters from zero, but rather ACPI table offsets, which
>>>>>>        explains why the numbers are so much larger than with DT.
>>>>>>
>>>>>>     4) When there is no SMT (threads=1) the core IDs for ACPI boot
>>>>>> guests
>>>>>>        match the logical CPU IDs, because these IDs must be equal to
>>>>>> the
>>>>>>        MADT CPU UID (as no processor containers are present), and QEMU
>>>>>>        uses the logical CPU ID for these MADT IDs.
>>>>>>
>>>>>> So in summary, with QEMU as the vendor for the guests, we simply
>>>>>> use sequential integers starting from zero for the non-leaf nodes
>>>>>> but with ID-valid flag unset, so that guest will ignore them and
>>>>>> use table offsets as unique container IDs. And we use logical CPU
>>>>>> IDs for the leaf nodes with the ID-valid flag set, which will be
>>>>>> consistent with MADT.
>>>>>>
>>>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>> ---
>>>>>>     hw/acpi/aml-build.c         | 60
>>>>>> +++++++++++++++++++++++++++++++++++++
>>>>>>     include/hw/acpi/aml-build.h |  3 ++
>>>>>>     2 files changed, 63 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>>>>> index b7b9db6888..0d50e88e9d 100644
>>>>>> --- a/hw/acpi/aml-build.c
>>>>>> +++ b/hw/acpi/aml-build.c
>>>>>> @@ -1990,6 +1990,66 @@ void build_processor_hierarchy_node(GArray
>>>>>> *tbl, uint32_t flags,
>>>>>>         }
>>>>>>     }
>>>>>>     +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
>>>>>> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState
>>>>>> *ms,
>>>>>> +                const char *oem_id, const char *oem_table_id)
>>>>>> +{
>>>>>> +    int pptt_start = table_data->len;
>>>>>> +    int uid = 0;
>>>>>> +    int socket;
>>>>>> +    AcpiTable table = { .sig = "PPTT", .rev = 2,
>>>>>> +                        .oem_id = oem_id, .oem_table_id =
>>>>>> oem_table_id };
>>>>> Table 5-149 of 6.2 spec (6.2 May 2017) tells the rev shall be 1. Or is
>>>>> it an erratum somewhere I did miss?
>>>> Yes, the revision in 6.2 spec is 1. And it's 2 in spec 6.3.
>>>> So just to be sure, should I use the oldest revision ?
>>> If you need (and use) features (such as flags) introduced in 6.3 then
>>> you should say the code complies with 6.3 and update the above comment.
>> The comment /* ACPI 6.2: 5.2.29 Processor Properties Topology Table
>> (PPTT) */
>> tried to explain the first spec version where PPTT is introduced is 6.2.
>> But it may
>> adds some confusion. I think it's better to replace it with:
>> /*
>>   * ACPI spec 5.2.29 Processor Properties Topology Table (PPTT)
>>   * (Revision 6.2 or later)
>>   */
>>
>> just like our build_slit().
> That's not my understanding. I think we usually point to the latest spec
> revision you comply with, ie. in that case 6.3 chapter ...
Ok, I get it. Would
/*
  * ACPI spec, Revision 6.3
  * 5.2.29 Processor Properties Topology Table (PPTT)
  */
be ok ?

Thanks,
Yanan
> Thanks
>
> Eric
>>>>> I would also add the spec version in the commit msg.
>>>>>> +
>>>>>> +    acpi_table_begin(&table, table_data);
>>>>>> +
>>>>>> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>>>>> +        uint32_t socket_offset = table_data->len - pptt_start;
>>>>>> +        int core;
>>>>>> +
>>>>>> +        build_processor_hierarchy_node(
>>>>>> +            table_data,
>>>>>> +            /*
>>>>>> +             * ACPI 6.2 - Physical package
>>>>>> +             * represents the boundary of a physical package
>>>>>> +             */
>>>>>> +            (1 << 0),
>>>>>> +            0, socket, NULL, 0);
>>>>> I see we set an ACPI process ID but in the meantime the ACPI processor
>>>>> ID valid flag is not set. I am not sure I fully catch the meaning of
>>>>> this latter but just to double check if this is done on purpose.
>>>> Yes, it's on purpose.
>>>>> Maybe
>>>>> wort a general comment as this also happens below.
>>>> The ID of the container node is invalid and ID of the leaf node is
>>>> valid.
>>>> The commit message by Andrew has explained why (reason 3). I think
>>>> it may be clear enough to explain there why we don't need a valid ID
>>>> for the container node.
>>>>>> +
>>>>>> +        for (core = 0; core < ms->smp.cores; core++) {
>>>>>> +            uint32_t core_offset = table_data->len - pptt_start;
>>>>>> +            int thread;
>>>>>> +
>>>>>> +            if (ms->smp.threads > 1) {
>>>>>> +                build_processor_hierarchy_node(
>>>>>> +                    table_data,
>>>>>> +                    /*
>>>>>> +                     * ACPI 6.2 - Physical package
>>>>>> +                     * doesn't represent the boundary of a physical
>>>>>> package
>>>>>> +                     */
>>>>>> +                    (0 << 0),
>>>>> would rather say (0 << 0) /* not a physical package */ and same
>>>>> elsewhere
>>>> Ok, thanks.
>>>>>> +                    socket_offset, core, NULL, 0);
>>>>>> +
>>>>>> +                for (thread = 0; thread < ms->smp.threads;
>>>>>> thread++) {
>>>>>> +                    build_processor_hierarchy_node(
>>>>>> +                        table_data,
>>>>>> +                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID
>>>>>> valid */
>>>>>> +                        (1 << 2) | /* ACPI 6.3 - Processor is a
>>>>>> Thread */
>>>>> So the references look globaly confusing to me. Either it complies to
>>>>> 6.2 or to 6.3. Looks ir rather complies with 6.3. To me, this needs to
>>>>> be clarified.
>>>> ACPI 6.2 in the comment means the flag is introduced in the spec
>>>> since 6.2.
>>>> The same, ACPI 6.3 means the flag is introduced since 6.3. Maybe I
>>>> should
>>>> just drop all the version-prefix in the comment ?
>>> Yes I think you can drop those comments and just upgrade the global
>>> compliance with 6.3
>>>
>> I will drop the prefix and keep the rest. And add a generic comment on
>> top of build_pptt() as I replied above.
>>
>> Thanks,
>> Yanan
>>>>> I would also add the reference it complies to in the
>>>>> commit msg.
>>>> Ok, sure.
>>>>
>>>> Thanks,
>>>> Yanan
>>>> .
>>>>>> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>>>>>> +                        core_offset, uid++, NULL, 0);
>>>>>> +                }
>>>>>> +            } else {
>>>>>> +                build_processor_hierarchy_node(
>>>>>> +                    table_data,
>>>>>> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID
>>>>>> valid */
>>>>>> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>>>>>> +                    socket_offset, uid++, NULL, 0);
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    acpi_table_end(linker, &table);
>>>>>> +}
>>>>>> +
>>>>>>     /* build rev1/rev3/rev5.1 FADT */
>>>>>>     void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData
>>>>>> *f,
>>>>>>                     const char *oem_id, const char *oem_table_id)
>>>>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>>>>>> index 2c457c8f17..b92706388c 100644
>>>>>> --- a/include/hw/acpi/aml-build.h
>>>>>> +++ b/include/hw/acpi/aml-build.h
>>>>>> @@ -493,6 +493,9 @@ void build_processor_hierarchy_node(GArray *tbl,
>>>>>> uint32_t flags,
>>>>>>                                         uint32_t parent, uint32_t id,
>>>>>>                                         uint32_t *priv_rsrc, uint32_t
>>>>>> priv_num);
>>>>>>     +void build_pptt(GArray *table_data, BIOSLinker *linker,
>>>>>> MachineState *ms,
>>>>>> +                const char *oem_id, const char *oem_table_id);
>>>>>> +
>>>>>>     void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData
>>>>>> *f,
>>>>>>                     const char *oem_id, const char *oem_table_id);
>>>>>>    
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>
>>>>> .
>>> .
> .

