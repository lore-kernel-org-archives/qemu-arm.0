Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E1CF3C246
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 12:47:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vza0o-0000mY-3t; Mon, 09 Mar 2026 08:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vza0k-0000fD-G6
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 08:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vza0g-0004FS-Rl
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 08:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773060418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJuCQo6H+MvVXMbi5lqS7edQhM07xsq/MRftzGxDZU8=;
 b=Ocrv84iyQZ0UyDk/aIbPneaSQFkXiwYUdBp9rorLJPdNSXA32kGKS6svCfw5vbNvPiyIUW
 FDH2kzkkzLDWjoYuFHd3rWsHPds5QUqHyJNXUim+EvXsFY07/XO0OqQ1EsAUb9kekK0o1Z
 Q+7u3aNH6/x5t4fRfu4HXqHDvXIa+gk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-C_5fSH5IMwi-fPtTwIJpYg-1; Mon, 09 Mar 2026 08:46:55 -0400
X-MC-Unique: C_5fSH5IMwi-fPtTwIJpYg-1
X-Mimecast-MFC-AGG-ID: C_5fSH5IMwi-fPtTwIJpYg_1773060414
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48535f4d5e1so3533575e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 05:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060414; x=1773665214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJuCQo6H+MvVXMbi5lqS7edQhM07xsq/MRftzGxDZU8=;
 b=HTGPLthSA/RsjeUZujEkvHpBoCOVi186IDzoRHp8iEDuEDaI5eowAZAKWGRsEX+Jvz
 LtsFSKDbOl0nYuPYW5BeUBdxAPvFEG/NdbkclO6PEZRULJKa+15t/Srgb3YVvJbdJJot
 rIGqFAoAfzcoyO+3NWpUxubYhQ9se/yjHq+jsc6pd6KoGoc1lXumJo3UCEyfWWRLpDG5
 kk5bGa5yrk8EVs7V9/mtS5QWsTrkRulqHFwoVGiTO70mqQTn6idzIsrTrblmzw20dHz1
 Bzg2hidan8k957HGCX/UDIQ/al+iv/9mcEkibwgZtvf1D8I4GnYIfUdvmPUMJxiEy2Q8
 59jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfdqpOjp2eQxVOz5Ogp30NRsuInH4btXrOGEqu4YiMEISz1UzGsV2No6L6knlkv+aP2hpO95PLKA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9Xob/iD0iHr9wIrDpz6/Q0i9agxqn2DCYBa+hdvzwA0b8eDgu
 9qBfwShc6KNwjfln6t2f6aJeL8xGp9y5cYumVLOucrap5IL3AQNHb2/Zd4NOJTsblEIdPwghdjk
 f+Y5MamF/PEErmn09biZ/SscTr7cAJmyar1FuEnoMC1UYIurM/S5DsQ==
X-Gm-Gg: ATEYQzxZkNZCO0u9kro+0lnrxxD/zROL3s3xImxK+pWLaKNyAh736FOg3r0qNmNG173
 l9s0dmZHOK7GOl6B3buOtJblhABOKjaaB2BydvWF6+TEAPWtOZrS5aTymAj7N9zO8XvYcdCjzGl
 W3G3LR04OpnUYrVhlJfD2ar0+4nrNtXezN4K0hGczF8SeHY6aMM8KAr3HfaiVMKb5hEq/YiJBHs
 ilTvBpgRNo0mdsIMy/n6oFxACx31tJbD1ARue5xRrXeR6n9wgVIIjXy8QXuamf6BlZNgdGy3nmh
 qYNabPbABJECfs2M/R88Zn16zDTC/s0x2DgUC1dRbBSGCSUnKdKg0xZAGkCYIMbgmM0dQa6DnhC
 VIG8KOy64xs8lCOsjN9AazVcebrqeZ17vTAGP8U4VGBWRi+BQjzTpd6Miw5PbBfUpOqLQXQ==
