Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp298441lfk;
        Thu, 21 Apr 2022 05:03:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpdjmnfb2BTDknL9bIKa1vw7JmjqJGak/uH8lBtEuPteYiIYtFWH28FVofa6JExtIc317C
X-Received: by 2002:a05:622a:164a:b0:2f1:ffab:b3e0 with SMTP id y10-20020a05622a164a00b002f1ffabb3e0mr12932932qtj.553.1650542599184;
        Thu, 21 Apr 2022 05:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650542599; cv=none;
        d=google.com; s=arc-20160816;
        b=k5TQQW84SnJq8xMGdcrizyIgab7ePO+myHLN58mtrwnWbHWimHqHq92eOf8FcOVcjm
         EBDi0TPyCcYuWKH3e1iZ815z8z6PUa+0xL9jE7fKmNSKKgoA807Osvu341vvLzwcjUsI
         0QVIaH7jNapxlDWF/GhdrxKJWx9jQCydGNkdvyWDWFKsJKC9YE4UXlAMGoFxU6mvCxBL
         dSKv1SC+wbjLEV4nUIaYMNkOlM2+1fzZZqP29grQtpL2l7McIHexttqs0YhSEGCAImB4
         Bn/CQs3DFC2XVmMDd1haBLzDs5w86AVbT9TkjLJc08iwyY8X0mJnTp8tsogBsRRqEoul
         F0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=HHe3eohLBk8G4eHz8ndI6hpIR9VZ3VTfQeLf+FY0mL0=;
        b=aJPbQuMYSu/BtECZoWS3APjcwWtr88djxGj8ej7iXTVH1p+C7Jwh3bo3En07pf1F75
         ctimLpo/cN6FLTENXLCa5PQDQmomnV0lT21ZfTs/gyiBLbfYLsTOfMulqrxFMrf+L5wg
         Xl3WZLMhW2MbMltmvKIgXBVbxTX0mcc/irX+hrJZvESYASCAtTlgTm2UYd00QDdgXXtS
         97C8k5opelRt7dmDShWnJUzhiLp/ukkRY6FCXP4T62zZMfv4fSrlahf5VwOcjrfDGOIn
         wTsCCQQzd5m3mQTg6NkH5l/UMjS1bOm9WTusFE8CL8PKJ+YXDqUKAHsjiUUgyhzO0+HN
         O8Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkwmkIxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020ac87f8a000000b002e1fbf3bf92si1405503qtj.387.2022.04.21.05.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 05:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkwmkIxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhVWk-00033k-DV
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 08:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhV1y-00055J-MG
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhV1r-0005oc-4d
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650540670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHe3eohLBk8G4eHz8ndI6hpIR9VZ3VTfQeLf+FY0mL0=;
 b=UkwmkIxDD10R6+MUuGPi80EUfy+PAvZNMzNchH6pNR7ZEJ3GYGa+NZOI0kWWnpMp0VmBsl
 QwGPmaMGNK24dSBdXM9y4J3o+isENGxXt2LQtewhVBET+ZMm/RAZVEbJ6NCt3YOhNhY33g
 EQn8TAeUrH0sSf27QWpC/xA/ygIJpRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-LjhBA2utOveHVxMV9Gi5og-1; Thu, 21 Apr 2022 07:31:09 -0400
X-MC-Unique: LjhBA2utOveHVxMV9Gi5og-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDF6803B22;
 Thu, 21 Apr 2022 11:31:08 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05DB94679FC;
 Thu, 21 Apr 2022 11:30:58 +0000 (UTC)
Subject: Re: [PATCH v7 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Igor Mammedov <imammedo@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-5-gshan@redhat.com>
 <20220420165655.5e83b381@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <45dbdc92-6406-ecf9-d48d-fd889c4d82a8@redhat.com>
Date: Thu, 21 Apr 2022 19:30:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220420165655.5e83b381@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 zhenyzha@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 Jonathan.Cameron@Huawei.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cqOVyqArAc6G

Hi Igor,

On 4/20/22 10:56 PM, Igor Mammedov wrote:
> On Wed, 20 Apr 2022 18:49:09 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> When the PPTT table is built, the CPU topology is re-calculated, but
>> it's unecessary because the CPU topology has been populated in
>> virt_possible_cpu_arch_ids() on arm/virt machine.
>>
>> This reworks build_pptt() to avoid by reusing the existing IDs in
>> ms->possible_cpus. Currently, the only user of build_pptt() is
>> arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> Looks fine to me, so
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> 
> Also do we have a bios-tables tests that watches over/tests PPTT table?
> if not please add one as a patch on top.
> 

Thanks a lot for your continuous reviews. We won't have PPTT table included
in bios-table tests. I will add one after this series is merged because
our downstream release needs this series :)

>> ---
>>   hw/acpi/aml-build.c | 109 +++++++++++++++++++-------------------------
>>   1 file changed, 47 insertions(+), 62 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 4086879ebf..73f4e69c29 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2002,86 +2002,71 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
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
>> +    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
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
>> +    /*
>> +     * This works with the assumption that cpus[n].props.*_id has been
>> +     * sorted from top to down levels in mc->possible_cpu_arch_ids().
>> +     * Otherwise, the unexpected and duplicate containers will be
>> +     * created.
>> +     */
>> +    for (n = 0; n < cpus->len; n++) {
>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
>> +            assert(cpus->cpus[n].props.socket_id > socket_id);
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
>> +                assert(cpus->cpus[n].props.cluster_id > cluster_id);
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
>> +        if (ms->smp.threads == 1) {
>> +            build_processor_hierarchy_node(table_data,
>> +                (1 << 1) | /* ACPI Processor ID valid */
>> +                (1 << 3),  /* Node is a Leaf */
>> +                cluster_offset, n, NULL, 0);
>> +        } else {
>> +            if (cpus->cpus[n].props.core_id != core_id) {
>> +                assert(cpus->cpus[n].props.core_id > core_id);
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

Thanks,
Gavin
  

