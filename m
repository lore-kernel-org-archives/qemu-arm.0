Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp922346dlb;
        Mon, 8 Jul 2024 08:20:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqkS5DwgR1oRKuPI43hJSlqPY2FW2X+W/PseiZe8NOoNBFgaLWmMyXpztg6g7uMVERdrpG6Aoly7R1YhyDHzfoFPd63csu
X-Google-Smtp-Source: AGHT+IFTcQW44FsIjBhO82niXQHdghlO/vJeeMoaTM6y7dIgKoV9EyVn0jikUImGNoG1WAVthUxN
X-Received: by 2002:a05:6214:f09:b0:6b5:7c8:8336 with SMTP id 6a1803df08f44-6b61c1d274dmr182996d6.56.1720452007160;
        Mon, 08 Jul 2024 08:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720452007; cv=none;
        d=google.com; s=arc-20160816;
        b=UIXOcnUvFBoHt28Osef6SlHqvK6/zhT4r/Is4uYBZiB54UGDVLWBUMFH6mjJnd4YN2
         U3wXUKYsWBv7JSIE5+8hJdd8QJHGXaf/i/wh3NV5Jn/p23NvcUpE0RraQn0vPZMocmS+
         01V6S+MSD6mvzowvOZR5e+8wTeoxippY4s3YP5v+rAkhxkdLaZr0TLatAyw4s90PIXei
         5cFqJvd3eHTRGjNK5s2xUK7ERq5vLRyFh9oUB1ukhOr1dHJ8vOM4vyv1zi2rOOXqeN5u
         uP39RHfrVU6T/LAgecdRj5taj1vGZIblhYoUCGEQjhooQ60v0rnGnI1OR6vJj+7C1Dc3
         V5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=bcaaCLu5w7lp6KzPabkWFRRuWQszxJCWccT5iuQB5qs=;
        fh=Mx8i0LTm+4GHd34BvBtwEZscUbvcRuQ8xfyMb9+SMAw=;
        b=V+yrs/WkXMqvHAdfkUmkWBCA4tdlRZMbmOITg1WH0g9W54PMaZJhOthen84P8A3OoG
         R6xoj9skLQtblMrPavEwzdazaaT/uu1kl7zwwNuhllwL44E/v0wEixWtgEY//51S+/37
         GWVNeVlvXaVqCxvtL/rzJkniDd0qMH0jjqhb/yuKzDczh7j2P7/ZQKk2V/S6A+Eo0sYk
         5k4dKcFB58JKuuav1I5R/X83LBwjnjehrZfGUgznYx9kbd5J7oUzQKEhYlo4au4ix729
         ZtnLjG8exJzzG00ng6MSbJp7AWUd0eO1hmlk+WGc0oANFAwXBs8a3mPS4UIGKu2vvks9
         3p/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fxnXcjwD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba8f327si944816d6.297.2024.07.08.08.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fxnXcjwD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720452006;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcaaCLu5w7lp6KzPabkWFRRuWQszxJCWccT5iuQB5qs=;
	b=fxnXcjwDGAL0zr+Cw37NochpRwSP/CQM19SFSxjjZdTOXfHXSyOtMNFsq7lu/82H0t0KWk
	XwUV0bgfaimZhWdcMxjGoI3KsPjAHUYocLTolv/CZje2YUneDRXDwK7zKmo35GXQdnsbSH
	NNFo5h9q0WrWm6rwk1K//jSGqgQddiA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-lz7O6jc8Pf2s5WGQv_X7BA-1; Mon, 08 Jul 2024 11:20:04 -0400
X-MC-Unique: lz7O6jc8Pf2s5WGQv_X7BA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52ea0d8adfcso4066995e87.0
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 08:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452002; x=1721056802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcaaCLu5w7lp6KzPabkWFRRuWQszxJCWccT5iuQB5qs=;
        b=qs4s4g/eqRerHhoYBn+iYe1/H6Vqfo7PLiQ9sQ3OIQCdSlaWmR4xHo1bRw8KSrspM0
         RutFDkRkP+ZAfEaNHuPC9xGYZ8DSY3nM78KHoMsfgnHoa6fWwe0qwPxKU+9LYwZN/1RR
         oBMHEeblQdsHrrZenmm6enFfwrXnVMgP+wPHqEAMod8RAkS1ZfMwNuJEA+Gv2jrtOUV3
         fHiUvNxiFShiLXxB/eDJyJxQ1HwcX40G7/lJfwspcbX+TTwRtqF8f54Qfz+h2uM4r+eL
         1kBMsv7l2Hy2Y7LFY2HpuIKCQwlcYi4pbvi38eYj3hczcmrAWnxgQJs8tmk6ZCGc08ID
         AWTg==
X-Forwarded-Encrypted: i=1; AJvYcCU4N2857XMCzus4DsbVRreecrl1+PjsiL9xsyY22NtjazYR7od1qmMsghcAkSRy2NGImOyFjXT6SO6ekFkYtTEEEmnkl3NU
X-Gm-Message-State: AOJu0Yza1Padkfvtpi8oje/HhmmKAC3wh3+0Dk/jdvSXz+MsR9LaU8nt
	0ONv8z3AfviQUbLhDpMoYanLKDRazsyQQ8+0dmnA5mY+CSAWU13s+kYet/UUzP+BdcbvPAay3aK
	CfcTS1mQPXdiUv1Psi9C8+VcIU8MQQ3SWVYFFJVeuOfNpYr3IBX8j/A==
