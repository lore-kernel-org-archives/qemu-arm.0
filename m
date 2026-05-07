Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FEECD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 16:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL1WZ-0005Qd-Vs; Thu, 07 May 2026 12:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1WU-0005Pl-Eo
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1WR-0003Cd-WE
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778171061;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tU0pCfm7OXH7xLO3k2ZX/vM+Dww2fErJOlf2/SNUyhI=;
 b=R/nI/XYXmxPmrKimM0EHJo8SZW+0g+vBoXCeNnIt6URxLPd75AfAg16zBpcgVBda+Rcm+M
 Jpi3b7WqW5T9J08Aaug6gFrXQRt6ubMJYaaNXw46Kw7pBi0ZgzsXsqtQEuYVYd7RE2h7RA
 TyvKtggwZNwtOxNJj7RJgI3ssxUv1hU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-vOCidz98ODmd1i6nS5xjRg-1; Thu, 07 May 2026 12:24:18 -0400
X-MC-Unique: vOCidz98ODmd1i6nS5xjRg-1
X-Mimecast-MFC-AGG-ID: vOCidz98ODmd1i6nS5xjRg_1778171057
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-447f2ce5556so643453f8f.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 09:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778171057; x=1778775857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tU0pCfm7OXH7xLO3k2ZX/vM+Dww2fErJOlf2/SNUyhI=;
 b=Emrr/ETyz/I+Fkc+5oux58T3tx3VIAhBfzwt9ZoM+6dkpFqoqEQivAm3xk9hie8iLR
 JuSrZwxJivLafVhOJUcrzVgTvS4k8apttHy6KhK8GymIi866rCtpWPrHEKNX2f8L1M2L
 2DlimJpPvw9lCqIvn2MSnCdSDKf5Jla6ZLx8zoHO8wQq+D9NANgc/JXYVRQISzThlpRi
 405EPr+4l+1JDq1gOi98Ls2LnTR/W3ZIVBTymANwfyDx+kqyyD4ut/5Mz0RvOmTWDimr
 gwmscD0TpCLU/WDZb5Eev83s47g6m3tTKCu1E/9p9X43UYjQ0Kwf3hDa96E+zraZz7DB
 do7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+VBFUi8KDTmo96UloeTSgAQoahCi7aX97Q1MOoIxhZj1R4NcfRn9QUSXwRHJZ7t4lHor2AxqaKYw==@nongnu.org
X-Gm-Message-State: AOJu0Yy701E1/UPWTkn9caSmlmwIOnKV/vv+lXMhzLAIDwbfHp+Aos52
 dj/g82I0G3mqZH16+mbrTQXECv9ev4WA2X7su6p/YjJsQr3uqJKbPCKfr0kLOycIZ5OcCJcGeP3
 YvbfoA0CbiXWwYyLxfQSOzDpwbd65//jKhwzS/AB0kD2mAmDA/C/4eQ==
X-Gm-Gg: AeBDiesDpgt/tuhhE+HDQG3EnXZZ+7CfmCcISTsDUNsudwqHzEVs8txcHfyFyZ4+0Q/
 M4667VGGP+DEt8xU71P27urLFieSDSk93DKYyG7WunUqr50kg+q52ApUoKLgAy7vgQRbhk/Rv/q
 V3OOUNVugRhDu6zkI5aPtWCXA9ODIS1c6ahyf2F2o7EFepqG2qVHjTQYyEb1GkKHxve1KpSzxTo
 WslhuzDKo0rvNYHl4+WriuRgAtGzNRk4Qi37VWVMMtMcuSGzhs2msGTsORq4wcDSW1tUSVA9JJh
 F8aDQFFrXF/xzl72gunB+n+ESCS1nPtA4C+2Wc2uIViBzt3flniecUqxFprY7g53qC52BiMLNWo
 9yCTiKIP3TKMlcK/Dy7vHb3XcOusarlgJLge53xBCE7ZeAhWZoUMUqSZgl/uqbAdOq8baZA==
