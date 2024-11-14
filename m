Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp178283njc;
        Thu, 14 Nov 2024 00:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwMQlcDWyCi55t1TwM71EiK4HgTfBVwOBbNtxZ2P42Ui/JmWmeGyS58qp4iLirp/95V5cVETYEEebxHg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3EJziGxwXRbmiFD3UXxs5tNgkwakCaxeW4kmW33+bqgHj6YFMmQlenEbAM3/1PnojkiH8
X-Received: by 2002:a05:620a:29ca:b0:7b1:4940:e9f5 with SMTP id af79cd13be357-7b331eb2e8bmr3302654485a.18.1731573745926;
        Thu, 14 Nov 2024 00:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731573745; cv=none;
        d=google.com; s=arc-20240605;
        b=eE/1mtFwHsmJ+sBxaCWxKFNgTO6Cyewgv2hRmm74h9U7fdmu3BzUVqBsotF4Z5TrJt
         hbjA9R+v8EDPRe+spLeqLk4quGeIla/wOruWlLuYXXjSRj7ZRTYlPx3nCiySn9lkVNQD
         g0LwAENYY4nCJkbjNNWgR6euucP9rFUI3m5gtLd62/mpYnE2Or7kMqJEVS+sDcQ/eokc
         fvO/idafLrjBqm/ogvHc+gSJg7EJ8n+pRwI0NSODGH4fOhnhv9rrGqMqrwKpp8DvUP2S
         4UCX/EzxRQqp8Jvnp+GM7FVlUNgcq2TutC1iBn5L6FIX9MS/YiWeV9Zh2MIHQPv7zTqr
         lRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zQkc4NSGH486X0NuA7/FDzdTttRtFmtgf7xbXoHO2wI=;
        fh=qgKI20/9A+b+oMvVOtlHAxPVx4D3O6i85LdIlROlF5U=;
        b=NKDzHiBUJv08QKg5Z5hjRP5DPrKufZjEO+n4xk7TmwW2N6cbMeyoGpEudZ18VxPoft
         9Lo/1z4nuGyIcyJ6GuRIH+Y2GA7362b3/GGh/3LDh4zZLbyJfo5xMprS+uRyTsCRWb1K
         B6owhuQO1aVYq76xu7EWWtRrWBJubRHZSyP1NHSY/vfFFpLCop5OUHQmAfWwo4NeUu+S
         y8kl8K+njDTS6tb81NABaAxsQh0oSaHQXHFheM5qb8vG7SVWTLpW3WWgCBqoiBv1qmL6
         2/NS1PwKloa9RLn70gqWtDVpl7iYG66cbCLLLF+0Fq/IWiqZkSNiSNDjsEPtUvG0bu/d
         IOLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GiZkJFpA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cae0d51si65985485a.573.2024.11.14.00.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 00:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GiZkJFpA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBVQh-0007JG-QA; Thu, 14 Nov 2024 03:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBVQb-0007Im-Nj
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 03:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBVQZ-00064e-BD
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 03:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731573728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQkc4NSGH486X0NuA7/FDzdTttRtFmtgf7xbXoHO2wI=;
 b=GiZkJFpAkTkCL5035QKESxQ+EZPHKDhI3rSX8kyMg0EohmruS2i/XLmIjnv9Ep2G4e88iB
 SZJiNFZQEgcWbNF+A+g4U2fSxNU8fmFKxPBcx1ih9tgMociUZfSGqMDB7k/4W0KhdoPhfk
 nvDwB+gClznPwJ0sqDA8KcFqWbJHj1o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-UoJGZs0DPBOFtEBZjrnDeQ-1; Thu, 14 Nov 2024 03:42:05 -0500
X-MC-Unique: UoJGZs0DPBOFtEBZjrnDeQ-1
X-Mimecast-MFC-AGG-ID: UoJGZs0DPBOFtEBZjrnDeQ
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cbf039dccfso4931986d6.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 00:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731573725; x=1732178525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQkc4NSGH486X0NuA7/FDzdTttRtFmtgf7xbXoHO2wI=;
 b=pkBEld85az8536QW20XWo3Z5Y3jhQMwapLa6+h3DZ30Jh0Ulgtwsmkf+Duigv3oZd5
 sjJjrol35quKAis9oeyFAnmIHguMl/yPt9zDOX5lv5ynqpwqRZT7iIiMSazfAh4nrXFX
 cbID3vMDQ+b15XUf4uHhBy5tR/2GoPwPgZJe81YAOZCB4rckB4TyKvrzrFHZYkGBs7v0
 6dIM1irqjcvTNw9bL6eRgsOdG9HLZf1xKRgl4LMWGTGHni2yn1EGRpOeJYHAn+PNXBoW
 bYN8T/fjBXsguG/PeFPfcVsE1zC7QYbc0p5CZYpzq9DMXsAngO5MsFASLRE4RWXs+YeO
 khig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVQscehd6TZxIp6yFaZV8XtXsikvHnTQE2S/3vgRbtKq9Qdn4gH7NmAE1006MP93q/pCd3KzIs5w==@nongnu.org
