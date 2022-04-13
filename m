Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp149483lfk;
        Wed, 13 Apr 2022 06:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDDdYRVqzDcpsX2t4ubodjfddmuaHR6r3fKaDoo+o1ok71ObnvE8aNKqs5sf13/v55NtjC
X-Received: by 2002:a05:620a:290b:b0:69c:5454:c5d with SMTP id m11-20020a05620a290b00b0069c54540c5dmr2361546qkp.766.1649858012727;
        Wed, 13 Apr 2022 06:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649858012; cv=none;
        d=google.com; s=arc-20160816;
        b=h7QtMPU3+VpbdAZu1zh2jDTddva1oyzVGlL5htLQiPgVNhInYm+OjmUhK2m9Gfcq6h
         SpPqMqankuKYyzoKUeDwo2KO+N19UDQzLiS/bhzb5n4YV7kwmZOR8t3iJAl1XF+HAEtS
         f02cs/yQbii+x73ukGm3QIkRmH5tMh6U7O+OvGri+Bgr01+MUK4pJkLHPq79vnpxxyUt
         MAe1UmOWYPUZFfTccihhG8OCkkH7YRfi9lfmaOXCEqRS1niwc5pM7Vx4dE9/sOTFfsol
         ObarhvpTeOJzJjrhYeN5QGE2ckmOneVgWJOEUjprzdpW5jVQTHjhoIYS4xEG2eb8T3Yn
         fN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=UAApPetu1voheOowNT90e1j5SyE4GBGVgkZ2W5GALH0=;
        b=wqwL2hEfTSVmmjeFvdF41OKZGYOXImhs2cJRXmle79wLxDjBeWiMluaq7cJ/biJjbM
         RspyfQksU88SNQu9ewSxkwrXuEtdjvWHrHQHrr3DLeQbRxrSclB49AXMP2CHk5PyImMt
         prAn6IzPiWOSvDJihOIw3ywwll0A32akdu659zy9qGM7DjUEIzXHHY/WxbIdvQh0PbUm
         NwNIh63Ll64otxt1PH6uxej4mTfWJ/gOQ7Rubavh1q1UsYaJetftUtkgQOCasyCUfO1F
         bXS29o7NlnEhfHwjW+2APprtqzOkDABYp9BLQ9VKUwDNc7xi5zz4F5wm/3H8Bw1MwX53
         JEXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LygpQKWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140dc700b004442d23d13esi8192249qvt.311.2022.04.13.06.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 06:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LygpQKWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nedR6-0003cz-7H
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 09:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nedQF-0002w4-M1
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 09:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nedQD-0005TP-PV
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 09:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649857956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAApPetu1voheOowNT90e1j5SyE4GBGVgkZ2W5GALH0=;
 b=LygpQKWCMByG34zLM+wvtlmRDhoLbWjSPPiyPcR0zKTR4gWKL5PSzCQL+BspZjdTsGxEVe
 snJPBpklr0blm+Ieu4Q3Sb0tyi0PHnZl3ouhiAZRwm5dfCUzyfYoR7jN7GTEn9Et4aHsFo
 +PCA+c4Za/i6wATF/DROSSMxF6S+b0U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-tNaJJOeiOwGgG9zlVrwqCg-1; Wed, 13 Apr 2022 09:52:35 -0400
X-MC-Unique: tNaJJOeiOwGgG9zlVrwqCg-1
Received: by mail-ej1-f70.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso907933ejs.12
 for <qemu-arm@nongnu.org>; Wed, 13 Apr 2022 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAApPetu1voheOowNT90e1j5SyE4GBGVgkZ2W5GALH0=;
 b=XtzhpxgaCudD9mD4qTlJ7WcUYyu2Pd2tyJCQPm8vk/sKaO/LN5QwavsNrL2ZNKHy1V
 ZgF1CeYVbrZs9aq840SN7C0usFwwbIyo5HKQG5v20bKsh2JC/P/hBsplMZP7p+XLXhru
 OT3MspFwNQD5AdxAQzxMg0aKpWrPmtnizAzhWgpV1uMmsIY3lzg2U7sFfFarbM55TaZG
 GJ+wNBT/xlBy1MU+wGqZTPfU9l6c+hyOKBbk46G1Vt9TmzWt0uink+F15AwbrZYftS+i
 tCvck6WQWmZao6EKy96qXOF7bvdWULCtAftnQYEUjSiJV9HuCRV+KVZD0Ucq96yer8Oi
 z/Xg==
