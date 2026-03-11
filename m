Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3764C104BEC7
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 10:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0GRU-0006oD-Aw; Wed, 11 Mar 2026 06:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0GRT-0006o5-CR
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 06:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0GRL-00039X-KS
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 06:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773223516;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O7yP0c5if+5PqoB91UNIvj3xa8Qgoo8xcZeCPbQEG8=;
 b=dEd1GS8Yje/uDWrZCkMfNJOmXR/IZq76y1MGe00Q2Di0ij5ZQoHCVHP1Y82KPmTLAcq7a4
 b9BsCUWpONCOfEibxsTy4Usd8pCxkvnN/uZw6COLHDTuH79S4IjtKoBj0dn2kBI3QvDRBf
 p0v1tz32xI1mGMcVdJ/qpSsIgeDK3aQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-dv7qQfrOP0yyu3rikgpgTA-1; Wed, 11 Mar 2026 06:05:15 -0400
X-MC-Unique: dv7qQfrOP0yyu3rikgpgTA-1
X-Mimecast-MFC-AGG-ID: dv7qQfrOP0yyu3rikgpgTA_1773223514
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4853b00f9f5so27159625e9.2
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 03:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773223514; x=1773828314;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+O7yP0c5if+5PqoB91UNIvj3xa8Qgoo8xcZeCPbQEG8=;
 b=GLJprU4woxtruIgCT1f46Inrwzrc0vsT8BmjwrLyho1dUBWlcLYd61+EhWndC7PFQ2
 4ZA023/ki20FtY3BcMfAKr2xWSiADCuMDRln3Jixu87FmYpbxvXN1PP3/XLFMK4TRbYh
 WUq1SD2O3+Z+ruFDlAaRaTVToRVnj0vZuYao5LuX1LZxPmaI/MJodu7iJ2Z7awO8AAyZ
 Sqt1dP0iZ4QR+KGtLGeOivOU8Q+3x5di8qHDcdVLMjRABdO9TTXgIXr4Meu4QYrg2+bx
 6dvOD7CRegni8F3I5O2zhCOnllG0/fO3mkxWfYowUYysbSo3Gi7hT/sipgv/BKxUEXTP
 3a3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeyW8fvsigYPtVjbQXW+dyGtwNRi1GAmnrpam/ovEHCaqRzF5t9qjNT4xlmen7cioQPP05XAeG+A==@nongnu.org
X-Gm-Message-State: AOJu0YwRdEqCj8o2yfVM+LS+EqEyQ31GiWQld/3Pm6UmrK+gd/QRip1g
 sCq6ENrrFj/rswDT7cs6QzWhpivm916UsdbnJDyzwQg8eDrJ1JoxmozWIFFym4aQ72YrQxTb+xE
 k7k30LMxQt1UDavuXiv8O+odBClIvJ5eaQ6s2rpKCHRtR3nhJGSQs2Q==
X-Gm-Gg: ATEYQzzFVP3aZd+e7lDwoFB5LbyVGZB09iRaBLU0Mkqc4JK8d42AxDrIgTqeCQp/xDf
 3Xy8Cr+HetT1R5Jnl8uZzoy1WKqGKzyiJLlNzkY+R2PhsEvcZjXf57OcmHjKs/fknWggjBmeUL5
 f8R4x5NHkcGqhEdalUAfBzasOiSeGk0+x9ijzXNyjymYB9tAV4NwZZIDOG6SxDjEZxti9iYW07+
 sZdl6aYl4zDsuJDxg6mMdMUjj86wkC+chuiOK8gpCJR8u8XtH2SAf0oCufK5SKr9ropqUBiTlXE
 2bTfPxNG/yky9M0Tb7qKP9Pb0YV9Yf0o80AG1A9mPFBYWS7CkTejW2d6IIiOXwNZ1m75I4hXIr9
 ix6wv8C6zY5C5FgWr1JVyn9aYmIDG4hy895m0WSn4zyQoKEO4lU3Sfgb2XgEYg6+t77DVFQ==
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id
 5b1f17b1804b1-4854b0afb48mr32436135e9.8.1773223513872; 
 Wed, 11 Mar 2026 03:05:13 -0700 (PDT)
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id
 5b1f17b1804b1-4854b0afb48mr32435355e9.8.1773223513288; 
 Wed, 11 Mar 2026 03:05:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f6b7sm182597315e9.9.2026.03.11.03.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 03:05:12 -0700 (PDT)