X-Received: by 2002:a05:6000:4014:b0:453:ef4c:e365 with SMTP id
 ffacd0b85a97d-453ef4ce392mr1113752f8f.35.1778171056762; 
 Thu, 07 May 2026 09:24:16 -0700 (PDT)
X-Received: by 2002:a05:6000:4014:b0:453:ef4c:e365 with SMTP id
 ffacd0b85a97d-453ef4ce392mr1113675f8f.35.1778171056148; 
 Thu, 07 May 2026 09:24:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4541712368esm80536f8f.26.2026.05.07.09.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 09:24:15 -0700 (PDT)
Message-ID: <73730082-679d-4cee-afee-659684e420c2@redhat.com>
Date: Thu, 7 May 2026 18:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/31] hw/arm/tegra241-cmdqv: Map VINTF page0 into
 guest MMIO space
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-23-skolothumtho@nvidia.com>
 <4918654a-7c79-474b-9ede-5418460a5a76@redhat.com>
 <CH3PR12MB75486E45A43C6CD5A203D03BAB3F2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75486E45A43C6CD5A203D03BAB3F2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ySOQahfvHgwx7TH8tKJ1pOufPOJbpNFvsrdY-ketuqY_1778171057
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/6/26 4:24 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 06 May 2026 13:45
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>;
>> phrdina@redhat.com
>> Subject: Re: [PATCH v4 22/31] hw/arm/tegra241-cmdqv: Map VINTF page0
>> into guest MMIO space
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 4/15/26 12:55 PM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Once a VCMDQ is allocated, map the mmap'd vintf_page0 region directly
>>> into the guest-visible MMIO space at offset 0x30000 as a RAM-backed
>>> MemoryRegion. This eliminates QEMU trapping for hot-path CONS/PROD
>>> index updates.
>>>
>>> After this patch, the two VCMDQ apertures use different access paths:
>>> the direct aperture (0x10000) remains QEMU-trapped and writes via
>>> vintf_ptr, while the VI aperture (0x30000) is a direct guest RAM
>>> mapping. Both paths write to the same underlying vintf_page0 memory,
>>> so no synchronisation between the apertures is needed.
>> I fail to understand when the previous trapped path using ptr in
>> tegra241_cmdqv_read/write_vcmdq gets used versus that path. Is it
>> eventually used?
> The spec does not prevent a guest from using the 0x10000 path for allocated
> VCMDQs, so the trap path remains valid and QEMU forwards those accesses to
> the mmap'd vintf_page0 via vintf_ptr.
>
> We cannot map 0x10000 directly to the guest as RAM because the kernel
> mmap only backs VCMDQs actually allocated via HW_QUEUE ioctl. If the
> guest allocates only 1 of 2 VCMDQs, exposing the full direct aperture page0
> as RAM would give the guest access to unallocated VCMDQ slots. Hence, it
> remains trapped and QEMU only fwds to vintf page0 for allocated queues.
Actually my question rather was why don't we use a subregion_overlap for
global vcmdq page0, mapping to vintf_page0 once cmdqv->vintf_page0 is
set, just as we do for VINTF0 page0? I understand
tegra241_cmdqv_read/write_vcmdq would return the same content anyway.

Besides, I would recommend that all over the code, page0 and page1 are
clearly differentiated in terms of accessors and comments and we use the
same terminology through the code for global vcmdq and vintf vcmdqs.

Thanks

