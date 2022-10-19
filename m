Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp741729ejn;
        Wed, 19 Oct 2022 16:58:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43iXB4vyXpLQg5VXFdovXxBBzOxINvkOFm3l3yQNLlF1i/mhCQpAYta7M2DHgxYDunnl/7
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr7584041qkh.723.1666223898216;
        Wed, 19 Oct 2022 16:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666223898; cv=none;
        d=google.com; s=arc-20160816;
        b=gwZu5cZzz6uTWbLKTJ9f8c5voOubHspgGcpplPWoy8ewWBlPEyDd0K29deBmf3wa7D
         FVBKaUa+zmIiG7xEsKhNOAaU8ZTwjP/JsV05pJvZnjmwAukbKTc2mS3Nw3wcaNXP2piU
         ha1ZSGvRVjrXlLMiZSuOPj7GZQ8ACcqv/s4Z8g9hUbHhf8FXdj3+QyfHXZcQnJ5oW05N
         faCS2ZPF0c4PylYXt1z+ICSSzwEMBkehz0K+/s3cj6iXARO9fA0dOV3N/itQ4KdCidfa
         0g1mGV24Vqnl+WTBpjZFEcMQh5T5bNfD9OUSTzZ5LpQvQf5Eui7IN7U9BYpni3hfVsT+
         16tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wwbY4UnbG3y0d34dJVtIY6VJpD+aYmqj+HXZ41/X3To=;
        b=y0GRg4VR/wShIoDFCFrMuJtgO5HyiukuKMjBOFJnlcfIcBm+y9Yg2KKS4zCG3PzGpS
         sg7gBDpUXLpTtoYH7CPXP2B+8Ei+uGwjrt9V8Mb68e5m9b2KFpMIkdQTG1/YPcddT2PR
         OpQb6NEtjio5O0yXwYUQf6OPp3TQcF5CDbh0FDwJdTMGaBW8+ClATyElmTY3hpfT3P9n
         84fn60Wl612rxC5jHnIbU0KRN2wrampd0xjsqQdWqYNikwYoT1KKT3C9/vukWqZ0iNjr
         1IWdw5HbnGWvXJNtXYFk9ZcgaAOPea1WBjZ3lV6fefztXV2U9qVFUAQD49SI1hFNukmW
         +Uig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xfpm2uWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq15-20020a056214258f00b004afb62a7941si3165456qvb.262.2022.10.19.16.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 16:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xfpm2uWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olIwz-0001CA-L7
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 19:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olIwU-0001Bs-2m
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 19:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olIwR-0005cH-AQ
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 19:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666223862;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwbY4UnbG3y0d34dJVtIY6VJpD+aYmqj+HXZ41/X3To=;
 b=Xfpm2uWF1K2c5oKH94jujtw3kHcPBp3CIfxaStzOy3gJaHm17b9E2yZuCXkOCjTqjLQ93k
 kjf4iY97a9Kjgbf+dCdoZmSYQZRaOPJQwlMlRg6V78qN6RiO6UVWng2jJtNw2eLUwvhAxf
 VPXdQeYncHFQF0b3IF/S2PTp7VdpvgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-rxyWZ5xPNL6XdgfzWBquNQ-1; Wed, 19 Oct 2022 19:57:38 -0400
X-MC-Unique: rxyWZ5xPNL6XdgfzWBquNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CA2811E67;
 Wed, 19 Oct 2022 23:57:38 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E627C40C6EC2;
 Wed, 19 Oct 2022 23:57:34 +0000 (UTC)
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
 <9a43b31a-63d7-d312-870d-168df1b41921@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6566e453-9b05-7092-f112-ea9e523be8b4@redhat.com>
Date: Thu, 20 Oct 2022 07:57:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <9a43b31a-63d7-d312-870d-168df1b41921@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kjG/Q4je/MtB

Hi Eric,

On 10/20/22 4:18 AM, Eric Auger wrote:
> On 10/12/22 01:18, Gavin Shan wrote:
>> After the improvement to high memory region address assignment is
>> applied, the memory layout can be changed, introducing possible
>> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
>> is disabled or enabled when the optimization is applied or not, with
>> the following configuration.
>>
>>    pa_bits              = 40;
>>    vms->highmem_redists = false;
>>    vms->highmem_ecam    = false;
>>    vms->highmem_mmio    = true;
>>
>>    # qemu-system-aarch64 -accel kvm -cpu host    \
>>      -machine virt-7.2,compact-highmem={on, off} \
>>      -m 4G,maxmem=511G -monitor stdio
>>
>>    Region            compact-highmem=off         compact-highmem=on
>>    ----------------------------------------------------------------
>>    RAM               [1GB         512GB]        [1GB         512GB]
>>    HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>>    HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>>    HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>>
>> In order to keep backwords compatibility, we need to disable the
>> optimization on machines, which is virt-7.1 or ealier than it. It
>> means the optimization is enabled by default from virt-7.2. Besides,
>> 'compact-highmem' property is added so that the optimization can be
>> explicitly enabled or disabled on all machine types by users.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>   docs/system/arm/virt.rst |  4 ++++
>>   hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
>>   include/hw/arm/virt.h    |  1 +
>>   3 files changed, 52 insertions(+)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 20442ea2c1..75bf5a4994 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -94,6 +94,10 @@ highmem
>>     address space above 32 bits. The default is ``on`` for machine types
>>     later than ``virt-2.12``.
>>   
>> +compact-highmem
>> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.
>> +  The default is ``on`` for machine types later than ``virt-7.2``
>> +
>>   gic-version
>>     Specify the version of the Generic Interrupt Controller (GIC) to provide.
>>     Valid values are:
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index c05cfb5314..8f1dba0ece 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
>>    * Note the extended_memmap is sized so that it eventually also includes the
>>    * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>>    * index of base_memmap).
>> + *
>> + * The addresses assigned to these regions are affected by 'compact-highmem'
>> + * property, which is to enable or disable the compact space in the Highmem
>> + * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
>> + * depending on the property in the following scenario.
> To me you shall rather explain here what is the so-called "compact"
> space vs the legacy highmem layout.
> 
> If I understand correctly the example rather legitimates the use of a
> compat option showing how the layout can be affected by the option. I
> would put that in the commit msg instead. Also in your example I see
> VIRT_HIGH_GIC_REDISTS is disabled but the code does not disable the
> region excpet if it does not fit within the PA. This does not match your
> example. Also the region is named VIRT_HIGH_GIC_REDIST2.
> 
> In v4, Marc also suggested to have individual options for each highmem
> region.
> https://lore.kernel.org/qemu-devel/0f8e6a58-0dde-fb80-6966-7bb32c4df552@redhat.com/
> 
> Have you considered that option?
> 

