Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03362E776F0
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 18:38:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYTkK-0001kX-NN; Wed, 24 Dec 2025 13:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYTkE-0001d8-Q5
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 13:37:58 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYTk4-0004qX-1t
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 13:37:50 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64d2c50f0d6so5407515a12.3
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 10:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766601464; x=1767206264; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWkVdt27nVyShdZ50B07UJ5etLSAz32Ld8eCMPSHMio=;
 b=UVSyomBnNFbLh7zPPeghLGcie4v200tUnKSWsUpWL2cn456YAlic4BkTvi+tBys6ky
 QG8C/itf9RNc9bVnf9oRurWoO6Qk7aj2GT4iCZQYaawxMNa2wV9hAmFE8/K8xccNd19T
 bViDmA0+XrFJOsvQFcTl6J+d4UdhaxAFRCMg+tb0LVLNEN143VP7ifqzcFDona6lFIQ9
 M0wt5Pqg3XlJZjSSDDr+/a3Qso/aGwVJ/cx4OCXl3IbCXC1qFc5IQW8YyumjbI0+Y+bP
 MiPUQX6SNTm9h4ULoRbZuwdryvaaFHKWngGvWx6M8mchWXHjC4RkQsdR63tktzmQx6Fs
 y0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766601464; x=1767206264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JWkVdt27nVyShdZ50B07UJ5etLSAz32Ld8eCMPSHMio=;
 b=cZYcoGWoLIzfaZuhLonM8HD3MojBTYMJ+/ht7E3RQHMBfchPD9CgkIs/Gwn/dWViZt
 u1p2l1TVGbcreANoYN4Xg9jJ+US7LlIHoRty5FCu9c7xzVRFxDs3qxLj8ifYA7/yhZ1D
 lRt/WCHqFaM/DZnMTEr6LAZpA9dnBiPf3ButC3rWNVvuYTg/NhO/xapPoKwREmJsURhB
 w7PDkufzitP+PwwjpOG5LPBYRoHp3yLZxTuWXFzkJ/KXAvyVeu9o2JmBK/jp0LH/F7Qj
 r0tgTwoND5BAFq5q7YixER1tR09EVfD1VQKMYnD7KK5xOhEEw+0f+oWXJBAcClXAy4ZL
 INFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCA6uo1R7Aoopa64y4S5RGcrs5tLXfQ7ENPvwnlAv7aZC8IsrQTuq7Ns8LEEFh+VigE6ubfpWFBg==@nongnu.org
X-Gm-Message-State: AOJu0Yz7Dv8Uh3Z47ODjT3L2fTS0g5Xgzn6/NlcOaCt0ZQyKGafPgPrd
 GsxmbgJhhUDNMuUD+erzICQ+QDecLn1UAKctoZpaAst9VCShcTbVOyoOqfkbx2I1wilQb80kTFr
 dmP/9yzYicgNh5nYQe8kUYRQ9pSbSQxaAEmnkoEP8zg==
X-Gm-Gg: AY/fxX7Tzu4nBuhtq0EYJi7JD2yW6pjpV7PucU7A0vu3P6FQidnZe0BnmxzWEockO/v
 tAXg5ek0n9VZQDol1wms5JezA/S8FWSn3t9F4Vx4BxOWn9mL5wLmkTPZj7FcV0biNGOEZZqKIVA
 0ysVE4QR/FhQD3DIdBUIQ9/zpN9HXnSyZwvZ0HDTsST12i7wUSzU4VLEJnoD9wASCVMleQrz0NN
 DrnIRTf0sco5zhnn4xHKNu9EQhnxv0E8oYLlqfPTKZ8Qyn5/bPpRRE9zJ20PRxvz8aiAfA=
X-Google-Smtp-Source: AGHT+IHncGsfHzoZ+DObaqMprM/Chy754T8dYyUt74eH/x0x010eyKO8a2CzSzSuMJWcpoIzdtYzvhYwUDUfQdYIc0I=
X-Received: by 2002:a17:906:209a:b0:b80:5aef:c30f with SMTP id
 a640c23a62f3a-b805aefc453mr1005782766b.44.1766601464040; Wed, 24 Dec 2025
 10:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20251224151351.86733-1-philmd@linaro.org>
 <20251224151351.86733-9-philmd@linaro.org>
In-Reply-To: <20251224151351.86733-9-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 24 Dec 2025 20:37:18 +0200
X-Gm-Features: AQt7F2oX57Ld59PIX_s4TWSvF2wPFN_Vb8awqAT1PYQPJUNJie7WAxAQR4F69Uk
Message-ID: <CAAjaMXbBD+qU1tv3OMTxgAsCHUPpWYgaqRYV8WHHjV=n11xvTQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/virtio: Reduce virtio_lduw/stw_phys_cached() scope
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Anton Johansson <anjo@rev.ng>, 
 David Hildenbrand <david@kernel.org>, qemu-riscv@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Dec 24, 2025 at 5:15=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> virtio_lduw_phys_cached() and virtio_stw_phys_cached() are
> only used within hw/virtio/virtio.c: reduce their scope by
> moving their definitions there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>  include/hw/virtio/virtio-access.h | 21 ---------------------
>  hw/virtio/virtio.c                | 21 +++++++++++++++++++++
>  2 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio=
-access.h
> index c866769cad8..5b5fff5295e 100644
> --- a/include/hw/virtio/virtio-access.h
> +++ b/include/hw/virtio/virtio-access.h
> @@ -102,27 +102,6 @@ static inline uint16_t virtio_tswap16(VirtIODevice *=
vdev, uint16_t s)
>  #endif
>  }
>
> -static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
> -                                               MemoryRegionCache *cache,
> -                                               hwaddr pa)
> -{
> -    if (virtio_access_is_big_endian(vdev)) {
> -        return lduw_be_phys_cached(cache, pa);
> -    }
> -    return lduw_le_phys_cached(cache, pa);
> -}
> -
> -static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
> -                                          MemoryRegionCache *cache,
> -                                          hwaddr pa, uint16_t value)
> -{
> -    if (virtio_access_is_big_endian(vdev)) {
> -        stw_be_phys_cached(cache, pa, value);
> -    } else {
> -        stw_le_phys_cached(cache, pa, value);
> -    }
> -}
> -
>  static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
>  {
>      *s =3D virtio_tswap16(vdev, *s);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 257cda506a4..fba9d347d17 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -216,6 +216,27 @@ static void virtio_check_indirect_feature(VirtIODevi=
ce *vdev)
>      }
>  }
>
> +static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
> +                                               MemoryRegionCache *cache,
> +                                               hwaddr pa)
> +{
> +    if (virtio_access_is_big_endian(vdev)) {
> +        return lduw_be_phys_cached(cache, pa);
> +    }
> +    return lduw_le_phys_cached(cache, pa);
> +}
> +
> +static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
> +                                          MemoryRegionCache *cache,
> +                                          hwaddr pa, uint16_t value)
> +{
> +    if (virtio_access_is_big_endian(vdev)) {
> +        stw_be_phys_cached(cache, pa, value);
> +    } else {
> +        stw_le_phys_cached(cache, pa, value);
> +    }
> +}
> +
>  /* Called within call_rcu().  */
>  static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
>  {
> --
> 2.52.0
>

