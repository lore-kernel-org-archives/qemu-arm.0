Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6502978ejq;
        Mon, 15 May 2023 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UgNyKKEKUdRLBzj3XssRvKapEEbI93ZVGt85fAEQlKwL9qNjdsmDxX6MQh1zXu4HdmrfU
X-Received: by 2002:adf:f5c6:0:b0:306:b3f8:690f with SMTP id k6-20020adff5c6000000b00306b3f8690fmr30896719wrp.36.1684156555293;
        Mon, 15 May 2023 06:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684156555; cv=none;
        d=google.com; s=arc-20160816;
        b=vvO/pGMPT/ru4CEJpsHjmRZ+tDsM+qDs1yarV6otBWxPCm3LwqnxpwyvssQjtHleBu
         +Q+lJD/vRf4kdg1NvmXDfDj2y7QtF8+no0b1h0GGrj6Eam/K6nSVFAer92Ix76QHnDER
         67jiLCws6TLW6rT6ij8o362gC50f2COVlzg5apyGl7pMnu9GDDrieDY/ySn3Tu0R93VU
         kRm4k5YGWGuXldgGavGoqtNlzloX+RF8SqS2haHl9i5eBqgM4PQ6oZYo+lxQPP5Dg1ug
         yoNLOep0s+GqmhBAX4MKU0T6OU1quxFgCOUVVD5YC7iV0ktFnN+Z3go/ZORLaRwsdntX
         ehaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=An+6psAfYyYe4wNRwE+HNKgZlN7pQ94M0TMeOm6ieos=;
        b=WU9nid3I1WUCM9vnMCjCOsP4mJu1RYXnfMrNJF22FstfJDJoTle6jLaFXkQw7KDcYg
         Q/Csdi5WY44oO6pZImkIm9jD0PyPpsUzRVy2n/a2PjY6nXx4frquLM3VV3hr78QVum9Z
         V6jzjgqb956lHAkbgWr92NVErM22woqKGv9kCiYkwlht3S35CNjxOhTKnZZTqyjxGOkV
         dhM/6/NtjZ1ZabZjrS/+0ecJhRQl0vs+Gy71WJ4ELOfUKtOUxsSdArf9GIYUS6EQhtXY
         x0f7ITVQWRUEgxX4kzHj0VNiz8rxdC0xe6/X5c20ebmSFCwmZc6JznfmTPx2b09gXBhM
         gHOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ckSWgdgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a5d414e000000b0030794a35e80si12320992wrq.1028.2023.05.15.06.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 06:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ckSWgdgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyY3H-0001ua-0L; Mon, 15 May 2023 09:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyY3C-0001qd-UI
 for qemu-arm@nongnu.org; Mon, 15 May 2023 09:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyY38-0003XA-S0
 for qemu-arm@nongnu.org; Mon, 15 May 2023 09:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684156537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=An+6psAfYyYe4wNRwE+HNKgZlN7pQ94M0TMeOm6ieos=;
 b=ckSWgdgke6hI2QvHTi1ciH2WZMG0LH2xpgydEjYGbp3OF+NmPsPhFvZBDZO3U0Hows4dX2
 9VSPiag6NeTcGnmsGukv2GETJu1gwCPCsrBDS3mprEpUByKlCtNFsnaNi/Z0l846zNlMsP
 jwUzMUQvDMsq4+VyLDnMydSp1nbIJus=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-1175eP6_Ol2bZfAg0HLkTg-1; Mon, 15 May 2023 09:15:36 -0400
X-MC-Unique: 1175eP6_Ol2bZfAg0HLkTg-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f38c97c8acso55674911cf.2
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 06:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684156536; x=1686748536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=An+6psAfYyYe4wNRwE+HNKgZlN7pQ94M0TMeOm6ieos=;
 b=BalAn1bS2r3TAhJRF7GjV/htXXCAUnY9bkAkUhrrlC09BvEUNphCu7lIWGUJ5ctx3W
 A/yu6/DjkYBiH6HcIJXKHd55ashGFaXbOICm26RdnYNrJrWKy0CEKkj9O76AvcysOg8p
 91I7p7bZzbGWvoHmyiaBEqKzdBJJ8csQOytficvn2L8/5JkP6CsZ9F1KGN6OoUBPvW8c
 hgh0D4DiOdE1iLhVyPxSxUN7v32bA1k5b2KHPVUJsBBzGNGEnfAF5GWF/mA6DFwHC0Vb
 iq3SDbQd+qtjVfu5V79KX/DSXEGj585vsMwel63SwTzYrRojOD0x1jA3j9D7TZrqXGDJ
 ZvAg==
