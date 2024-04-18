Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1559944ejd;
        Thu, 18 Apr 2024 00:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxGryRy4m+Jm5p5Zz2jYmfSLZ1mazIgOJoepOW0l1f3oNRC0YQqzVqtNvG8iUMECLWscHxUdfLUefW4avkhr8UgKyNjrY4
X-Google-Smtp-Source: AGHT+IGyT275tyrZSAgr1knO9xsA+VUEwlNdiZW2tN8G2OPz0TWwoDnwpYoLymqm7NAtkCfVbXKt
X-Received: by 2002:a05:620a:31aa:b0:78e:db72:9f40 with SMTP id bi42-20020a05620a31aa00b0078edb729f40mr2512070qkb.13.1713426985974;
        Thu, 18 Apr 2024 00:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713426985; cv=none;
        d=google.com; s=arc-20160816;
        b=YX9F3AONLxUwxHojVNwUIwQtLUxb3F7kC4SPweyLhrtdF0RZRPf2LKo3RlxzdWUC4S
         zpGLVfDuWnHJ76XXM7G4lWIW2/rVQKlgvTj0Oka4q5k5Nf8n5ovLsitmWfKeh1yqaRnI
         ICxtEQsQvG4HlrRMJInsgqykQ0lJSZ9tnOzzHNYO+UcpvIIcyNyP76H4mkfWncU0Hal/
         z+K92dteBX6qnDPAUe4WuY7aqCEDffaSs2fuhvfULf2aIIaxdFKGUOAb+6Plt357Fbbv
         2yW7AWqEAMRIJKQ9n6WoBieW67mkbD5wyNiuT6RlyJ9scNl5tVEEu4m7Rq7gzpafcMbZ
         h4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+AJRVK1J2Bm1IOcAddMTRzH20GLdSfC9QEoO87nKsR0=;
        fh=541Gwp2DnuFmc1qgJBEp+y3TQBD7Bfw5wTeyXKbJkgk=;
        b=QPqMY17XXDNlVj92uextgex1xfF+DoL1EwK+WCAGeXYizleJOcCViITwJkK7VVmD6x
         QbF0Tv1ineOAjVaB+aKbUmCiKopoRHtaXnjIT/59iTxrE66wjLOYK6YVQLQSdLzu13N7
         OO+T2uqu90R0osOWD/E1jDz/CW4dG7i7u3kSPd+mku3htrJBU+npr50mzpXt0CggkZbD
         8OdISbTEM8KHBwUGclXx7QB9Bd5MSrlx4xdRLONSRQ6xumvkhOhPfqGXsfGn++bmX75a
         oul61Vg2Tx8+gnJERnfEgtfOkmBHRkYFVe5V9FKC85AFbtusoxkDGcVxXXcnuVp2BjEA
         FM+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AWGwoUFc;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n3-20020a05620a294300b0078ed673542fsi986749qkp.171.2024.04.18.00.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 00:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AWGwoUFc;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713426985;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AJRVK1J2Bm1IOcAddMTRzH20GLdSfC9QEoO87nKsR0=;
	b=AWGwoUFcy74u6NFaIgW/hCM2QsyM+YLNa0Od64Ve4Ymc9LWuucpm4gpPykY/OEoV9bTjhj
	1GACgcVs8QpS6HqcUorpF8B1aPIJJ52vxe4QEbNbbtMmpuqPA7MVBDODsQN2GZs9wbGz5I
	X0LWnVCO7IsIPeS/f4QHluOgnSuNnHM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-mpJ1jPN8PL-R3ka993PluQ-1; Thu, 18 Apr 2024 03:56:24 -0400
X-MC-Unique: mpJ1jPN8PL-R3ka993PluQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78f08178393so157736685a.1
        for <alex.bennee@linaro.org>; Thu, 18 Apr 2024 00:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713426983; x=1714031783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AJRVK1J2Bm1IOcAddMTRzH20GLdSfC9QEoO87nKsR0=;
        b=dyCC02Bv8ujzQ4i+H/jzmlqmEMfXYA0BcbK7UPmLKtBOfCbeY06vMlJvTnQlU24nch
         QhmaCadnTTl+eiZIYXniRQFBFdy7mgCpokyDxDl6v+O1siOeGaanyyloHseMDKTzU6xY
         L5R7LMykBZCWYHLO9EJo1XuFXa6rZcbM/OIkt7g+PypagZv43lFxZS8IDIIQnZyv20OQ
         PBlX05ixfkZrFYycRzCnvPhdLnihKmlBZD7p5SsOsKHzC2IoQTYfZ8x29MsFftxBoKvi
         Dnr8We+92+h1Q2s8+ZxsiygXYaEBELwr1fkZf5P3sUSbDme5miqDdsosF7IxW7+Ks8td
         g2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNaR8wIdSoo8k6MbYWsiSKjEXKBEcsa/RgIoAj4sCIEfPk76XaUXdceSL3leL2F/A6hIAuDB9n3ahpPL1FYMfBtKvJFZkJ
