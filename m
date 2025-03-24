Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2243242njc;
        Mon, 24 Mar 2025 14:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMUriuE5aw45Cpee9ZZJQsfCR2Vc2ZFhd/CjCW3jhiSkS+6WRJdkcKAvlvbOp4ZbQvaWnrws/lm3QhXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEhMxjhsKUH1oPwFZf17PTN2SjiOAg+0HE4Ohs5swMamMN7KZZGgc2oIPTrx4i3OHJFL9Xe
X-Received: by 2002:ad4:5c64:0:b0:6e8:f5d9:57be with SMTP id 6a1803df08f44-6eb3f35b304mr245438996d6.28.1742852643035;
        Mon, 24 Mar 2025 14:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742852643; cv=none;
        d=google.com; s=arc-20240605;
        b=UCo7sOiedY2fZAKLt/34fVRaWrj57iKf7xXGsn10unFxMkZkrAhAJLrTDJFmBRAGJW
         0sOz2X3u7DmrEc1LFTr6nVEgV5IGh2DT5953qVt3odB+rzH3FWcxdjiM8w7TXHCElEBt
         Y2jgmP+S4InprzVgYVxoq8R+Zt74WuK8AH3N/LRDW9CY9cRXqODsfrmsMmBYiyMljNmM
         wujJPhJSaKN0q9r+q+x5Tzg78nAra7szKFUlmRUM5zy6Ln8J2+FERD1IGKjqQYi25BI4
         c1A6kwJaRj5SG8HuEUJjmA5ivXcBBXpCv72O5zfDqwjLqBZ6CdICchAqLhNIaHDJgQH+
         cz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+cqxR8H9H+Hvc+H73vODaIIkMh7TXOUZqKAnklA+VFU=;
        fh=lMhKTCcRk7dct0by73EFw8HYOlRehgRz1b42bpuPvuQ=;
        b=J4D/0aWrTMK5rcKzGpOYOAJAK3HzE14kOcqxssA82p7qW7aiwVAwWIUVJIqi8zF8f3
         tnHq0j7yb3m99cPKATjYEY9ltr7w6zatoh+g7/7ZPfTGn+Z9Fa/EEhygokqWhvHAmSXg
         5pdsgH2g44vXkX1PZh7UxoymN6N8eq7yJJirCbeixsMEmsq6x7h5r0pD4IK7Ia27JFHf
         UnaO/IhnlISGklpKNcubk72rBBS9oReqPZAsIRHeqwB7PrTDfxDydnNFr3VCsWC80VBB
         1SRBR7nI40Tl1SErORjxuwo8XQVse9HNphi3UhKjIiijcu0WFBt3XySfp0jBSqUDSNeL
         dxTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7aGcfWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3eff34bfsi81119296d6.196.2025.03.24.14.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 14:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7aGcfWC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twpaG-000551-K3; Mon, 24 Mar 2025 17:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1twpaE-00054D-G8
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 17:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1twpaB-0007dv-6k
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 17:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742852615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cqxR8H9H+Hvc+H73vODaIIkMh7TXOUZqKAnklA+VFU=;
 b=B7aGcfWC3LanQm11v5Ubs2sXlfmYnfLmXTgdDLdQE4yKhcRKbmuDBRJ1iowUpiuhVR2ODw
 O2S7ePlxZYXGZizk2z2rjvo3B5WvvIdb5v2NT4Scgn1s+ZPrRy7lPFQ8P5U8bWXT0e4P3P
 81I7uU0wXG0t/lk5xgL9kjFHAZOUv+w=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-3Xr0lAypOSua-AvpRLSgZg-1; Mon, 24 Mar 2025 17:43:34 -0400