X-Gm-Message-State: AC+VfDyWh7kNo5vk1sKAK1imui9VgXFfM+jjEuTG79jyhUXc/ohP/Ph/
 4vT89zI6NgTttZyRLGC9LrYhIGPa/ogLzTqoo0UWwxiCPl0HXCY9dU44fhntJhemmJO8cjB/HpT
 eCs3zB+JHXca9
X-Received: by 2002:ac8:7d14:0:b0:3f4:dfba:8220 with SMTP id
 g20-20020ac87d14000000b003f4dfba8220mr31879815qtb.50.1684156535873; 
 Mon, 15 May 2023 06:15:35 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:3f4:dfba:8220 with SMTP id
 g20-20020ac87d14000000b003f4dfba8220mr31879776qtb.50.1684156535540; 
 Mon, 15 May 2023 06:15:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05622a174400b003f532993912sm428797qtk.74.2023.05.15.06.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 06:15:34 -0700 (PDT)
Message-ID: <4b41c86f-99e5-96e8-6fba-692f73006dcb@redhat.com>
Date: Mon, 15 May 2023 15:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 10/10] hw/arm/smmuv3: Add knob to choose
 translation stage and enable stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-11-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401104953.1325983-11-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.811, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qGhho6AfI85o

Hi Mostafa,

On 4/1/23 12:49, Mostafa Saleh wrote:
> As everything is in place, we can use a new system property to
> advertise which stage is supported and remove bad_ste from STE
> stage2 config.
>
> The property added arm-smmuv3.stage can have 3 values:
> - "1": Stage-1 only is advertised.
> - "2": Stage-2 only is advertised.
> - "all": Stage-1 + Stage-2 are supported, which is not implemented in
> this patch series.
>
> If not passed or an unsupported value is passed, it will default to
> stage-1.
>
> Advertise VMID16.
>
> Don't try to decode CD, if stage-2 is configured.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - Squash knob patch with stage-2 enable patch.
> - Don't try to decode CD, if stage-2 is configured.
> ---
>  hw/arm/smmuv3.c         | 34 +++++++++++++++++++++++++---------
>  include/hw/arm/smmuv3.h |  1 +
>  2 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 826aacf8b1..22b5613d4c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
>  #include "cpu.h"
> @@ -248,14 +249,20 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  
>  static void smmuv3_init_regs(SMMUv3State *s)
>  {
> -    /**
> -     * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
> -     *       multi-level stream table
> +    /*
> +     * Based on sys property, the stages supported in smmu will be advertised.
> +     * At the moment "all" is not supported and default to stage-1.
>       */
> -    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
> +    if (s->stage && !strcmp("2", s->stage)) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
> +    } else {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
> +    }
> +
>      s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
>      s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
>      s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, VMID16, 1); /* 16-bit VMID */
>      s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
>      s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
>      /* terminated transaction will always be aborted/error returned */
> @@ -458,10 +465,6 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
>          goto bad_ste;
>      }
>  
> -    /* This is still here as stage 2 has not been fully enabled yet. */
> -    qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> -    goto bad_ste;
> -
>      return 0;
>  
>  bad_ste:
> @@ -740,7 +743,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    if (cfg->aborted || cfg->bypassed) {
> +    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
>          return 0;
>      }
>  
> @@ -1809,6 +1812,18 @@ static const VMStateDescription vmstate_smmuv3 = {
>      }
>  };
>  
> +static Property smmuv3_properties[] = {
> +    /*
> +     * Stages of translation advertised.
> +     * "1": Stage 1
> +     * "2": Stage 2
> +     * "all": Stage 1 + Stage 2
I don't think you should talk about 'all' at the moment.

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> +     * Defaults to stage 1
> +     */
> +    DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void smmuv3_instance_init(Object *obj)
>  {
>      /* Nothing much to do here as of now */
> @@ -1825,6 +1840,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>                                         &c->parent_phases);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
> +    device_class_set_props(dc, smmuv3_properties);
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 6031d7d325..d183a62766 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -62,6 +62,7 @@ struct SMMUv3State {
>  
>      qemu_irq     irq[4];
>      QemuMutex mutex;
> +    char *stage;
>  };
>  
>  typedef enum {

