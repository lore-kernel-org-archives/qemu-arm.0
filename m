Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp674034ejb;
        Wed, 15 Feb 2023 08:53:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/gVD0QcFO15TRO3s8NdTEG2P3AZr9wgWO/44s9MISiked9JgKT8u3q/LuBUTiXvtzqRYdh
X-Received: by 2002:a05:622a:1116:b0:3b3:b92f:3650 with SMTP id e22-20020a05622a111600b003b3b92f3650mr4371108qty.62.1676480017100;
        Wed, 15 Feb 2023 08:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676480017; cv=none;
        d=google.com; s=arc-20160816;
        b=Ut7ksrnhFu42BMJT5A9auXz/qpKCL9rslxDmthiaXu5gkIFyheX/6r0hRsggI2go+M
         ilLGw8DJRzJgPIf814Wusk89pBsdf8rP942Oq6+nIEu06hRc3jN+Dt7E6TnmHuuBWCJo
         z0bI30NlJ5SLN78KNddxia977F7NoA9viLOeUFHarzkO5aAwTYpGrUYuyeoQpJeX5FUa
         /fuWSmw1EU6zvsi2wEvLq3gjgxZ0KCWd/LVQmVRbkKSMPsfmJmmoyj2ji0slhHPwCT9L
         pQ6T+gjktAhFsr0ahK84/c9FbsE9FEYvdIC+lwdFbZLvIAgAZu//s+/ozzDJNJdxWIdC
         tY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6DyEQ0ssRz6jKJymW6QFmq+3seEU9MM3fb0kcX98Ckk=;
        b=FHQo+Kqf+ZbfBA1Nkll+7YLIpa89jOggBCNBGm5j+iL5ZzLQNQZJBsx1OqMH5vdg3m
         PE+WgW9xh7mQMzoTksr7wHKn8S/qnybN7AbLcElcGAd4ERNsZcyuhwgDLdkBHXHRePzl
         FJfy8aQTj0J6bUOXwtQwbqLQOkPqJz8+Z5wXoHLb/f+2TUQp58NaWTuJYMaI3VzV1JVb
         TGcUMdgcI8wwNpO0vyh7Smty2W6uiYlp1Z3c7ygVAHk5o6dqLEn0JR4t492CGXVF+ec5
         ANEQgW6wLfgiccdJurySIydeuHYWDprVxsD8nxjXysnnYY1XfOpqDyx7SeCynZRcCZms
         NRLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQ6pbpxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r204-20020a3744d5000000b0073b84a0ab05si80303qka.375.2023.02.15.08.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 08:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQ6pbpxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSL2C-0003gK-5u; Wed, 15 Feb 2023 11:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL2A-0003fV-8O
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL28-0005Pc-Mk
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 11:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676480008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DyEQ0ssRz6jKJymW6QFmq+3seEU9MM3fb0kcX98Ckk=;
 b=HQ6pbpxCMt9ufTOhvKjEF9aXxEqHYP7/BKkJnN1e5qa5zO+9knVyyJcsNaPWzcte3Llunp
 K0IRQMKUEXAPbaJYklgrsNGDM6CxUi6zyqaILl21W8k0erl3NSnzd8tLqF4AhhgYIgsFk7
 +DQX/7db7hAznhi6AW41IMNxscT9Spk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-iTvz0kIAOIaWUlQPGJyPxA-1; Wed, 15 Feb 2023 11:53:26 -0500
X-MC-Unique: iTvz0kIAOIaWUlQPGJyPxA-1
Received: by mail-qk1-f200.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso11906702qkp.20
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 08:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DyEQ0ssRz6jKJymW6QFmq+3seEU9MM3fb0kcX98Ckk=;
 b=Tr7lUGkazRy+fFPNHh3UVeS8HPTlP3lPEBpfa0ayMtWSoN0ZlXqt1Us0RSkhpybw1P
 n4uY/EMUZP3eaOGHEH3cKDFoPpbOQPzhsAmLKtizf/wDGYt4oTY7xJuz8A6G9gcazyeE
 yrAWjDowBAqbSkOK2c8ZfjXgLBPZvl4FE09DIHGI3U7kv/CLZE+cp7HCOOnr1rkFtff3
 XOSL4WJjdifypC+N2LYhbXt4UGQsRD2x18ocTXi/rbx9VLf4oUQYK3cH4Wt0+1i1hLV9
 lvSzSZZESPYULccEuhNuUDMcrDjovNaWrUD1w1OQ8rTclgJJEwFNyPOyJ254C8quR1LD
 9gGg==
X-Gm-Message-State: AO0yUKWh5bL6ZRZbOAAaWqGvqLKUD3WaFeYb4/69EcFAZnJpbSgoLKwO
 cOBFg1N2WtI5iRR1Q3THYmIWNeP1BxsveRVQ2/uX+jffE9NGUM724qCk3q26HE6liu++zgw1XTy
 dNeE8oopFHUXK
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr4556538qtk.57.1676480006270; 
 Wed, 15 Feb 2023 08:53:26 -0800 (PST)
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr4556512qtk.57.1676480005997; 
 Wed, 15 Feb 2023 08:53:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d19-20020ae9ef13000000b0071ddbe8fe23sm14132155qkg.24.2023.02.15.08.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:53:25 -0800 (PST)
Message-ID: <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
Date: Wed, 15 Feb 2023 17:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-4-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: AScQ/MhHrU3P



On 2/5/23 10:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support. Rename smmu_ptw_64 to
> smmu_ptw_64_s1.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 54186f31cb..4fcbffa2f1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>  }
>  
>  /**
> - * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>   * @cfg: translation config
>   * @iova: iova to translate
>   * @perm: access type
> @@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   * Upon success, @tlbe is filled with translated_addr and entry
>   * permission rights.
>   */
> -static int smmu_ptw_64(SMMUTransCfg *cfg,
> -                       dma_addr_t iova, IOMMUAccessFlags perm,
> -                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> +                          dma_addr_t iova, IOMMUAccessFlags perm,
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      dma_addr_t baseaddr, indexmask;
>      int stage = cfg->stage;
> @@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>          g_assert_not_reached();
>      }
>  
> -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
May need to rename the trace points as well

Thanks

Eric
>  }
>  
>  /**