Message-ID: <8ee0ec15-bf22-473e-85f4-96426a9e763d@redhat.com>
Date: Wed, 11 Mar 2026 11:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
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
 <20260226105056.897-18-skolothumtho@nvidia.com>
 <22acfd93-72cd-49ca-b2f6-a080bf66104c@redhat.com>
 <CH3PR12MB754885F68C4F08CC39732EB2AB47A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754885F68C4F08CC39732EB2AB47A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: euF4iy8VDC06cj1dNSz59p9VW2bFUC4mE6x4VlVAJ4Q_1773223514
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 3/11/26 10:26 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 11 March 2026 07:55
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; phrdina@redhat.com
>> Subject: Re: [PATCH v3 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0
>> for CMDQV
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/26/26 11:50 AM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Global VCMDQ pages provide a VM wide view of all VCMDQs, while the
>>> VINTF pages expose a logical view local to a given VINTF. Although real
>>> hardware may support multiple VINTFs, the kernel currently exposes a
>>> single VINTF per VM.
>>>
>>> The kernel provides an mmap offset for the VINTF Page0 region during
>>> vIOMMU allocation. However, the logical-to-physical association between
>>> VCMDQs and a VINTF is only established after HW_QUEUE allocation. Prior
>>> to that, the mapped Page0 does not back any real VCMDQ state.
>>>
>>> When VINTF is enabled, mmap the kernel provided Page0 region and
>>> unmap it when VINTF is disabled. This prepares the VINTF mapping
>>> in advance of subsequent patches that add VCMDQ allocation support.
>> So at some point we transition from something that is purely emulated
>> (page 1 global cmdq) to something that is mmapped on a host page. How do
>> we transfer the state of the cmdq from one to the other?
> Right. If a guest uses both the "Global VCMDQ registers Page0" and the
> "VINTF0 Logical VCMDQ registers Page0" interchangeably (and I see
> nothing in the spec that forbids this), then we need to keep the two
> views in sync.

Also assuming the global VCMDQs are accessible and thus used, I guess we
shall properly handle the actual commands (equivalent of
smmuv3_cmdq_consume()), no? 
I don't see it done at the moment.

By the way, do we want support of VCMDQs in fully emulated mode. I guess
it would be sensible?

Thanks

Eric
>
> So when the mapping between a global VCMDQ and a logical VCMDQ is
> created through the HW_QUEUE ioctl, we should sync the state between
> the Global VCMDQ Page0 and the VINTF0 Logical VCMDQ Page0.
>
> I will double check this.
>
> Thanks,
> Shameer
>
>> Thanks
>>
>> Eric
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/tegra241-cmdqv.h |  3 +++
>>>  hw/arm/tegra241-cmdqv.c | 44
>> +++++++++++++++++++++++++++++++++++++++--
>>>  2 files changed, 45 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
>>> index d379b8860c..3ce9f539ae 100644
>>> --- a/hw/arm/tegra241-cmdqv.h
>>> +++ b/hw/arm/tegra241-cmdqv.h
>>> @@ -18,6 +18,8 @@
>>>  #define TEGRA241_CMDQV_MAX_CMDQ            (1U <<
>> TEGRA241_CMDQV_NUM_CMDQ_LOG2)
>>>  #define TEGRA241_CMDQV_NUM_SID_PER_VM_LOG2 4
>>>
>>> +#define VINTF_PAGE_SIZE 0x10000
>>> +
>>>  /*
>>>   * Tegra241 CMDQV MMIO layout (64KB pages)
>>>   *
>>> @@ -34,6 +36,7 @@ typedef struct Tegra241CMDQV {
>>>      SMMUv3AccelState *s_accel;
>>>      MemoryRegion mmio_cmdqv;
>>>      qemu_irq irq;
>>> +    void *vintf_page0;
>>>
>>>      /* Register Cache */
>>>      uint32_t config;
>>> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
>>> index e1f1562c44..a3767a85a3 100644
>>> --- a/hw/arm/tegra241-cmdqv.c
>>> +++ b/hw/arm/tegra241-cmdqv.c
>>> @@ -151,6 +151,39 @@ static uint64_t tegra241_cmdqv_read(void
>> *opaque, hwaddr offset, unsigned size)
>>>      }
>>>  }
>>>
>>> +static bool
>>> +tegra241_cmdqv_munmap_vintf_page0(Tegra241CMDQV *cmdqv, Error
>> **errp)
>>> +{
>>> +    if (!cmdqv->vintf_page0) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (munmap(cmdqv->vintf_page0, VINTF_PAGE_SIZE) < 0) {
>>> +        error_setg_errno(errp, errno, "Failed to unmap VINTF page0");
>>> +        return false;
>>> +    }
>>> +    cmdqv->vintf_page0 = NULL;
>>> +    return true;
>>> +}
>>> +
>>> +static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV
>> *cmdqv, Error **errp)
>>> +{
>>> +    IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
>>> +
>>> +    if (cmdqv->vintf_page0) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (!iommufd_backend_viommu_mmap(viommu->iommufd, viommu-
>>> viommu_id,
>>> +                                     VINTF_PAGE_SIZE,
>>> +                                     cmdqv->cmdqv_data.out_vintf_mmap_offset,
>>> +                                     &cmdqv->vintf_page0, errp)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>  /*
>>>   * Write a VCMDQ register using VCMDQ0_* offsets.
>>>   *
>>> @@ -216,7 +249,7 @@ tegra241_cmdqv_write_vcmdq(Tegra241CMDQV
>> *cmdqv, hwaddr offset0, int index,
>>>  }
>>>
>>>  static void tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr
>> offset,
>>> -                                       uint64_t value)
>>> +                                       uint64_t value, Error **errp)
>>>  {
>>>      int i;
>>>
>>> @@ -227,8 +260,10 @@ static void
>> tegra241_cmdqv_write_vintf(Tegra241CMDQV *cmdqv, hwaddr offset,
>>>          cmdqv->vintf_config = value;
>>>          if (value & R_VINTF0_CONFIG_ENABLE_MASK) {
>>> +            tegra241_cmdqv_mmap_vintf_page0(cmdqv, errp);
>>>              cmdqv->vintf_status |= R_VINTF0_STATUS_ENABLE_OK_MASK;
>>>          } else {
>>> +            tegra241_cmdqv_munmap_vintf_page0(cmdqv, errp);
>>>              cmdqv->vintf_status &= ~R_VINTF0_STATUS_ENABLE_OK_MASK;
>>>          }
>>>          break;
>>> @@ -251,6 +286,7 @@ static void tegra241_cmdqv_write(void *opaque,
>> hwaddr offset, uint64_t value,
>>>                                   unsigned size)
>>>  {
>>>      Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
>>> +    Error *local_err = NULL;
>>>      int index;
>>>
>>>      if (offset >= TEGRA241_CMDQV_IO_LEN) {
>>> @@ -276,7 +312,7 @@ static void tegra241_cmdqv_write(void *opaque,
>> hwaddr offset, uint64_t value,
>>>          cmdqv->cmdq_alloc_map[(offset - A_CMDQ_ALLOC_MAP_0) / 4] =
>> value;
>>>          break;
>>>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>>> -        tegra241_cmdqv_write_vintf(cmdqv, offset, value);
>>> +        tegra241_cmdqv_write_vintf(cmdqv, offset, value, &local_err);
>>>          break;
>>>      case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
>>>          /* Same decoding as read() case: See comments above */
>>> @@ -300,6 +336,10 @@ static void tegra241_cmdqv_write(void *opaque,
>> hwaddr offset, uint64_t value,
>>>          qemu_log_mask(LOG_UNIMP, "%s unhandled write access at 0x%"
>> PRIx64 "\n",
>>>                        __func__, offset);
>>>      }
>>> +
>>> +    if (local_err) {
>>> +        error_report_err(local_err);
>>> +    }
>>>  }
>>>
>>>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)


