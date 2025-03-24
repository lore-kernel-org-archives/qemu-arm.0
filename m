Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2003446njc;
        Mon, 24 Mar 2025 07:56:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoPBQ+gbTnvJ9+/nX0i4NX/KzRZG10DPNCL5dRM1QHbCe8QW02F/aihui4fa/6ckBBXSABt5yjU2MmwA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6kze4srz7Wdi3FHjG6YH6oqkc1KGw6Y/FsvnjEQo1MsTnv7UYdTHwS6cwo5LGolIS5KCC
X-Received: by 2002:a05:620a:28c5:b0:7c3:cd38:9be8 with SMTP id af79cd13be357-7c5ba18d422mr1836424085a.25.1742828203077;
        Mon, 24 Mar 2025 07:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742828203; cv=none;
        d=google.com; s=arc-20240605;
        b=HAMWWYubYbki491XDalNJW49bmAlC7iRd5dzqTqjlaQH1mAhqxBvhMLq1JgEP28cn0
         CD7TUvJzobUuxlGepXsfAIhPgzZ/bzCNIBepp14GIe2vM4o7+aHFyiQ+Xsl/OKQRM1eJ
         eqMn4XY/vKzTwY2XnP+sPh92jRFl8OOw0NzqjFag6nxtMU3pGsCHkKLWiH+Pio5cR+9M
         68yHtAU46TinXB1rEFipYuxgehjzxs0awBw6rx9K+mgUoAgl5opEztKauNPPM1CSDdET
         5d0MECNJM5XS2+8lyn/TB5/o+gkgFyBv+4y1qwFu/CuMRqx+efOGnNTBx3MFcLByM6/e
         n25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9UHDPO/kN0G4XquNdLIr90piQ8a/PRGewVN32e5YMjI=;
        fh=RSV8xxJOOngMscCSldvNpZlpW7oNA8VOIx7GVxUwE5k=;
        b=Ie0Fq5cwPWuOXXZ6RruLUKn4E8oKVsecIf5JBtyViUwTb0CvbmPQkyHKE3Q+qLpBGd
         QsDhgwVUzq/PSQhpzOoo1UToQYUKyW+1xXXpkd7Gslipfw9JAhEnMheDubwR2yLA1X+l
         93HynR55n6mGhuQKY9vMemnzuMAg+WEfukOKw4IHdTKpCUo6vJoPuEVVsTfqqJ37VpOe
         eu48uHIKiga/Wmeelo4wYKGgSj2y8zn4fHWDFojQqZQITZduBDGRYGsCEf1vEPBHqUTz
         gmYRPh8AhWjvDqDgO2MML1yT0DIUiROPQymEcMsgBxfaC+t6QSXWkpWhEHi3XHXSfYg8
         yCgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TUJY6eGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9362a16si753573185a.560.2025.03.24.07.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 07:56:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TUJY6eGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twjE4-0003ST-1q; Mon, 24 Mar 2025 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjDz-0003S1-GG
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twjDw-0004LW-Cs
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742828177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UHDPO/kN0G4XquNdLIr90piQ8a/PRGewVN32e5YMjI=;
 b=TUJY6eGy7w1ZbRyZUHar0ibrjm/rOB6ubILcT9ouycrRFpeCD/k5576y8srj36tZjeSteu
 PkFhC2yYbAQQxTyJIidOJJ3Qfg5q+VGP4SDZB0DgiKhXT9bcUxyjGpIxBipXOPpyZWt0xq
 gacogODlbyREn+IuWMdgwljMQKgy28w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-ZJpbXJI6Nnu1cD0DqjAdbQ-1; Mon, 24 Mar 2025 10:56:16 -0400
X-MC-Unique: ZJpbXJI6Nnu1cD0DqjAdbQ-1
X-Mimecast-MFC-AGG-ID: ZJpbXJI6Nnu1cD0DqjAdbQ_1742828175
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3914bc0cc4aso2309522f8f.3
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 07:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742828175; x=1743432975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UHDPO/kN0G4XquNdLIr90piQ8a/PRGewVN32e5YMjI=;
 b=xQPe/+gmkbfr0iEgDBDFGZ1eGCMethdryw9EwbUa10ZAq454vHroaK9Gywn4mmeLBu
 n/mImqVHSoWLmENyXlFbFDYSw5YDkMmL39S+s7fVczQE2m68+6fE4hnWC7mXII3K21At
 VYu5q6pSusq5sZN2JazsUeUe3NJJH5FeGuFwM/PV+KHIxVK1xpKLgC3mSKicA/lkg449
 Odekew8AaPbhwIDGYEz+LbF0ZcYm8V/jyvAzoKuiYuG1TBBO/ERxTr4jPR9PFglG2SxV
 BMDnb6fDsFb0Mq3Dxbsuu7Isx9Y7EjCl64LI6a3pU0gIJ45jjH1EGxm0F1SK/DK3jn/W
 0dRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUep5gMztnftIaCgG691sT9Mf9+NaDB65TbnmS6MhJhbdZFcZlHzAmvjqtV2LEWpJQQ9/fN8wxKew==@nongnu.org
