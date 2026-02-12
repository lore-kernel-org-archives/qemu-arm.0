Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C9EE3692
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 14:43:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqXuG-00059U-Rc; Thu, 12 Feb 2026 09:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXuF-000580-F2
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:42:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqXty-000591-VX
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 09:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770907300;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP3p6Cmi5zKb4kLg6es0mD/dZfZy3AVMebvW+4aneAE=;
 b=a+mR7VPx7UsrPe3lHwAO/ReFSgQkk0xnOGOpI72omUE9xHi5tKlJdRjaBD/WAex2Wuo+dX
 VLLlYJxXw0yZllwvfD0PsuDvCCir/hlGs4LCyV0VNBaBR1g9HhA22irzXqEnjkg/MsJ+uu
 UvLCObDU9auxJs3HcONTCmJgee45f+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-r_fqWecQOkyueRB7ft5LWA-1; Thu, 12 Feb 2026 09:41:37 -0500
X-MC-Unique: r_fqWecQOkyueRB7ft5LWA-1
X-Mimecast-MFC-AGG-ID: r_fqWecQOkyueRB7ft5LWA_1770907296
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47ee3dd7fc8so60688185e9.3
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 06:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770907296; x=1771512096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qP3p6Cmi5zKb4kLg6es0mD/dZfZy3AVMebvW+4aneAE=;
 b=bRXqdLwQ862tEiLR+PrC2WUAqyQ2o/foOKKnXoSjgiJ/NO9/r2kDPPjiouLfO4akX/
 qq3HGVAI68EcthSF5hMoYhpZJ2BbBIcmecgxT6oKEWvGi73PN/l1eMr8Xkr/Exg7IZ1e
 k6D3EvqzAp7GtPVE51BQzPhVuxVO5cOXacP6OglWoTVyu5QlTV15MwxEkX7wgYnrPmfr
 ABNgE2XxJtDnJz5PgHixbuJluPXC+FHOPfypicf+C5Gl/5+K5dZhc0iKdG5Roce+jGJM
 8PicYRvTq26lRUlLDuu+FZRGDJ14lMfCNVMzMO0N+cH/AMMt7soM8IHxKrfwkS+ex/ad
 +gDQ==
X-Gm-Message-State: AOJu0YwLhp8TYLBx+bV9uQXVOefXGDW+9Gmu9c7TB+RL2cazn/aFvkvT
 +KpLCjWfm8QV9x8exXhHWvAS90NxnsWkehTexQ+aS2jJvUoa7WCp3JSYW3t6IYALw3Kv15itRjw
 jbcQji0WYs8CMCaE4qrmTVhatEENhdlf66aLR5+/QQ93rfI4mbh0Khw==
X-Gm-Gg: AZuq6aLsCNaJjwwtguWg12NzobhgbY5CvxN5C6wl2HaxCAb7++r8FuhlFWRuOiRXGRn
 0Wv3bbp3ay2R6kjvrxPD81me3CTT3G/yTbvvc3ZXRJjfoR3NprFiMbp8jSj6OEfuDzQ/+jkMltW
 ddNaVZdWkq0h7chX9UkiDLFZGH6I2IU47iHgFQlLH8maPa2Kn/jTubiizj8+imRettR+dAx8/Z4
 jl/dofnGhzV/2IHnT7gyHvAoK9Ovn1neZyQQ8LRZQoOzgR2kpqutAMsTwbv7j/o3lzcSnaht0NV
 XneU29hemaaYLr+9IRqfEpavaar9Q6FuvqwL8WjA+nH1/lT5NfRgiqUx+p+kXGwpKNjkEKCN5df
 i4qaQVLE0xhhH7oWBbGyxK9vWYNAY4EgkdzojikHN6AiWAjAAuUXplUos4QXPJ9gEx3vStg==
X-Received: by 2002:a05:600c:19ca:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-48365720147mr46823705e9.34.1770907295686; 
 Thu, 12 Feb 2026 06:41:35 -0800 (PST)
X-Received: by 2002:a05:600c:19ca:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-48365720147mr46823085e9.34.1770907295212; 
 Thu, 12 Feb 2026 06:41:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm167775345e9.0.2026.02.12.06.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:41:34 -0800 (PST)
Message-ID: <46d3b859-6e05-4c03-8e77-0aa76629f772@redhat.com>
Date: Thu, 12 Feb 2026 15:41:33 +0100
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75483C2BA4EDC24CA0F78A4CAB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IwkR4fvKYjPFydolqvbSrs74Xii32wgQzdpF295r5Gw_1770907296
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



