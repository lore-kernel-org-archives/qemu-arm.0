Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3050370ejb;
        Mon, 20 Mar 2023 10:12:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set/4HEVfZAkWP635yJDd6naGC9tOSHH99z3OF5H1nc9+sEj2I/n21YURU08xeVU8b+4Z4NYe
X-Received: by 2002:a05:6214:238e:b0:56e:9ab5:cd9f with SMTP id fw14-20020a056214238e00b0056e9ab5cd9fmr49598707qvb.39.1679332369836;
        Mon, 20 Mar 2023 10:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679332369; cv=none;
        d=google.com; s=arc-20160816;
        b=bzdJSGRHmPXmirfCgPS3RD77f2MtaGx/xwPJEKXCRAn1KZ73Rv8XTLJR2OR9mj+X/K
         qCt6MY9mZxIPOFGAX9ltqWs7nlIypm7706IVyCge/XS74qmvniSZTj3b+2iRPifei33r
         C9hgO59CEWbPrrdkgc7kpeTmwO/mCOwGkOsH7HUhukwjss6+8LG9JMoC8T099qdeoc+t
         IEz3t1C45kzZCVcC+tZHm0YCrjBWYzZgY0qeZ+vSMZUCHt4pcpoN+w6XfM6/HjWGA+Ls
         Nzs+5f4fcEILdvvtcxWiX0Frr7eKbfHFcLFH7z9Vbhp5JYMPD0zUTuc0uy5a4sunieX/
         UMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BJZmmotS7AbwLcgUbP5uINHOw7FEWz31Ap3frXadQ34=;
        b=BiBV5zgr/aPnIgCC9fMJn7SFJR4bswf5W/9SZUEQvuaCfqMg0ukNlucbeViqUSGnDs
         u3hHvoncPi6DQEZNL1yY+BKBzmdryrAdMKAUeoxU4zA5hrby75J79xj7kU9ak4WediKa
         e2KMO2ipML4VRvphwoNMAca6xAnYOpQJL3j9FMinql5+D97YFcR8kisGLtWHGTwD4eAp
         qaCcO6vwZqBGXjxNEvaxwQb/LXGqEYznf2At15yguwyzzZQLDT2xVfZb+B+WgiLa74Zq
         FMXpOGMnML4aG8UtxEoYxbllmmtn1YDSYJdmbPRQHASc7Z9Ff66lC/z6gF7wyl7mABuo
         y4XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXxrWVpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a40c900b00745c7874715si6952947qko.418.2023.03.20.10.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 10:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXxrWVpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peJ3h-0003WM-5i; Mon, 20 Mar 2023 13:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peJ3e-0003TC-CH
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 13:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peJ3a-0008IK-H9
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 13:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679332344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJZmmotS7AbwLcgUbP5uINHOw7FEWz31Ap3frXadQ34=;
 b=PXxrWVpIMkv2OzY+L9vUBqV2epGYvkx30qmVO4IvFTlI2ARto4f8Q75PUqY6VIM4Gfp4W3
 krZF9NpxTvQK5AX0jGFJibTgZvMJmcxIYepv2zUVeyrtDIJA7Fgv09HbHup2finifAuoFg
 0flaazzgxlKDoNTXx1m62lkzx+7HBms=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-z7BfT7e4MReqi-Ma3W_Eag-1; Mon, 20 Mar 2023 13:12:23 -0400
X-MC-Unique: z7BfT7e4MReqi-Ma3W_Eag-1
Received: by mail-wm1-f71.google.com with SMTP id
 iv18-20020a05600c549200b003ee21220fccso184058wmb.1
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 10:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BJZmmotS7AbwLcgUbP5uINHOw7FEWz31Ap3frXadQ34=;
 b=Q0QmKMDpxXheuCzvLm6DF2IROdPXjKm7bIguFvrRPy+q/m8GgbaUDOMxNVcFRniPgc
 ulGm3ixcMcxHK3IpF0sBXUBpSPuoRirun1iCnjnXNqeGpo+8rLRSOqCiQXiC57pY9dqx
 HKR46apeSc/OcJ3xg+kVpfCBLbNQvISX8Kf+qmYJPFQWdykM5or8d870/D31dSdPDAA8
 MyMUeBQXKK0g92fE48rPgPWrZ1Cu02OX9UUu5c133leogLawg7uk2jydaQ1zE/TCvvhM
 C8+fMuwGWFFLG2gB2m2MvPOIBSzz4TuDrzX9YF06jO7dFAo7jUhYl7Vute1I/zGQNveE
 jiiQ==
X-Gm-Message-State: AO0yUKWT+IMowYcGz1j0yjD7Gdk6NeJ8BacBUCiAumply9tZNJR/zOpl
 IAVyybNSv+FoiGbq/NqWmC8NqQhLpd0UBFqJgtOO9B7eY4Rc7HDDMx/SToOnT45QSFcefiqOY7G
 fKwr4zjfHfqQj
X-Received: by 2002:a5d:6409:0:b0:2cf:e8b2:4f76 with SMTP id
 z9-20020a5d6409000000b002cfe8b24f76mr41490wru.66.1679332342524; 
 Mon, 20 Mar 2023 10:12:22 -0700 (PDT)
X-Received: by 2002:a5d:6409:0:b0:2cf:e8b2:4f76 with SMTP id
 z9-20020a5d6409000000b002cfe8b24f76mr41470wru.66.1679332342197; 
 Mon, 20 Mar 2023 10:12:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a5d6a8f000000b002d743eeab39sm2616096wru.58.2023.03.20.10.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 10:12:21 -0700 (PDT)
