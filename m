Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D9DEE368C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:57:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqY86-0002ZR-TG; Thu, 12 Feb 2026 09:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqY85-0002YU-Hj
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqY83-0001IF-OL
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770908235;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeLaj+6E3iwCE3EmKUGkoRvRQQ/N85qL4sT6EGFRxNQ=;
 b=EyqLHNZ/XUqRXGNhkreWC4R7yxwkIcFash8pBqZO8fl90zPljihbdT34pTFdEJjpim88r8
 HqsrFYIUGQlzM7MfSvsGWTeSTa5HxP4EG34g22xbINwAagBMKdAgNrhlsiLmDFnqzWCAdw
 cD92uF4/aPC518niDbXM4tWp6B3stPk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-pURGNQUvOtmcT93QNmvhAg-1; Thu, 12 Feb 2026 09:57:13 -0500
X-MC-Unique: pURGNQUvOtmcT93QNmvhAg-1
X-Mimecast-MFC-AGG-ID: pURGNQUvOtmcT93QNmvhAg_1770908233
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so57301655e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770908232; x=1771513032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeLaj+6E3iwCE3EmKUGkoRvRQQ/N85qL4sT6EGFRxNQ=;
 b=RRNTQASn88HuK3doUzodz5QMQ4CoJQ/3mX1oGEJbpwQU/fqOOcmBT4Z2ZpockmCTwr
 JA17D0KT2o5om/uQwhCZNePIHfrYdTRLWVD2QdFl1jed9Ti3mW5wNtNV2/P3XLZaMr3k
 KOy3MtzVmZhNd05DlSiqRTopRrUHZvspVD3/x5BX/gOuevnfDEMuhTv6JMvqIV+QYl00
 DvG9hWQObMnOdj8YOVdy0m8sqeQM3EJWx1taZL8hG12qBTaX1EJbWeaNdHq0xDlsY+Ul
 QtbTPt+bWCKA9pq7J6DIp1VQUTIX9qEfkP7QhWi7PQ87ir8GPc5PuiZH5FMm68iLc/0S
 gXVw==
X-Gm-Message-State: AOJu0YxRoGz0e4ALz6oAJifLErIU68vTCEAz/zu5JDQQZWZ+0xdK24/p
 B6BLlfffFSp8cvIY/0gx8WxgM0oIpsha7KUPki6dU+otvaSbp4XOOKNrVzSZG98zyWQWmR76dLv
 6NAgUbQszefY5Kd5gYoirF0ndQruC/1FOtmVJgw2BeHzUCdI4KqDslg==
X-Gm-Gg: AZuq6aIVSW0GhpzIYjt3L5IJ1XgEsJeAooocCdSwk06kdtvTUdgBS3aNBgfEkbtLmy9
 y/h5hDDIiIjnxR/DU6dmaqyvez9rAd5NiQ37zVXAkPiX7BqGqxbBes/Uf7ZlBdNdJ3Gvd3IdpN+
 x2tnlXFQi5FhSPrBl654L/JdZEQegiBkfD07mdoShZkqf+BPTjuantLVn4Z0Daa54OAi7pkgxPV
 ntMLOqzEWwwuscx9cxMbwIgzMWgEXKZOI66xUE7Qx+KuPP2z+uKwvHq6bLDvaxqRdLW0TYCHKSn
 3JhkKqlc0h0OKrElTTs3eb1fz/5nLcbKqsSSzxS12Dp23S2Goe8ovHtoHIBbbKEfuV8aa16Hcnh
 7K+F4GhvFRtidlzPmyWYIhB/0F0bw/A+yWJHOMUM3m4v8WBKAh/g/JXbpRH+HOPlJK9rQ3g==
X-Received: by 2002:a05:600c:6489:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-48365716845mr35103555e9.28.1770908232476; 
 Thu, 12 Feb 2026 06:57:12 -0800 (PST)
X-Received: by 2002:a05:600c:6489:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-48365716845mr35103045e9.28.1770908231961; 
 Thu, 12 Feb 2026 06:57:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc8b9sm12553726f8f.24.2026.02.12.06.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:57:11 -0800 (PST)
