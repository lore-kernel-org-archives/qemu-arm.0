Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2058879lfb;
        Tue, 22 Mar 2022 20:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5clKSOM/5y5mGhfZRGqFa15vSZZeWqVodFSwqGdE0UMzjvRwFcDpHs0pySxw6lfrSWXb6
X-Received: by 2002:a0c:f801:0:b0:427:47d3:3715 with SMTP id r1-20020a0cf801000000b0042747d33715mr22260283qvn.46.1648006382023;
        Tue, 22 Mar 2022 20:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648006382; cv=none;
        d=google.com; s=arc-20160816;
        b=mYpgYLoln0sIizO4eQB0lVJY6+ex5IBCmK80aqgFEUlvPx795wct3fhNF9SohltqH+
         8bX8bOSOjSHlubOkL6tq3LNUyMp3Bym+tPrpxQFidcIeMAnuXn43716VDSF5zEL4Sx8M
         zCd6iyzUEFbfwH9hYify0+KbVYrNPrI/AUD1akiwLh9UIXNYUZ9nNfhPMetVkXdvdocC
         YmXmgZ8vnGx9zH1Unw5h61s1C/Pwyuqcao+j6oqvbmKBjHXuHaj2Pv7oZflZPTKMfLPh
         GPVNDDh+wbl0WaOawhlyKsWxu3S1hBV7wvb329ZQE12Tm69McVh5lMp7sXKSbgJHefVG
         7idA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=hpDJNZY/U+lVR4I7Rc+khyF0YH3Kq8V98sO85I7TTzQ=;
        b=SvqSEZCD2qFNXx/nOVB/2SVdzm6QSlCfOG2lrN2QZ88eSrTKMe9i3QSGFuhBQvXPvK
         cOKNwVJMUztlGehqobCM83YZAvLfDtevQfBT97LDFktelpg2OMudJ/EYUgbwdQ+GquKE
         UaUbN6a3TQOSg+ZpP54LYIrzVWYmefYUAFGw8fL9LziQ0WVeVEeArEAwDsRQFyFclMYE
         TQz+XtvGU4tJOmvXrIYE8rZURLU/KQcGrc5JSSWBkP1TsB68gsOMrw+ZKeAu0JYVNGea
         oizJ/QPu64k4gIWDf+/xr4WiEdhCOVUfBe8Iu9kwdC0GhfqHEsMNvAZfzxkhSKZQWi68
         lZQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WnyRWc8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs17-20020a05620a471100b0067ecd01045bsi435516qkb.54.2022.03.22.20.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 20:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WnyRWc8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWrk5-0005mm-HU
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 23:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrjB-0005Ac-8C
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 23:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWrj7-0004Ig-V7
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 23:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648006321;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpDJNZY/U+lVR4I7Rc+khyF0YH3Kq8V98sO85I7TTzQ=;
 b=WnyRWc8cnYRYJDhpziqzPZ0UCODmyBzZ+g4QirPInK2ube/zm6+E1fRRfPMZaU6T/VN1L9
 RIdbotQHyeOGqHdpLK3QNw85ygEaydpQ6QLNbzU0mNstLpM9ntfTrtJdE3jnMEpWqWh+CJ
 b3h7KFOJ4UntTYCV3p30Jnq03+DHhHo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-5mDHNC92MnKnP0HAoOuqSw-1; Tue, 22 Mar 2022 23:31:58 -0400
X-MC-Unique: 5mDHNC92MnKnP0HAoOuqSw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8BE7801E80;
 Wed, 23 Mar 2022 03:31:57 +0000 (UTC)