On 2/10/26 9:46 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: 09 February 2026 19:42
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; clg@redhat.com;
>> alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
>> interface
>>
>> On Fri, Feb 06, 2026 at 02:48:04PM +0000, Shameer Kolothum wrote:
>>> CMDQ-Virtualization (CMDQV) is a hardware extension to SMMUv3 that
>> enables
>>> virtualization of multiple command queues (VCMDQs).
>> Let's mention "NVIDIA", noting it's a non-standard extension.
> The idea of this ops based callback is to make it more generic and not
> NVIDIA specific to start with. This leaves room in case ARM introduces
> a standardised version of something similar in the future, or if another
> vendor provides a similar extension.
>
>>> CMDQV support is a specialization of the IOMMUFD backed accelerated
>>> SMMUv3 path. Introduce an ops interface to factor CMDQV specific
>>> initialization and CMDQV vIOMMU/vEVENTQ allocation behavior out of
>>> the base implementation. The ops pointer and associated state are
>>> stored in the accelerated SMMUv3 state.
>>>
>>> No functional change
>>>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/smmuv3-accel.h | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
>>> index c9c10e55c3..ca087240e5 100644
>>> --- a/hw/arm/smmuv3-accel.h
>>> +++ b/hw/arm/smmuv3-accel.h
>>> @@ -16,6 +16,23 @@
>>>  #endif
>>>  #include CONFIG_DEVICES
>>>
>>> +/*
>>> + * CMDQ-Virtualization (CMDQV) hardware support, extends the SMMUv3
>> to
>>> + * support multiple VCMDQs with virtualization capabilities.
>> Ditto
>>
>>> + * CMDQV specific behavior is factored behind this ops interface.
>>> + */
>>> +typedef struct SMMUv3AccelCmdqvOps {
>>> +    bool (*init)(SMMUv3State *s, Error **errp);
>>> +    bool (*alloc_viommu)(SMMUv3State *s,
>>> +                         HostIOMMUDeviceIOMMUFD *idev,
>>> +                         uint32_t *out_viommu_id,
>>> +                         Error **errp);
>>> +    void (*free_viommu)(SMMUv3State *s);
>> I don't see much value of having alloc/free_viommu..
>>
>> Type and data structure are the only difference from the standard
>> viommu routine, and both are already in the uAPI header.
> That is right. But again, this is mainly to keep the interface generic.
> IIUC, Eric had suggested, using an ops or object style abstraction
> to separate extension specific behaviour from the core code.

My initial thought was callbacks to specialize implementation for accel
smmu without vcmdq versus accel smmu with vcmdqs. Effectively we could
later imagine to have other implementations with vcmdqs but it is
difficult to guess the specialization needs at that stage. I think in
the original series you already add the first kind of differentiation.

At least reset and init need to be specialized.

Maybe alloc_viommu does not need to because the differentiation only
happens on the type arg. But originally you where also turning off 

s->tegra241_cmdqv if IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV failed so I had
the impression you reverted to a fallback impl. If there is
specialization, I still think ops are relevant. Eric

>
>>> +    bool (*alloc_veventq)(SMMUv3State *s,  Error **errp);
>>> +    void (*free_veventq)(SMMUv3State *s);
>> alloc_/free_veventq can be moved into alloc/free_viommu functions.
>>> +    void (*reset)(SMMUv3State *s);
>>> +} SMMUv3AccelCmdqvOps;
>> Overall, an ops structure feels unnecessary to me. Maybe init and
>> reset are somewhat plausible. But nobody else would reuse this ops
>> structure that is exclusive to Tegra241CMDQV?
> That's true for now, as there is only one implementation today. If this
> abstraction feels over engineered at this stage, we can simplify or defer
> it (and fall back to calling the tegra241-specific functions directly, as in
> the RFC) and revisit once there is a clearer need.
>
> I'm open to suggestions, and let's wait to hear from others as well.
>
>>>  /*
>>>   * Represents an accelerated SMMU instance backed by an iommufd
>> vIOMMU object.
>>>   * Holds bypass and abort proxy HWPT IDs used for device attachment.
>>> @@ -28,6 +45,8 @@ typedef struct SMMUv3AccelState {
>>>      uint32_t bypass_hwpt_id;
>>>      uint32_t abort_hwpt_id;
>>>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
>>> +    const SMMUv3AccelCmdqvOps *cmdqv_ops;
>>> +    void *cmdqv;
>> Having two pointers for the same extension feels redundant. Maybe
>> merge them with:
>>
>> typedef struct SMMUv3AccelCmdqv {
>>     void *private; // points to Tegra241CMDQV
>>     struct iommu_viommu_tegra241_cmdqv viommu_data;
>> } SMMUv3AccelCmdqv;
>>
>> ...
>>
>> SMMUv3AccelState {
>>     ...
>>     SMMUv3AccelCmdqv *cmdqv;
>> };
>>
>> ?
> We could fold the private data and ops into a single struct and store that
> in SMMUv3AccelState. However, if we want to keep this generic, it may
> be better to keep them separate.
>
> Thanks,
> Shameer
>