X-Gm-Message-State: AOJu0YwRUZNskNsOWX2vfLNFjuddVVFcyyNUJ9EYLq8MjGzsr5IwA2x4
 7V0fDyUHaxhOU4dN6Tmxj+NZ48+rbxiEsi4LAW8CcKshF/n09mPC9aly0ggqTChefy1WWgAfOGW
 dHV/TyC+dyXt2KPCFkQrLg82gKc/3aZoT5BGsGxkLO6q8mDNFZA==
X-Received: by 2002:a05:6214:469b:b0:6cb:f0ec:b31e with SMTP id
 6a1803df08f44-6d39e1e92bdmr341064406d6.42.1731573724728; 
 Thu, 14 Nov 2024 00:42:04 -0800 (PST)
X-Received: by 2002:a05:6214:469b:b0:6cb:f0ec:b31e with SMTP id
 6a1803df08f44-6d39e1e92bdmr341064186d6.42.1731573724224; 
 Thu, 14 Nov 2024 00:42:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d3ee7ab148sm3135426d6.41.2024.11.14.00.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 00:42:03 -0800 (PST)
Message-ID: <991e3963-245e-41af-b128-431520c7d4e3@redhat.com>
Date: Thu, 14 Nov 2024 09:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <7a3b6dcb5db349f5a7e718784ef46c97@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7a3b6dcb5db349f5a7e718784ef46c97@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9B-adPYj2WcOAZ7YFh-Bz-zyszyhvl8Dth3lPTbdHJg_1731573725
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RGxWykzG+FKh

Hi Shameer,

