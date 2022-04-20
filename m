Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2959101lfk;
        Wed, 20 Apr 2022 01:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1AuwSL6EeWjFLmZHa/dfNLsSzfimbiN3TgQ0NEILjcdvQORqm+h20ZwuVhnmLJpiQv6L2
X-Received: by 2002:a37:a0d7:0:b0:69e:a2e1:1b43 with SMTP id j206-20020a37a0d7000000b0069ea2e11b43mr7561556qke.46.1650442771264;
        Wed, 20 Apr 2022 01:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650442771; cv=none;
        d=google.com; s=arc-20160816;
        b=nK6REVnijcPxrPkREFRAshYZXZY25miY49wkdkufpLAhg7XMCt1a6tAvpV89CqCKbF
         ZRqLT9IhJjIzK07dvWCqDfcocrsGBHwDm6zaLHdyFBCNnd3A/xpsjcYmEOEN9kv6e6HR
         ahupTWUap55WEKmDdRjHatuC1TCf9iz2A73475it7xaG7/A95utnJchYDSQqURhmf6EN
         Ut3weimdyfIUcdJtsh8Y6PXB4KYo5e2CFZPwdilkrCGezKmIsh6RNqCR6Z9kcLRSXZwW
         GnamM38x6ZEjgjwfHs8KZumeo7Nv0S9qJ8Hn/FVYah2Q+auu1OBh7ZTkp7HGSOq8P42C
         0HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=MA2zQRj/r3wPeovHLYGTHdA8vP8955zCmXeuVF59fYY=;
        b=B5v4jHvW1j1Ss1MDiKU1iDFoQErAb5azl5+JIBu3t0K2G1LQxnwGj1/82eNOLhvn2H
         6wk6051JsFyAPqxhz0i8ni8eHjGrCZ3hAxL6/5go8uBC/pkZI0+C8W8+8k5gQ+sQQT32
         4dD/Q+4gJSp+ELKQDxwZxvRM8DqjKKKGX+7nLbeXRHzcCMX2rVzfc1FsgZHxRFWMpQpM
         J9SoVjS+Vq3M2lakTT7kp1EjaBdJyIpAa8cUQGAySPtnSDh5xRxHZwLth+thqlRwzeeN
         qQyaEUkajMDGYlHnn5TayAvE3aT9oQ078+zIZJtDB8Dcz8Vk7NJjMWMB2NGqW64Jx/2m
         zHng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b40h6p7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac84e49000000b002f1f096e700si365456qtw.516.2022.04.20.01.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 01:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b40h6p7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh5Yg-0000Dd-Mw
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 04:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5QV-00036R-SS
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 04:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5QS-0001oq-7y
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 04:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650442257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA2zQRj/r3wPeovHLYGTHdA8vP8955zCmXeuVF59fYY=;
 b=b40h6p7RxYHoNABmh7o67I7BhSJrmY3wxBAu+zeWQAb18DRHrlPQ2f/V/FOtwoTFPx6SRK
 F3C9GzRsdjXt0b66Pht9rQMeY9zoaSGI625h8NnEQHFuTroFuASEf+3QBgI2/2jWDTmyei
 WhJUB8dI5M8WHnyKX9HxJhe+3m/TD8w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-zIAW_1L6OdKp6XuWe6rNmg-1; Wed, 20 Apr 2022 04:10:56 -0400
X-MC-Unique: zIAW_1L6OdKp6XuWe6rNmg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs13-20020a1709073e8d00b006e8be1ab258so584978ejc.0
 for <qemu-arm@nongnu.org>; Wed, 20 Apr 2022 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MA2zQRj/r3wPeovHLYGTHdA8vP8955zCmXeuVF59fYY=;
 b=AB977MfTeH1rifFKiZudnw5roews9vDVtfwFkcAmacSBQ7jdlretbhhVszgLqdifoz
 2WXxnhRX9cGTtJp88/u5GZXwJXrryZAJwVDnxhNvCzHlOlaiAq5C1VWkzfWgHRLqlCJ5
 p7pbYo50g11O7iTS9EzDxgVBS7oApVKWh4TMtVB/R4mF/9/DRSdI3+u/gHgMi+SceUs5
 awu+iTuaMP5WPDNjbkfjxhWZ+JUb6/1uIgyOYvdpEGFNKvX+kvJYXBbxagAMlB/NFBH7
 joBHLxG7MhHa75nmtkoWjX2h+8frXj+k7i//iwuMfcnHHCgjYTEXRTgqKAZCWQh3VSqA
 e8Tg==
X-Gm-Message-State: AOAM532eSsqGXmrk+7UJXflG0AWYbERkfzZFCzZx1GY0gR4JLM9yWbSj
 ezK1V3W/vm7eisK1qzayBe9Si6p1HxM2C2nLqHvn0YeLsyNAD/dt2HRxtx30VnetBUw1jqalbEh
 3ZN/3xlrDdtuL
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr16546632ejs.40.1650442255759; 
 Wed, 20 Apr 2022 01:10:55 -0700 (PDT)
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr16546603ejs.40.1650442255418; 
 Wed, 20 Apr 2022 01:10:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a170906369700b006e8973a14dbsm6528451ejc.79.2022.04.20.01.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:10:54 -0700 (PDT)
Date: Wed, 20 Apr 2022 10:10:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220420101053.17faee64@redhat.com>
In-Reply-To: <8f76fa31-7ec8-faf9-da7f-0f740722a8a1@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
 <20220419105432.11ad0f90@redhat.com>
 <8f76fa31-7ec8-faf9-da7f-0f740722a8a1@redhat.com>
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iRZO7scDvF4e

