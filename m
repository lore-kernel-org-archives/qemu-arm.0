Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp631747lfk;
        Tue, 12 Apr 2022 19:16:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXgtPWUBfEYkBZjp0y5Ci8ytW5YJ/VxuYxDSt2greukfjm6mAp3HI1/op7/mp3gNZxcSkY
X-Received: by 2002:a37:aaca:0:b0:69b:3826:3cbc with SMTP id t193-20020a37aaca000000b0069b38263cbcmr5229191qke.373.1649816196996;
        Tue, 12 Apr 2022 19:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649816196; cv=none;
        d=google.com; s=arc-20160816;
        b=caGcOL81FyxKW8C1nkEWFGw8K9RJyabX+naicVCnYeJx5Ij0GoAcK+hC1ZKXEt8CtK
         0eMowIsiUaPwo4IAfSo6JBKhRtmXlUjy/kEk1mia8aQoLzfW50S/Z/WNppxre8xrjujm
         lNJdj+ry/6RP7nLpYJibBWqBp2DMTG8mm9+hTGUmqpARADSYKvgDMt4c8R3cQqh0QVvc
         N0u9iezUrx4HJ0Y8kesEBGAlOo0inlDG7sWXTx8+nN2xIac44eiGrqAtz/vNOoq2deua
         wAYoj4KhRDmYMLlCd8+UK8atS+uxxSafq3KJ0MBX51yZIhmVDjp4T+ZfIPLg1IpZHZpB
         p7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=JRClM90qibEEeApmUGuefHfPzhVstFH0UdOa9yNMQvY=;
        b=j9dmnvw9oAvjpEjf/V1VlRglS3zTa5+NMMmR46PUbeOkZZfBmd8zQ6Ef9oZqlYmpuB
         PeF7HerTtUINrazhoKK6EtIBeXCwAF+8iBpFthycrG/a4Y58JVjgBb3sXU4h5912F7u5
         ux82M7y/HY2I1h24PWS/q3is9IyTjgkHBwb7VUUV/HUe7oqY8vy1Jo15rxtWBnfudu5l
         3n16wKJqBPdwp7znV4y5/2ChW+XO6nKKvYk3REQLSXxXW9AcBn4QP42mcf3KlaYB0X9F
         q0AT+l5dVETKf9dowg1pxsliDyn00ino+Y71uifAsJrJtadFYVrR+vTXdb5l8+ylivyW
         BLDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i3GSEd9T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a05d400b002e22babade4si8039389qtb.570.2022.04.12.19.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Apr 2022 19:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i3GSEd9T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neSYe-0001d4-GA
	for alex.bennee@linaro.org; Tue, 12 Apr 2022 22:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neSY7-0001cg-UX
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 22:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neSY5-0001N3-0M
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 22:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649816160;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRClM90qibEEeApmUGuefHfPzhVstFH0UdOa9yNMQvY=;
 b=i3GSEd9TDxUD7FNQM4DyHF5d5joASWuPOwvyPE+quTFmUn5JPOcExkUR3pESei26o70r1q
 KxFA//VSevOyerUPCoZaYP41ra3FCVLOAM9TpVlnCD4tmfXgUNhqCGFwdPzUfR3ZzHBor6
 rCxPBvUXW9PUfnbt0DMCWuibVZuzcaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-Cm2hOZwmPnenbtE0cgFd4Q-1; Tue, 12 Apr 2022 22:15:57 -0400
X-MC-Unique: Cm2hOZwmPnenbtE0cgFd4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 810051014A61;
 Wed, 13 Apr 2022 02:15:56 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C85C27EA6;
 Wed, 13 Apr 2022 02:15:49 +0000 (UTC)
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220412164014.00000cea@Huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8356ccf0-83be-6507-5c92-89c989246a50@redhat.com>
Date: Wed, 13 Apr 2022 10:15:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220412164014.00000cea@Huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /UGxodyR4evG

Hi Jonathan,

On 4/12/22 11:40 PM, Jonathan Cameron wrote:
> On Sun,  3 Apr 2022 22:59:53 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> When the PPTT table is built, the CPU topology is re-calculated, but
>> it's unecessary because the CPU topology has been populated in
>> virt_possible_cpu_arch_ids() on arm/virt machine.
>>
>> This reworks build_pptt() to avoid by reusing the existing one in
>> ms->possible_cpus. Currently, the only user of build_pptt() is
>> arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> My compiler isn't being very smart today and gives a bunch of
> maybe used uninitialized for socket_offset, cluster_offset and core_offset.
> 
> They probably are initialized in all real paths, but I think you need to
> set them to something at instantiation to keep the compiler happy.
> 