X-Received: by 2002:a05:6512:3e19:b0:52c:e3ad:3fbf with SMTP id 2adb3069b0e04-52ea06bb61amr11019595e87.42.1720452002171;
        Mon, 08 Jul 2024 08:20:02 -0700 (PDT)
X-Received: by 2002:a05:6512:3e19:b0:52c:e3ad:3fbf with SMTP id 2adb3069b0e04-52ea06bb61amr11019567e87.42.1720452001709;
        Mon, 08 Jul 2024 08:20:01 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42667720667sm57913105e9.33.2024.07.08.08.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 08:20:01 -0700 (PDT)
Message-ID: <86fc9221-f24e-4a7f-8a0d-b19102f981f0@redhat.com>
Date: Mon, 8 Jul 2024 17:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-12-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240701110241.2005222-12-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: SxP2ITMjO44+

Hi Mostafa,

On 7/1/24 13:02, Mostafa Saleh wrote:
> When nested translation is requested, do the following:
>
> - Translate stage-1 table address IPA into PA through stage-2.
> - Translate stage-1 table walk output (IPA) through stage-2.
> - Create a single TLB entry from stage-1 and stage-2 translations
>   using logic introduced before.
>
> For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
>     7.3.12 F_WALK_EABT:
>         Translation of an IPA for Stage 1 descriptor fetch:
> 	S2 == 1 (stage 2), CLASS == T
> So, F_WALK_EABT is used which propagtes to CLASS == TT.
>
> smmu_ptw() has a new argument SMMUState which include the TLB as
> stage-1 table address can be cached in there.
>
> Also in smmu_ptw() a separate path used for nesting to simplify the
> code, although some logic can be combined.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 72 +++++++++++++++++++++++++++++++-----
>  include/hw/arm/smmu-common.h |  2 +-
>  2 files changed, 64 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 24b7d09e2b..71afd486ba 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -318,6 +318,38 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>      return NULL;
>  }
>  
> +/* Translate stage-1 table address using stage-2 page table. */
> +static inline int translate_table_addr_ipa(dma_addr_t *table_addr,
> +                                           SMMUTransCfg *cfg,
> +                                           SMMUPTWEventInfo *info,
> +                                           SMMUState *bs)
Nit: in general the SMMUState if the 1st arg, as the most global state.
> +{
> +    dma_addr_t addr = *table_addr;
> +    SMMUTLBEntry *cached_entry;
> +    int asid;
> +
> +    /*
> +     * The translation table walks performed from TTB0 or TTB1 are always
> +     * performed in IPA space if stage 2 translations are enabled.
> +     */
> +    asid = cfg->asid;
> +    cfg->stage = SMMU_STAGE_2;
> +    cfg->asid = -1;
> +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
> +    cfg->asid = asid;
> +    cfg->stage = SMMU_NESTED;
> +
> +    if (cached_entry) {
> +        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> +        return 0;
> +    }
> +
> +    info->stage = SMMU_STAGE_2;
> +    info->type = SMMU_PTW_ERR_WALK_EABT;
> +    info->addr = addr;
so I guess also here the recorded address should be the IOVA (Jean's
previous comment)?

Eric
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>   * @cfg: translation config
> @@ -333,7 +365,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   */
>  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                            dma_addr_t iova, IOMMUAccessFlags perm,
> -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> +                          SMMUState *bs)
>  {
>      dma_addr_t baseaddr, indexmask;
>      SMMUStage stage = cfg->stage;
> @@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                  goto error;
>              }
>              baseaddr = get_table_pte_address(pte, granule_sz);
> +            if (cfg->stage == SMMU_NESTED) {
> +                if (translate_table_addr_ipa(&baseaddr, cfg, info, bs)) {
> +                    goto error;
> +                }
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -568,10 +606,8 @@ error:
>   * combine S1 and S2 TLB entries into a single entry.
>   * As a result the S1 entry is overriden with combined data.
>   */
> -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> -                                                SMMUTLBEntry *tlbe_s2,
> -                                                dma_addr_t iova,
> -                                                SMMUTransCfg *cfg)
> +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> +                        dma_addr_t iova, SMMUTransCfg *cfg)
>  {
>      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
>          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> @@ -596,14 +632,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>   * @perm: tentative access type
>   * @tlbe: returned entry
>   * @info: ptw event handle
> + * @bs: smmu state which includes TLB instance
>   *
>   * return 0 on success
>   */
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
>  {
> +    int ret;
> +    SMMUTLBEntry tlbe_s2;
> +    dma_addr_t ipa;
> +
>      if (cfg->stage == SMMU_STAGE_1) {
> -        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
>      } else if (cfg->stage == SMMU_STAGE_2) {
>          /*
>           * If bypassing stage 1(or unimplemented), the input address is passed
> @@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>          return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
>      }
>  
> -    g_assert_not_reached();
> +    /* SMMU_NESTED. */
> +    ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
> +    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    combine_tlb(tlbe, &tlbe_s2, iova, cfg);
> +    return 0;
>  }
>  
>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> @@ -677,7 +731,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> -    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
> +    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
>      if (status) {
>              g_free(cached_entry);
>              return NULL;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1db566d451..cf0fd3ec74 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -185,7 +185,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>   * pair, according to @cfg translation config
>   */
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
>  
>  
>  /*