I think your comments make sense to me. So lets put the following comments
to the code and move the example to commit log.

   /*
    * The memory map for these Highmem IO Regions can be in legacy or compact
    * layout, depending on 'compact-highmem' property. In legacy layout, the
    * PA space for one specific region is always reserved, even the region has
    * been disabled or doesn't fit into the PA space. However, the PA space for
    * the region won't be reserved in these circumstances.
    */

You're correct about the example. VIRT_HIGH_GIC_REDIST2 should be used. Besides,
the configuration is only achievable by modifying source code at present, until
Marc's suggestion rolls in to allow users disable one particular high memory
regions by more properties. I will amend the commit log to have something like
below.

     For example, VIRT_HIGH_PCIE_MMIO memory region is disabled or enabled when
     the optimization is applied or not, with the following configuration. The
     configuration is only achievable by modifying source code, until more properties
     are added to allow user selectively disable those high memory regions.

For Marc's suggestion to add properties so that these high memory regions can
be disabled by users. I can add one patch after this one to introduce the following
3 properties. Could you please confirm the property names are good enough? It's
nice if Marc can help to confirm before I'm going to work on next revision.

     "highmem-ecam":    "on"/"off" on vms->highmem_ecam
     "highmem-mmio":    "on"/"off" on vms->highmem_mmio
     "highmem-redists": "on"/"off" on vms->highmem_redists

>> + *
>> + * pa_bits              = 40;
>> + * vms->highmem_redists = false;
>> + * vms->highmem_ecam    = false;
>> + * vms->highmem_mmio    = true;
>> + *
>> + * # qemu-system-aarch64 -accel kvm -cpu host    \
>> + *   -machine virt-7.2,compact-highmem={on, off} \
>> + *   -m 4G,maxmem=511G -monitor stdio
>> + *
>> + * Region            compact-highmem=off        compact-highmem=on
>> + * ----------------------------------------------------------------
>> + * RAM               [1GB         512GB]        [1GB         512GB]
>> + * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>> + * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
>> + * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>>    */
>>   static MemMapEntry extended_memmap[] = {
>>       /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>> @@ -2353,6 +2374,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
>>       vms->highmem = value;
>>   }
>>   
>> +static bool virt_get_compact_highmem(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->highmem_compact;
>> +}
>> +
>> +static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->highmem_compact = value;
>> +}
>> +
>>   static bool virt_get_its(Object *obj, Error **errp)
>>   {
>>       VirtMachineState *vms = VIRT_MACHINE(obj);
>> @@ -2971,6 +3006,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                             "Set on/off to enable/disable using "
>>                                             "physical address space above 32 bits");
>>   
>> +    object_class_property_add_bool(oc, "compact-highmem",
>> +                                   virt_get_compact_highmem,
>> +                                   virt_set_compact_highmem);
>> +    object_class_property_set_description(oc, "compact-highmem",
>> +                                          "Set on/off to enable/disable compact "
>> +                                          "space for high memory regions");
>> +
>>       object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>>                                     virt_set_gic_version);
>>       object_class_property_set_description(oc, "gic-version",
>> @@ -3055,6 +3097,7 @@ static void virt_instance_init(Object *obj)
>>   
>>       /* High memory is enabled by default */
>>       vms->highmem = true;
>> +    vms->highmem_compact = !vmc->no_highmem_compact;
>>       vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>>   
>>       vms->highmem_ecam = !vmc->no_highmem_ecam;
>> @@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>>   
>>   static void virt_machine_7_1_options(MachineClass *mc)
>>   {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>       virt_machine_7_2_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>> +    /* Compact space for high memory regions was introduced with 7.2 */
>> +    vmc->no_highmem_compact = true;
>>   }
>>   DEFINE_VIRT_MACHINE(7, 1)
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 709f623741..c7dd59d7f1 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -125,6 +125,7 @@ struct VirtMachineClass {
>>       bool no_pmu;
>>       bool claim_edge_triggered_timers;
>>       bool smbios_old_sys_ver;
>> +    bool no_highmem_compact;
>>       bool no_highmem_ecam;
>>       bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
>>       bool kvm_no_adjvtime;
> 

Thanks,
Gavin

