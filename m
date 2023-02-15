Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp673780ejb;
        Wed, 15 Feb 2023 08:53:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+xqUNjmT6v8qDol14z9Nc75v7v5ED/7q1KlAbPmAl+VcdbdKaU2Ft0gPDjVXC6PBpNI5uU
X-Received: by 2002:ac8:5848:0:b0:3bc:dd21:4a0 with SMTP id h8-20020ac85848000000b003bcdd2104a0mr4816387qth.30.1676479998925;
        Wed, 15 Feb 2023 08:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676479998; cv=none;
        d=google.com; s=arc-20160816;
        b=RDzK8qR3WPUv9ienLVXvU201Z2vu8kCDDXMV6fDafnUVraZgR2LbrRd4Wod78h32wN
         negq7YD59BWoDtVbaLD2hUu/BSCyUgfinEW2QVPaI6P3VUa93U959c1AsoQ8vbApEmIE
         cTYyQnkIdZGIf2/JcvFAQB0/irhmlll61il/F5Z+QLrp4a6u7hnXLLXpLa8JymTag3JS
         1iRnFiGO5I2L+p3go02sxHyhnI1JFy1D6bw6Rye7hnDFxkdi/ECHyh4aNFhZdFxE7Xw3
         HmtxhtUfuK2NhLHVrifp/XfyQJ8mRqClIq6Ytt3tGTRxZXMkXTdVfwUEFjxMNtlpUBFX
         mZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fu+HvnrhHsC8Th7MpV+249ydwOUKgpY4ah3wN26Em6I=;
        b=cqQ2iDA92XmJMRswXKa5xCVRykYpA5csItnRV3nMRReSL4cvxSvOi9xDqNN/P8rXG5
         9w8H7B6QDwkCMa4Hpy5t4/gRtPbapVYcM/qP06dtcbw1WAPEosbGhuYf65oJkp8Rm6oD
         ohYWJ9sabiiyxAtBfx0PoZCYKKA3cxVb3canBhWG4n7bEju8Og8v0847gfqkcOs5uehj
         P6KTLF7RUOFrps+FCuJixT+0qnPXFBIHNbELpti9vxCYA8GOXPlgVPcJnSYmf031vH9m
         TJhLWH8xrr059SIyS7dHlHwnL/ZsRhch2dHWqEtBoLgIAo1bC0Md6GDn7Vhz3s6JoGOg
         +Yqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gVpsCtW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ac8704d000000b003b9bb33ef8dsi12528811qtm.432.2023.02.15.08.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 08:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gVpsCtW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSL1V-0002u4-50; Wed, 15 Feb 2023 11:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL1U-0002tq-0I
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL1S-0005IW-8U
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676479965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fu+HvnrhHsC8Th7MpV+249ydwOUKgpY4ah3wN26Em6I=;
 b=gVpsCtW2VDNWO4OlZKH3Vbd8ZtzhUPIaHvREwT6LWCXHdTLScbScLNM+qVjtL7y+0pVutZ
 1MSZkIJpojTrAlFZ2z9fub6uD3CRcxOiN5O5TwidQLsb9NAdB+IlC4dM3pyBnflCVFaN8k
 4OxXYoJUZeJSTVciHIrDomcrSXXd/Cw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-OnJUneyvMjSngMw8AD91bw-1; Wed, 15 Feb 2023 11:52:44 -0500
X-MC-Unique: OnJUneyvMjSngMw8AD91bw-1
Received: by mail-qv1-f69.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso11029729qvb.21
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 08:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fu+HvnrhHsC8Th7MpV+249ydwOUKgpY4ah3wN26Em6I=;
 b=z3yh2rdjTYOpXUuBG/tNtiuOSDtm/feCA4qlhiu5oC3PdKn++J14lpzS+hKFI2PMBD
 RH04qSv4XcxQxIqx9jMTAA7mAVHrk9vAcZeVLHqML8BivGc24LQ6QikMQXpH4DnptiKw
 R9wbDgCv6kfbb3eF/JVvs6xnbRcnIp4qt8+nFJVDGKRsBaCuv/fzm+3FxFtviuMmbno2
 QCDMAFPsJslVJuSs5I7eDGkJQ0FFz5fHVgT9hRo0Z5TwaOx9irTyY0y7yyZKP1yT8Nnt
 AlNrI/TDOCnZFEwinccfM5r/+x7jWNHnV9MP8O62GhoQQpaAX1oMglRCwnkRNwjhfZkn
 6Usw==
