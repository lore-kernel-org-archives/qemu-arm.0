Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3318366njc;
        Wed, 26 Mar 2025 06:38:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOOQPKOUkVeu0R7X5qzRgQsSklisRAFJkTrSSjoVq9E3BRrm0lVZoBKjLVcf57j/KZQ44NyWWiuSuSjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFQPfmVUhTx3xOGzv2VkfeN424jHH3uPsJx5SJzbLsApzkBZB30oyO5h7QrEQV3pDODKk7K
X-Received: by 2002:a05:620a:258f:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c5e48be609mr635435085a.2.1742996322334;
        Wed, 26 Mar 2025 06:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742996322; cv=none;
        d=google.com; s=arc-20240605;
        b=CrWmsbM8iDMwQYrI98vg9XnxIMK8tlDJhPmoP/g4FCmvNDbPCAtMJP8tQO9E+g3TjP
         XjkOAoxyZ3SXHVYkJgyB7sDgN6DDvS42ufRuZXATOyNWAJf1d6bMrK1zw1W8QphGtLJQ
         c4StGf2S9N9IoMtpFCemb6i34YqKi60M1OIHvTfOHpT1hWIoKiF9wlBJf26kO/CeQ+SG
         ZVh0YBqrTo/JKaN84MIJG+x5MrQHyl4lhJKJJ+25EWGRTTCRj0V0/yDa0uI4DUxFTjgu
         YcQQoq6Ox+wFQvlpsLG/5eryrLwlLfxPA+oaNBgAfNaF7XAaIEWAY3ApSpQ/EgPwZE69
         tg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fc79c2L0cAXU2KnYLVY/R/r8eGq45TPBbCVSyVREE8E=;
        fh=JdUSfO5XYx+e4SFnKuurg/nU9pHt+1ZKJvF0YcmZm3I=;
        b=DCihs2PZ7mlYeGyUIAlhLmyaaIGSNfhmp+n2icozdcwJ1/p77zMr9hh5055xuFDFC/
         fBsxgkz9lfVEQbdlznZQqPu0Zhit0u/zsSHHzeqRtpNCrSgqazXIUw/Kqmm4TdcP6Uao
         lKnrms/v+ULBGEe2oxF0dChk+aO1rYY5OM4lbRXVPky67mUboRp2MqOgcvbSbXOMWjEQ
         MtJbMcvS+23EsRlIfvwSHxnaYwSrkB+44z0vKHK1Jb9SMfIx5D5VS5Y3TEfW4s22BYew
         nJ52yCg9NefZfC8uGjmMyvwpLTAWEkOZmqH1uWspZnQI0CJ4Ryxlrp8YAtGMwvLWNA3z
         8w9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RysgtKC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01aab1si118231266d6.312.2025.03.26.06.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 06:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RysgtKC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txQxa-0007lL-Ou; Wed, 26 Mar 2025 09:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txQxY-0007k0-F5
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txQxU-0000jz-QJ
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 09:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742996293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fc79c2L0cAXU2KnYLVY/R/r8eGq45TPBbCVSyVREE8E=;
 b=RysgtKC/2ZN+j1boQ88jBfBdmQmWs1lzWtklPwEGCRBihVAv8yGOCE9Ne6NAKTydN5CCxN
 cbiFEEmZSG2DS1jGpkdIz8H52ucgbGF8mT31UmDIQPA7rwQWjb8wZItEakuaWe+Fan8NeU
 lE0HK6aAWNQJP/U6+Y9Iet8gUuvU7/A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-9DuLtc-nP3KFUh81P1fgWw-1; Wed, 26 Mar 2025 09:38:12 -0400
