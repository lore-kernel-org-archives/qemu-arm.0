Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp720981ejb;
        Wed, 15 Feb 2023 09:48:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZZ80iHXU8iTpHTf384J5hvIU3bMFT1m67+wKvydHvO3tCQPi7RnCDRvGT5sdx1HJVEQbp
X-Received: by 2002:a05:6214:508f:b0:56e:da8b:c4f2 with SMTP id kk15-20020a056214508f00b0056eda8bc4f2mr5632712qvb.8.1676483302085;
        Wed, 15 Feb 2023 09:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676483302; cv=none;
        d=google.com; s=arc-20160816;
        b=lbqxeobdp+fN0HAkAKNf7Vv4T86Ineo7d/JYwD9qi5QWL2jO2wLo2u3AzxNaUE0bl2
         9NLaV41cliPhPGbRYW8lkfLt0QfLt6YgM8ruyz82ddEmIFsofgv2ujsV0Mb8nqtOeqSK
         y0yUoM+IxwNPpQYXp+3fyxyuwfu/hHVL1F97RyIkMY9RlNS+xXNvTQ/x41oOVg3avixJ
         O1KJnnCTHFPa3l8bLHHamKQDQsO13OFTA5ylTS7smXBqc76POLAPId1pEJVU1IYzVPiw
         Frkay49LZAW1w1lttVVxFfU5tkRwmjEvEhjfE02aN0yZGDOfhyXspdM1iZn41vpqs+RS
         jNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nAJkqMrv/Ar9KRSVWexH7O6gB/SMYW13Xpo5A9dUpzc=;
        b=yWlbTROpKutHrcqSoR2zZg01GgRoEzazjWDuleOLrkahOVk19m5nAaNpctSr1/u/MO
         llOo5Z/UBLtdf9L83KusRdMT8i2WO4iokCoRk6Oq4aGkFM/1rJGoZ+2ItZC6FGwukUK6
         QkUqvN3SC1MwBIBfitYgO0Cj+9GkB0NrtF7ncOIRIKShdzGEzNmKYpkz+DfBJqf/BqD7
         7NSsmtwFeUfkyo2eCQas0RQdBWmDizg4UsibiLF3+KwUvXDqPGDEMYqFpE8CCQXb/ce6
         0kctp1T7hrYD4ge00EfhX6d7lLjVKfD517vnHeH71EfZ2nrTM8TyJ6zfn+WQptxbU+jF
         KKwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZpNOy2dk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a0cb347000000b0056b077e7f42si14720650qvf.476.2023.02.15.09.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 09:48:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZpNOy2dk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLt3-0005uA-HV; Wed, 15 Feb 2023 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSLsu-0005lb-LU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSLss-0005Hq-QJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAJkqMrv/Ar9KRSVWexH7O6gB/SMYW13Xpo5A9dUpzc=;
 b=ZpNOy2dkh5ryElcETVLMXZffDJARptr9RzpIzYtwLt/3IHmWwUSEn7p5YxqVuUoYULxO9d
 XJw3JkEabgeHaKpgIbVxNewtN8TXtrF+/1yn/zkUjwD0zCZsC47N6e1AgTMASaGhQWfztn
 5mAumqV7ofBF0oWDZ4r6IAROlWv1FDQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-6OVBRF_GMJS6l72Nq0mR8Q-1; Wed, 15 Feb 2023 12:47:56 -0500
X-MC-Unique: 6OVBRF_GMJS6l72Nq0mR8Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso11448009qtb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAJkqMrv/Ar9KRSVWexH7O6gB/SMYW13Xpo5A9dUpzc=;
 b=3fAkdhX7s4HYkwmhhAAh2d5RAWseXSUilPiUn+oiRnuols6PjlThRV+sk2gZxImp2O
 gLNhTA2s5Pbwz9helhhf6IkRFRBNVGwdu6b3lqyDkWZCME6K6VCp0Awhux27OUzDEgms
 P172Nmp+DlN9oiy1EFltLmf2yLNNtguS+xKIDm0UTbuFyu7QmIMIFYu++Aj+vftCv5GZ
 l1liHYQjckd+UTtErOlGSPWNQVhnb/XLlQtQ74iyM3vqPOwzjZzOlQ53v2mgUZEfnAf3
 CJYQOWp39Ud2S83udFfjSPaE+5N/g6GIm/On/XXIy89wE3aWEuLkAMo9lmtZzWpdXO6q
 8JkQ==