X-MC-Unique: 3Xr0lAypOSua-AvpRLSgZg-1
X-Mimecast-MFC-AGG-ID: 3Xr0lAypOSua-AvpRLSgZg_1742852613
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85e15e32366so496552939f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 14:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742852613; x=1743457413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cqxR8H9H+Hvc+H73vODaIIkMh7TXOUZqKAnklA+VFU=;
 b=duP9pGG/viHhEYUuVPE2VkN9pyAAiaCEOENFbg4SJrzBvee2UcAUH+WEiqQm0gvXHw
 JGI0omDEA9tPRmwf9RoPjaT7SN0xFb8ffDQlHk6NAA/pwZ+3PL3GPUr8FTclm59kG8xh
 d1oyFI5Jt6WJv1wqPGtcLS7dClId5EZ5dY+O2JvM5vkpXaGaWc1PoVd+GYBaZy1Wv+4F
 sn0VOillRLIX54zk0LftZuUI6cD3YSxMu+grI6TUWMbaxztv4rZTPZmzlWSaHfmHPTgE
 wm7PmDRvJXmiKxJw8Q0/1hMVoSr3UJUIPuILNmwLdDyEZXofvT+DNDEmVuib743f9772
 7zYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxBKfKH7JNAhJ/vT/07yuYbsLTWMUaQXpeRBMr456833kPwO814o7rjBSvxpP8Ara/dC6+gAP4w==@nongnu.org
X-Gm-Message-State: AOJu0YxODgWN3AKtl8KIKfXE3iBhiGkluRbePOP3vFI72iIOKKOxXj0j
 UKlXW3F4ysXbK1yV8T6TPRCuE3fxyzDCoQ4lA9MVHG8Ue368Uj5+0KYSKbC6CSJx3bDUkxcZGDq
 Ai1OrptXuFHU5d6WcaJdyTRojt/Nv4WJRTNRzhkcbu7FTfbyX/A==
X-Gm-Gg: ASbGncut/k2xWqxPDR+wZlw8QaKL8Wjx22HsTKO+eAeNB+dCV85aynAM9azY+JYNU+z
 /RbUAeFfnFjs17TmdgdmeQOWxFhi9LJOxd7t5lSOV0bmxpmT2FLlgmgDnbfKcQUAA9MPaBXrviG
 hb8UWO5yJhpY6pKvdNPmg8rMPK+4H0bTlnzqT54U9yeR3bNIcAQSWP83ZNlkg3JQiAnvRUBOVvd
 MCJvK+ORw7AAxqxXq/oJcHKNRfMXVTobfmKQbpLw5RxWcjg/cFid+CMGZ9J8i3Kb7yy4SalFzcW
 kItTIS+lS9p+d7nJ
X-Received: by 2002:a05:6602:4088:b0:85d:b054:6eb9 with SMTP id
 ca18e2360f4ac-85e2cb417c3mr1683506539f.14.1742852613290; 
 Mon, 24 Mar 2025 14:43:33 -0700 (PDT)
X-Received: by 2002:a05:6602:4088:b0:85d:b054:6eb9 with SMTP id
 ca18e2360f4ac-85e2cb417c3mr1683503139f.14.1742852612819; 
 Mon, 24 Mar 2025 14:43:32 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85e2bbff652sm175802039f.7.2025.03.24.14.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 14:43:32 -0700 (PDT)
Message-ID: <44584edc-97cb-4468-a751-70b551c0d66d@redhat.com>
Date: Mon, 24 Mar 2025 17:43:30 -0400
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
 <1b838258-7d30-4d9e-b350-3950617419e2@redhat.com>
 <b7201a78-f2ea-4aee-a973-b02e4dc78652@redhat.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <b7201a78-f2ea-4aee-a973-b02e4dc78652@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gi9CbZoMajrLtbdzMfqtEVyvWFzJviNluGSb_m153rE_1742852613
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: bpz3RjALy1zQ



