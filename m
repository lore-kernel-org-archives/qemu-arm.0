Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp6462njc;
        Thu, 20 Mar 2025 18:00:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXqolZdhLCRlKAFHGpEa5wXsMQc4bqNg7By/F8fNQY5+UHJh9k3j5NLaLEbCu1MjFdx8+L3cDeJMgjXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHe3IDKuE1AfCdM3MCJI8KpYNB8ghA/ek3nYpDNbg28dt7gshcMqsewhCsO5k6+ksFdXUiz
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr184723485a.15.1742518806795;
        Thu, 20 Mar 2025 18:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742518806; cv=none;
        d=google.com; s=arc-20240605;
        b=b2NcQBZkVD5THHVopGTXxv1SQq+aRu5brhe94ZWNhW8QoW60llffWl/S7XQaMpemW2
         MGOw5hQjWLQuKrMVT1DKjv7wFsV325DAttPsrNEVt+VHCNlz7j2Xx94LvRDt8L6fnmLj
         gwUQtOufLABYJfqSMF8t43V0aZV6VPawCHaUUTlLllsvOrUpzrL5Ij426OYmrMa6MQrB
         QXheU8AaG/ZXkLQtWW0ZC71189MvRxtRtVipyVdRl/gUZOxKebEgirZL7N3mg5YW+3iq
         PRiSotqy7jHg2TZtS5NLcDK4HDyeFK2yZK4X/8g6KaBQnBYynIc2MjsptUM0tpyjFzyY
         zhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wNQuGkuOojxbTctffvW3xyBknRtXGVmfbkBsNlqOf4A=;
        fh=j4OjOZILWtP8LC/HdVKAKQ9MstWDVitPLXK+mnvdieA=;
        b=AG7D79zo6875xzgZ38v6xabQRfIzfqo9P+2Jt+IsvbBHtPKkpEpWEbz5xFW+Xq5QWI
         McdBT3WbmEtQnGaruEeoZR3UhT054YZB+aIM1LsEu8zogMTj2I7Mrlh27FXliXKhT4g7
         hgFdH8+DLygkV7CoZ1o1h0w34Zfou6EuxXOHxL9WAqhU511zOAp1yfn5Rm7Lrrthoyvd
         3QDg6WNatL2S27kozKkKvZ/El5IDYx9n1cG40wIZgVnzNRQrxosFFBJ/lLwC8dxNByWm
         UFcb/EB+H3x9JALkfuU6Q1vRLZG51Koo++x6C4UoCKhWfw2ORe60NPhiHkQflQrRGKgJ
         LpKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hU83Kf9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9356c83si93001885a.419.2025.03.20.18.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 18:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hU83Kf9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvQjp-0008JG-D5; Thu, 20 Mar 2025 20:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvQjm-0008IG-EH
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 20:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tvQjk-0006F6-Gj
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 20:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742518787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNQuGkuOojxbTctffvW3xyBknRtXGVmfbkBsNlqOf4A=;
 b=hU83Kf9H66SUVFh0EmX0P4j1ELtQ8Pw++I0cfPrBcy8gNjCaBAj9qieJue+Khk/9t4FP0Q
 xYngWSUMLOKJj41SqrMa5AvfaAnkNeCfGdcmz/Xs/ntKjqIF1Q2fo/xLdA2Ndg8Sg3vWym
 fYu+k/r/mfQsG4Up17KkTXHtNBMH6gY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-flkqSupBMlK0jp69e0IXzg-1; Thu, 20 Mar 2025 20:59:43 -0400
X-MC-Unique: flkqSupBMlK0jp69e0IXzg-1
X-Mimecast-MFC-AGG-ID: flkqSupBMlK0jp69e0IXzg_1742518783
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85e3084ce48so1746239f.2
 for <qemu-arm@nongnu.org>; Thu, 20 Mar 2025 17:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742518783; x=1743123583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wNQuGkuOojxbTctffvW3xyBknRtXGVmfbkBsNlqOf4A=;
 b=qyMa7FEoQ8f0uvtRDL1gg+8A2bn6zjdykcZTUbZSjsK1K5qSRIbHbvzQmCBz4p9lbu
 V/IyKYKT8/NAhQPT5ajvhAfwcP9xtpwwDVZxdTcj8Im2gSU2aMWMJCeWaECUqEFQfgMK
 +x40yImgOAduKBPu8qY22LwUVKwz6rr3mU2VLpeNdb8+7qxuDRulxxFbCuYHaLCu63ND
 BLb0PHuleH1tF1IoSJ+DsU5w8ajxBHz6KalLElkzcQjhuPCYkEQrM3dJewhNBEij6ihx
 fo0p8dt3TmoiUBTfW6Ye5qVV3h0gUlWfaAARJ5obS8cGPQwCvZ68xf2p8uvCs6gVHFaY
 Dx8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqo9cN8rMEkER7217WiTi+TsMaAICYbPl7IeqOhl+k/qO8o00ELJ+tMXgMSefPH862ZOYZLpy93A==@nongnu.org
