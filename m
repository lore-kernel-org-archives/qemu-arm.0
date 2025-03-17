Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2383310njb;
        Mon, 17 Mar 2025 09:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgvVrU7dWWkjfVt+19Z6UAUIityTAK5WRs2kBy38KjG+6VmYw/jd98txQvJ/xdjVEdCV6P48/GmK0Leg==@linaro.org
X-Google-Smtp-Source: AGHT+IHwjzWZ6bodUtG2jlpfE0pV005sMw0rPtBmNI1oXnQRGeWrw5zcj/+G3S3sZxsJd12O3nSW
X-Received: by 2002:ac8:590b:0:b0:476:8a83:9617 with SMTP id d75a77b69052e-476c8142fa2mr203929901cf.21.1742230383987;
        Mon, 17 Mar 2025 09:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742230383; cv=none;
        d=google.com; s=arc-20240605;
        b=dAACSRqgHkt0O4ai2Qj1bwHYBZVi8dmhoeFd32ZepkKN+OUaLipfqgFMNGQdoicjXh
         JNqLuP230Ly7woXS9YxOvb6OZCgIGqQhp1E5869pRkeyhgX1+Z3vfOkRp8f4D/JlB7L6
         FgqLn9oxBJrbamrjwTVSyz+lhvTD5iFUO9f9z9fplrrmiEGhxz+OLL1v0OkprQo+IQlI
         19LdZgl7XB5MPpV7588xPftX0kpd+rVV2J7H6kFkZcLEDu8h/MoRT6uvCRfz6EtEKd1O
         lCDeNIIuX0GtnVwXj8L3mbfZiCyjTNwV6eSUgLKnfnAjUt5y5/5QBej4CNrsu9brsu1g
         SsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IAXbsGZdNS+8G7A18KwymoDmijmgppjTiy6zvWv7VKc=;
        fh=eAU9IAEMaCuy2l9gW/+49BWVwbmD3kOC7VkX9XeTZ2w=;
        b=cvUzhSrIjIVt0sgV1WpevGhk8wWz8sOr77IODdW5xRI1auGP4KvO/C9Svlt6XktdhA
         DG1VqNqZpoOtFzoNYPVvvMx6HBnsZYiOhI2gJ404ZLZDJawiMCP4co0vPJtVS6kEAgjy
         Yrju8FnN1sxQDxT0k8zXv1RLEE2uHsyyZiVA1qd5R7tQqsP7MjuNUEliq+ejLIPdcW3s
         /fKWxC6HS/jT9iTn8Fl3vPTyy422BNYnHV2E0JmZgMsHvQXef7tF7hyCZVplirU4V6lX
         kA7yxEA+aYwzDSztHuN1ncKDyiKAiU4qftIWNH2mV2t7WxWHdpM+KYcjMxdcy2ALoNEw
         khVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vqg7YIFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7e1b3esi103870491cf.226.2025.03.17.09.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 09:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vqg7YIFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuDhm-0006qZ-Md; Mon, 17 Mar 2025 12:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuDhl-0006qE-OH
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 12:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuDhg-00037G-Jy
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 12:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742230353;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAXbsGZdNS+8G7A18KwymoDmijmgppjTiy6zvWv7VKc=;
 b=Vqg7YIFZ9ubJ+xl1VFNMnBp3ATG0fZ2e9NeAclbf6nHJohFoheshAmDOH6HJkwMc8lUTRH
 Su0K370fIvgHLhubBV4rz3UzFVBGlzLwX8zfSy4v2D2sDGoOEIuy6KLk9bwQr9g/uiEwkJ
 lz7uD6yXZYGR0OwZH7AmeeegU8G3obY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-kJYvrAujMgC1OrdZQJBaPA-1; Mon, 17 Mar 2025 12:52:31 -0400