On 11/14/24 09:20, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, November 13, 2024 5:12 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for
>> SMMUv3 Nested device
>>
>> Hi Shameer,
>> On 11/8/24 13:52, Shameer Kolothum wrote:
>>> Based on SMMUv3 as a parent device, add a user-creatable smmuv3-
>> nested
>>> device. Subsequent patches will add support to specify a PCI bus for
>>> this device.
>>>
>>> Currently only supported for "virt", so hook up the sybus mem & irq
>>> for that  as well.
>>>
>>> No FDT support is added for now.
>>>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  hw/arm/smmuv3.c         | 34 ++++++++++++++++++++++++++++++++++
>>>  hw/arm/virt.c           | 31 +++++++++++++++++++++++++++++--
>>>  hw/core/sysbus-fdt.c    |  1 +
>>>  include/hw/arm/smmuv3.h | 15 +++++++++++++++
>>>  include/hw/arm/virt.h   |  6 ++++++
>>>  5 files changed, 85 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c index
>>> 2101031a8f..0033eb8125 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -2201,6 +2201,19 @@ static void smmu_realize(DeviceState *d, Error
>> **errp)
>>>      smmu_init_irq(s, dev);
>>>  }
>>>
>>> +static void smmu_nested_realize(DeviceState *d, Error **errp) {
>>> +    SMMUv3NestedState *s_nested = ARM_SMMUV3_NESTED(d);
>> nit: s/s_nested/ns or just s?
>>> +    SMMUv3NestedClass *c =
>> ARM_SMMUV3_NESTED_GET_CLASS(s_nested);
>>> +    Error *local_err = NULL;
>>> +
>>> +    c->parent_realize(d, &local_err);
>> I think it is safe to use errp directly here.
> Ok.
>
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +}
>>> +
>>>  static const VMStateDescription vmstate_smmuv3_queue = {
>>>      .name = "smmuv3_queue",
>>>      .version_id = 1,
>>> @@ -2299,6 +2312,18 @@ static void smmuv3_class_init(ObjectClass
>> *klass, void *data)
>>>      device_class_set_props(dc, smmuv3_properties);  }
>>>
>>> +static void smmuv3_nested_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    SMMUv3NestedClass *c = ARM_SMMUV3_NESTED_CLASS(klass);
>>> +
>>> +    dc->vmsd = &vmstate_smmuv3;
>>> +    device_class_set_parent_realize(dc, smmu_nested_realize,
>>> +                                    &c->parent_realize);
>>> +    dc->user_creatable = true;
>>> +    dc->hotpluggable = false;
>>> +}
>>> +
>>>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>>                                        IOMMUNotifierFlag old,
>>>                                        IOMMUNotifierFlag new, @@
>>> -2337,6 +2362,14 @@ static void
>> smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>>>      imrc->notify_flag_changed = smmuv3_notify_flag_changed;  }
>>>
>>> +static const TypeInfo smmuv3_nested_type_info = {
>>> +    .name          = TYPE_ARM_SMMUV3_NESTED,
>>> +    .parent        = TYPE_ARM_SMMUV3,
>>> +    .instance_size = sizeof(SMMUv3NestedState),
>>> +    .class_size    = sizeof(SMMUv3NestedClass),
>>> +    .class_init    = smmuv3_nested_class_init,
>>> +};
>>> +
>>>  static const TypeInfo smmuv3_type_info = {
>>>      .name          = TYPE_ARM_SMMUV3,
>>>      .parent        = TYPE_ARM_SMMU,
>>> @@ -2355,6 +2388,7 @@ static const TypeInfo
>>> smmuv3_iommu_memory_region_info = {  static void
>>> smmuv3_register_types(void)  {
>>>      type_register(&smmuv3_type_info);
>>> +    type_register(&smmuv3_nested_type_info);
>>>      type_register(&smmuv3_iommu_memory_region_info);
>>>  }
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c index
>>> 780bcff77c..38075f9ab2 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -181,6 +181,7 @@ static const MemMapEntry base_memmap[] = {
>>>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>>>      [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
>>>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>>> +    [VIRT_SMMU_NESTED] =        { 0x0b000000, 0x01000000 },
>> I agree with Mostafa that the _NESTED terminology may not be the best
>> choice.
> Yes. Agree.
Nicolin's suggestion to use a reference to HW acceleration looks
sensible to me.
>
>> The motivation behind that multi-instance attempt, as introduced in
>> https://lore.kernel.org/all/ZEcT%2F7erkhHDaNvD@Asurada-Nvidia/
>> was:
>> - SMMUs with different feature bits
>> - support of VCMDQ HW extension for SMMU CMDQ
>> - need for separate S1 invalidation paths
>>
>> If I understand correctly this is mostly wanted for VCMDQ handling? if this
>> is correct we may indicate that somehow in the terminology.
>>
> Not just for VCMDQ, but it benefits when we have multiple physical SMMUv3
> instances as well.
>
>> If I understand correctly VCMDQ terminology is NVidia specific while ECMDQ
>> is the baseline (?).
> Yes, VCMDQ is NVIDIA specific. And ECMDQ is ARM SMMUv3, but don’t think we
> can associate ECMDQ with a virtual SMMUv3.
ok
>
>>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that
>> size */
>>>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
>>>      [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
>>> @@ -226,6 +227,7 @@ static const int a15irqmap[] = {
>>>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>>>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
>>>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS
>>> -1 */
>>> +    [VIRT_SMMU_NESTED] = 200,
>> What is the max IRQs expected to be consumed. Wother to comment for
>> next interrupt user.
> Depends on how many we plan to support max  and each requires minimum 4. I will
> update with a  comment here.
>
>>>  };
>>>
>>>  static void create_randomness(MachineState *ms, const char *node) @@
>>> -2883,10 +2885,34 @@ static void
>> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>>                                          DeviceState *dev, Error
>>> **errp)  {
>>>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>
>>> -    if (vms->platform_bus_dev) {
>>> -        MachineClass *mc = MACHINE_GET_CLASS(vms);
>>> +    /* For smmuv3-nested devices we need to set the mem & irq */
>>> +    if (device_is_dynamic_sysbus(mc, dev) &&
>>> +        object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3_NESTED)) {
>> why did you choose not using the PLATFORM BUS infra which does that
>> kind of binding automatically (also it provisions for dedicated MMIOs and
>> IRQs). At least you would need to justify in the commit msg I think
> Because I was not  sure how to do this binding otherwise. I couldn't find
> any such precedence  for a  dynamic platform bus dev binding 
> MMIOs/IRQs(May be I didn't look hard). I mentioned it in cover letter.
>
> Could you please give me some pointers/example for this? I will also
> take another look.
vfio platform users such automatic binding (however you must check that
vfio platform bus mmio and irq space is large enough for your needs).

the binding is transparently handled by
    if (vms->platform_bus_dev) {
        if (device_is_dynamic_sysbus(mc, dev)) {
           
platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
                                     SYS_BUS_DEVICE(dev));
        }
    }


>
>>> +        hwaddr base = vms->memmap[VIRT_SMMU_NESTED].base;
>>> +        int irq =  vms->irqmap[VIRT_SMMU_NESTED];
>>> +
>>> +        if (vms->smmu_nested_count >= MAX_SMMU_NESTED) {
>>> +            error_setg(errp, "smmuv3-nested max count reached!");
>>> +            return;
>>> +        }
>>> +
>>> +        base += (vms->smmu_nested_count * SMMU_IO_LEN);
>>> +        irq += (vms->smmu_nested_count * NUM_SMMU_IRQS);
>>>
>>> +        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>> +        for (int i = 0; i < 4; i++) {
>>> +            sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
>>> +                               qdev_get_gpio_in(vms->gic, irq + i));
>>> +        }
>>> +        if (vms->iommu != VIRT_IOMMU_SMMUV3_NESTED) {
>>> +            vms->iommu = VIRT_IOMMU_SMMUV3_NESTED;
>>> +        }
>>> +        vms->smmu_nested_count++;
>> this kind of check would definitively not integrated in the platform bus but
>> this could be introduced generically in the framework though or special
>> cased after the platform_bus_link_device
> Ok. So I assume there is a better way to link the MMIOs/IRQs as you mentioned 
> above and we can add another helper to track this count as well.
>
>>> +    }
>>> +
>>> +    if (vms->platform_bus_dev) {
>>>          if (device_is_dynamic_sysbus(mc, dev)) {
>>>              platform_bus_link_device(PLATFORM_BUS_DEVICE(vms-
>>> platform_bus_dev),
>>>                                       SYS_BUS_DEVICE(dev)); @@ -3067,6
>>> +3093,7 @@ static void virt_machine_class_init(ObjectClass *oc, void
>> *data)
>>>      machine_class_allow_dynamic_sysbus_dev(mc,
>> TYPE_VFIO_AMD_XGBE);
>>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>>>      machine_class_allow_dynamic_sysbus_dev(mc,
>> TYPE_VFIO_PLATFORM);
>>> +    machine_class_allow_dynamic_sysbus_dev(mc,
>>> + TYPE_ARM_SMMUV3_NESTED);
>>>  #ifdef CONFIG_TPM
>>>      machine_class_allow_dynamic_sysbus_dev(mc,
>> TYPE_TPM_TIS_SYSBUS);
>>> #endif diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c index
>>> eebcd28f9a..0f0d0b3e58 100644
>>> --- a/hw/core/sysbus-fdt.c
>>> +++ b/hw/core/sysbus-fdt.c
>>> @@ -489,6 +489,7 @@ static const BindingEntry bindings[] = {  #ifdef
>>> CONFIG_LINUX
>>>      TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC,
>> add_calxeda_midway_xgmac_fdt_node),
>>>      TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
>>> +    TYPE_BINDING("arm-smmuv3-nested", no_fdt_node),
>>>      VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a",
>>> add_amd_xgbe_fdt_node),  #endif  #ifdef CONFIG_TPM diff --git
>>> a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h index
>>> d183a62766..87e628be7a 100644
>>> --- a/include/hw/arm/smmuv3.h
>>> +++ b/include/hw/arm/smmuv3.h
>>> @@ -84,6 +84,21 @@ struct SMMUv3Class {
>>>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
>>>  OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
>>>
>>> +#define TYPE_ARM_SMMUV3_NESTED   "arm-smmuv3-nested"
>>> +OBJECT_DECLARE_TYPE(SMMUv3NestedState, SMMUv3NestedClass,
>>> +ARM_SMMUV3_NESTED)
>>> +
>>> +struct SMMUv3NestedState {
>>> +    SMMUv3State smmuv3_state;
>>> +};
>>> +
>>> +struct SMMUv3NestedClass {
>>> +    /*< private >*/
>>> +    SMMUv3Class smmuv3_class;
>>> +    /*< public >*/
>>> +
>>> +    DeviceRealize parent_realize;
>>> +};
>>> +
>>>  #define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
>>>  #define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
>>>
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h index
>>> 46f48fe561..50e47a4ef3 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -50,6 +50,9 @@
>>>  /* MMIO region size for SMMUv3 */
>>>  #define SMMU_IO_LEN 0x20000
>>>
>>> +/* Max supported nested SMMUv3 */    if (vms->platform_bus_dev) {
>>>         if (device_is_dynamic_sysbus(mc, dev)) {
>>>             platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
>>>                                      SYS_BUS_DEVICE(dev));
>>>         }
>>>     }
>>>
>>> +#define MAX_SMMU_NESTED 128
>> Ouch, that many?!
> 😊. I just came up with the max we can support the allocated MMIO space.
> We do have systems at present which has 8 physical SMMUv3s at the moment.
> Probably 16/32 would be a better number I guess.
OK thanks

Eric
>
> Thanks,
> Shameer