X-MC-Unique: 9DuLtc-nP3KFUh81P1fgWw-1
X-Mimecast-MFC-AGG-ID: 9DuLtc-nP3KFUh81P1fgWw_1742996291
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-391492acb59so4068305f8f.3
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 06:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742996291; x=1743601091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fc79c2L0cAXU2KnYLVY/R/r8eGq45TPBbCVSyVREE8E=;
 b=lnNvjWR1XsRj4mcH7Nx/NOGDzMXCJvZiA3+fSzZ6Tsoe8/UPSOEI9EEbXf9zkbqtiM
 SkGzhdIj5PzXBAZppPVHhZLoncIxq26rvvjEfNSw2hg28dE7XkgNW/r+Jb3tl1PM/Z9x
 CqLc6cEGbDW/mV/SLyE0huhoKK8is+JGAAsxttans/Uy6nKwNhVhqs24z+Bxe4acrULM
 iXkekDUYValHsnEnY1UY4Ne47IK/jH51GB9oAySSbwLuDNzQ5APP59u9LGt6mI6nj/Uh
 rZAPpB2kQaS2A2HY6TRIb98AuK8K9rSJxXnSMbcVqkM3s++fIgw8UkOIP3hZsmxlyMeu
 ZZdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtwwfvERBcexHXMnHltb4ACBx0ryxV9ywNZbk7SmeVzfmJ8+PaG+UMhHOw6XUcvlrmr4nJXIzYcA==@nongnu.org
X-Gm-Message-State: AOJu0Yzgb5/BMCS3KIgi17JEqu4b+IsNCfm4MqXFpEkGYFPZe8i5HDLp
 EnucY06/ZaesXQvV5OP1k1h1Lnv0xa+CTOJGGKwH83DjmYLoyY9ba/5FUmnBsrFn14wIVA7S1aD
 KtJNZD6ekQuqBalDqLVviX2vKXPAhzU7c+HCW3rFKGRy2NQodLw==
X-Gm-Gg: ASbGncskQodec/VxhbUbas8WilVNg69PNg+2DVLg0rjRt5CEq4qDi4RfhE5v1YJoZLe
 ZSrzI4uTA11CMB0GARMjsTXHsq8w04zNQh/oM+Q7J/6UeUrRg9BfbyFpsrulEHiuet12NHETljT
 6VRwgIWEkku/yXSnfCOgVBoVnZGCpq2nC+9QdFRVWeGPdm7hW2NKHyXJzMSHxNmpDi/slolJ6kC
 d0K/OgaL0A7IQlVZV2ZODaVcZQs9uKZaRs7o+IMRGXLbWiKTJeQbZi3cCk04Iv05HKvaMVnBxAA
 MTzdrqeOH2G8A97RER5KUl43ELJ+3u5r5ax6E0Sza7Opt/0iO3HcLfY7ZOC/2Kg=
X-Received: by 2002:a05:6000:178c:b0:391:47f2:8d90 with SMTP id
 ffacd0b85a97d-3997f9017e3mr17029701f8f.20.1742996291319; 
 Wed, 26 Mar 2025 06:38:11 -0700 (PDT)
X-Received: by 2002:a05:6000:178c:b0:391:47f2:8d90 with SMTP id
 ffacd0b85a97d-3997f9017e3mr17029640f8f.20.1742996290216; 
 Wed, 26 Mar 2025 06:38:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5708sm2228235e9.32.2025.03.26.06.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:38:09 -0700 (PDT)
Message-ID: <e23b4803-02d1-4850-8b6e-ad398a66a31c@redhat.com>
Date: Wed, 26 Mar 2025 14:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tp083zTwMloLiM-zMHoJNgvlSOFejI-8BKQqf2Nez2o_1742996291
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
X-TUID: s0PlW+VJMcLS

