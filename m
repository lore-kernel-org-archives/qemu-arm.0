Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp766544ejb;
        Wed, 15 Feb 2023 10:54:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/GOUQP91N1jknHH7ud1dKvk7wWUfemqWwaN44/eaom/pGP78dKWawLzKAL2dOeX/pWMvJD
X-Received: by 2002:ac8:7f95:0:b0:3b9:b7c9:f0d1 with SMTP id z21-20020ac87f95000000b003b9b7c9f0d1mr5488511qtj.39.1676487253566;
        Wed, 15 Feb 2023 10:54:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676487253; cv=none;
        d=google.com; s=arc-20160816;
        b=BurDNQnbMuSK1f01G7/2HVP/UDJF1WRp2eVx5p5Gmb4zekOvtn0mZV/6VwqmyAuDA4
         nLhy8ZfmkQOV4r2La9I+I96mrUJ7qichMC4I5fIS5DkkymUUSPeO2f1lA+D2it/UKXiC
         P/ltkQ0tTXYjxg3DOmUPJAcEpIKAf795W/9HYTUPGusTM6XK3ZXfMIYTlTRn3rBOsFUJ
         yqD/TotZJN60QzyYj1IFUzg3Ak9D3yyPze8ZSxuSRQUDQ7zBOFpQWLSUK1zOSwjdpQ68
         /VvSTR5xVgxaadIprOt+7E5qLSz4Lq9iUjQIC/mdeWkEqHTkSLQ8kuyNCay9Z381/mB1
         Dl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gwo8u/u4G1nwOBopi2ARjFOYFBg/8QHvIBF01myTrK8=;
        b=qE+Sge28hI3CFUKkxsN2uh6FuLpsF/hsDADczIZoSKy8Y0F9/0jfANxqE7IcjqSEkz
         BO86SXPnVo/qJRvQD6Hb9ZblddqdDFq/ReRdsIRSi88HJ+3aKEDpIIr9qztWO6MNfytD
         PVmklNuV9NvWCM3MjN5YhKCJOVUz4mn/hW0sv+/BW4tVGjUFXm2xQjqIDeHpG3VEYt3K
         xOVWqsjTYQn7HZTWVSqdx2KTQrhn7RqsEyVPn4PqRrJtNulCBL4D0+8tuY0AT/D64FFf
         a7TBMkDtCZnM2SHEMjp+y71LtuDBg+xrKaPhyswpS68XNBgxs+kOiNZalHVFkcHGmtUm
         74RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YmIW+eA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a05620a248200b006fcc513ec60si15605808qkn.93.2023.02.15.10.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 10:54:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YmIW+eA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSMud-000466-EP; Wed, 15 Feb 2023 13:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMuZ-00045o-PC
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMuW-0006LI-EP
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 13:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487223;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwo8u/u4G1nwOBopi2ARjFOYFBg/8QHvIBF01myTrK8=;
 b=YmIW+eA3u0l83k9Ga4aTbFw1V6iEbIqWgOwZdT5qnf00haADAOxKCPw4N8dMZD4+fUAdat
 afQ/y0bdLQ0e4UHPVbp/Ba450/f+23PeDXkOL3JB9qmm6W0VQhuP1hL6MYvlYm++THtbeB
 7Gx1v10RjSJ5felkSFJiJDaS0flPAuU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-xV4mPQ47M8Si-Xv8lMdydA-1; Wed, 15 Feb 2023 13:53:42 -0500
X-MC-Unique: xV4mPQ47M8Si-Xv8lMdydA-1
Received: by mail-qt1-f198.google.com with SMTP id
 n1-20020ac85a01000000b003ba2a2c50f9so11754638qta.23
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 10:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwo8u/u4G1nwOBopi2ARjFOYFBg/8QHvIBF01myTrK8=;
 b=TLKLh94WMXZz1tFBqnKHHtQraKHSsrUSDBTOcsGJt11SRtBtb+zIFW15lk3OCdOlPQ
 gUJHc/gXmaeVAHpHq5MyZo5uMrNp8JWv9sH4kAX84+VNAQsP/4z1kxWTaoLoAXO5EwPm
 cx3FFpxmQMIQ6Df835IiRDY3HoYoyhdST8CKR1YENhyvUwjYxc383jCoAYS42RJnDZSr
 dhtlzF8hwcdr6F7pwAqJeU/H6vocO1HGD4Szpjdo9/m1o1wCm5x8+UNhg2UR6E6DEwiR
 4N9+Ho2Irgk63y5wc2Z/XG8xSxCo0TMhl8BqFLserfrgmk2/lxS1VhXKI4dIGvkemAER
 HkoQ==
X-Gm-Message-State: AO0yUKUV0EpH2ORb12+6zDgc4d/DKf+GMZ8CjOKPz1HZb8JAkQdpafKQ
 2wkZsVQwZ9MzGeIQGkyiwjS+0kT/N+ij3OQaJWaRVDZQfpOVowG0323/VPr9Pbp3R2bcq3LE9fQ
 nFpzXlC3KEObO
X-Received: by 2002:a05:6214:29ea:b0:56b:f017:c2e4 with SMTP id
 jv10-20020a05621429ea00b0056bf017c2e4mr4237886qvb.47.1676487221828; 
 Wed, 15 Feb 2023 10:53:41 -0800 (PST)
X-Received: by 2002:a05:6214:29ea:b0:56b:f017:c2e4 with SMTP id
 jv10-20020a05621429ea00b0056bf017c2e4mr4237860qvb.47.1676487221537; 
 Wed, 15 Feb 2023 10:53:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l67-20020a37bb46000000b0071d0f1d01easm14380652qkf.57.2023.02.15.10.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:53:40 -0800 (PST)
Message-ID: <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
Date: Wed, 15 Feb 2023 19:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page
 table
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-8-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-8-smostafa@google.com>
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
X-TUID: vwTmKrl3RcvM

Hi Mostafa,
On 2/5/23 10:44, Mostafa Saleh wrote:
> Check if with the configured start level, ia_bits and granularity we
> can have a valid page table as described in ARM ARM D8.2 Translation
> process.
> The idea is to see for the highest possible number of IPA bits, how
> many concatenated tables we would need, if it is more than 16, then
> this is not possible.

This rather checks the validity and consistency of the STE S2 fields.
The patch title sounds a bit misleading to me.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 6633fe40fa..c49b341287 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -341,6 +341,28 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ia_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ia_bits = 64 - t0sz;
s/ia/ipa
> +    uint64_t mx = (1ULL << ia_bits) - 1;
s/mx/max_ipa
> +    int nr_concat = pgd_idx(level, gran, mx) + 1;
> +
> +    if (nr_concat > SMMU_MAX_S2_CONCAT) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
> @@ -407,6 +429,13 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>              goto bad_ste;
>          }
>  
> +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                     cfg->s2cfg.granule_sz)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 STE stage 2 config not valid!\n");
> +            goto bad_ste;
> +        }
> +
To me this would need to be integrated into the STE decoding patch. This
latter shall be self-contained if possible to ease the review

Thanks

Eric
>          /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;