Message-ID: <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
Date: Mon, 20 Mar 2023 18:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-11-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 4b5TykGHOg1Y

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> OAS used to be hardcoded to 44 bits, however according to SMMU manual
> 6.3.6 SMMU_IDR5, OAS must match the system physical address size, so
> we read it from CPU PARANGE.
>
> Remove PA_MAX and pa_range as they were not used.
>
> Add SMMUv3State as an argument to decode_cd, so it can read the SMMU
> OAS.
>
> As CPU can use PARANGE with 52 bits, add 52 bits check to oas2bits,
> and cap OAS to 48 bits for stage-1 and stage-2 if granule is not 64KB
> as specified for SMMUv3.1 and later.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c     | 13 +++++++++----
>  hw/arm/smmuv3-internal.h | 15 ++-------------
>  hw/arm/smmuv3.c          | 41 ++++++++++++++++++++++++++++++++++------
>  3 files changed, 46 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e4b477af10..3a2b06fd7f 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -307,7 +307,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>      dma_addr_t baseaddr, indexmask;
>      int stage = cfg->stage;
>      SMMUTransTableInfo *tt = select_tt(cfg, iova);
> -    uint8_t level, granule_sz, inputsize, stride;
> +    uint8_t level, granule_sz, inputsize, stride, oas;
>  
>      if (!tt || tt->disabled) {
>          info->type = SMMU_PTW_ERR_TRANSLATION;
> @@ -319,7 +319,12 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>      inputsize = 64 - tt->tsz;
>      level = 4 - (inputsize - 4) / stride;
>      indexmask = SMMU_IDXMSK(inputsize, stride, level);
> -    baseaddr = extract64(tt->ttb, 0, 48);
> +    oas = cfg->oas;
> +    if (tt->granule_sz != 16) {
> +        oas = MIN(oas, 48);
> +    }
> +
> +    baseaddr = extract64(tt->ttb, 0, oas);
>      baseaddr &= ~indexmask;
>  
>      while (level < SMMU_LEVELS) {
> @@ -416,8 +421,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>       * Get the ttb from concatenated structure.
>       * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
>       */
> -    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> -                                  idx * sizeof(uint64_t);
> +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, cfg->s2cfg.oas) +
> +                                  (1 << stride) * idx * sizeof(uint64_t);
>      dma_addr_t indexmask = SMMU_IDXMSK(inputsize, stride, level);
>  
>      baseaddr &= ~indexmask;
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 3388e1a5f8..25ae12fb5c 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -564,23 +564,12 @@ static inline int oas2bits(int oas_field)
>          return 44;
>      case 5:
>          return 48;
> +    case 6:
> +        return 52;
>      }
>      return -1;
>  }
>  
> -static inline int pa_range(STE *ste)
> -{
> -    int oas_field = MIN(STE_S2PS(ste), SMMU_IDR5_OAS);
> -
> -    if (!STE_S2AA64(ste)) {
> -        return 40;
> -    }
> -
> -    return oas2bits(oas_field);
> -}
> -
> -#define MAX_PA(ste) ((1 << pa_range(ste)) - 1)
> -
>  /* CD fields */
>  
>  #define CD_VALID(x)   extract32((x)->word[0], 31, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7297f6adc1..bc4ec202f4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -238,6 +238,13 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  
>  static void smmuv3_init_regs(SMMUv3State *s)
>  {
> +    /*
> +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
> +     * size.
> +     */
> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
is this working in accelerated mode?
> +
>      /**
>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>       *       multi-level stream table
> @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
I am not sure you can change that easily. In case of migration this is
going to change the behavior of the device, no?

Thanks

Eric
>  
>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>      s->cmdq.prod = 0;
> @@ -374,6 +381,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>  
>      if (!STE_VALID(ste)) {
>          if (!event->inval_ste_allowed) {
> @@ -450,7 +458,16 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>  
>  
> -        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), oas));
> +        /*
> +         * For SMMUv3.1 and later, when OAS == IAS == 52, the stage 2 input
> +         * range is further limited to 48 bits unless STE.S2TG indicates a
> +         * 64KB granule.
> +         */
> +        if (cfg->s2cfg.granule_sz != 16) {
> +            cfg->s2cfg.oas = MIN(cfg->s2cfg.oas, 48);
> +        }
> +
>          /*
>           * It is ILLEGAL for the address in S2TTB to be outside the range
>           * described by the effective S2PS value.
> @@ -607,10 +624,12 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>      return 0;
>  }
>  
> -static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> +static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg, CD *cd,
> +                     SMMUEventInfo *event)
>  {
>      int ret = -EINVAL;
>      int i;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>  
>      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
>          goto bad_cd;
> @@ -630,7 +649,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>      cfg->stage = 1;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
> -    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> +    cfg->oas = MIN(oas2bits(oas), cfg->oas);
> +
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
>  
> @@ -658,9 +678,18 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>              goto bad_cd;
>          }
>  
> +        /*
> +         * An address greater than 48 bits in size can only be output from a
> +         * TTD when, in SMMUv3.1 and later, the effective IPS is 52 and a 64KB
> +         * granule is in use for that translation table
> +         */
> +        if (tt->granule_sz != 16) {
> +            oas = MIN(cfg->oas, 48);
> +        }
> +
>          tt->tsz = tsz;
>          tt->ttb = CD_TTB(cd, i);
> -        if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
> +        if (tt->ttb & ~(MAKE_64BIT_MASK(0, oas))) {
>              goto bad_cd;
>          }
>          tt->had = CD_HAD(cd, i);
> @@ -719,7 +748,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    return decode_cd(cfg, &cd, event);
> +    return decode_cd(s, cfg, &cd, event);
>  }
>  
>  /**