X-Gm-Message-State: AOAM532KpTb3A3VmOKbVywjcAp9//QNShNNhlFTcM2JDxAmzsWh0eHKT
 utrVWu9VTpBlRpSjrTkYwqSYGvw2+ut+HoeH2FyZnFtQzW2h1wb0+DKqdQw0zXT/UhNZ6AcyJQa
 S+Xp8hTwFPKaW
X-Received: by 2002:a05:6402:36d:b0:41d:7a5f:8393 with SMTP id
 s13-20020a056402036d00b0041d7a5f8393mr16069533edw.277.1649857954594; 
 Wed, 13 Apr 2022 06:52:34 -0700 (PDT)
X-Received: by 2002:a05:6402:36d:b0:41d:7a5f:8393 with SMTP id
 s13-20020a056402036d00b0041d7a5f8393mr16069511edw.277.1649857954382; 
 Wed, 13 Apr 2022 06:52:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm14251ejj.142.2022.04.13.06.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 06:52:33 -0700 (PDT)
Date: Wed, 13 Apr 2022 15:52:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220413155232.0a1f4d88@redhat.com>
In-Reply-To: <20220403145953.10522-5-gshan@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVGknzaFsSVy

On Sun,  3 Apr 2022 22:59:53 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
> 
> This reworks build_pptt() to avoid by reusing the existing one in
> ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
>  1 file changed, 38 insertions(+), 62 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..4b0f9df3e3 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    GQueue *list = g_queue_new();
> -    guint pptt_start = table_data->len;
> -    guint parent_offset;
> -    guint length, i;
> -    int uid = 0;
> -    int socket;
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> +    uint32_t socket_offset, cluster_offset, core_offset;
> +    uint32_t pptt_start = table_data->len;
> +    int n;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
>  
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> -        g_queue_push_tail(list,
> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> -        build_processor_hierarchy_node(
> -            table_data,
> -            /*
> -             * Physical package - represents the boundary
> -             * of a physical package
> -             */
> -            (1 << 0),
> -            0, socket, NULL, 0);
> -    }
> +    for (n = 0; n < cpus->len; n++) {

> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> +            socket_id = cpus->cpus[n].props.socket_id;

this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
I'd add here and for other container_id an assert() that checks for that
specific ID goes in only one direction, to be able to detect when rule is broken.

otherwise on may end up with duplicate containers silently.

> +            cluster_id = -1;
> +            core_id = -1;
> +            socket_offset = table_data->len - pptt_start;
> +            build_processor_hierarchy_node(table_data,
> +                (1 << 0), /* Physical package */
> +                0, socket_id, NULL, 0);
> +        }
>  
> -    if (mc->smp_props.clusters_supported) {
> -        length = g_queue_get_length(list);
> -        for (i = 0; i < length; i++) {
> -            int cluster;
> -
> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> +        if (mc->smp_props.clusters_supported) {
> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
> +                cluster_id = cpus->cpus[n].props.cluster_id;
> +                core_id = -1;
> +                cluster_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
> +                    (0 << 0), /* Not a physical package */
> +                    socket_offset, cluster_id, NULL, 0);
>              }
> +        } else {
> +            cluster_offset = socket_offset;
>          }
> -    }
>  
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int core;
> -
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> +        if (ms->smp.threads <= 1) {

why <= instead of < is used here?

> +            build_processor_hierarchy_node(table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 3),  /* Node is a Leaf */
> +                cluster_offset, n, NULL, 0);
> +        } else {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                core_id = cpus->cpus[n].props.core_id;
> +                core_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
>                      (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (1 << 1) | /* ACPI Processor ID valid */
> -                    (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    cluster_offset, core_id, NULL, 0);
>              }
> -        }
> -    }
> -
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int thread;
>  
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> -            build_processor_hierarchy_node(
> -                table_data,
> +            build_processor_hierarchy_node(table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 2) | /* Processor is a Thread */
>                  (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                core_offset, n, NULL, 0);
>          }
>      }
>  
> -    g_queue_free(list);
>      acpi_table_end(linker, &table);
>  }
>  