X-Received: by 2002:a05:600c:a111:b0:485:3b00:f92e with SMTP id
 5b1f17b1804b1-4853b00fb11mr45859005e9.2.1773060414044; 
 Mon, 09 Mar 2026 05:46:54 -0700 (PDT)
X-Received: by 2002:a05:600c:a111:b0:485:3b00:f92e with SMTP id
 5b1f17b1804b1-4853b00fb11mr45858675e9.2.1773060413575; 
 Mon, 09 Mar 2026 05:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237dd017sm89901535e9.2.2026.03.09.05.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:46:52 -0700 (PDT)
Message-ID: <7920718a-d1b5-43bc-a066-38f70613507d@redhat.com>
Date: Mon, 9 Mar 2026 13:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/32] hw/arm/tegra241-cmdqv: Implement CMDQV vIOMMU
 alloc/free
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-14-skolothumtho@nvidia.com>
 <ed5ca420-94e5-4e9e-a2c3-f59eb6ea8ada@redhat.com>
 <CH3PR12MB7548F5610D7F339C5DAD0E41AB79A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548F5610D7F339C5DAD0E41AB79A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rWPdxNOhiXo3DyZZmHE6Vw2oXvMk4vPM39-KEb9sDpU_1773060414
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/9/26 12:31 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 09 March 2026 11:09
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; phrdina@redhat.com
>> Subject: Re: [PATCH v3 13/32] hw/arm/tegra241-cmdqv: Implement CMDQV
>> vIOMMU alloc/free
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/26/26 11:50 AM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Replace the stub implementation with real vIOMMU allocation for
>>> Tegra241 CMDQV.
>>>
>>> Free the vIOMMU ID on teardown.
>>>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/tegra241-cmdqv.c | 19 +++++++++++++++++--
>>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c index
>>> 6959766129..d487612ba2 100644
>>> --- a/hw/arm/tegra241-cmdqv.c
>>> +++ b/hw/arm/tegra241-cmdqv.c
>>> @@ -25,14 +25,29 @@ static void tegra241_cmdqv_write(void *opaque,
>>> hwaddr offset, uint64_t value,
>>>
>>>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)  {
>>> +    SMMUv3AccelState *accel = s->s_accel;
>>> +    IOMMUFDViommu *viommu = accel->viommu;
>>> +
>>> +    if (!viommu) {
>>> +        return;
>>> +    }
>>> +    iommufd_backend_free_id(viommu->iommufd, viommu->viommu_id);
>>>  }
>>>
>>>  static bool
>>>  tegra241_cmdqv_alloc_viommu(SMMUv3State *s,
>> HostIOMMUDeviceIOMMUFD *idev,
>>>                              uint32_t *out_viommu_id, Error **errp)  {
>>> -    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
>>> -    return false;
>>> +    Tegra241CMDQV *cmdqv = s->s_accel->cmdqv;
>>> +
>>> +    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
>>> +
>>> + IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
>> if the only think that differs compared to no cmdq is the type, ie.
>>
>> IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV vs
>> IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV
>>
>> + passing true args, maybe you can just record the type of the cmdqv
>> + that is being used in the smmu_accel device. Then you can get rid of
>> + alloc and free
> It is not just the type. Based on the type we also need to pass,
>
>  * @data_len: Length of the type specific data
>  * @__reserved: Must be 0
>  * @data_uptr: User pointer to a driver-specific virtual IOMMU data
>  *
>
> And the above is implementation specific.
>
> If our idea of the "ops" is to allow easier support for different 
> implementations in future, it probably makes sense to keep this.

OK I missed the fact data_len and IOMMU data needed specialization.

Thanks

Eric
>
> Thanks,
> Shameer
>
>> Eric
>>
>>
>>> +                                      idev->hwpt_id, &cmdqv->cmdqv_data,
>>> +                                      sizeof(cmdqv->cmdqv_data), out_viommu_id,
>>> +                                      errp)) {
>>> +        return false;
>>> +    }
>>> +    return true;
>>>  }
>>>
>>>  static void tegra241_cmdqv_reset(SMMUv3State *s)


