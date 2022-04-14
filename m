Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp674873lfk;
        Thu, 14 Apr 2022 00:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5zLvpgbnlIrdcLiK/un4IzsLJ0vwm0Hx6ttNbtn8jIhXJC8011F8ojehmZZhve3kWX4Zf
X-Received: by 2002:a0c:8051:0:b0:42d:ef02:183c with SMTP id 75-20020a0c8051000000b0042def02183cmr2194479qva.28.1649922050093;
        Thu, 14 Apr 2022 00:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649922050; cv=none;
        d=google.com; s=arc-20160816;
        b=OLuG61731Hpoen5R8ksIrhmeVcVLZqbehAyW0C3oKw33IhDxK529ZMV0pACTfx6i+Q
         MmBLHGD7qdtLxj2M5SBrLmXGKYiL/svEBKiOgpkLbNCOMIOdQX2vVPF/l51dkSW6AWjO
         nvQOSSy47GQGSf8wDWVsmlDZ+Qk23yuT+F4O6EFByYo9wRAalV21EhQZsYDI0BlFgF3/
         fVx9TWINcchKdL6RfT5GGXuw9LKWG2nUuivQxykJDUCCVt5RZ20IAbmuhH/VEQuvU1ex
         97StUUzBdsTszyBkVobPqtBVdAa4wKVjCxUjk5H9GCH9xJM4SsxADQc/06DgBFMETL6r
         Xhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=txa/y2P9Y1cKhKeDOQ93iF42qDvo1Q2w6qS0rcrYF7Y=;
        b=G6cUMeFBOSgSJtRF19mjDG/9N2N2MK71cgkUwKwLFTcGZdDNUEC3/xjVyDemNSYO7C
         rlreLTYBv3cphk9vihbXsVQCY9myAJUctY9xclUftAFDyz0ALJ3uERUKH1dpBnwo+J72
         4FUeHcRhbxvHqDQk8Qov1SCjWYNWLZaAmzis2ch4bgS4inF4UBgsBu8Pv6SIHOC6UYlF
         7ce5mpQI2cN5r5OPFhSfTD1SmcdMQctR7kPLTeoKTo6EAUS/OhssW/2/nKCt1aRSLbHI
         wmnDv7Ct54eiF+igdXI+zTPUmNpUNuEZO3Mb1YwQwOsvzFm9lq119GO/if7sv40bi/RZ
         ci2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LcjdjK/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y184-20020a3764c1000000b0067e4be23991si7321815qkb.470.2022.04.14.00.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Apr 2022 00:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="LcjdjK/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neu5x-0004UA-KF
	for alex.bennee@linaro.org; Thu, 14 Apr 2022 03:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neu5H-0004Th-IE
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 03:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neu5D-00070L-V9
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 03:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649922003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txa/y2P9Y1cKhKeDOQ93iF42qDvo1Q2w6qS0rcrYF7Y=;
 b=LcjdjK/CgQUkDo3rFAhXRyIAEJCehOnWTXvuh1N1VwLnSGr4XhBJlUPcNDLcKNvG4I1l2Z
 pbZ/a0rs4wnz6mibKvshlk540V245o44A6M5dyRrvCdg8nh80Tlgm3lodtPgylE3zhujkN
 J6NC3NcNDzSeiZ5NbvyAHccPPy09e2A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-VEi2hotKN1y5kKv2oqqujQ-1; Thu, 14 Apr 2022 03:40:00 -0400
X-MC-Unique: VEi2hotKN1y5kKv2oqqujQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C7E99F3C9;
 Thu, 14 Apr 2022 07:39:59 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC8E7AC3;
 Thu, 14 Apr 2022 07:39:43 +0000 (UTC)
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
 <e856e342-8e98-c5c5-c188-23d1339e5955@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <59159d01-4b34-2e19-2fad-218080753859@redhat.com>
Date: Thu, 14 Apr 2022 15:39:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e856e342-8e98-c5c5-c188-23d1339e5955@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 21NoL+70IhM0

Hi Yanan,