Hi Shameer, Nicolin,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Inroduce an SMMUCommandBatch and some helpers to batch and issue the
> commands.  Currently separate out TLBI commands and device cache commands
can you precise which "device cache commands" you are talking about?
> to avoid some errata on certain versions of SMMUs. Later it should check
worth to give more details about this famous errata here.
> IIDR register to detect if underlying SMMU hw has such an erratum.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c    | 69 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-internal.h | 29 +++++++++++++++++
>  2 files changed, 98 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 76134d106a..09be838d22 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -160,6 +160,75 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>                                            nested_data.ste[0]);
>  }
>  
> +/* Update batch->ncmds to the number of execute cmds */
> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch)
> +{
> +    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(bs);
> +    uint32_t total = batch->ncmds;
> +    IOMMUFDViommu *viommu_core;
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return 0;
> +    }
> +
> +    if (!s_accel->viommu) {
> +        return 0;
> +    }
> +    viommu_core = &s_accel->viommu->core;
> +    ret = iommufd_backend_invalidate_cache(viommu_core->iommufd,
> +                                           viommu_core->viommu_id,
> +                                           IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
> +                                           sizeof(Cmd), &batch->ncmds,
> +                                           batch->cmds);
> +    if (total != batch->ncmds) {
> +        error_report("%s failed: ret=%d, total=%d, done=%d",
> +                      __func__, ret, total, batch->ncmds);
some commands may have been executed (batch->ncmds !=0). Is the
batch_cmds array updated accordingly? In the kernel doc I don't see any
mention of that. Do you need to report a cmd_error as we do for some
other cmds?
> +        return ret;
> +    }
> +
> +    batch->ncmds = 0;
> +    batch->dev_cache = false;
> +    return ret;
> +}
> +
> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
I was confused by the name. The helper adds a single Cmd to the batch,
right? so batch_cmd would better suited.
> +                            SMMUCommandBatch *batch, Cmd *cmd,
> +                            uint32_t *cons, bool dev_cache)
> +{
> +    int ret;
> +
> +    if (!bs->accel) {
> +        return 0;
> +    }
> +
> +    if (sdev) {
> +        SMMUv3AccelDevice *accel_dev;
> +        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
> +        if (!accel_dev->s1_hwpt) {
can it happen? in the positive can you add some comment to describe in
which condition?
> +            return 0;
> +        }
> +    }
> +
> +    /*
> +     * Currently separate out dev_cache and hwpt for safety, which might
> +     * not be necessary if underlying HW SMMU does not have the errata.
> +     *
> +     * TODO check IIDR register values read from hw_info.
> +     */
> +    if (batch->ncmds && (dev_cache != batch->dev_cache)) {
> +        ret = smmuv3_accel_issue_cmd_batch(bs, batch);
> +        if (ret) {
> +            *cons = batch->cons[batch->ncmds];
> +            return ret;
> +        }
> +    }
> +    batch->dev_cache = dev_cache;
> +    batch->cmds[batch->ncmds] = *cmd;
> +    batch->cons[batch->ncmds++] = *cons;
> +    return 0;
> +}
> +
>  static bool
>  smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
>                                 HostIOMMUDeviceIOMMUFD *idev, Error **errp)
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 46c8bcae14..4602ae6728 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -549,13 +549,42 @@ typedef struct CD {
>      uint32_t word[16];
>  } CD;
>  
> +/**
> + * SMMUCommandBatch - batch of invalidation commands for smmuv3-accel
> + * @cmds: Pointer to list of commands
> + * @cons: Pointer to list of CONS corresponding to the commands
> + * @ncmds: Total ncmds in the batch
number of commands
> + * @dev_cache: Issue to a device cache
indicate whether the invalidation command batch targets device cache?
> + */
> +typedef struct SMMUCommandBatch {
> +    Cmd *cmds;
> +    uint32_t *cons;
> +    uint32_t ncmds;
> +    bool dev_cache;
> +} SMMUCommandBatch;
> +
>  int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                    SMMUEventInfo *event);
>  void smmuv3_flush_config(SMMUDevice *sdev);
>  
>  #if defined(CONFIG_ARM_SMMUV3_ACCEL) && defined(CONFIG_IOMMUFD)
> +int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
> +int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
> +                            SMMUCommandBatch *batch, Cmd *cmd,
> +                            uint32_t *cons, bool dev_cache);
>  void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid);
>  #else
> +static inline int smmuv3_accel_issue_cmd_batch(SMMUState *bs,
> +                                               SMMUCommandBatch *batch)
> +{
> +    return 0;
> +}
> +static inline int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
> +                                          SMMUCommandBatch *batch, Cmd *cmd,
> +                                          uint32_t *cons, bool dev_cache)
> +{
> +    return 0;
> +}
>  static inline void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>  {
>  }
Thanks

Eric

