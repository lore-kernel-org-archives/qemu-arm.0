Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp439415njc;
        Wed, 19 Mar 2025 11:22:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4B6YKTSWP8GT4Kdj5fNWO84gm76BK6XF7jIGikgER5I8yYR+X8fHHif6gmxAFwm84KYHCMZftvNsF+g==@linaro.org
X-Google-Smtp-Source: AGHT+IGfr/3HkHrsBk5sPazvUBpDYz7sfxt3zfsslDR9lXhExu4cWfmraYv6wtMTAzHPn8t6bHKI
X-Received: by 2002:a05:620a:4112:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c5a83cc1e8mr397561385a.33.1742408557977;
        Wed, 19 Mar 2025 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742408557; cv=none;
        d=google.com; s=arc-20240605;
        b=I3lJbyhXnbFm96OnwsZV9lp+97E6/rVKjjlvmsFFpJ7RWxWr+pkLa2L65jRj9p5p7Y
         ne2y2qFAHpOlOJlzSe6vO83/qPAPcoHXVhQFVPzOvmLKWZEjpjJ9mcW1dVfCU2KV2uEs
         zK+uwj5erKzl2m8ove7WpHdYoY615hHK8wJAM2FOA9kyiMBhP2GHFdAGZ9B6+C1q0BEP
         1a3eb6JQIOwmZYykI0V8NWt13tppUBCg9/Djp1h0W/fhv3MmlM1kpKVJqp4u5U44OiBq
         gL8R3W6M2mpHXUsRjM3RodYw8wQ0KqRGBvhEB0mb2NcPNuHf1aVYBKnvUOxtSYnKQHyy
         N9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=okPMf6cCHQbe28vUxCLh9bHn7x3G8lNwSs6TkpJtphc=;
        fh=04kPck5u/MP3claHJzplmwRBgVp0XlTv0WUEN86B3mg=;
        b=c70oO8DQlW/ZpsAInnef+e+ll6LSXDq7dRpleriqyk/+XmjGzTLpEjSMlmZFtYTFTI
         u4uRn2aRvkaKdBcFDiUMDgrJc2ZNrK1it8IPcdMw6QBdSRmzkwBxd4inJ/uGAxzwPol2
         qsu2UUT0YKUf/iRLKldNYaTyCe11+ZNfkWjZdkcDCa57DVYuWpPJLWrnB9brDqLzlTQw
         VMtDb5zp/1nB1AnVMxqwByoAHQ6kZRFUftPqC04FFoXuhIIs4ytG1vsOtRYOlUf/fITS
         fV2YSmae5zcBd+4yWVC2750zWb0d5+sRrEpcK58n86uu4emdCW6Xa37yL+P41WW+dwfj
         /zPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JUvR6XDW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cec947si1420648585a.383.2025.03.19.11.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 11:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JUvR6XDW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuy3R-00088Z-OU; Wed, 19 Mar 2025 14:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuy3M-00086b-0k
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuy3K-0006JO-3E
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742408524;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okPMf6cCHQbe28vUxCLh9bHn7x3G8lNwSs6TkpJtphc=;
 b=JUvR6XDWKNBkueKPRwJdHpF+T6vX9dcv8JvA6nIyQFVc+A52d+Ng7WH/U3Ecz7kBvXKKzz
 uOlmR8GWY/e41bZp+1zLfGLX3BGYquuV2lSYDTPYz57+dY42rGdn8RAjqzxTSz07m03/I0
 OCsd2rOuRdm5+0/76zmAI4R/BTEag/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-n6-H5JHaNYaPv1LyfTc6mQ-1; Wed, 19 Mar 2025 14:22:01 -0400