On 4/14/22 10:56 AM, wangyanan (Y) wrote:
> On 2022/4/14 8:33, Gavin Shan wrote:
>> On 4/13/22 9:52 PM, Igor Mammedov wrote:
>>> On Sun,  3 Apr 2022 22:59:53 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>
>>>> When the PPTT table is built, the CPU topology is re-calculated, but
>>>> it's unecessary because the CPU topology has been populated in
>>>> virt_possible_cpu_arch_ids() on arm/virt machine.
>>>>
>>>> This reworks build_pptt() to avoid by reusing the existing one in
>>>> ms->possible_cpus. Currently, the only user of build_pptt() is
>>>> arm/virt machine.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
>>>>   1 file changed, 38 insertions(+), 62 deletions(-)
>>>>
>>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>>> index 4086879ebf..4b0f9df3e3 100644
>>>> --- a/hw/acpi/aml-build.c
>>>> +++ b/hw/acpi/aml-build.c
>>>> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                   const char *oem_id, const char *oem_table_id)
>>>>   {
>>>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>> -    GQueue *list = g_queue_new();
>>>> -    guint pptt_start = table_data->len;
>>>> -    guint parent_offset;
>>>> -    guint length, i;
>>>> -    int uid = 0;
>>>> -    int socket;
>>>> +    CPUArchIdList *cpus = ms->possible_cpus;
>>>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
>>>> +    uint32_t socket_offset, cluster_offset, core_offset;
>>>> +    uint32_t pptt_start = table_data->len;
>>>> +    int n;
>>>>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>>>>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>>>>         acpi_table_begin(&table, table_data);
>>>>   -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>>> -        g_queue_push_tail(list,
>>>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
>>>> -        build_processor_hierarchy_node(
>>>> -            table_data,
>>>> -            /*
>>>> -             * Physical package - represents the boundary
>>>> -             * of a physical package
>>>> -             */
>>>> -            (1 << 0),
>>>> -            0, socket, NULL, 0);
>>>> -    }
>>>> +    for (n = 0; n < cpus->len; n++) {
>>>
>>>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
>>>> +            socket_id = cpus->cpus[n].props.socket_id;
>>>
>>> this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
>>> I'd add here and for other container_id an assert() that checks for that
>>> specific ID goes in only one direction, to be able to detect when rule is broken.
>>>
>>> otherwise on may end up with duplicate containers silently.
>>>
>>
>> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
>> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
>> may need add comments for this in v6.
>>
>>     /*
>>      * This works with the assumption that cpus[n].props.*_id has been
>>      * sorted from top to down levels in mc->possible_cpu_arch_ids().
>>      * Otherwise, the unexpected and duplicate containers will be created.
>>      */
>>
>> The implementation in v3 looks complicated, but comprehensive. The one
>> in this revision (v6) looks simple, but the we're losing flexibility :)
>>
>>
>>>> +            cluster_id = -1;
>>>> +            core_id = -1;
>>>> +            socket_offset = table_data->len - pptt_start;
>>>> +            build_processor_hierarchy_node(table_data,
>>>> +                (1 << 0), /* Physical package */
>>>> +                0, socket_id, NULL, 0);
>>>> +        }
>>>>   -    if (mc->smp_props.clusters_supported) {
>>>> -        length = g_queue_get_length(list);
>>>> -        for (i = 0; i < length; i++) {
>>>> -            int cluster;
>>>> -
>>>> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>>> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>>>> -                g_queue_push_tail(list,
>>>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>>>> -                build_processor_hierarchy_node(
>>>> -                    table_data,
>>>> -                    (0 << 0), /* not a physical package */
>>>> -                    parent_offset, cluster, NULL, 0);
>>>> +        if (mc->smp_props.clusters_supported) {
>>>> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
>>>> +                cluster_id = cpus->cpus[n].props.cluster_id;
>>>> +                core_id = -1;
>>>> +                cluster_offset = table_data->len - pptt_start;
>>>> +                build_processor_hierarchy_node(table_data,
>>>> +                    (0 << 0), /* Not a physical package */
>>>> +                    socket_offset, cluster_id, NULL, 0);
>>>>               }
>>>> +        } else {
>>>> +            cluster_offset = socket_offset;
>>>>           }
>>>> -    }
>>>>   -    length = g_queue_get_length(list);
>>>> -    for (i = 0; i < length; i++) {
>>>> -        int core;
>>>> -
>>>> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>>> -        for (core = 0; core < ms->smp.cores; core++) {
>>>> -            if (ms->smp.threads > 1) {
>>>> -                g_queue_push_tail(list,
>>>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>>>> -                build_processor_hierarchy_node(
>>>> -                    table_data,
>>>> +        if (ms->smp.threads <= 1) {
>>>
>>> why <= instead of < is used here?
>>>
>>
>> It's the counterpart to the one in the original implementation,
>> which is "if (ms->smp.threads > 1)". the nodes for threads won't
>> be created until ms->smp.threads is bigger than 1. If we want
>> to use "<" here, then the code will be changed like below in v6.
>> However, I really don't think it's necessary.
>>
>>            if (ms->smp.threads < 2) {
>>                :
>>            }
>>
> The smp_parse() guarantees that we either have "one threads" or
> "multi threads" in ms->smp. So I think there are two proper choices:
> if (ms->smp.threads == 1) {
> ...
> } else {
> ...
> }
> 
> or
> 
> if (ms->smp.threads > 1) {
> ...
> } else {
> ...
> }
> 
Yes, it's guaranteed ms->smp.threads is equal to or larger than 1.
I will use the pattern of 'if (ms->smp.threads == 1)' in v6.

>>>> + build_processor_hierarchy_node(table_data,
>>>> +                (1 << 1) | /* ACPI Processor ID valid */
>>>> +                (1 << 3),  /* Node is a Leaf */
>>>> +                cluster_offset, n, NULL, 0);
>>>> +        } else {
>>>> +            if (cpus->cpus[n].props.core_id != core_id) {
>>>> +                core_id = cpus->cpus[n].props.core_id;
>>>> +                core_offset = table_data->len - pptt_start;
>>>> +                build_processor_hierarchy_node(table_data,
>>>>                       (0 << 0), /* not a physical package */
>>>> -                    parent_offset, core, NULL, 0);
>>>> -            } else {
>>>> -                build_processor_hierarchy_node(
>>>> -                    table_data,
>>>> -                    (1 << 1) | /* ACPI Processor ID valid */
>>>> -                    (1 << 3),  /* Node is a Leaf */
>>>> -                    parent_offset, uid++, NULL, 0);
>>>> +                    cluster_offset, core_id, NULL, 0);
>>>>               }
>>>> -        }
>>>> -    }
>>>> -
>>>> -    length = g_queue_get_length(list);
>>>> -    for (i = 0; i < length; i++) {
>>>> -        int thread;
>>>>   -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>>>> -            build_processor_hierarchy_node(
>>>> -                table_data,
>>>> +            build_processor_hierarchy_node(table_data,
>>>>                   (1 << 1) | /* ACPI Processor ID valid */
>>>>                   (1 << 2) | /* Processor is a Thread */
>>>>                   (1 << 3),  /* Node is a Leaf */
>>>> -                parent_offset, uid++, NULL, 0);
>>>> +                core_offset, n, NULL, 0);
>>>>           }
>>>>       }
>>>>   -    g_queue_free(list);
>>>>       acpi_table_end(linker, &table);
>>>>   }

Thanks,
Gavin

