Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp784981njb;
        Thu, 4 Jul 2024 11:33:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBHwfcZASVbkZolT6OYum0eMqYauu7RiO0vY9g8tPf+iB+1ugyS1jpv+0hlIYoFk6GwWiEFzkck07drIpznKAcGeDEbPTW
X-Received: by 2002:a05:600c:22c2:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-4264b131861mr21240195e9.10.1720117979912;
        Thu, 04 Jul 2024 11:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720117979; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6ErrxJAwph+fpk7Nq6WxT+lbCem5zp/V5o7+DSzxPyvX/IuzMVXkI2zsomV3aRg15
         j51SXG2g3XVi9SPu50ac3ESl1iGRpy06Yf3XWxffNjW7v26nUAIZaKVgtgQ9snj6BxC2
         UpN/9RBUDgWFRdxdfHpmIudUmNy5RxgI/aKsLjX9E1FvhKCySN6aBdTWMjgo5BMtZNfx
         sL74qjX8OvGkW0lTbeSh4+Olf7ud2+rmAwzmwUydBZ/YnE4uI5a+l0/xLB0yz2hpqzeA
         hxaZ9LMm1Wv0bapUjDrZAk4peP/m962zS3PkarCAsWNML0Mqn451QAR6C/kscs2oNSDK
         u4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=093eQqwjwdZ9T2e/A+1zO+f8C9q+fawb6Z0V4olwT7I=;
        fh=oZakz7YwOQOUyR3BXWFZPCN3Arl1Z6Z3r4LDzl0LOkY=;
        b=QFJQG/eqWcvR3cHRB+mAjxv925BFT6vcz1Qg53kbotRaGg28oqIFgh+JS555TbyfUv
         VCahesOnpNbqs9KuZsKQfp/JwDv2glrV2m4+AGAoWHUDuTDbaeJVo26jVaRJInw58Vmj
         rDyU3jhH9EcjU7NPRAh/ZNA0Dq8m6KzPngCxRMkkna8zdAEzLsL230X2GEKjLC0PIXyM
         2J9JCPLZfYkfAAB2UWgGei3VFsrw4JP+taioGb2eGRSqQLJy/71vQ4uK8/HYLGLtJxvB
         AsDW+vlNvDLzPAFRU0Y5EMsxVfc8iDPx02lyPdX3jXbpXaNTkPnQVpzjv8Ci9VF++owG
         166g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2/ZAbOw";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4264a2ff4c4sor5310255e9.4.2024.07.04.11.32.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2/ZAbOw";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720117979; x=1720722779; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=093eQqwjwdZ9T2e/A+1zO+f8C9q+fawb6Z0V4olwT7I=;
        b=U2/ZAbOwIpMYYvYmuqzNmMcOa7Bjof7BghBsNiGABiXINq0FfucWnK1dN4iPnXNbjS
         Xq/4O7iByvlE0KwWzMdu4bJr3SXQjANn8oK5qv4nSWCA/rBU0fM2KWOD5FnjI17dlG31
         AB7+eX2coX40cF9wu548hPpqcd96ePF5sd4dKuJFMI8ccidSZ4TyU1AnfFKHfeFru9Wh
         C2E3YeS+62iRWAhwg4quzhcMvMAqXd7f6FgGOCogdZ4gbltdQsYjKvqRuY83zl/8896l
         gDGnK+Q5Wj0sDdsUjPgRdVC6G7wNroqc00S8Ru+rmmJ6hpTsfK0PAlb54IQE0nMe8PkI
         RqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117979; x=1720722779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=093eQqwjwdZ9T2e/A+1zO+f8C9q+fawb6Z0V4olwT7I=;
        b=SkX2sLpckkYgwJAXoGrIU9WSAocoroN4JE9KvY9drE3Ixvxe3tFY0A1ZPzFuA79gVx
         hQYFDS9gG9gh3ZKXqOI9Ssi0MbuITri8xiVTVOJ6weHU9TesCDo9nu3oFFip6TPsFb2G
         wjA5JDzI+J1IgtMw1bjV5xjBe4I/l4OznUubukTnaU6o+7bZj/7+kvgEK/5oxUXBnBl1
         q3uiVcL2PEtG8HVC1dVDpLUR3hezMmlo7Je5uWCoCVDjkAJlTicSdsjUoMguzjIL/Q4p
         qQ7NC6kp+xrtDHFj0fepKRJRjHutRJxhg8fleXxAnogoL8Lv7tiLMzzeA2LMLpwhgU5x
         nihA==
X-Forwarded-Encrypted: i=1; AJvYcCUj4RhyUuPrmV704Mrvp6TVcKL7IHQsyQqXBtGlKrjxIdWNSWlkGL52O0655r22/niSLtX89XzKoJK4k871vCh4pt6bkN2c
X-Gm-Message-State: AOJu0Yy5BjF8In/RcrfK6t3XAJIlK7wdT7n/Cm//JmV9It94LN05+jIH
	sCiQl3xygqb6+vIUt9KXIzA8WOiG6bW5IUsiei1LygTgaExLX/PB3zuCr1qhnQRQ4w==
X-Google-Smtp-Source: AGHT+IGBwHBmVWEtfqQ8PxmOLn331O1Ai9JQG4EVA0Iw5jAdFNzYlMmyBGZig4Rdz8QAXPFixUMlrg==
X-Received: by 2002:a7b:c8c5:0:b0:425:6424:5f97 with SMTP id 5b1f17b1804b1-4264b126c8emr23507825e9.5.1720117979387;
        Thu, 04 Jul 2024 11:32:59 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a283551sm33165625e9.42.2024.07.04.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:32:59 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:33:12 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 13/19] hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
Message-ID: <20240704183312.GJ1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-14-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-14-smostafa@google.com>
X-TUID: DSFvB0w3ZwZ8

On Mon, Jul 01, 2024 at 11:02:35AM +0000, Mostafa Saleh wrote:
> Soon, Instead of doing TLB invalidation by ASID only, VMID will be
> also required.
> Add smmu_iotlb_inv_asid_vmid() which invalidates by both ASID and VMID.
> 
> However, at the moment this function is only used in SMMU_CMD_TLBI_NH_ASID
> which is a stage-1 command, so passing VMID = -1 keeps the original
> behaviour.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

One small issue: the change to hw/arm/trace-events for
trace_smmu_iotlb_inv_asid_vmid() should be in patch 13 rather than 14,
otherwise the series isn't bisectable.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/arm/smmu-common.c         | 20 +++++++++++++-------
>  hw/arm/smmuv3.c              |  2 +-
>  include/hw/arm/smmu-common.h |  2 +-
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 5bf9eadeff..d0309a95b2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -159,13 +159,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
>      g_hash_table_remove_all(s->iotlb);
>  }
>  
> -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> -                                         gpointer user_data)
> +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
> +                                              gpointer user_data)
>  {
> -    int asid = *(int *)user_data;
> +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
> -    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> +    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
> +           (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
>  }
>  
>  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> @@ -270,10 +271,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>                                  &info);
>  }
>  
> -void smmu_iotlb_inv_asid(SMMUState *s, int asid)
> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
>  {
> -    trace_smmu_iotlb_inv_asid(asid);
> -    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> +    SMMUIOTLBPageInvInfo info = {
> +        .asid = asid,
> +        .vmid = vmid,
> +    };
> +
> +    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
>  }
>  
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e5ecd93258..928f125523 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1329,7 +1329,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
> -            smmu_iotlb_inv_asid(bs, asid);
> +            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index de032fdfd1..2bc9a03d47 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -212,7 +212,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
> -void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