X-Gm-Message-State: AOJu0Yyl4l5NIocgOrg5s5C6nm/pSYNgmDJI+A5lGM48kPjILWPhcPmi
 z554R7qXpuZvXu0jovVgbhfhtz2+n9YOY6I1wqvZfzMRwF/ozwamrkJkMOTyzK9jKwjTl8AmKQq
 /gjjSgfPxVMYX8Ab3pFFR97lPocKCFcnhxQzl1B0TYem4BjAEqQ==
X-Gm-Gg: ASbGnctiOVoVP4w0leF4PFzyQtAJnRoZOc1lex7bypnLNcSgiJ+oNloFaTCHy3csMTQ
 uKGIf0+cxQs1H3Pncjzuh6IYRr5AZeJLij6846Yzw+bpqXu1LHNDo5pkMBXKwFymY7BS0xhIsrS
 6G2uRcnf7AHTSBAWlN3EvFUj+oQShEv7Cn1PYl6jmXV2yO9v2E5crELJC5/VZApAG/GlkHtqtHr
 tjDYtald0V7VPH15rWbk6Iw/7ztIEkbbE2ctxumVmRl5dX1DSHZnQPgA7DBzzQR1Ko63dimw0ZD
 dd1hnmsENmQ+xpLh
X-Received: by 2002:a05:6602:3e90:b0:85b:41cc:f709 with SMTP id
 ca18e2360f4ac-85e2cc7c804mr137565439f.14.1742518783070; 
 Thu, 20 Mar 2025 17:59:43 -0700 (PDT)
X-Received: by 2002:a05:6602:3e90:b0:85b:41cc:f709 with SMTP id
 ca18e2360f4ac-85e2cc7c804mr137563339f.14.1742518782639; 
 Thu, 20 Mar 2025 17:59:42 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85e2bdb5495sm17204039f.46.2025.03.20.17.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 17:59:41 -0700 (PDT)
Message-ID: <1b838258-7d30-4d9e-b350-3950617419e2@redhat.com>
Date: Thu, 20 Mar 2025 20:59:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: eric.auger@redhat.com,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
 <3d1312b411f04121a3be90879a915982@huawei.com>
 <1c603ab2-4fbb-4838-a544-d88bc2608506@redhat.com>
 <44ed64f0-8e8b-4a87-9a85-074b9d283bc8@redhat.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <44ed64f0-8e8b-4a87-9a85-074b9d283bc8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: foTbbs8Lk7y0LtDklGfycD9O1NlakkB-sLDOUJRNpQo_1742518783
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zKm1iRS2vuu8