X-Gm-Message-State: AO0yUKVp4yyI5oyg670Rbd1AlUlaB342/kfzXSK9P6dX580+q4tUv2Q6
 pmk1AnGpYnTYxYRLk3lwm67IDrqUi5J6ETlAubvvA1iLLOpxf0j9jhg7od5/QjzHuclZmoWqO32
 Tz+18DcDaunPv
X-Received: by 2002:ac8:7f47:0:b0:3b8:5aa8:7d7a with SMTP id
 g7-20020ac87f47000000b003b85aa87d7amr4321161qtk.68.1676479963649; 
 Wed, 15 Feb 2023 08:52:43 -0800 (PST)
X-Received: by 2002:ac8:7f47:0:b0:3b8:5aa8:7d7a with SMTP id
 g7-20020ac87f47000000b003b85aa87d7amr4321126qtk.68.1676479963280; 
 Wed, 15 Feb 2023 08:52:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ac8700c000000b003b0766cd169sm13423220qtm.2.2023.02.15.08.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:52:42 -0800 (PST)
Message-ID: <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
Date: Wed, 15 Feb 2023 17:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-6-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-6-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: MbI/O8Z/94d5

Hi Mostafa,

On 2/5/23 10:44, Mostafa Saleh wrote:
> In preparation for adding stage-2 support. Add Stage-2 PTW code.
> Only Aarch64 fromat is supported as stage-1.
format
> Max 48 bits IPA is supported.
>
> Nesting stage-1 and stage-2 is not supported right now.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 112 ++++++++++++++++++++++++++++++++---
>  hw/arm/smmu-internal.h       |  37 ++++++++++++
>  include/hw/arm/smmu-common.h |   1 +
>  3 files changed, 143 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 4fcbffa2f1..df0d1dc024 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -362,6 +362,99 @@ error:
>      return -EINVAL;
>  }
>  
> +/**
> + * smmu_ptw_64_s2 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * for stage-2.
> + * @cfg: translation config
> + * @iova: iova to translate
> + * @perm: access type
> + * @tlbe: SMMUTLBEntry (out)
> + * @info: handle to an error info
> + *
> + * Return 0 on success, < 0 on error. In case of error, @info is filled
> + * and tlbe->perm is set to IOMMU_NONE.
> + * Upon success, @tlbe is filled with translated_addr and entry
> + * permission rights.
> + */
> +
> +static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> +                          dma_addr_t iova, IOMMUAccessFlags perm,
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    const int stage = 2;
> +    int granule_sz = cfg->s2cfg.granule_sz;
> +    /* ARM ARM: Table D8-7. */
> +    int inputsize = 64 - cfg->s2cfg.tsz;
> +    int level = get_start_level(cfg->s2cfg.sl0, granule_sz);
> +    int stride = granule_sz - 3;
> +    int idx = pgd_idx(level, granule_sz, iova);
> +    /*
> +     * Get the ttb from concatenated structure.
> +     * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
> +     */
> +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> +                        idx * sizeof(uint64_t);
> +    dma_addr_t indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
> +
> +    baseaddr &= ~indexmask;
> +
> +    while (level < SMMU_MAX_LEVELS) {
> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> +        uint64_t mask = subpage_size - 1;
> +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> +        uint64_t pte, gpa;
> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
> +        uint8_t ap;
> +
> +        if (get_pte(baseaddr, offset, &pte, info)) {
> +                goto error;
> +        }
> +        trace_smmu_ptw_level(level, iova, subpage_size,
> +                             baseaddr, offset, pte);
I can the trace point names should be updated as well (and
differentiated between S1/S2)
> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
> +            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
> +                                       pte_addr, offset, pte);
same for PTE's?
> +            break;
> +        }
> +
> +        if (is_table_pte(pte, level)) {
> +            baseaddr = get_table_pte_address(pte, granule_sz);
> +            level++;
> +            continue;
> +        } else if (is_page_pte(pte, level)) {
> +            gpa = get_page_pte_address(pte, granule_sz);
> +            trace_smmu_ptw_page_pte(stage, level, iova,
> +                                    baseaddr, pte_addr, pte, gpa);
> +        } else {
> +            uint64_t block_size;
> +
> +            gpa = get_block_pte_address(pte, level, granule_sz,
> +                                        &block_size);
> +            trace_smmu_ptw_block_pte(stage, level, baseaddr,
> +                                     pte_addr, pte, iova, gpa,
> +                                     block_size >> 20);
> +        }
> +        ap = PTE_AP(pte);
> +        if (is_permission_fault_s2(ap, perm)) {
> +            info->type = SMMU_PTW_ERR_PERMISSION;
don't we have to different S1 versus S2 faults?
> +            goto error;
> +        }
> +
> +        tlbe->entry.translated_addr = gpa;
> +        tlbe->entry.iova = iova & ~mask;
> +        tlbe->entry.addr_mask = mask;
> +        tlbe->entry.perm = ap;
> +        tlbe->level = level;
> +        tlbe->granule = granule_sz;
> +        return 0;
> +    }
> +    info->type = SMMU_PTW_ERR_TRANSLATION;
> +
> +error:
> +    tlbe->entry.perm = IOMMU_NONE;
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> @@ -376,15 +469,20 @@ error:
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    if (!cfg->aa64) {
> -        /*
> -         * This code path is not entered as we check this while decoding
> -         * the configuration data in the derived SMMU model.
> -         */
> -        g_assert_not_reached();
if that's still true for S2, maybe keep that check here upfront?
> +    if (cfg->stage == 1) {
> +        if (!cfg->aa64) {
> +            /*
> +             * This code path is not entered as we check this while decoding
> +             * the configuration data in the derived SMMU model.
> +             */
> +            g_assert_not_reached();
> +        }
> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    } else if (cfg->stage == 2) {
> +        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
>      }
>  
> -    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +    g_assert_not_reached();
>  }
>  
>  /**
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31953..b02c05319f 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -73,6 +73,9 @@
>  #define is_permission_fault(ap, perm) \
>      (((perm) & IOMMU_WO) && ((ap) & 0x2))
>  
> +#define is_permission_fault_s2(ap, perm) \
> +    (!((ap & perm) == perm))
> +
>  #define PTE_AP_TO_PERM(ap) \
>      (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>  
> @@ -96,6 +99,40 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>              MAKE_64BIT_MASK(0, gsz - 3);
>  }
>  
> +#define SMMU_MAX_S2_CONCAT    16
> +
> +/*
> + * Relies on correctness of gran and sl0 from caller.
> + * FEAT_LPA2 and FEAT_TTST are not implemented.
> + */
> +static inline int get_start_level(int sl0 , int gran)
> +{
> +    /* ARM ARM: Table D8-12. */
> +    if (gran == 12) {
> +        return 2 - sl0;
> +    }
> +    /* ARM ARM: Table D8-22 and Table D8-31. */
> +    return 3 - sl0;
> +}
> +
> +/*
> + * Index in a concatenated first level stage-2 page table.
> + * ARM ARM: D8.2.2 Concatenated translation tables.
> + */
> +static inline int pgd_idx(int start_level, int granule, dma_addr_t iova)
> +{
> +    uint64_t ret;
> +    /*
> +     * Get the number of bits handled by next levels, then any extra bits in
> +     * the address should index the concatenated tables. This relation can
> +     * deduced from tables in ARM ARM: D8.2.7-9
> +     */
> +    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
can't we factorize anything with the S1 PTW?
indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
> +
> +    ret = iova >> shift;
> +    return ret;
> +}
> +
>  #define SMMU_IOTLB_ASID(key) ((key).asid)
>  
>  typedef struct SMMUIOTLBPageInvInfo {
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 45f74d0e93..1e666e8b6d 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -28,6 +28,7 @@
>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>  
>  #define SMMU_MAX_VA_BITS      48
> +#define SMMU_MAX_LEVELS       4
can't this be reused as well with S1 PTW?
>  
>  /*
>   * Page table walk error types
Eric

