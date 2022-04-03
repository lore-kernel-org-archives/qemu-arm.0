Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2100152lfb;
        Sun, 3 Apr 2022 03:44:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZx6Wf+neQiWH13dQRwwwPcuf0Yz03+6pFFLfv8hjvSbxDf+6GgXoynV9O3M6Dd5M4laf0
X-Received: by 2002:ac8:7d10:0:b0:2e2:77c:ec25 with SMTP id g16-20020ac87d10000000b002e2077cec25mr13877965qtb.325.1648982685310;
        Sun, 03 Apr 2022 03:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648982685; cv=none;
        d=google.com; s=arc-20160816;
        b=kknTZ4dXPjfKrRKf+u1+x0ZDGyEtOhEYCHgjgdbPEJM0/z7KfwIMUMOwNaN4E49XTl
         Y4IT8GjJRVaueD0h7+C4TRgvHgJdf5m4PUexW5bLQXyv/SN2rx1LZZGodfFhVWw1Acjg
         k/C3xEU6ZrLg4Tp5lRZyinwpe86oDK2pH1pJ0tcJjLvhGHppAKLJVCyMBX+QGk/QP9gv
         ILJ/STknidR0DUGc8S7wfyHMuIGFG4RDFRtX0cnY8+ty1gGw7Ef4roz0OlLGgj1DXuWP
         J1jHQtqyWdmx9jrmF8op9b53pX6cc6WLzUkgJfuu5IqkWaT0rv+0btGfBaZAdwMWUHOS
         wMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=gVPF6pikzgEAq3Ik/rWxgRMhrzHAAwVEyP8zF/NkdiY=;
        b=LDPbArZwFriIiT64yClRbJcjm1A9GAkWxOSBSus0T2/X1jeD/qbA6kQLLwrQwJBbS/
         gSuWquQdKo3a2/5Hmehmff3TL8UNtx7AXT7pZdVNvz13YBBNsbDGEUgqYGo6OZiPOCtO
         wkWRJCdx5BN4llcr1IYTpJvR65nM3T2a8LkDd/jHdSIZvyoMGr4p6AnawHoCfmvn2L6D
         UpyGYeGrqAcb3DuGVYxuchtECKvQEgRv+Vvg31h60ZD4VglhGukGtfAWqsRbFihDIJzx
         KJUcNlx+p1865IYPo9yRWH5HnmzK6mLnIB7LtnbxeazIKKhIj3iYECluBWZvynjbu5K+
         /Rww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wd8L9Gtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x65-20020a37ae44000000b0067e4be238d5si2391833qke.282.2022.04.03.03.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 03:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wd8L9Gtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naxiu-0002bZ-NT
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 06:44:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxiO-0002bI-QM
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 06:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxiL-0007Oz-L9
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 06:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648982647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVPF6pikzgEAq3Ik/rWxgRMhrzHAAwVEyP8zF/NkdiY=;
 b=Wd8L9Gtltzbr6mCEe2xFVRe2CpHZ2AZLmx3cPbMwuTASFFispc7nfD5rn9WOeHt5Qwh386
 1ROpsmAlgiFx6zu//w4nzFeSYyU6+SdgPNM63xTJ2y1lbmyyjJH8hoK6Lx67o+AuaOgh95
 8+JNHaksUDS/zpG+gTXwzqcmiWpHzd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-GJZBUN8aM0iBpzJR7K09Nw-1; Sun, 03 Apr 2022 06:44:06 -0400
X-MC-Unique: GJZBUN8aM0iBpzJR7K09Nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1A5185A5BE;
 Sun,  3 Apr 2022 10:44:04 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF3D40FD7D4;
 Sun,  3 Apr 2022 10:43:45 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] hw/arm/virt: Unify ACPI processor ID in MADT and
 SRAT table
To: Igor Mammedov <imammedo@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-5-gshan@redhat.com>
 <20220325150020.0063c782@redhat.com>
 <5b7686b4-b0e1-a9ec-f546-2161baa0ed3e@redhat.com>
 <20220330145201.77bdcb6c@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6971635d-f408-5aaa-c182-634ff0ac301b@redhat.com>