Eric
>
> Thanks,
> Shameer
>
>>> The mapping is installed lazily on first successful VCMDQ hardware
>>> queue allocation and removed when CMDQV or VINTF is disabled.
>>>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/tegra241-cmdqv.h |  1 +
>>>  hw/arm/tegra241-cmdqv.c | 37
>> +++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 38 insertions(+)
>>>
>>> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
>>> index 039d86374f..2befa6205e 100644
>>> --- a/hw/arm/tegra241-cmdqv.h
>>> +++ b/hw/arm/tegra241-cmdqv.h
>>> @@ -46,6 +46,7 @@ typedef struct Tegra241CMDQV {
>>>      IOMMUFDVeventq *veventq;
>>>      IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>>>      void *vintf_page0;
>>> +    MemoryRegion *mr_vintf_page0;
>>>
>>>      /* Register Cache */
>>>      uint32_t config;
>>> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
>>> index eb619e1134..bf989dd51f 100644
>>> --- a/hw/arm/tegra241-cmdqv.c
>>> +++ b/hw/arm/tegra241-cmdqv.c
>>> @@ -15,6 +15,40 @@
>>>  #include "tegra241-cmdqv.h"
>>>  #include "trace.h"
>>>
>>> +static void tegra241_cmdqv_guest_unmap_vintf_page0(Tegra241CMDQV
>> *cmdqv)
>>> +{
>>> +    if (!cmdqv->mr_vintf_page0) {
>>> +        return;
>>> +    }
>>> +
>>> +    memory_region_del_subregion(&cmdqv->mmio_cmdqv, cmdqv-
>>> mr_vintf_page0);
>>> +    object_unparent(OBJECT(cmdqv->mr_vintf_page0));
>>> +    g_free(cmdqv->mr_vintf_page0);
>>> +    cmdqv->mr_vintf_page0 = NULL;
>>> +}
>>> +
>>> +static void tegra241_cmdqv_guest_map_vintf_page0(Tegra241CMDQV
>> *cmdqv)
>>> +{
>>> +    char *name;
>>> +
>>> +    if (cmdqv->mr_vintf_page0) {
>>> +        return;
>>> +    }
>>> +
>>> +    name = g_strdup_printf("%s vintf-page0",
>>> +                           memory_region_name(&cmdqv->mmio_cmdqv));
>>> +    cmdqv->mr_vintf_page0 = g_malloc0(sizeof(*cmdqv->mr_vintf_page0));
>>> +    memory_region_init_ram_device_ptr(cmdqv->mr_vintf_page0,
>>> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
>>> +                                      name, VINTF_PAGE_SIZE,
>>> +                                      cmdqv->vintf_page0);
>>> +    cmdqv->mr_vintf_page0->ram_device_skip_iommu_map = true;
>> I guess you need a setter, here to.
>>> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv,
>>> +                                        CMDQV_VINTF_PAGE0_BASE,
>>> +                                        cmdqv->mr_vintf_page0, 1);
>>> +    g_free(name);
>>> +}
>>> +
>>>  static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int
>> index)
>>>  {
>>>      IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
>>> @@ -72,6 +106,7 @@ static bool
>> tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int index,
>>>      hw_queue->viommu = viommu;
>>>      cmdqv->vcmdq[index] = hw_queue;
>>>
>>> +    tegra241_cmdqv_guest_map_vintf_page0(cmdqv);
>>>      return true;
>>>  }
>>>
>>> @@ -312,6 +347,7 @@ static void
>> tegra241_cmdqv_config_vintf_write(Tegra241CMDQV *cmdqv,
>>>                  cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>>>              }
>>>          } else {
>>> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>>>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>>>              tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>>>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>>> @@ -438,6 +474,7 @@ static void tegra241_cmdqv_write_mmio(void
>> *opaque, hwaddr offset,
>>>          if (value & R_CONFIG_CMDQV_EN_MASK) {
>>>              cmdqv->status |= R_STATUS_CMDQV_ENABLED_MASK;
>>>          } else {
>>> +            tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
>>>              tegra241_cmdqv_free_all_vcmdq(cmdqv);
>>>              cmdqv->status &= ~R_STATUS_CMDQV_ENABLED_MASK;
>>>          }
>> Thanks
>>
>> Eric


