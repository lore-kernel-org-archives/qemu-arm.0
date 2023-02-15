Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp767321ejb;
        Wed, 15 Feb 2023 10:55:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+2dmKQ6HGi9hkxmUxjtcY4Tojyt/ftFUCTlsgQi77F9gvWruSYLv2U7VqJLlXbAQ8JpJn1
X-Received: by 2002:a05:6214:2686:b0:56e:a352:cf6f with SMTP id gm6-20020a056214268600b0056ea352cf6fmr6369075qvb.52.1676487344844;
        Wed, 15 Feb 2023 10:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676487344; cv=none;
        d=google.com; s=arc-20160816;
        b=m5hqgWvr08qP1FHot/96c9wLfhguD1hVmzx25TAInsfCEXKYpbRBn+Gn3wk39nNDHC
         y06mybq6WppflJ/Z8kWlPlemeeT2PvVZWRJ2+7Oug2ODdag7WBWmgDL21uXU65ypnl1d
         CC9K75TP8Icfldw9uv3Yw9DOqTkUI/bmnzKgYmSTKagfxFnhXMxX7E08nAT4xDUb0E5F
         IF0HN2HOuHbtx/OCdgHAZY5VbkVjgp1AzwCsJLFAePpvEYSlRDqc11KNg3YKiWmmc5CD
         wGHr7nZanFSPsedENCR1yTO4ohGaWd7LOeB9MIa8eQ7MjxvP5Us+IyrexRSjmu9p5evh
         EkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sHgPSsY5tsE4Bl4KPlfDiI+7AxE3H2cnXZaZIM67PSc=;
        b=xQsgOImCmenInvN4ZIIGojXt19Z6WqwmBUTnUEKB150cOOv4Atc7UsK3H35rBeyIzi
         1PJy2jtgVhYw9Yf0MjjXJ+as7ux+Mtxbdlv8qE+v3Tngv15a11DYYGsCxTMK2pM5F4ZH
         WD38nBjl/PbmEt/qbjsXi3LoJCuSM40MYNCQx3QcTmnJHIVZqTAWdfg2rKmFh0O4VSE8
         h51QLNFY0HqliuCUgvkna9723zwVXx/Nlt7k2953VKQi9nRa7MqVF+bt1evy2LHMc6LY
         OGACtSYJtVSdDiQrmAESVrHkDRlYyPmGtMP0XaWy81hwPHyklzSz7/CIPTeflAFEA+oA
         /ycw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a7SsyjF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a0cf2ce000000b0056c242d9f79si7125306qvm.554.2023.02.15.10.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 10:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a7SsyjF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSMwJ-0005RR-Du; Wed, 15 Feb 2023 13:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMwI-0005RB-Is
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:55:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMwH-0007aV-2j
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487332;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHgPSsY5tsE4Bl4KPlfDiI+7AxE3H2cnXZaZIM67PSc=;
 b=a7SsyjF2BRZFcpqrQl4JN1dhDrNspx6o9wop/yrh8P/F8A+GJzkeCJgJ4oagiOUV8HqrHa
 A+QSw5sEKtXKGMw1TzRVYedOHNTOfuZgv6zOkkG5wxxLFIqP6KOSEAiPjh3DZouJdnQ16T
 bKGA1WnHFm7+Fg+jVRm22dSxaZZWuf0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-I9xdt2f0M5a5Xf_e6Z7Sxw-1; Wed, 15 Feb 2023 13:55:31 -0500
X-MC-Unique: I9xdt2f0M5a5Xf_e6Z7Sxw-1
Received: by mail-qv1-f71.google.com with SMTP id
 ks3-20020a056214310300b0056bec2871e8so11127286qvb.1
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 10:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHgPSsY5tsE4Bl4KPlfDiI+7AxE3H2cnXZaZIM67PSc=;
 b=TDi7796dzXLZcJ5cm9QKd5lpQgFOuKumKGxzxrO0R+T457T421yJJrceDpw2WnptKS
 ZODvzfRnBRcMQjfz78jbYiLeOxyXUx+cEZjsYWN/X1ZFRrU0m+VYRNTRyKStipAhlDgb
 Se8YkzP1bezobAAxQ8amBaeRvNLYAJjBU+eJxExYmgjU3YEvmDcNH1DUJ7/wQfpmDNMB
 UtgmUpV1FahC3I64w+xk5cbykO5vNa8EStaKNx7YbZNcoM/ebkxFf84Ed5KUDx+PdNA1
 RRlaqF6lgDAVG2YR3+XnbVHE2p7FytOAcgnDQLHbXgRuzBRK2VXRAlbjRRH9cNtEgDNk
 QcDg==
X-Gm-Message-State: AO0yUKX6Abu6WYR0F3c30zMR+XPMhMI7o2+GtZcry15tot0jLob0Hqp5
 xuGl/2iMzMX1fUzD6hqiDAKdxPxJZSwJYUXmtK/3hpyrwV4hKL5lgnPE9zNdsqkODLThBNF+QL7
 8+HidmIhaDvGo
X-Received: by 2002:a05:622a:1447:b0:3b6:3596:182b with SMTP id
 v7-20020a05622a144700b003b63596182bmr5066229qtx.36.1676487330683; 
 Wed, 15 Feb 2023 10:55:30 -0800 (PST)
X-Received: by 2002:a05:622a:1447:b0:3b6:3596:182b with SMTP id
 v7-20020a05622a144700b003b63596182bmr5066208qtx.36.1676487330424; 
 Wed, 15 Feb 2023 10:55:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f18-20020ac80692000000b003b9e1d3a502sm13628343qth.54.2023.02.15.10.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:55:29 -0800 (PST)
Message-ID: <7300b312-d58b-fdab-a72e-6ee9d0a1aa95@redhat.com>
Date: Wed, 15 Feb 2023 19:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 15/16] hw/arm/smmuv3: Add fault configuration for
 stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-16-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-16-smostafa@google.com>
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
X-TUID: oa6vFskK9tY9



On 2/5/23 10:44, Mostafa Saleh wrote:
> As stall is not supported, if S2S is set the translation would abort.
> For S2R, we reuse the same code used for stage-1 with flag
> record_faults. However when nested translation is supported we would
> need to separate stage-1 and stage-2 faults.
same here, please squash that code in the STE decoding and possible add
those above comments in the commit msg

Thanks

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h | 2 ++
>  hw/arm/smmuv3.c          | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 3ccb9d118e..ccdae81db8 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -528,6 +528,8 @@ typedef struct CD {
>  #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
>  #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
>  #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e0976ac236..5f792d96ab 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -446,6 +446,11 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>  
>          cfg->s2cfg.affd = STE_S2AFFD(ste);
> +        cfg->record_faults = STE_S2R(ste);
> +        if (STE_S2S(ste)) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +            goto bad_ste;
> +        }
>  
>          /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");