X-MC-Unique: kJYvrAujMgC1OrdZQJBaPA-1
X-Mimecast-MFC-AGG-ID: kJYvrAujMgC1OrdZQJBaPA_1742230351
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f184b916so145418186d6.3
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 09:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742230351; x=1742835151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IAXbsGZdNS+8G7A18KwymoDmijmgppjTiy6zvWv7VKc=;
 b=FcQsH15uyWXsjB4GYGYOpImp/USI9zoD2Amvf/64RcUGbjinIJXqjbqLE9zyXzKuSD
 0ZF8C0IOvFf5oSaLt18QQVBVlil0OA4YBmIwzmuhgnM06KtjHytDvZ2GAhOIoDmItv4H
 ovJegIsCOaKXgm2tyupvCp9hv4lfiMIaK9mizzxYBMMOrdZ8U5vkjOnnWVBa0Z9mnDzr
 b8+qpt0PjZdSrCC1QE5xDzOKSmr5jwTdrmh+8LG5TLzUGukaHBuVdK6xI44r5h19vopP
 d3yvSXcX3SeXsk6BPj/TDtboecrGpJmdoIXrtZsk5/XXlsK2xlg67UhlBMdjPhksC5k7
 9SpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqCM67DAOMRJXRGK3oRcj5RTZ5wh/ehdENoMN5heuqM5WWCnQGkue1n+eChh3H3dCOLpOxiLlXUw==@nongnu.org
X-Gm-Message-State: AOJu0Ywvpu1NTWtT28AzhpyPSdC40putpBG3p5AYYjWBqDll92Fd/NZH
 52HO4UzSeIUac7e6qZdeq8g60jFtIyQj2dqbONr03e0atANFZ//Etrr9HBJ3O8NE64zN4N0zCL0
 k++8+tnNMirXoguhMi6nD/aNlKJWv3oRWaJNjtcm+JlxZ0KVrjQ==
X-Gm-Gg: ASbGncvfFzpPimQiPqmxwpaoXJOMcU1SZEqgiH6YJonU3vwN54RKCVwRjeKHJa+TYN1
 7rNA5pJw5YFRbRYPqCgw1oQmb2I3elaV/A/+BJQ/N7G+pIJtbd6vYdjZgcUP8pk6VBBjqN7mZRn
 D9Ferzb29YgchwAGru330NnnGYWqabOXR8dMyeFHXKQSSn+JbBK5iGDsG7TQ08Ewc4q5QkTUXSK
 KcyuWAKuw6IM30yIIMs4MZ85Kvz2Gy5lXbMLM/As0VkhGRgIFbQOAuFwjHm5axj42wbJBdLtnRy
 zeflK7Bd5swehBZ5lnAHJef+e7N4bkX6izjsUzmi4KLgquO0/I4q5q0+IszONUU=
X-Received: by 2002:a05:6214:29ea:b0:6e8:f133:3795 with SMTP id
 6a1803df08f44-6eaeaaa12c3mr204511486d6.32.1742230351191; 
 Mon, 17 Mar 2025 09:52:31 -0700 (PDT)
X-Received: by 2002:a05:6214:29ea:b0:6e8:f133:3795 with SMTP id
 6a1803df08f44-6eaeaaa12c3mr204510916d6.32.1742230350772; 
 Mon, 17 Mar 2025 09:52:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb036e8b00sm21684966d6.17.2025.03.17.09.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:52:30 -0700 (PDT)
Message-ID: <1105d100-dd1e-4aca-b518-50f903967416@redhat.com>
Date: Mon, 17 Mar 2025 17:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/20] hw/arm/smmu-common: Introduce callbacks for
 PCIIOMMUOps
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-8-shameerali.kolothum.thodi@huawei.com>
 <fe047856-b564-4776-8651-daa65c02133b@redhat.com>
 <2606bc1d06f24495a8f382b3d1af3fc6@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2606bc1d06f24495a8f382b3d1af3fc6@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CEZWvEG774K-giBdhs-Jp6Dy9xmfVJn7YXAipN4mhvY_1742230351
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vq2oMrdWjyO1


Hi Shameer,

