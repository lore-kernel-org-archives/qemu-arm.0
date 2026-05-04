Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B37CD3427
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 16:02:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvkL-00016f-2a; Mon, 04 May 2026 12:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJvjS-0000mM-Cu
 for qemu-arm@nongnu.org; Mon, 04 May 2026 12:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wJvjQ-0008A7-K5
 for qemu-arm@nongnu.org; Mon, 04 May 2026 12:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777910475;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJZ+j+/C1nuMP3Jo9t7IR0Qkle0T7gUt1LCimRZnXgY=;
 b=MZn0JLcVj22K0CXA9PSI0hr01ZY3icSADpj4/LqnEWPlCYrjCA9aDuCCg7hS3UWwL3RK2z
 QsNInvZwz09Clj2E08br4/21My53yhWt7ddkkdR65fITktg9UwGiV1wDtdQYRSk8NYal2/
 eGTqXQLyn4WY42nGjXAAAFoxNxrCgEM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-IEgZOp5UOYSqX2LOCDvgjQ-1; Mon, 04 May 2026 12:01:13 -0400
X-MC-Unique: IEgZOp5UOYSqX2LOCDvgjQ-1
X-Mimecast-MFC-AGG-ID: IEgZOp5UOYSqX2LOCDvgjQ_1777910471
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-488c0fcc6deso24259245e9.2
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 09:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777910471; x=1778515271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJZ+j+/C1nuMP3Jo9t7IR0Qkle0T7gUt1LCimRZnXgY=;
 b=GbjriFImnJ5AZ1B2awMdbzCnoulkSh3RpxgE4o23nqqEI3HLDoHpuKtc0CrUSG5yGa
 bBNW+t6BFFm3tJGWbWSv1lWylt91AAn+9Hamtn4jNc+/V4iNAEmStoCS4p7IzYtir1ec
 RLM5t1Qow3lhJBL/MjQLwge8tUPeg2nKRcjWo1FRyinbyjYA9uEvIUALtwjhHLxes1A3
 Wrdwyi9rWTFpXUpTIgk3iacRfPDcCtoiPBmTOaEYeN/TNOuNw4B7+eVDAINMy9qStUEs
 P0+Jk64njZE/8YL/yF8xFft+PT9BcRdLLCgF+yAoZ4SbwoN7QwvhcHyWe2+tH3qkrfcW
 iy0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9W/ofTkwCKat0oNZZLu1RsHSgnnAXQWzg4TGJiCYfuqkYkaAsou210NpgmmPpleqxLEoag5rnc4A==@nongnu.org
X-Gm-Message-State: AOJu0YyQMNzWs6mtpzECkBatl8w4uS5b9MPo9j42Rb7ntJIAlfzRGeyW
 3CTp6xrExaE0pcDQUOXYBzmGDU9r+8+fZvj+R37T/b3hQDE1RSOWSK6iY4bHXFQuw4NlReROb8w
 alal9Jpq6G1HHUjXnLw8m/i97mEX7jLZBnCCGul+xhqjvHzwXXO8ECg==
X-Gm-Gg: AeBDiet9E98CiB5RJzMFL2bLrZXnszmau1IIcKpatFaiIMjalkw/IVW3LKqnHDHtU1D
 4rk/es4q6LvvCyvMd2Dmsw5hz/jIB/nVEmlYN0TVW5kzpjc9TaNTYy/8f8ByBJm8ERi2UEHUyVQ
 bAAA9+QhbyWXdcD88o33Xutljoub/6M9reNtBWH/AVyOYNTTEVO3FABCWegEGzrLIcDpNB+i3Bd
 kLB7xeFXMiGmKmPSZT5eDmdTFXjTA08sBXBfrlu/Gfc3UHVTCzfZMNXjEqxXqNr26/J8CIG1aJA
 SFsjULiZ69Sy4n1fiDj8VwedU7p9RLliGU0DpgoTPL/VTq3xdiCK+19fLucy6FONAe1iU7erz1K
 nlYcMj14/phTPlPm8ZrVs3AJcdxDcTzHYrJyT49VVOGp1zikD5hIws7eAxnGJxztQRIyIi2HT2Y
 rJrvCO