X-MC-Unique: n6-H5JHaNYaPv1LyfTc6mQ-1
X-Mimecast-MFC-AGG-ID: n6-H5JHaNYaPv1LyfTc6mQ_1742408521
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-391425471d6so2978671f8f.3
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 11:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742408520; x=1743013320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=okPMf6cCHQbe28vUxCLh9bHn7x3G8lNwSs6TkpJtphc=;
 b=p+a8heZW+BhVf9xeIq4espk0lWYRdzF425KsSuKZeL5uXPZemCdZg+MdUoKyAqw2cQ
 oFgNn8vIJ63lmf1PLIgkhSAwhPFEQX91kBhjh2Vs68EQMmR4AxEEea7GAVNMzioAIr8n
 YegMJ06HGtkMX2BK1GN/vQpIps2QWj5D+1RJ2wCP8r3wnBKB4HV1EAhO3ZcFlxIJBD0J
 Siwvz1jxrdsajDDfuwNitidGIKAe/qorUGCN0dKSSyja9ZsEvxona9eS6YL1IeYEA7yF
 BuRmFcFBE4z75/MX+vu2c/Xsc5iyuorlBF3bJ4m55fGJJeKxgr21gFDzuw6GOPm7kiD3
 tH8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBgbuQFh80BiOq3Dvycsx7ZJUkeeUjLhTEVp35Dax78ndQTaPGX2repEmu/vbYzmkS2+4GBtIUvA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+0di5ru1FyhGdDsKF0KEcNk9ZbfSg0AjJerxk+wf14J8IcJIs
 V1E4qt90Tiy8KTeKt4dq9bUpIkIVxef+ityycW9pf5BDfNc6zJX7+BsOiTYN3YW8hkYzQ46xUWM
 ro4UcJE3+0BQckghJDBevwAWa5W/X+pDTPSL1ZsnsU4EdjZPaFQ==
X-Gm-Gg: ASbGncsbfrngqtCaWaBtW8GexP2MT5SxaQwjkVCxOcQRZjiYUpG0/5OFl2W5gJMIKfX
 FAXssJfHKnztXUYHj0NJLQDW2ejfQ95oDSWB5tIa8RyGAx8QVicUFz9IIC+scHfwQ+klxQIuV4u
 NXOgcpXO3vhfm4cY1jmP70sDuwKtF2Rdr2jen+amt4ZH9vei5bEbtnyl3ooxRJUBzcysGSq8dZe
 H6V61QvscvxR9IQ5XarSAEMoCYge07PoCAiNNo7CVb9B6UvKbBA9gwqLm80t4t2sSQ3H7y3hAJR
 9gBlxv+TdzHUVmUdQ3ggnfGfeK+bsoU+HJQNQdWYXJCPu6VhY3xlTE4BhXAFd/U=
X-Received: by 2002:a05:6000:400b:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39973b0474cmr2631843f8f.49.1742408520464; 
 Wed, 19 Mar 2025 11:22:00 -0700 (PDT)
X-Received: by 2002:a05:6000:400b:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39973b0474cmr2631828f8f.49.1742408520002; 
 Wed, 19 Mar 2025 11:22:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ebaa5sm21525608f8f.87.2025.03.19.11.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 11:21:59 -0700 (PDT)
Message-ID: <44ed64f0-8e8b-4a87-9a85-074b9d283bc8@redhat.com>
Date: Wed, 19 Mar 2025 19:21:57 +0100
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1c603ab2-4fbb-4838-a544-d88bc2608506@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y4HrCAGoVrttiEE2jh411MEOCKBsyb-u0F5zoQjYP_o_1742408521
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: jH5aHBfKavPH

Hi Don,