X-Gm-Message-State: AOJu0YwzzccEPhAhdpkBkNx7xEF0iuHZpeYr0JgUTrnykzApF7N4eU+N
 ta52UD+j1J2sxt3oq9Zmk0zgEdA2wHIs4t+a5O0RjQi37G3dx6nNff2eGhThVkKHvqv6JGyAv9F
 iaZ+ggqYvT0mFKrF45itN1mE1sBe00R9yhjYXjMbtGJN+t5Yy5Q==
X-Gm-Gg: ASbGncuhmJ5RH5y01AbUzPrH4ox4JaaA+lrCDSf1RlPA6BvLXy7CZb4Vis/NNtpqHyS
 n/JLV8MLclmrd6bSLyjqG8bNkypVKC0Sal7kAlBye02P9A9NFdIroeK5Ecc6JSJN8ifzdI1qMT5
 62N3O7rYmVm7yCafeXw6/HbrVbQ/SDpsNaJKeFzJ8ZZbH7HzztvEWpsoRZn4/3g92yOS2nqeoza
 oayLjnPtKFFD2/zr3wrS2TqFDvT7WNWgEnr7WrI5NKWgjgcPLhClC0fgVPhV+SO9GR/4125xNto
 JZ5H6C6TDU2fkKZp/YY8jn3V8CpUAvOBBLx/B5u5ReKHj2nl9tMfPKSDvcltuuA=
X-Received: by 2002:a05:6000:1f86:b0:391:4743:6de4 with SMTP id
 ffacd0b85a97d-3997f940e28mr10720695f8f.50.1742828174970; 
 Mon, 24 Mar 2025 07:56:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1f86:b0:391:4743:6de4 with SMTP id
 ffacd0b85a97d-3997f940e28mr10720665f8f.50.1742828174413; 
 Mon, 24 Mar 2025 07:56:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b2654sm11021073f8f.41.2025.03.24.07.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:56:13 -0700 (PDT)
Message-ID: <b7201a78-f2ea-4aee-a973-b02e4dc78652@redhat.com>
Date: Mon, 24 Mar 2025 15:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Donald Dutile <ddutile@redhat.com>,
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1b838258-7d30-4d9e-b350-3950617419e2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MRAcQR_vB1F1UNL0PxyOU1Ax1bDwu--yE1fzBhfoTSk_1742828175
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: u8dGzPboeYli