Received: from [10.72.12.33] (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C276743E914;
 Wed, 23 Mar 2022 03:31:51 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Igor Mammedov <imammedo@redhat.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-3-gshan@redhat.com>
 <12b4a089-b01f-f536-499e-d6029d0b1dea@huawei.com>
 <20220318142811.1d8eb072@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3f55457e-bf2e-03f4-1eef-17d277c4d094@redhat.com>
Date: Wed, 23 Mar 2022 11:31:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220318142811.1d8eb072@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: t1ZRMkMg2p5j

Hi Igor and Yanan,

On 3/18/22 9:28 PM, Igor Mammedov wrote:
> On Fri, 18 Mar 2022 14:34:12 +0800
> "wangyanan (Y)" <wangyanan55@huawei.com> wrote:
>> On 2022/3/3 11:11, Gavin Shan wrote:
>>> When the PPTT table is built, the CPU topology is re-calculated, but
>>> it's unecessary because the CPU topology, except the cluster IDs,
>>> has been populated in virt_possible_cpu_arch_ids() on arm/virt machine.
>>>
>>> This avoids to re-calculate the CPU topology by reusing the existing
>>> one in ms->possible_cpus. However, the cluster ID for the CPU instance
>>> has to be calculated dynamically because there is no corresponding
>>> field in struct CpuInstanceProperties. Currently, the only user of
>>> build_pptt() is arm/virt machine.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>    hw/acpi/aml-build.c | 106 ++++++++++++++++++++++++++++++++++----------
>>>    1 file changed, 82 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index 8966e16320..572cf5fc00 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>                    const char *oem_id, const char *oem_table_id)
>>>    {
>>>        MachineClass *mc = MACHINE_GET_CLASS(ms);
>>> +    CPUArchIdList *cpus = ms->possible_cpus;
>>> +    GQueue *socket_list = g_queue_new();
>>> +    GQueue *cluster_list = g_queue_new();
>>> +    GQueue *core_list = g_queue_new();
>>>        GQueue *list = g_queue_new();
>>>        guint pptt_start = table_data->len;
>>>        guint parent_offset;
>>>        guint length, i;
>>> -    int uid = 0;
>>> -    int socket;
>>> +    int n, id, socket_id, cluster_id, core_id, thread_id;
>>>        AcpiTable table = { .sig = "PPTT", .rev = 2,
>>>                            .oem_id = oem_id, .oem_table_id = oem_table_id };
>>>    
>>>        acpi_table_begin(&table, table_data);
>>>    
>>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>> +    for (n = 0; n < cpus->len; n++) {
>>> +        socket_id = cpus->cpus[n].props.socket_id;
>>> +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
>>> +            continue;
>>> +        }
>>> +
>>> +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
>>>            g_queue_push_tail(list,
>>>                GUINT_TO_POINTER(table_data->len - pptt_start));
>>>            build_processor_hierarchy_node(
>>> @@ -2023,65 +2032,114 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>                 * of a physical package
>>>                 */
>>>                (1 << 0),
>>> -            0, socket, NULL, 0);
>>> +            0, socket_id, NULL, 0);
>>>        }
>>>    
>>>        if (mc->smp_props.clusters_supported) {
>>>            length = g_queue_get_length(list);
>>>            for (i = 0; i < length; i++) {
>>> -            int cluster;
>>> -
>>>                parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
>>> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
>>> +
>>> +            for (n = 0; n < cpus->len; n++) {
>>> +                if (cpus->cpus[n].props.socket_id != socket_id) {
>>> +                    continue;
>>> +                }
>>> +
>>> +                /*
>>> +                 * We have to calculate the cluster ID because it isn't
>>> +                 * available in the CPU instance properties.
>>> +                 */
>> Since we need cluster ID now, maybe we can simply make it supported
>> in the CPU instance properties.
> 
> agreed
> 

Thanks for your review. I will add it in v3. FYI, the addition
needs to be done in the PATCH[v3 01/04] where the CPU topology
is populated :)

Thanks,
Gavin

>>> +                cluster_id = cpus->cpus[n].props.thread_id /
>>> +                             (ms->smp.cores * ms->smp.threads);
>>> +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
>>> +                    continue;
>>> +                }
>>> +
>>> +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
>>>                    g_queue_push_tail(list,
>>>                        GUINT_TO_POINTER(table_data->len - pptt_start));
>>>                    build_processor_hierarchy_node(
>>>                        table_data,
>>>                        (0 << 0), /* not a physical package */
>>> -                    parent_offset, cluster, NULL, 0);
>>> +                    parent_offset, cluster_id, NULL, 0);
>>>                }
>>>            }
>>>        }
>>>    
>>>        length = g_queue_get_length(list);
>>>        for (i = 0; i < length; i++) {
>>> -        int core;
>>> -
>>>            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -        for (core = 0; core < ms->smp.cores; core++) {
>>> -            if (ms->smp.threads > 1) {
>>> -                g_queue_push_tail(list,
>>> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
>>> -                build_processor_hierarchy_node(
>>> -                    table_data,
>>> -                    (0 << 0), /* not a physical package */
>>> -                    parent_offset, core, NULL, 0);
>>> -            } else {
>>> +        if (!mc->smp_props.clusters_supported) {
>>> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
>>> +        } else {
>>> +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
>>> +        }
>>> +
>>> +        for (n = 0; n < cpus->len; n++) {
>>> +            if (!mc->smp_props.clusters_supported &&
>>> +                cpus->cpus[n].props.socket_id != socket_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            /*
>>> +             * We have to calculate the cluster ID because it isn't
>>> +             * available in the CPU instance properties.
>>> +             */
>>> +            id = cpus->cpus[n].props.thread_id /
>>> +                (ms->smp.cores * ms->smp.threads);
>>> +            if (mc->smp_props.clusters_supported && id != cluster_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            core_id = cpus->cpus[n].props.core_id;
>>> +            if (ms->smp.threads <= 1) {
>>>                    build_processor_hierarchy_node(
>>>                        table_data,
>>>                        (1 << 1) | /* ACPI Processor ID valid */
>>>                        (1 << 3),  /* Node is a Leaf */
>>> -                    parent_offset, uid++, NULL, 0);
>>> +                    parent_offset, core_id, NULL, 0);
>>> +                continue;
>>>                }
>>> +
>>> +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
>>> +                continue;
>>> +            }
>>> +
>>> +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
>>> +            g_queue_push_tail(list,
>>> +                GUINT_TO_POINTER(table_data->len - pptt_start));
>>> +            build_processor_hierarchy_node(
>>> +                table_data,
>>> +                (0 << 0), /* not a physical package */
>>> +                parent_offset, core_id, NULL, 0);
>>>            }
>>>        }
>>>    
>>>        length = g_queue_get_length(list);
>>>        for (i = 0; i < length; i++) {
>>> -        int thread;
>>> -
>>>            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
>>> -        for (thread = 0; thread < ms->smp.threads; thread++) {
>>> +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
>>> +
>>> +        for (n = 0; n < cpus->len; n++) {
>>> +            if (cpus->cpus[n].props.core_id != core_id) {
>>> +                continue;
>>> +            }
>>> +
>>> +            thread_id = cpus->cpus[n].props.thread_id;
>>>                build_processor_hierarchy_node(
>>>                    table_data,
>>>                    (1 << 1) | /* ACPI Processor ID valid */
>>>                    (1 << 2) | /* Processor is a Thread */
>>>                    (1 << 3),  /* Node is a Leaf */
>>> -                parent_offset, uid++, NULL, 0);
>>> +                parent_offset, thread_id, NULL, 0);
>>>            }
>>>        }
>>>    
>>>        g_queue_free(list);
>>> +    g_queue_free(core_list);
>>> +    g_queue_free(cluster_list);
>>> +    g_queue_free(socket_list);
>>>        acpi_table_end(linker, &table);
>>>    }
>>>      
>>
> 