X-Gm-Message-State: AOJu0Yy5nlFtXTVdDXj3EI/pfO9TFHBoYjhavOwvp+hANLCsYXQEKOKo
	mfmFqOU516ONEUViACkQM7BJQfbPhR1rfOlBnvEHHZj5Zc2Tvy6sNbzVE0OSIongBNanDvteQAv
	tD1S1RTMC7fW2b2iFcMuLFXy7Tsc4YEqp0383u1ykBJ1JamuaCcZasG4n93zGKg==
X-Received: by 2002:a05:620a:40c3:b0:78d:68f2:11af with SMTP id g3-20020a05620a40c300b0078d68f211afmr2564030qko.23.1713426982889;
        Thu, 18 Apr 2024 00:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:78d:68f2:11af with SMTP id g3-20020a05620a40c300b0078d68f211afmr2564017qko.23.1713426982521;
        Thu, 18 Apr 2024 00:56:22 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id y21-20020a05620a44d500b0078ecd71114dsm413360qkp.69.2024.04.18.00.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 00:56:21 -0700 (PDT)
Message-ID: <74b42fab-7731-4826-974f-dec9f0413b7d@redhat.com>
Date: Thu, 18 Apr 2024 09:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v2 03/13] hw/arm/smmu: Consolidate ASID and VMID types
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240408140818.3799590-4-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YdGZZMWD1dRp

Hi Mostafa,

On 4/8/24 16:08, Mostafa Saleh wrote:
> ASID and VMID used to be uint16_t in the translation config, however,
> in other contexts they can be int as -1 in case of TLB invalidation,
> to represent all(don’t care).
> When stage-2 was added asid was set to -1 in stage-2 and vmid to -1
> in stage-1 configs. However, that meant they were set as (65536),
> this was not an issue as nesting was not supported and no
> commands/lookup targets both.
>
> With nesting, it’s critical to get this right as translation must be
> tagged correctly with ASID/VMID, and with ASID=-1 meaning stage-2.
> Represent ASID/VMID everywhere as int.

small conflict  due to
0b796f3810  hw/arm/smmu: Avoid using inlined functions with external
linkage again

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 10 +++++-----
>  hw/arm/smmuv3.c              |  4 ++--
>  include/hw/arm/smmu-common.h | 14 +++++++-------
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 20630eb670..771b9c79a3 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -57,7 +57,7 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>             (k1->vmid == k2->vmid);
>  }
>  
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level)
>  {
>      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> @@ -130,7 +130,7 @@ void smmu_iotlb_inv_all(SMMUState *s)
>  static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>                                           gpointer user_data)
>  {
> -    uint16_t asid = *(uint16_t *)user_data;
> +    int asid = *(int *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> @@ -139,7 +139,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
>                                           gpointer user_data)
>  {
> -    uint16_t vmid = *(uint16_t *)user_data;
> +    int vmid = *(int *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
>      return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> @@ -191,13 +191,13 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                                  &info);
>  }
>  
> -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, int asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>  }
>  
> -inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> +inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
>  {
>      trace_smmu_iotlb_inv_vmid(vmid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f081ff0cc4..897f8fe085 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1235,7 +1235,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          }
>          case SMMU_CMD_TLBI_NH_ASID:
>          {
> -            uint16_t asid = CMD_ASID(&cmd);
> +            int asid = CMD_ASID(&cmd);
>  
>              if (!STAGE1_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
> @@ -1268,7 +1268,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              break;
>          case SMMU_CMD_TLBI_S12_VMALL:
>          {
> -            uint16_t vmid = CMD_VMID(&cmd);
> +            int vmid = CMD_VMID(&cmd);
>  
>              if (!STAGE2_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 5944735632..96eb017e50 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -84,7 +84,7 @@ typedef struct SMMUS2Cfg {
>      bool record_faults;     /* Record fault events (S2R) */
>      uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
>      uint8_t eff_ps;         /* Effective PA output range (based on S2PS) */
> -    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
> +    int vmid;               /* Virtual Machine ID (S2VMID) */
>      uint64_t vttb;          /* Address of translation table base (S2TTB) */
>  } SMMUS2Cfg;
>  
> @@ -108,7 +108,7 @@ typedef struct SMMUTransCfg {
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
> -    uint16_t asid;
> +    int asid;
>      SMMUTransTableInfo tt[2];
>      /* Used by stage-2 only. */
>      struct SMMUS2Cfg s2cfg;
> @@ -132,8 +132,8 @@ typedef struct SMMUPciBus {
>  
>  typedef struct SMMUIOTLBKey {
>      uint64_t iova;
> -    uint16_t asid;
> -    uint16_t vmid;
> +    int asid;
> +    int vmid;
>      uint8_t tg;
>      uint8_t level;
>  } SMMUIOTLBKey;
> @@ -205,11 +205,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>                                  SMMUTransTableInfo *tt, hwaddr iova);
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
> -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> -void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
> +void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> +void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  