On 3/21/25 1:59 AM, Donald Dutile wrote:
>
>
> On 3/19/25 2:21 PM, Eric Auger wrote:
>> Hi Don,
>>
>>
>> On 3/19/25 5:21 PM, Donald Dutile wrote:
>>>
>>>
>>> On 3/19/25 5:26 AM, Shameerali Kolothum Thodi wrote:
>>>> Hi Don,
>>>>
>>> Hey!
>>>
>>>>> -----Original Message-----
>>>>> From: Donald Dutile <ddutile@redhat.com>
>>>>> Sent: Tuesday, March 18, 2025 10:12 PM
>>>>> To: Shameerali Kolothum Thodi
>>>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>>>> qemu-devel@nongnu.org
>>>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>>>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a
>>>>> pxb-
>>>>> pcie bus
>>>>>
>>>>> Shameer,
>>>>>
>>>>> Hi!
>>>>>
>>>>> On 3/11/25 10:10 AM, Shameer Kolothum wrote:
>>>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>>>> and that is set as the primary-bus for the smmu dev.
>>>>>>
>>>>>> Signed-off-by: Shameer Kolothum
>>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>>> ---
>>>>>>     hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>>>>>>     1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>>>>> index c327661636..1471b65374 100644
>>>>>> --- a/hw/arm/smmuv3-accel.c
>>>>>> +++ b/hw/arm/smmuv3-accel.c
>>>>>> @@ -9,6 +9,21 @@
>>>>>>     #include "qemu/osdep.h"
>>>>>>
>>>>>>     #include "hw/arm/smmuv3-accel.h"
>>>>>> +#include "hw/pci/pci_bridge.h"
>>>>>> +
>>>>>> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
>>>>>> +{
>>>>>> +    DeviceState *d = opaque;
>>>>>> +
>>>>>> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
>>>>>> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
>>>>>> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus-
>>>>>> name)) {
>>>>>> +            object_property_set_link(OBJECT(d), "primary-bus",
>>>>>> OBJECT(bus),
>>>>>> +                                     &error_abort);
>>>>>> +        }
>>>>>> +    }
>>>>>> +    return 0;
>>>>>> +}
>>>>>>
>>>>>>     static void smmu_accel_realize(DeviceState *d, Error **errp)
>>>>>>     {
>>>>>> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d,
>>>>>> Error
>>>>> **errp)
>>>>>>         SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>>>>         Error *local_err = NULL;
>>>>>>
>>>>>> +    object_child_foreach_recursive(object_get_root(),
>>>>>> +                                   smmuv3_accel_pxb_pcie_bus, d);
>>>>>> +
>>>>>>         object_property_set_bool(OBJECT(dev), "accel", true,
>>>>>> &error_abort);
>>>>>>         c->parent_realize(d, &local_err);
>>>>>>         if (local_err) {
>>>>>> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass
>>>>> *klass, void *data)
>>>>>>         device_class_set_parent_realize(dc, smmu_accel_realize,
>>>>>>                                         &c->parent_realize);
>>>>>>         dc->hotpluggable = false;
>>>>>> +    dc->bus_type = TYPE_PCIE_BUS;
>>>>>>     }
>>>>>>
>>>>>>     static const TypeInfo smmuv3_accel_type_info = {
>>>>>
>>>>> I am not seeing the need for a pxb-pcie bus(switch) introduced for
>>>>> each
>>>>> 'accel'.
>>>>> Isn't the IORT able to define different SMMUs for different RIDs?
>>>>> if so,
>>>>> itsn't that sufficient
>>>>> to associate (define) an SMMU<->RID association without introducing a
>>>>> pxb-pcie?
>>>>> and again, I'm not sure how that improves/enables the device<->SMMU
>>>>> associativity?
>>>>
>>>> Thanks for taking a look at the series. As discussed elsewhere in
>>>> this thread(with
>>>> Eric), normally in physical world (or atleast in the most common
>>>> cases) SMMUv3
>>>> is attached to PCIe Root Complex and if you take a look at the IORT
>>>> spec, it describes
>>>> association of ID mappings between a RC node and SMMUV3 node.
>>>>
>>>> And if my understanding is correct, in Qemu, only pxb-pcie allows you
>>>> to add
>>>> extra root complexes even though it is still plugged to
>>>> parent(pcie.0). ie, for all
>>>> devices downstream it acts as a root complex but still plugged into a
>>>> parent pcie.0.
>>>> This allows us to add/describe multiple "smmuv3-accel" each
>>>> associated with a RC.
>>>>
>>> I find the qemu statements a bit unclear here as well.
>>> I looked at the hot plug statement(s) in docs/pcie.txt, as I figured
>>> that's where dynamic
>>> IORT changes would be needed as well.  There, it says you can hot-add
>>> PCIe devices to RPs,
>>> one has to define/add RP's to the machine model for that plug-in.
>>>
>>> Using libvirt, it could auto-add the needed RPs to do dynmaic smmuv3
>>> additions,
>> I am not sure I understand your statement here. we don't want "dynamic"
>> SMMUv3 instantiation. SMMUv3 is a platform device which is supposed to
>> be coldplugged on a pre-existing PCIe hierarchy. The SMMUv3 device is
>> not something that is meant to be hotplugged or hotunplugged.
>> To me we hijack the bus= property to provide information about the IORT
>> IDMAP
>>
> Dynamic in the sense that if one adds smmuv3 for multiple devices,
> libvirt will dynamically figure out how to instantiate one, two,
> three... smmu's
> in the machine at cold boot.
> If you want a machine to be able to hot-plug a device that would
> require another smmu,
> than the config, and smmu, would have to be explicilty stated; as is
> done today for
> hot-plug PCIe if the simple machine that libvirt would make is not
> sufficient to
> hot-add a PCIe device.

Hum this will need to be discussed with libvirt guys but I am not sure
they will be inclined to support such kind of policy, esp because vIOMMU
is a pretty marginal use case as of now. They do automatic instantiation
for pcie, usb controllers but I am not sure they will take care of the
vIOMMU tbh

Eric
>
>> Thanks
>>
>> Eric
>>> if I understand how libvirt does that today for pcie devices now (/me
>>> looks at danpb for feedback).
>>>
>>>> Having said that,  current code only allows pxb-pcie root complexes
>>>> avoiding
>>>> the pcie.0. The idea behind this was, user can use pcie.0 with a non
>>>> accel SMMUv3
>>>> for any emulated devices avoiding the performance bottlenecks we are
>>>> discussing for emulated dev+smmuv3-accel cases. But based on the
>>>> feedback from
>>>> Eric and Daniel I will relax that restriction and will allow
>>>> association with pcie.0.
>>>>
>>> So, I think this isn't a restriction that this smmuv3 feature should
>>> enforce;
>>> lack of a proper RP or pxb-pcie will yield an invalid config
>>> issue/error, and
>>> the machine definition will be modified to meet the needs for IORT.
>>>
>>>> Thanks,
>>>> Shameer
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>  
>>>>>>> to root complexes.
>>>>> Feel free to enlighten me where I may have mis-read/interpreted the
>>>>> IORT
>>>>> & SMMUv3 specs.
>>>>>
>>>>> Thanks,
>>>>> - Don
>>>>>
>>>>
>>>
>>
>