On 3/19/25 5:21 PM, Donald Dutile wrote:
>
>
> On 3/19/25 5:26 AM, Shameerali Kolothum Thodi wrote:
>> Hi Don,
>>
> Hey!
>
>>> -----Original Message-----
>>> From: Donald Dutile <ddutile@redhat.com>
>>> Sent: Tuesday, March 18, 2025 10:12 PM
>>> To: Shameerali Kolothum Thodi
>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>> qemu-devel@nongnu.org
>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>>> pcie bus
>>>
>>> Shameer,
>>>
>>> Hi!
>>>
>>> On 3/11/25 10:10 AM, Shameer Kolothum wrote:
>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>> and that is set as the primary-bus for the smmu dev.
>>>>
>>>> Signed-off-by: Shameer Kolothum
>>> <shameerali.kolothum.thodi@huawei.com>
>>>> ---
>>>>    hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>>>>    1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>>> index c327661636..1471b65374 100644
>>>> --- a/hw/arm/smmuv3-accel.c
>>>> +++ b/hw/arm/smmuv3-accel.c
>>>> @@ -9,6 +9,21 @@
>>>>    #include "qemu/osdep.h"
>>>>
>>>>    #include "hw/arm/smmuv3-accel.h"
>>>> +#include "hw/pci/pci_bridge.h"
>>>> +
>>>> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
>>>> +{
>>>> +    DeviceState *d = opaque;
>>>> +
>>>> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
>>>> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
>>>> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus-
>>>> name)) {
>>>> +            object_property_set_link(OBJECT(d), "primary-bus",
>>>> OBJECT(bus),
>>>> +                                     &error_abort);
>>>> +        }
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>>
>>>>    static void smmu_accel_realize(DeviceState *d, Error **errp)
>>>>    {
>>>> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d, Error
>>> **errp)
>>>>        SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>>        Error *local_err = NULL;
>>>>
>>>> +    object_child_foreach_recursive(object_get_root(),
>>>> +                                   smmuv3_accel_pxb_pcie_bus, d);
>>>> +
>>>>        object_property_set_bool(OBJECT(dev), "accel", true,
>>>> &error_abort);
>>>>        c->parent_realize(d, &local_err);
>>>>        if (local_err) {
>>>> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass
>>> *klass, void *data)
>>>>        device_class_set_parent_realize(dc, smmu_accel_realize,
>>>>                                        &c->parent_realize);
>>>>        dc->hotpluggable = false;
>>>> +    dc->bus_type = TYPE_PCIE_BUS;
>>>>    }
>>>>
>>>>    static const TypeInfo smmuv3_accel_type_info = {
>>>
>>> I am not seeing the need for a pxb-pcie bus(switch) introduced for each
>>> 'accel'.
>>> Isn't the IORT able to define different SMMUs for different RIDs?  
>>> if so,
>>> itsn't that sufficient
>>> to associate (define) an SMMU<->RID association without introducing a
>>> pxb-pcie?
>>> and again, I'm not sure how that improves/enables the device<->SMMU
>>> associativity?
>>
>> Thanks for taking a look at the series. As discussed elsewhere in
>> this thread(with
>> Eric), normally in physical world (or atleast in the most common
>> cases) SMMUv3
>> is attached to PCIe Root Complex and if you take a look at the IORT
>> spec, it describes
>> association of ID mappings between a RC node and SMMUV3 node.
>>
>> And if my understanding is correct, in Qemu, only pxb-pcie allows you
>> to add
>> extra root complexes even though it is still plugged to
>> parent(pcie.0). ie, for all
>> devices downstream it acts as a root complex but still plugged into a
>> parent pcie.0.
>> This allows us to add/describe multiple "smmuv3-accel" each
>> associated with a RC.
>>
> I find the qemu statements a bit unclear here as well.
> I looked at the hot plug statement(s) in docs/pcie.txt, as I figured
> that's where dynamic
> IORT changes would be needed as well.  There, it says you can hot-add
> PCIe devices to RPs,
> one has to define/add RP's to the machine model for that plug-in.
>
> Using libvirt, it could auto-add the needed RPs to do dynmaic smmuv3
> additions,
I am not sure I understand your statement here. we don't want "dynamic"
SMMUv3 instantiation. SMMUv3 is a platform device which is supposed to
be coldplugged on a pre-existing PCIe hierarchy. The SMMUv3 device is
not something that is meant to be hotplugged or hotunplugged.
To me we hijack the bus= property to provide information about the IORT
IDMAP

Thanks

Eric
> if I understand how libvirt does that today for pcie devices now (/me
> looks at danpb for feedback).
>
>> Having said that,  current code only allows pxb-pcie root complexes
>> avoiding
>> the pcie.0. The idea behind this was, user can use pcie.0 with a non
>> accel SMMUv3
>> for any emulated devices avoiding the performance bottlenecks we are
>> discussing for emulated dev+smmuv3-accel cases. But based on the
>> feedback from
>> Eric and Daniel I will relax that restriction and will allow
>> association with pcie.0.
>>
> So, I think this isn't a restriction that this smmuv3 feature should
> enforce;
> lack of a proper RP or pxb-pcie will yield an invalid config
> issue/error, and
> the machine definition will be modified to meet the needs for IORT.
>
>> Thanks,
>> Shameer
>>
>>
>>
>>
>>
>>
>>
>>
>>  
>>>>> to root complexes.
>>> Feel free to enlighten me where I may have mis-read/interpreted the
>>> IORT
>>> & SMMUv3 specs.
>>>
>>> Thanks,
>>> - Don
>>>
>>
>