On 3/24/25 10:56 AM, Eric Auger wrote:
> 
> 
> On 3/21/25 1:59 AM, Donald Dutile wrote:
>>
>>
>> On 3/19/25 2:21 PM, Eric Auger wrote:
>>> Hi Don,
>>>
>>>
>>> On 3/19/25 5:21 PM, Donald Dutile wrote:
>>>>
>>>>
>>>> On 3/19/25 5:26 AM, Shameerali Kolothum Thodi wrote:
>>>>> Hi Don,
>>>>>
>>>> Hey!
>>>>
>>>>>> -----Original Message-----
>>>>>> From: Donald Dutile <ddutile@redhat.com>
>>>>>> Sent: Tuesday, March 18, 2025 10:12 PM
>>>>>> To: Shameerali Kolothum Thodi
>>>>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>>>>> qemu-devel@nongnu.org
>>>>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>>>>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a
>>>>>> pxb-
>>>>>> pcie bus
>>>>>>
>>>>>> Shameer,
>>>>>>
>>>>>> Hi!
>>>>>>
>>>>>> On 3/11/25 10:10 AM, Shameer Kolothum wrote:
>>>>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>>>>> and that is set as the primary-bus for the smmu dev.
>>>>>>>
>>>>>>> Signed-off-by: Shameer Kolothum
>>>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>>>> ---
>>>>>>>      hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>>>>>>>      1 file changed, 19 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>>>>>> index c327661636..1471b65374 100644
>>>>>>> --- a/hw/arm/smmuv3-accel.c
>>>>>>> +++ b/hw/arm/smmuv3-accel.c
>>>>>>> @@ -9,6 +9,21 @@
>>>>>>>      #include "qemu/osdep.h"
>>>>>>>
>>>>>>>      #include "hw/arm/smmuv3-accel.h"
>>>>>>> +#include "hw/pci/pci_bridge.h"
>>>>>>> +
>>>>>>> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
>>>>>>> +{
>>>>>>> +    DeviceState *d = opaque;
>>>>>>> +
>>>>>>> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
>>>>>>> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
>>>>>>> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus-
>>>>>>> name)) {
>>>>>>> +            object_property_set_link(OBJECT(d), "primary-bus",
>>>>>>> OBJECT(bus),
>>>>>>> +                                     &error_abort);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>>
>>>>>>>      static void smmu_accel_realize(DeviceState *d, Error **errp)
>>>>>>>      {
>>>>>>> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d,
>>>>>>> Error
>>>>>> **errp)
>>>>>>>          SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>>>>>          Error *local_err = NULL;
>>>>>>>
>>>>>>> +    object_child_foreach_recursive(object_get_root(),
>>>>>>> +                                   smmuv3_accel_pxb_pcie_bus, d);
>>>>>>> +
>>>>>>>          object_property_set_bool(OBJECT(dev), "accel", true,
>>>>>>> &error_abort);
>>>>>>>          c->parent_realize(d, &local_err);
>>>>>>>          if (local_err) {
>>>>>>> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass
>>>>>> *klass, void *data)
>>>>>>>          device_class_set_parent_realize(dc, smmu_accel_realize,
>>>>>>>                                          &c->parent_realize);
>>>>>>>          dc->hotpluggable = false;
>>>>>>> +    dc->bus_type = TYPE_PCIE_BUS;
>>>>>>>      }
>>>>>>>
>>>>>>>      static const TypeInfo smmuv3_accel_type_info = {
>>>>>>
>>>>>> I am not seeing the need for a pxb-pcie bus(switch) introduced for
>>>>>> each
>>>>>> 'accel'.
>>>>>> Isn't the IORT able to define different SMMUs for different RIDs?
>>>>>> if so,
>>>>>> itsn't that sufficient
>>>>>> to associate (define) an SMMU<->RID association without introducing a
>>>>>> pxb-pcie?
>>>>>> and again, I'm not sure how that improves/enables the device<->SMMU
>>>>>> associativity?
>>>>>
>>>>> Thanks for taking a look at the series. As discussed elsewhere in
>>>>> this thread(with
>>>>> Eric), normally in physical world (or atleast in the most common
>>>>> cases) SMMUv3
>>>>> is attached to PCIe Root Complex and if you take a look at the IORT
>>>>> spec, it describes
>>>>> association of ID mappings between a RC node and SMMUV3 node.
>>>>>
>>>>> And if my understanding is correct, in Qemu, only pxb-pcie allows you
>>>>> to add
>>>>> extra root complexes even though it is still plugged to
>>>>> parent(pcie.0). ie, for all
>>>>> devices downstream it acts as a root complex but still plugged into a
>>>>> parent pcie.0.
>>>>> This allows us to add/describe multiple "smmuv3-accel" each
>>>>> associated with a RC.
>>>>>
>>>> I find the qemu statements a bit unclear here as well.
>>>> I looked at the hot plug statement(s) in docs/pcie.txt, as I figured
>>>> that's where dynamic
>>>> IORT changes would be needed as well.  There, it says you can hot-add
>>>> PCIe devices to RPs,
>>>> one has to define/add RP's to the machine model for that plug-in.
>>>>
>>>> Using libvirt, it could auto-add the needed RPs to do dynmaic smmuv3
>>>> additions,
>>> I am not sure I understand your statement here. we don't want "dynamic"
>>> SMMUv3 instantiation. SMMUv3 is a platform device which is supposed to
>>> be coldplugged on a pre-existing PCIe hierarchy. The SMMUv3 device is
>>> not something that is meant to be hotplugged or hotunplugged.
>>> To me we hijack the bus= property to provide information about the IORT
>>> IDMAP
>>>
>> Dynamic in the sense that if one adds smmuv3 for multiple devices,
>> libvirt will dynamically figure out how to instantiate one, two,
>> three... smmu's
>> in the machine at cold boot.
>> If you want a machine to be able to hot-plug a device that would
>> require another smmu,
>> than the config, and smmu, would have to be explicilty stated; as is
>> done today for
>> hot-plug PCIe if the simple machine that libvirt would make is not
>> sufficient to
>> hot-add a PCIe device.
> 
> Hum this will need to be discussed with libvirt guys but I am not sure
> they will be inclined to support such kind of policy, esp because vIOMMU
> is a pretty marginal use case as of now. They do automatic instantiation
> for pcie, usb controllers but I am not sure they will take care of the
> vIOMMU tbh
> 
> Eric

A discussion w/libvirt developers would be prudent.
I don't think it's that complicated and lots of parallels to device-assigned pcie devices & virtio-devices,
but for possibly different reasons: for pci(e) assigned devices, need to add (hw-centric) RP's and pcie bus's;
virtio devices can share a (n emulated) PCI.

for smmu: devices assigned can be attached to an smmu, which libvirt can have accel=auto added to it, on
a separate smmu than those added to virtio devices(sharing that smmu).  Each assigned device can have a
unique smmu-id, like assigned PCI(e) devices have unique pci-id (pcie is one-device/one-bus, of course)
but the assigned devices may actually use the same smmu (physically, even though virtually defined as separate).
If we end up with too many smmu's b/c we have successfully exploited their advanced features
for assigned devices in guests, I'll consider that a win! ;-)
Seriously, I'm sure we can figure out how to improve the libvirt smmu/iommu assignment of (assigned) devices to (virtual) smmu's/iommu's
with a bit more hw-tree lookup code.

I look forward to the discussion with the libvirt developers.

>>
>>> Thanks
>>>
>>> Eric
>>>> if I understand how libvirt does that today for pcie devices now (/me
>>>> looks at danpb for feedback).
>>>>
>>>>> Having said that,  current code only allows pxb-pcie root complexes
>>>>> avoiding
>>>>> the pcie.0. The idea behind this was, user can use pcie.0 with a non
>>>>> accel SMMUv3
>>>>> for any emulated devices avoiding the performance bottlenecks we are
>>>>> discussing for emulated dev+smmuv3-accel cases. But based on the
>>>>> feedback from
>>>>> Eric and Daniel I will relax that restriction and will allow
>>>>> association with pcie.0.
>>>>>
>>>> So, I think this isn't a restriction that this smmuv3 feature should
>>>> enforce;
>>>> lack of a proper RP or pxb-pcie will yield an invalid config
>>>> issue/error, and
>>>> the machine definition will be modified to meet the needs for IORT.
>>>>
>>>>> Thanks,
>>>>> Shameer
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>   
>>>>>>>> to root complexes.
>>>>>> Feel free to enlighten me where I may have mis-read/interpreted the
>>>>>> IORT
>>>>>> & SMMUv3 specs.
>>>>>>
>>>>>> Thanks,
>>>>>> - Don
>>>>>>
>>>>>
>>>>
>>>
>>
> 