On Wed, 20 Apr 2022 13:19:34 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/19/22 4:54 PM, Igor Mammedov wrote:
> > On Thu, 14 Apr 2022 08:33:29 +0800
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 4/13/22 9:52 PM, Igor Mammedov wrote:  
> >>> On Sun,  3 Apr 2022 22:59:53 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>      
> >>>> When the PPTT table is built, the CPU topology is re-calculated, but
> >>>> it's unecessary because the CPU topology has been populated in
> >>>> virt_possible_cpu_arch_ids() on arm/virt machine.
> >>>>
> >>>> This reworks build_pptt() to avoid by reusing the existing one in
> >>>> ms->possible_cpus. Currently, the only user of build_pptt() is
> >>>> arm/virt machine.
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> ---
> >>>>    hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
> >>>>    1 file changed, 38 insertions(+), 62 deletions(-)
> >>>>
> >>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >>>> index 4086879ebf..4b0f9df3e3 100644
> >>>> --- a/hw/acpi/aml-build.c
> >>>> +++ b/hw/acpi/aml-build.c
> >>>> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>>>                    const char *oem_id, const char *oem_table_id)
> >>>>    {
> >>>>        MachineClass *mc = MACHINE_GET_CLASS(ms);
> >>>> -    GQueue *list = g_queue_new();
> >>>> -    guint pptt_start = table_data->len;
> >>>> -    guint parent_offset;
> >>>> -    guint length, i;
> >>>> -    int uid = 0;
> >>>> -    int socket;
> >>>> +    CPUArchIdList *cpus = ms->possible_cpus;
> >>>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> >>>> +    uint32_t socket_offset, cluster_offset, core_offset;
> >>>> +    uint32_t pptt_start = table_data->len;
> >>>> +    int n;
> >>>>        AcpiTable table = { .sig = "PPTT", .rev = 2,
> >>>>                            .oem_id = oem_id, .oem_table_id = oem_table_id };
> >>>>    
> >>>>        acpi_table_begin(&table, table_data);
> >>>>    
> >>>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> >>>> -        g_queue_push_tail(list,
> >>>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> >>>> -        build_processor_hierarchy_node(
> >>>> -            table_data,
> >>>> -            /*
> >>>> -             * Physical package - represents the boundary
> >>>> -             * of a physical package
> >>>> -             */
> >>>> -            (1 << 0),
> >>>> -            0, socket, NULL, 0);
> >>>> -    }
> >>>> +    for (n = 0; n < cpus->len; n++) {  
> >>>      
> >>>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> >>>> +            socket_id = cpus->cpus[n].props.socket_id;  
> >>>
> >>> this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
> >>> I'd add here and for other container_id an assert() that checks for that
> >>> specific ID goes in only one direction, to be able to detect when rule is broken.
> >>>
> >>> otherwise on may end up with duplicate containers silently.
> >>>      
> >>
> >> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
> >> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
> >> may need add comments for this in v6.
> >>
> >>       /*
> >>        * This works with the assumption that cpus[n].props.*_id has been
> >>        * sorted from top to down levels in mc->possible_cpu_arch_ids().
> >>        * Otherwise, the unexpected and duplicate containers will be created.
> >>        */
> >>
> >> The implementation in v3 looks complicated, but comprehensive. The one
> >> in this revision (v6) looks simple, but the we're losing flexibility :)  
> > 
> > 
> > comment is not enough, as it will break silently that's why I suggested
> > sprinkling asserts() here.
> >   
> 
> I don't think it breaks anything. Duplicated PPTT entries are allowed in
> linux at least. The IDs in the duplicated PPTT entries should be same.
> Otherwise, the exposed CPU topology is really broken.

Spec doesn't say anything about allowing duplicate entries so I'd rather
avoid that (if you find a such provision in spec then put a reference
in this commit message to end discussion on duplicates).


> 
> I don't think it's harmful to add the check and assert, so I will introduce
> a helper function like below in v7. Sadly that v6 was posted before I received
> your confirm. Igor, could you please the changes, to be included into v7,
> looks good to you? The complete patch is also attached :)
> 
> +static bool pptt_entry_exists(MachineState *ms, int n, bool check_socket_id,
> +                              bool check_cluster_id, bool check_core_id)
> +{
> +    CPUArchId *cpus = ms->possible_cpus->cpus;
> +    CpuInstanceProperties *t = &cpus[n].props;
> +    CpuInstanceProperties *s;
> +    bool match;
> +    int i;
> +
> +    for (i = 0; i < n; i++) {

Wouldn't it make whole thing O(n^2) in worst case?

I suggest put asserts directly into build_pptt() and considering that
it relies on ids being sorted, do something like this:
   assert(foo_id_val > previous_id)
which will ensure that id doesn't jump back unexpectedly


> +        match = true;
> +        s = &cpus[i].props;
> +
> +        if (check_socket_id && s->socket_id != t->socket_id) {
> +            match = false;
> +        }
> +
> +        if (match && check_cluster_id && s->cluster_id != t->cluster_id) {
> +            match = false;
> +        }
> +
> +        if (match && check_core_id && s->core_id != t->core_id) {
> +            match = false;
> +        }
> +
> +        if (match) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> 
> The following assert() will be applied in build_pptt():
> 
> assert(!pptt_entry_exists(ms, n, true, false, false));           /* socket  */
> assert(!pptt_entry_exists(ms, n, true, true, false));            /* cluster */
> assert(!pptt_entry_exists(ms, n, true,
>             mc->smp_props.clusters_supported, true));             /* core    */
> 
> Thanks,
> Gavin
> 