Date: Sun, 3 Apr 2022 18:43:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220330145201.77bdcb6c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xfgxTBioh+VK

Hi Igor,

On 3/30/22 8:52 PM, Igor Mammedov wrote:
> On Sat, 26 Mar 2022 03:08:19 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 3/25/22 10:00 PM, Igor Mammedov wrote:
>>> On Wed, 23 Mar 2022 15:24:38 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> The value of the following field has been used in ACPI PPTT table
>>>> to identify the corresponding processor. This takes the same field
>>>> as the ACPI processor ID in MADT and SRAT tables.
>>>>
>>>>     ms->possible_cpus->cpus[i].props.thread_id
>>>
>>> thread-id could be something different than ACPI processor ID
>>> (to be discussed in the first patch).
>>>
>>> I'd prefer to keep both decoupled, i.e. use [0 - possible_cpus->len)
>>> for ACPI processor ID as it's done with x86 madt/srat and ACPI CPU
>>> hotplug code. So we could reuse at least the later when implementing
>>> CPU hotplug for arm/virt and it's good from consistency point of view.
>>>    
>>
>> Yeah, I think so, thread-id and ACPI processor UID could be different.
>> thread IDs could be overlapped on multiple CPUs, who belongs to different
>> socket/die/core. However, ACPI processor UID should be unique for the
>> CPU in the whole system.
>>
>> If you agree, Lets use [0 - possible_cpus->len] in next respin.
> 
> Agreed.
>

Thanks for your confirm and the changes, as I mentioned before, will be
included in v4.
  
>> What I
>> need to do is dropping PATCH[4/4] and replacing @thread_id with @n in
>> build_pptt() of PATCH[3/4].
>>

Thanks,
Gavin

>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt-acpi-build.c | 12 +++++++++---
>>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 449fab0080..7fedb56eea 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -534,13 +534,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>    
>>>>        for (i = 0; i < cpu_list->len; ++i) {
>>>>            uint32_t nodeid = cpu_list->cpus[i].props.node_id;
>>>> +        uint32_t thread_id = cpu_list->cpus[i].props.thread_id;
>>>> +
>>>>            /*
>>>>             * 5.2.16.4 GICC Affinity Structure
>>>>             */
>>>>            build_append_int_noprefix(table_data, 3, 1);      /* Type */
>>>>            build_append_int_noprefix(table_data, 18, 1);     /* Length */
>>>>            build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
>>>> -        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
>>>> +        build_append_int_noprefix(table_data,
>>>> +                                  thread_id, 4); /* ACPI Processor UID */
>>>>            /* Flags, Table 5-76 */
>>>>            build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
>>>>            build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
>>>> @@ -704,6 +707,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>    {
>>>>        int i;
>>>>        VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>> +    MachineState *ms = MACHINE(vms);
>>>>        const MemMapEntry *memmap = vms->memmap;
>>>>        AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
>>>>                            .oem_table_id = vms->oem_table_id };
>>>> @@ -725,8 +729,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>        build_append_int_noprefix(table_data, vms->gic_version, 1);
>>>>        build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
>>>>    
>>>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>>>> +    for (i = 0; i < ms->smp.cpus; i++) {
>>>>            ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>>>> +        uint32_t thread_id = ms->possible_cpus->cpus[i].props.thread_id;
>>>>            uint64_t physical_base_address = 0, gich = 0, gicv = 0;
>>>>            uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
>>>>            uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
>>>> @@ -743,7 +748,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>            build_append_int_noprefix(table_data, 76, 1);   /* Length */
>>>>            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>>>>            build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
>>>> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
>>>> +        build_append_int_noprefix(table_data,
>>>> +                                  thread_id, 4);        /* ACPI Processor UID */
>>>>            /* Flags */
>>>>            build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
>>>>            /* Parking Protocol Version */
>>>    
>>
> 

