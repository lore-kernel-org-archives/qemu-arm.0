Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36031CF6A86
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 09:20:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdmC6-0004nw-3h; Thu, 08 Jan 2026 04:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vdmC5-0004m3-5D
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 04:20:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vdmC3-00047B-G6
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 04:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767864034;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaDE4FhUoUcTJ2xNeqQWBxO/Ax2n3T46t7PIjA4XeWM=;
 b=RwGHL6zD7Nn7wANpWJwP8P5dONuFtuTNGcaJPE4Pr5L2iKuiTVPIVUFl64HjdA0CEQAgKE
 d1aU9j4j7dVNL9X57bEhk2gxRyTH3dlwDKygOdzr0eK0/i57DVi5v+PX9vDGpeWmmdl9rV
 ZjZ+N01waIhvRAYe7O9b6Z/eBjlXOMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-mLn-Z8S8MuutLluQU8tf5w-1; Thu, 08 Jan 2026 04:20:31 -0500
X-MC-Unique: mLn-Z8S8MuutLluQU8tf5w-1
X-Mimecast-MFC-AGG-ID: mLn-Z8S8MuutLluQU8tf5w_1767864030
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso18109205e9.3
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 01:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864030; x=1768468830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uaDE4FhUoUcTJ2xNeqQWBxO/Ax2n3T46t7PIjA4XeWM=;
 b=TIy4TTEXTmlVaTSC9dMepEE/UHpcyVodKXkNvDXFBjhxexYQQ2gikfSYeCwgFIpG1S
 d7CpnlM4Cx0xt+2z76J4qu1SsBIMqceCMU8dV9FinL5xM3sc6GQQvLwiBf4DEZQRLrFF
 A0PvU4zDWAEGjFZlLFPZ0BaG2GKAuIOEKx7GnCDWrbS6+Xevbf1DYKa0m/nUaa/Lka6Y
 ExH3MNvVkfaKLgNcOzxLFBZoFSxnfkKpbJ6RGq5Mbq7fKEeCJ26k3LwvmP/no6uIes/Q
 N69iJIn5ivAqhhJbvKAmzHxu2M5yZIeljlX9uqb8VNEgxSkmCjGVIsUX75CQ40uQbPHo
 iDHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDSTdyMVD17ltyJEPoVjksL7E01OpWrgxUMDSLv8EADQhyLnIaMt9PnIH9jqm8cMaBb8censIEfA==@nongnu.org
X-Gm-Message-State: AOJu0YyQEFOTV2qnW0ymacMOZM1jCMDk2AjqhbNM5g+cIB1gqvIQABkK
 g6dX2oRtcS+9xhsVI1MBpuAqzUbuhEFpn3YuygyijDKgNvKF8YPEsQ4hPCegurct32pJcRVRwzo
 4rtpSuENLwvgssRo/wbEp1MrjmRIuUS92mMK9qKgud6RAg3leMJkdEw==
X-Gm-Gg: AY/fxX66jigR86WzHdtMK3jXGluUeEA/jDUtAq7JHkp42exmPa3xfcDrImYm4CpGg0z
 U0jMLqKO7a4Qr1RT2p9RcsbPbHIzdhxZ/4S0yxJqqW+IPrfUVrFv64p7kur/K8AemMYsQeoZCio
 Yri2mvJkWstuUdAOpn/58k7qAZwaNULijfdoYgsFOdNR/ZLqjaLARy/zNjcWaCODfDzCwB7ezd/
 tdDbz+EFTeqyJeGcTsN458b1gO+bSzfBIcvSe3BGDpYGt9jELoH5RabGWvVWrCue+PWTuN4RNQ7
 8/aOpULKYfNP258Tzm1x8tYEpYxiIbi2KPa37WbYd2Gt8Q2ZKSli1Uw1W7+EAI4s8m/87qAR2XP
 Gx3N78BFhfBp5SjQAvZ7YamMHnor5aA4L+BmlQ54N5IOzy9tJ1j5Splw6Vw==
X-Received: by 2002:a05:600c:3b19:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-47d84b3b645mr67241515e9.21.1767864029890; 
 Thu, 08 Jan 2026 01:20:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvWCbpCYFJV+XXNJQcusiGOxM2HYZ+oAQV9ngPCExkAIcfmhaQ5mwylBXYNB1bmwZVqlJ22A==
X-Received: by 2002:a05:600c:3b19:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-47d84b3b645mr67241075e9.21.1767864029432; 
 Thu, 08 Jan 2026 01:20:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8678cad8sm35775945e9.3.2026.01.08.01.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:20:28 -0800 (PST)
Message-ID: <023c6dba-e9d0-46c1-8503-c65ec6df2821@redhat.com>
Date: Thu, 8 Jan 2026 10:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
 <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wbjDTNsVEJBF2WH6UlZnmW142tTCX-tHCKRSXxO6f08_1767864030
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 1/5/26 9:05 PM, Philippe Mathieu-Daudé wrote:
> On 17/12/25 00:57, Pierrick Bouvier wrote:
>> This will be used to access non-secure and secure memory. Secure support
>> and Granule Protection Check (for RME) for SMMU need to access secure
>> memory.
>>
>> As well, it allows to remove usage of global address_space_memory,
>> allowing different SMMU instances to have a specific view of memory.
>>
>> User creatable SMMU are handled as well for virt machine,
>> by setting the memory properties when device is plugged in.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   include/hw/arm/smmu-common.h |  4 ++++
>>   include/hw/arm/virt.h        |  2 ++
>>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>>   hw/arm/virt.c                | 13 +++++++++++--
>>   5 files changed, 54 insertions(+), 6 deletions(-)
>
>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 62a76121841..9a67ce857fe 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -944,6 +944,13 @@ static void smmu_base_realize(DeviceState *dev,
>> Error **errp)
>>           return;
>>       }
>>   +    g_assert(s->memory);
>> +    address_space_init(&s->memory_as, s->memory, "smmu-memory-view");
>> +    if (s->secure_memory) {
>> +        address_space_init(&s->secure_memory_as, s->secure_memory,
>> +                           "smmu-secure-memory-view");
>
> Else, are we sure the SMMU implementations will behave correctly?
>
>> +    }
>> +
>>       /*
>>        * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie
>> based extra
>>        * root complexes to be associated with SMMU.
>> @@ -1008,10 +1015,28 @@ static void smmu_base_class_init(ObjectClass
>> *klass, const void *data)
>>       rc->phases.exit = smmu_base_reset_exit;
>>   }
>>   +static void smmu_base_instance_init(Object *obj)
>> +{
>> +    SMMUState *s = ARM_SMMU(obj);
>> +
>> +    object_property_add_link(obj, "memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>> +
>> +    object_property_add_link(obj, "secure-memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->secure_memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>
> Why can't we use device_class_set_props(&static_properties)
> in smmu_base_class_init()? 

We have smmu_dev_properties with a DEFINE_PROP_LINK
Couldn't we add the new links there?

Eric
>
>> +}
>> +
>>   static const TypeInfo smmu_base_info = {
>>       .name          = TYPE_ARM_SMMU,
>>       .parent        = TYPE_SYS_BUS_DEVICE,
>>       .instance_size = sizeof(SMMUState),
>> +    .instance_init = smmu_base_instance_init,
>>       .class_data    = NULL,
>>       .class_size    = sizeof(SMMUBaseClass),
>>       .class_init    = smmu_base_class_init,
>
> Anyhow this is functional and I suppose this can be improved on top, so:
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>