X-Received: by 2002:a05:600c:8b0e:b0:485:ae14:8191 with SMTP id
 5b1f17b1804b1-48a9852d122mr161545315e9.5.1777910471208; 
 Mon, 04 May 2026 09:01:11 -0700 (PDT)
X-Received: by 2002:a05:600c:8b0e:b0:485:ae14:8191 with SMTP id
 5b1f17b1804b1-48a9852d122mr161544265e9.5.1777910470482; 
 Mon, 04 May 2026 09:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebc4201sm451562435e9.15.2026.05.04.09.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 09:01:09 -0700 (PDT)
Message-ID: <e1a3cb59-1faf-428e-8e85-f3f4059ee1cf@redhat.com>
Date: Mon, 4 May 2026 18:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/31] hw/arm/tegra241-cmdqv: Implement CMDQV vIOMMU
 alloc/free
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-14-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-14-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 31LqI92Z02qc22bsz0FeTvHqxr2lynBFFZ_CwJiYpRs_1777910471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
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



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Replace the stub implementation with real vIOMMU allocation for
> Tegra241 CMDQV.
>
> Allocate a matching vEVENTQ together with the vIOMMU, since it is
> specific to the Tegra241 CMDQV vIOMMU and used to receive CMDQV
> events.
>
> Free both objects on teardown.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Co-developed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/tegra241-cmdqv.h |  1 +
>  hw/arm/tegra241-cmdqv.c | 46 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 2a34a4b6b4..fa0aa3ab04 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -30,6 +30,7 @@ typedef struct Tegra241CMDQV {
>      SMMUv3AccelState *s_accel;
>      MemoryRegion mmio_cmdqv;
>      qemu_irq irq;
> +    IOMMUFDVeventq *veventq;
>  } Tegra241CMDQV;
>  
>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index ccd3c6d275..2f1084b55f 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -25,13 +25,57 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>  
>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)
>  {
> +    SMMUv3AccelState *accel = s->s_accel;
> +    IOMMUFDViommu *viommu = accel->viommu;
> +    Tegra241CMDQV *cmdqv = accel->cmdqv;
> +    IOMMUFDVeventq *veventq = cmdqv->veventq;
> +
> +    if (!viommu) {
> +        return;
> +    }
> +    if (veventq) {
> +        close(veventq->veventq_fd);
> +        iommufd_backend_free_id(viommu->iommufd, veventq->veventq_id);
> +        g_free(veventq);
> +        cmdqv->veventq = NULL;
> +    }
> +    iommufd_backend_free_id(viommu->iommufd, viommu->viommu_id);
>  }
>  
>  static bool
>  tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                              uint32_t *out_viommu_id, Error **errp)
>  {
> -    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> +    Tegra241CMDQV *cmdqv = s->s_accel->cmdqv;
> +    uint32_t viommu_id, veventq_id, veventq_fd;
> +    IOMMUFDVeventq *veventq;
> +
> +    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                      IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
> +                                      idev->hwpt_id, &cmdqv->cmdqv_data,
> +                                      sizeof(cmdqv->cmdqv_data), &viommu_id,
> +                                      errp)) {
> +        return false;
> +    }
> +
> +    if (!iommufd_backend_alloc_veventq(idev->iommufd, viommu_id,
> +                                       IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
> +                                       1 << 16, &veventq_id, &veventq_fd,
> +                                       errp)) {
> +        error_append_hint(errp, "Tegra241 CMDQV: failed to alloc veventq");
> +        goto free_viommu;
> +    }
> +
> +    veventq = g_new(IOMMUFDVeventq, 1);
> +    veventq->veventq_id = veventq_id;
> +    veventq->veventq_fd = veventq_fd;
> +    cmdqv->veventq = veventq;
> +
> +    *out_viommu_id = viommu_id;
> +    return true;
> +
> +free_viommu:
> +    iommufd_backend_free_id(idev->iommufd, viommu_id);
>      return false;
>  }
>  