Thanks for reporting the warning raised from the compiler. I think
your compiler may be smarter than mine :)

Yeah, they're initialized in all real paths after checking the code
again. So lets initialize them with zeroes in v6, but I would hold
for Igor and Yanan's reviews on this (v5) series.

Thanks,
Gavin

> 
>> ---
>>   hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
>>   1 file changed, 38 insertions(+), 62 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 4086879ebf..4b0f9df3e3 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   const char *oem_id, const char *oem_table_id)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> -    GQueue *list = g_queue_new();
>> -    guint pptt_start = table_data->len;
>> -    guint parent_offset;
>> -    guint length, i;
>> -    int uid = 0;
>> -    int socket;
>> +    CPUArchIdList *cpus = ms->possible_cpus;
>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
>> +    uint32_t socket_offset, cluster_offset, core_offset;
>> +    uint32_t pptt_start = table_data->len;
>> +    int n;
>>       AcpiTable table = { .sig = "PPTT", .rev = 2,
>>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
>>   
>>       acpi_table_begin(&table, table_data);
>>   
>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>> -        g_queue_push_tail(list,
>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
>> -        build_processor_hierarchy_node(
>> -            table_data,
>> -            /*
>> -             * Physical package - represents the boundary
>> -             * of a physical package
>> -             */
>> -            (1 << 0),
>> -            0, socket, NULL, 0);
>> -    }
>> +    for (n = 0; n < cpus->len; n++) {
>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
>> +            socket_id = cpus->cpus[n].props.socket_id;
>> +            cluster_id = -1;
>> +            core_id = -1;
>> +            socket_offset = table_data->len - pptt_start;
>> +            build_processor_hierarchy_node(table_data,
>> +                (1 << 0), /* Physical package */
>> +                0, socket_id, NULL, 0);
>> +        }
>>   
>> -    if (mc->smp_props.clusters_supported) {
>> -        length = g_queue_get_length(list);
>> -        for (i = 0; i < length; i++) {
>> -            int cluster;
>> -
>> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>> -                g_queue_push_tail(list,
>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (0 << 0), /* not a physical package */
>> -                    parent_offset, cluster, NULL, 0);
>> +        if (mc->smp_props.clusters_supported) {
>> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
>> +                cluster_id = cpus->cpus[n].props.cluster_id;
>> +                core_id = -1;
>> +                cluster_offset = table_data->len - pptt_start;
>> +                build_processor_hierarchy_node(table_data,
>> +                    (0 << 0), /* Not a physical package */
>> +                    socket_offset, cluster_id, NULL, 0);
>>               }
>> +        } else {
>> +            cluster_offset = socket_offset;
>>           }
>> -    }
>>   
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int core;
>> -
>> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (core = 0; core < ms->smp.cores; core++) {
>> -            if (ms->smp.threads > 1) {
>> -                g_queue_push_tail(list,
>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> +        if (ms->smp.threads <= 1) {
>> +            build_processor_hierarchy_node(table_data,
>> +                (1 << 1) | /* ACPI Processor ID valid */
>> +                (1 << 3),  /* Node is a Leaf */
>> +                cluster_offset, n, NULL, 0);
>> +        } else {
>> +            if (cpus->cpus[n].props.core_id != core_id) {
>> +                core_id = cpus->cpus[n].props.core_id;
>> +                core_offset = table_data->len - pptt_start;
>> +                build_processor_hierarchy_node(table_data,
>>                       (0 << 0), /* not a physical package */
>> -                    parent_offset, core, NULL, 0);
>> -            } else {
>> -                build_processor_hierarchy_node(
>> -                    table_data,
>> -                    (1 << 1) | /* ACPI Processor ID valid */
>> -                    (1 << 3),  /* Node is a Leaf */
>> -                    parent_offset, uid++, NULL, 0);
>> +                    cluster_offset, core_id, NULL, 0);
>>               }
>> -        }
>> -    }
>> -
>> -    length = g_queue_get_length(list);
>> -    for (i = 0; i < length; i++) {
>> -        int thread;
>>   
>> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>> -            build_processor_hierarchy_node(
>> -                table_data,
>> +            build_processor_hierarchy_node(table_data,
>>                   (1 << 1) | /* ACPI Processor ID valid */
>>                   (1 << 2) | /* Processor is a Thread */
>>                   (1 << 3),  /* Node is a Leaf */
>> -                parent_offset, uid++, NULL, 0);
>> +                core_offset, n, NULL, 0);
>>           }
>>       }
>>   
>> -    g_queue_free(list);
>>       acpi_table_end(linker, &table);
>>   }
>>   
> 

