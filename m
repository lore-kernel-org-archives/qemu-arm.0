Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3309662ejb;
        Mon, 19 Dec 2022 00:39:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5yYqszw9LVxylMAsO3TVGl+BnwodLZh0iBS+fHOSm6cPZC1M1ENl2EdHRbW8Z7J1Ef8arf
X-Received: by 2002:ad4:45a2:0:b0:4c7:797e:7788 with SMTP id y2-20020ad445a2000000b004c7797e7788mr56727286qvu.20.1671439185625;
        Mon, 19 Dec 2022 00:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671439185; cv=none;
        d=google.com; s=arc-20160816;
        b=D87WgOu6lfwB92+rFqhxY6bcHEYc8isBef6Gd76ImEIsDmkSbzcEfnNCAmI7tEtnll
         LlIgJAMosmVw56JI1fYXgaZhpg5EjK3U8iM5iXzUEjzwl6vXUSyYYYTwSbvk3Jwz7crj
         0zaA8ys6LfI/jkFJSypG/ajC4sJiAOGJnrAhMGSlsVhOeSb5KsAe61yvq9fsuzz/vBMO
         m6voGRif17mPmHZzQCrCrNbmAdmImQrPSpbC5/d6O6jDUx+FTkTsnTdXWUjAxOKlJvyB
         qpeCu+7AYiDFgWLC7UiPi1dbuyERHtl/ZfzlvJEFzUsQjhTirp+KaAiBf0O6e101hPk8
         2ToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oG0rO08Fx7LbBxHdq3/mbT068NXJDt5+pp7TEPRnHZ8=;
        b=l+A/JddXAZvYhCl+vjdUXTBRVTYaRP9Bk8Bdn+m6bdE8QI8SZuRxcnZQWpNPJVuhqT
         WwZIbKBd2b2/9Tqnr1P+ryQakwQGH/Z9iJPFfRtJnjaIA9GeeVKhrVKuwkAHKjeTDjGg
         pzN4ilXb5RVvOOQDO1gpCng6cxueP9itjghKxQtYFC4iKwLeg8EXRb8ONJ0bVwHx5jz/
         E/I1Tfsy2dXdmEaqPNRaiDeSCrDLy750oEL2wJu9yisVtk4vwy69q4WkvRcdtlYOHy1+
         DoS8p9/uH4ExBGQa2RCj33fZnB0ruWXuN8DX4179fOyXd895udDfOHXQxO+a4euGjBjN
         M7qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DP1fYE8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im2-20020a056214246200b004c6ad784ee9si3883810qvb.546.2022.12.19.00.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 00:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DP1fYE8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7BgK-0003IP-OM; Mon, 19 Dec 2022 03:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgJ-0003I5-Es
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 03:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgH-0006Ta-9J
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 03:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG0rO08Fx7LbBxHdq3/mbT068NXJDt5+pp7TEPRnHZ8=;
 b=DP1fYE8J8ZFPJW2TSjEq1c/Vm10erRosF4cfDe4bYYhnmAchHaqXKjxhmuS/MhihGbxm8v
 lcuihB+97FJM4r7KV9zeXGiKH3n6wfQI4ob6PTujyavS0eNls/qcN+rOp0eGMkY0JSVTAn
 1x67k+qGdTm1RO+3iz3JaYc5id0mkw4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-Lr1rh5HkMnyscYZAdXzcMg-1; Mon, 19 Dec 2022 03:39:25 -0500
X-MC-Unique: Lr1rh5HkMnyscYZAdXzcMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so6313366wme.7
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 00:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oG0rO08Fx7LbBxHdq3/mbT068NXJDt5+pp7TEPRnHZ8=;
 b=NkY57Q89ilqhvURZD5sfzExkXIq7g7sc1puMpgz12KPi8ZWHCa7MfsCz5TUUZ8DslV
 AQHHP6t3Bu8aVUmrPRa9nN2QX4cqSYhzd12oVt/l34er5x60xQnB1d6h+Ltn13L2gf+t
 mzT47CUr1NiTggVH5uLIr24Sjl+VUCLRqnoi7T7R/R4wMchwRhDYg+8VVsinc9GOQxal
 rzWu3GV/GfBTZzIr+I4wMdJb07Oklck4qGTTg7K/LEMeh3+8htih8HRDWqZ6mIXNOEpT
 gez2BeokSMLymsF3pJ3hq29D3mQ+BA47z7WXif5vZfa2moYLZUvBPIpST8MnweuuRSl6
 FFvw==
X-Gm-Message-State: AFqh2ko5FxCLPb02cJ5Ri8I+RZjNI2IYBBwjp9pLUenfgog7rkH9VhQ5
 dfWM08CCE218KIfopallTucwhxDsL9IfynAHlctgXuykQHQKVZ8cprehmDz73aTruevMemHlPEd
 AVjHqUeerLx5N
X-Received: by 2002:a05:600c:492a:b0:3d3:4007:9c88 with SMTP id
 f42-20020a05600c492a00b003d340079c88mr9573011wmp.18.1671439164782; 
 Mon, 19 Dec 2022 00:39:24 -0800 (PST)
X-Received: by 2002:a05:600c:492a:b0:3d3:4007:9c88 with SMTP id
 f42-20020a05600c492a00b003d340079c88mr9572997wmp.18.1671439164539; 
 Mon, 19 Dec 2022 00:39:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm20579860wmq.2.2022.12.19.00.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:39:23 -0800 (PST)
Message-ID: <7476b4b3-aceb-3694-520d-ae83430577c7@redhat.com>
Date: Mon, 19 Dec 2022 09:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Avoid using inlined functions
 with external linkage
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-3-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221216214924.4711-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: +zSfyVhs4+bt



On 12/16/22 22:49, Philippe Mathieu-Daudé wrote:
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
>
>   hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
>   hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
>     void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>     ^
>     static
>
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining, so these are likely oversights rather than intentional.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/smmu-common.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 9f196625a2..54186f31cb 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>      g_hash_table_insert(bs->iotlb, key, new);
>  }
>  
> -inline void smmu_iotlb_inv_all(SMMUState *s)
> +void smmu_iotlb_inv_all(SMMUState *s)
>  {
>      trace_smmu_iotlb_inv_all();
>      g_hash_table_remove_all(s->iotlb);
> @@ -146,9 +146,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
>             ((entry->iova & ~info->mask) == info->iova);
>  }
>  
> -inline void
> -smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> -                    uint8_t tg, uint64_t num_pages, uint8_t ttl)
> +void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
>      /* if tg is not set we use 4KB range invalidation */
>      uint8_t granule = tg ? tg * 2 + 10 : 12;
> @@ -174,7 +173,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                                  &info);
>  }
>  
> -inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> @@ -374,8 +373,8 @@ error:
>   *
>   * return 0 on success
>   */
> -inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -                    SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      if (!cfg->aa64) {
>          /*