On 3/13/25 9:09 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, March 12, 2025 4:24 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 07/20] hw/arm/smmu-common: Introduce
>> callbacks for PCIIOMMUOps
>>
>>
>>
>>
>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>> Subsequently smmuv3-accel will provide these callbacks
>>>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  hw/arm/smmu-common.c         | 27 +++++++++++++++++++++++++++
>>>  include/hw/arm/smmu-common.h |  5 +++++
>>>  2 files changed, 32 insertions(+)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c index
>>> 83c0693f5a..9fd455baa0 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -865,6 +865,10 @@ static AddressSpace *smmu_find_add_as(PCIBus
>> *bus, void *opaque, int devfn)
>>>      SMMUState *s = opaque;
>>>      SMMUPciBus *sbus = smmu_get_sbus(s, bus);
>>>
>>> +    if (s->accel && s->get_address_space) {
>>> +        return s->get_address_space(bus, opaque, devfn);
>>> +    }
>>> +
>> why do we require that new call site? This needs to be documented in the
>> commit msg esp. because we don't know what this cb will do.
> Currently, this is where the first time SMMUDevice sdev is allocated. And for smmuv3-accel
> cases we are introducing a new SMMUv3AccelDevice accel_dev for holding additional
> accel specific information. In order to do that the above cb is used. Same for other callbacks
> as well.
>
> Another way of avoiding the callbacks would be to  move the pci_setup_iommu(bus, ops) 
> call from the smmu-common.c to smmuv3/smmuv3-accel and handle it directly there.
>
> Or is there a better idea?
>
>>>      sdev = sbus->pbdev[devfn];
>>>      if (!sdev) {
>>>          sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1); @@ -874,8
>>> +878,31 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void
>> *opaque, int devfn)
>>>      return &sdev->as;
>>>  }
>>>
>>> +static bool smmu_dev_set_iommu_device(PCIBus *bus, void *opaque,
>> int devfn,
>>> +                                      HostIOMMUDevice *hiod, Error
>>> +**errp) {
>>> +    SMMUState *s = opaque;
>>> +
>>> +    if (s->accel && s->set_iommu_device) {
>>> +        return s->set_iommu_device(bus, opaque, devfn, hiod, errp);
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static void smmu_dev_unset_iommu_device(PCIBus *bus, void *opaque,
>>> +int devfn) {
>>> +    SMMUState *s = opaque;
>>> +
>>> +    if (s->accel && s->unset_iommu_device) {
>>> +        s->unset_iommu_device(bus, opaque, devfn);
>>> +    }
>>> +}
>>> +
>>>  static const PCIIOMMUOps smmu_ops = {
>>>      .get_address_space = smmu_find_add_as,
>>> +    .set_iommu_device = smmu_dev_set_iommu_device,
>>> +    .unset_iommu_device = smmu_dev_unset_iommu_device,
>>>  };
>>>
>>>  SMMUDevice *smmu_find_sdev(SMMUState *s, uint32_t sid) diff --git
>>> a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index
>>> 80ff2ef6aa..7b05640167 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -160,6 +160,11 @@ struct SMMUState {
>>>
>>>      /* For smmuv3-accel */
>>>      bool accel;
>>> +
>>> +    AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int
>> devfn);
>>> +    bool (*set_iommu_device)(PCIBus *bus, void *opaque, int devfn,
>>> +                             HostIOMMUDevice *dev, Error **errp);
>>> +    void (*unset_iommu_device)(PCIBus *bus, void *opaque, int devfn);
>> I think this should be exposed by a class and only implemented in the
>> smmuv3 accel device. Adding those cbs directly in the State looks not the
>> std way.
> Ok. You mean we can directly place  PCIIOMMUOps *ops here then? 
When I first skimmed through the series I assumed you would use 2
seperate devices, in which case that would use 2 different
implementations of the same class. You may have a look at
docs/devel/qom.rst and Methods and class there.

Now as I commented earlier I think the end user shall instantiate the
same device for non accel and accel. I would advocate for passing an
option telling whether we want accel modality. Then it rather looks like
what was done for vfio device with either legacy or iommufd backend.

depending on whether the iommufd option is passed you select the right
class implementation:
see hw/vfio/common.c and vfio_attach_device


    const VFIOIOMMUClass *ops =
        VFIO_IOMMU_CLASS(object_class_by_name(TYPE_VFIO_IOMMU_LEGACY));

    if (vbasedev->iommufd) {
        ops =
VFIO_IOMMU_CLASS(object_class_by_name(TYPE_VFIO_IOMMU_IOMMUFD));
    }

I would doing something similar for selecting the right ops depending on
the passed option.

I hope this helps

Eric


>
> Thanks,
> Shameer