On 3/19/25 2:21 PM, Eric Auger wrote:
> Hi Don,
> 
> 
> On 3/19/25 5:21 PM, Donald Dutile wrote:
>>
>>
>> On 3/19/25 5:26 AM, Shameerali Kolothum Thodi wrote:
>>> Hi Don,
>>>
>> Hey!
>>
>>>> -----Original Message-----
>>>> From: Donald Dutile <ddutile@redhat.com>
>>>> Sent: Tuesday, March 18, 2025 10:12 PM
>>>> To: Shameerali Kolothum Thodi
>>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>>> qemu-devel@nongnu.org
>>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>>>> pcie bus
>>>>
>>>> Shameer,
>>>>
>>>> Hi!
>>>>
>>>> On 3/11/25 10:10 AM, Shameer Kolothum wrote:
>>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>>> and that is set as the primary-bus for the smmu dev.
>>>>>
>>>>> Signed-off-by: Shameer Kolothum
>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>> ---
>>>>>     hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>>>>>     1 file changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>>>> index c327661636..1471b65374 100644
>>>>> --- a/hw/arm/smmuv3-accel.c
>>>>> +++ b/hw/arm/smmuv3-accel.c
>>>>> @@ -9,6 +9,21 @@
>>>>>     #include "qemu/osdep.h"
>>>>>
>>>>>     #include "hw/arm/smmuv3-accel.h"
>>>>> +#include "hw/pci/pci_bridge.h"
>>>>> +
>>>>> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
>>>>> +{
>>>>> +    DeviceState *d = opaque;
>>>>> +
>>>>> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
>>>>> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
>>>>> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus-
>>>>> name)) {
>>>>> +            object_property_set_link(OBJECT(d), "primary-bus",
>>>>> OBJECT(bus),
>>>>> +                                     &error_abort);
>>>>> +        }
>>>>> +    }
>>>>> +    return 0;
>>>>> +}
>>>>>
>>>>>     static void smmu_accel_realize(DeviceState *d, Error **errp)
>>>>>     {
>>>>> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d, Error
>>>> **errp)
>>>>>         SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>>>         Error *local_err = NULL;
>>>>>
>>>>> +    object_child_foreach_recursive(object_get_root(),
>>>>> +                                   smmuv3_accel_pxb_pcie_bus, d);
>>>>> +
>>>>>         object_property_set_bool(OBJECT(dev), "accel", true,
>>>>> &error_abort);
>>>>>         c->parent_realize(d, &local_err);
>>>>>         if (local_err) {
>>>>> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass
>>>> *klass, void *data)
>>>>>         device_class_set_parent_realize(dc, smmu_accel_realize,
>>>>>                                         &c->parent_realize);
>>>>>         dc->hotpluggable = false;
>>>>> +    dc->bus_type = TYPE_PCIE_BUS;
>>>>>     }
>>>>>
>>>>>     static const TypeInfo smmuv3_accel_type_info = {
>>>>
>>>> I am not seeing the need for a pxb-pcie bus(switch) introduced for each
>>>> 'accel'.
>>>> Isn't the IORT able to define different SMMUs for different RIDs?
>>>> if so,
>>>> itsn't that sufficient
>>>> to associate (define) an SMMU<->RID association without introducing a
>>>> pxb-pcie?
>>>> and again, I'm not sure how that improves/enables the device<->SMMU
>>>> associativity?
>>>
>>> Thanks for taking a look at the series. As discussed elsewhere in
>>> this thread(with
>>> Eric), normally in physical world (or atleast in the most common
>>> cases) SMMUv3
>>> is attached to PCIe Root Complex and if you take a look at the IORT
>>> spec, it describes
>>> association of ID mappings between a RC node and SMMUV3 node.
>>>
>>> And if my understanding is correct, in Qemu, only pxb-pcie allows you
>>> to add
>>> extra root complexes even though it is still plugged to
>>> parent(pcie.0). ie, for all
>>> devices downstream it acts as a root complex but still plugged into a
>>> parent pcie.0.
>>> This allows us to add/describe multiple "smmuv3-accel" each
>>> associated with a RC.
>>>
>> I find the qemu statements a bit unclear here as well.
>> I looked at the hot plug statement(s) in docs/pcie.txt, as I figured
>> that's where dynamic
>> IORT changes would be needed as well.  There, it says you can hot-add
>> PCIe devices to RPs,
>> one has to define/add RP's to the machine model for that plug-in.
>>
>> Using libvirt, it could auto-add the needed RPs to do dynmaic smmuv3
>> additions,
> I am not sure I understand your statement here. we don't want "dynamic"
> SMMUv3 instantiation. SMMUv3 is a platform device which is supposed to
> be coldplugged on a pre-existing PCIe hierarchy. The SMMUv3 device is
> not something that is meant to be hotplugged or hotunplugged.
> To me we hijack the bus= property to provide information about the IORT
> IDMAP
> 
Dynamic in the sense that if one adds smmuv3 for multiple devices,
libvirt will dynamically figure out how to instantiate one, two, three... smmu's
in the machine at cold boot.
If you want a machine to be able to hot-plug a device that would require another smmu,
than the config, and smmu, would have to be explicilty stated; as is done today for
hot-plug PCIe if the simple machine that libvirt would make is not sufficient to
hot-add a PCIe device.

> Thanks
> 
> Eric
>> if I understand how libvirt does that today for pcie devices now (/me
>> looks at danpb for feedback).
>>
>>> Having said that,  current code only allows pxb-pcie root complexes
>>> avoiding
>>> the pcie.0. The idea behind this was, user can use pcie.0 with a non
>>> accel SMMUv3
>>> for any emulated devices avoiding the performance bottlenecks we are
>>> discussing for emulated dev+smmuv3-accel cases. But based on the
>>> feedback from
>>> Eric and Daniel I will relax that restriction and will allow
>>> association with pcie.0.
>>>
>> So, I think this isn't a restriction that this smmuv3 feature should
>> enforce;
>> lack of a proper RP or pxb-pcie will yield an invalid config
>> issue/error, and
>> the machine definition will be modified to meet the needs for IORT.
>>
>>> Thanks,
>>> Shameer
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>   
>>>>>> to root complexes.
>>>> Feel free to enlighten me where I may have mis-read/interpreted the
>>>> IORT
>>>> & SMMUv3 specs.
>>>>
>>>> Thanks,
>>>> - Don
>>>>
>>>
>>
> 