Message-ID: <dcde8f24-7523-4e2c-8ce6-4048d3ca9c7c@redhat.com>
Date: Thu, 12 Feb 2026 15:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-6-skolothumtho@nvidia.com>
 <aYo4n4N3dW1OLzTk@Asurada-Nvidia>
 <CH3PR12MB75483C2BA4EDC24CA0F78A4CAB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <46d3b859-6e05-4c03-8e77-0aa76629f772@redhat.com>
 <CH3PR12MB7548F06A2BB9C009FD2043F2AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548F06A2BB9C009FD2043F2AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y01PcKDcnNMQVJPbsj1osjgxf-EI-0W9UUnteGznpnk_1770908233
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2/12/26 3:50 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 12 February 2026 14:42
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Nicolin Chen
>> <nicolinc@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jiandi An
>> <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
>> interface
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/10/26 9:46 AM, Shameer Kolothum Thodi wrote:
>>>> -----Original Message-----
>>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>> Sent: 09 February 2026 19:42
>>>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
>>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>>>> eric.auger@redhat.com; peter.maydell@linaro.org; clg@redhat.com;
>>>> alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
>>>> <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>>>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>>>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>>>> <kjaju@nvidia.com>
>>>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV
>> ops
>>>> interface
>>>>
>>>> On Fri, Feb 06, 2026 at 02:48:04PM +0000, Shameer Kolothum wrote:
>>>>> CMDQ-Virtualization (CMDQV) is a hardware extension to SMMUv3 that
>>>> enables
>>>>> virtualization of multiple command queues (VCMDQs).
>>>> Let's mention "NVIDIA", noting it's a non-standard extension.
>>> The idea of this ops based callback is to make it more generic and not
>>> NVIDIA specific to start with. This leaves room in case ARM introduces
>>> a standardised version of something similar in the future, or if another
>>> vendor provides a similar extension.
>>>
>>>>> CMDQV support is a specialization of the IOMMUFD backed accelerated
>>>>> SMMUv3 path. Introduce an ops interface to factor CMDQV specific
>>>>> initialization and CMDQV vIOMMU/vEVENTQ allocation behavior out of
>>>>> the base implementation. The ops pointer and associated state are
>>>>> stored in the accelerated SMMUv3 state.
>>>>>
>>>>> No functional change
>>>>>
>>>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>>>> ---
>>>>>  hw/arm/smmuv3-accel.h | 19 +++++++++++++++++++
>>>>>  1 file changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
>>>>> index c9c10e55c3..ca087240e5 100644
>>>>> --- a/hw/arm/smmuv3-accel.h
>>>>> +++ b/hw/arm/smmuv3-accel.h
>>>>> @@ -16,6 +16,23 @@
>>>>>  #endif
>>>>>  #include CONFIG_DEVICES
>>>>>
>>>>> +/*
>>>>> + * CMDQ-Virtualization (CMDQV) hardware support, extends the
>> SMMUv3
>>>> to
>>>>> + * support multiple VCMDQs with virtualization capabilities.
>>>> Ditto
>>>>
>>>>> + * CMDQV specific behavior is factored behind this ops interface.
>>>>> + */
>>>>> +typedef struct SMMUv3AccelCmdqvOps {
>>>>> +    bool (*init)(SMMUv3State *s, Error **errp);
>>>>> +    bool (*alloc_viommu)(SMMUv3State *s,
>>>>> +                         HostIOMMUDeviceIOMMUFD *idev,
>>>>> +                         uint32_t *out_viommu_id,
>>>>> +                         Error **errp);
>>>>> +    void (*free_viommu)(SMMUv3State *s);
>>>> I don't see much value of having alloc/free_viommu..
>>>>
>>>> Type and data structure are the only difference from the standard
>>>> viommu routine, and both are already in the uAPI header.
>>> That is right. But again, this is mainly to keep the interface generic.
>>> IIUC, Eric had suggested, using an ops or object style abstraction
>>> to separate extension specific behaviour from the core code.
>> My initial thought was callbacks to specialize implementation for accel
>> smmu without vcmdq versus accel smmu with vcmdqs. Effectively we could
>> later imagine to have other implementations with vcmdqs but it is
>> difficult to guess the specialization needs at that stage. I think in
>> the original series you already add the first kind of differentiation.
>>
>> At least reset and init need to be specialized.
>>
>> Maybe alloc_viommu does not need to because the differentiation only
>> happens on the type arg. But originally you where also turning off
>>
>> s->tegra241_cmdqv if IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV failed so
>> I had
>> the impression you reverted to a fallback impl. If there is
>> specialization, I still think ops are relevant. Eric
> There is no fallback implementation. So just to confirm, you are suggesting
> to remove the ops completely or just keep the ops for reset/init only?

Depends on the code to come next. If your reset and init really differs
between normal accel SMMU and vcmdq enhanced accel SMMU, to me it is
still relevant to have separate implementations in different callbacks.

Thanks

Eric
>
> Thanks,
> Shameer
>