X-Gm-Message-State: AO0yUKXfmGwWBMeMvQYD4+EAS5fLk2RfiMLzdACs0HAAP5jOwoZyU6Dl
 mjXZal4yNb7yWy9SS9VTgyEW5RFm2XXKF6bg0zJ1+uy6Aa63MRZsnDzFBllws8pgreHoa0v2C9W
 Ln1a1dbddHYd34L8=
X-Received: by 2002:a05:622a:393:b0:3b9:c019:b134 with SMTP id
 j19-20020a05622a039300b003b9c019b134mr5581186qtx.4.1676483275841; 
 Wed, 15 Feb 2023 09:47:55 -0800 (PST)
X-Received: by 2002:a05:622a:393:b0:3b9:c019:b134 with SMTP id
 j19-20020a05622a039300b003b9c019b134mr5581158qtx.4.1676483275534; 
 Wed, 15 Feb 2023 09:47:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o2-20020ac85a42000000b003b630456b8fsm13843712qta.89.2023.02.15.09.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 09:47:54 -0800 (PST)
Message-ID: <3086b46d-b7dd-5403-f0c0-7051a7fbc189@redhat.com>
Date: Wed, 15 Feb 2023 18:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-7-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-7-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Jsvjj9TIpjT

Hi Mostafa,

On 2/5/23 10:44, Mostafa Saleh wrote:
> Parse stage-2 configuration and populate it in SMMUTransCfg.
> Configs in this patch (s2g, ttb, tsz, sl0).
above 'sentence' a bit cryptic.
> Checking validity of values added when possible.
>
> MAX IPA supported is 48 bits and only AA64 tables are supported.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c              | 43 +++++++++++++++++++++++++++++++++++-
>  include/hw/arm/smmu-common.h |  1 +
>  2 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 54dd8e5ec1..6633fe40fa 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -366,7 +366,48 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    if (STE_CFG_S2_ENABLED(config)) {
> +    if (STAGE2_SUPPORTED(s->features) && STE_CFG_S2_ENABLED(config)) {
Don't you want to check both S1 and S2 aren't set?
> +        cfg->stage = 2;
> +
> +        if (STE_S2AA64(ste) == 0x0) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "SMMUv3 AArch32 tables not supported\n");
> +            goto bad_ste;
> +        }
> +
> +        switch (STE_S2TG(ste)) {
> +        case 0x0: /* 4KB */
> +            cfg->s2cfg.granule_sz = 12;
> +            break;
> +        case 0x1: /* 64KB */
> +            cfg->s2cfg.granule_sz = 16;
> +            break;
> +        case 0x2: /* 16KB */
> +            cfg->s2cfg.granule_sz = 14;
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.vttb = STE_S2TTB(ste);
> +        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
What about IDR3.STT currently 0 so S2T0SZ <= 39

don't you need to check against SMMU_IDR3.STT/S2TG

• In architectures after SMMUv3.0:
– If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for
this field is MAX(16,
64-IAS).
– If STE.S2TG selects a 64KB granule, the minimum valid value for this
field is (64-IAS).
> +
> +        if ((64 - cfg->s2cfg.tsz) > SMMU_MAX_IPA_BITS) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 IPA too big! TS0Z = %x\n",
> +                          cfg->s2cfg.tsz);
> +            goto bad_ste;
> +        }
> +
> +        cfg->s2cfg.sl0 = STE_S2SL0(ste);
> +        if (cfg->s2cfg.sl0 == 0x3) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "SMMUv3 STE->SL0 0x3 has no meaning!\n");
> +            goto bad_ste;
what about S2PS, S2VMID?

you may either squash [RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from
STE into that patch or at least mention in the commit msg that S2VMID
will be dealt with separately

Eric

> +        }
> +
> +        /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;
>      }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1e666e8b6d..7906e359d9 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -28,6 +28,7 @@
>  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>  
>  #define SMMU_MAX_VA_BITS      48
> +#define SMMU_MAX_IPA_BITS     48
>  #define SMMU_MAX_LEVELS       4
>  
>  /*

