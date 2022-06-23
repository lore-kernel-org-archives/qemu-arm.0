Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2936855lft;
        Thu, 23 Jun 2022 05:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyglSz07nyt3NQl+arba3HrAHZkO56EPFFWyS8Lk54Cq29F3MiIqEtQPl1gN2cCeWN6EIL
X-Received: by 2002:a63:9d88:0:b0:40c:9c4d:29ba with SMTP id i130-20020a639d88000000b0040c9c4d29bamr7382757pgd.590.1655988996028;
        Thu, 23 Jun 2022 05:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655988996; cv=none;
        d=google.com; s=arc-20160816;
        b=vTw7lNGhPlmjqeXgiVPtkHxv6Pces1aQt5pMrTvuySm7Oiiwc39zqjijHuR3j3sGsZ
         IYOgQB+ml9uMZqNha7+9HnjmEyO/oNIkHIYBhAGNcAk7l5mOR/2vsfDoFLfdekLGUsmn
         VVBxaMNfeedkqREXcA9nb8a+m2gh+Q6j+46e4b4GSJmaBbAkqP2D/L2KktxNA6PPuZ4n
         ozua8GmOtaY5egjr6/uXmFIA7wQ3I5CgqDBg6K9KFQjLKosn9lEaXo9ZZwLj7b2Kdghy
         Y+xstX/Mek9lmBPvOlfLL3jbchRuBwIxbzNyhP59BLBdUdfF7PvrizjbIpYJJdG+CK4G
         WQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=R61v/iPwH5KRi9bjTWRa7Tpm/TZZ3nQfs1k5tUMicU0=;
        b=u0vag3fz1cKl1abq+FM3vIkUqdnjpMw2fm+wHAuWPgZSu0dlDp4CZNNQBwESOWtit6
         zuCciHPdFQF2ONdezV3dZV4LWEjwi4ptQzNFiYzyYBKyAfJecQdXIGQFjIgRgYw0VKhT
         mEj5eSwBU3F6ZlknooNu1c7UgE1IZ1aHzNzcHzVGnhVg37e6KeN10tO95RiP2dSy2vhp
         /YSal4PdQRZhQZuBji3JpTjfSykQXQb29FnW5A5IWDQ/BoOSuEleWH8Hk/X1qB/IoAKO
         gVSXZd4kreVgicegHGKnAgiHixmNU6cQbSnVqDYVYZ+x6xFIYPkXxsgxcu20SvzfFh3d
         KRCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfyAChad;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id h4-20020a170902748400b001640bfcdf58si14362792pll.182.2022.06.23.05.56.35;
        Thu, 23 Jun 2022 05:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfyAChad;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiFWM4e (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 23 Jun 2022 08:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiFWM4a (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:56:30 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032114B84D
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:56:25 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3177f4ce3e2so169410967b3.5
        for <kvm@vger.kernel.org>; Thu, 23 Jun 2022 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R61v/iPwH5KRi9bjTWRa7Tpm/TZZ3nQfs1k5tUMicU0=;
        b=CfyAChadOteldYBSZO3K48+sg5Z2V+tqrHjV/80mmrJJ2o5mH2AY8xnSUFq15GkPgZ
         hjqe/TeBLJgEj4U1teQ6SehfoJGiDSJgCpsBHEH/ctk0uB7aoZoF8/KnuMEul40oev7z
         RrtkLOjjP5k1T1iohMMZj5DdEzXRINS0V6bIqke2DPKwuzeU93kofmrcCxfs8YfeoqOJ
         ADDL9CQs1cQ9GKVlnqBrfiHzNvlplV2NmZamszXAAur+TUPLbEEVCzLsty7tI6ZortIH
         2O5I1YQwvN8nBOF/aDzokpZzB7zGxI9mhJfifp4pR6Rs8F/OOw+6TS95PuzxVJZ4Chbt
         uKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R61v/iPwH5KRi9bjTWRa7Tpm/TZZ3nQfs1k5tUMicU0=;
        b=tyASM3SlGxay2SOxKe2eyA5asKfPFKNSfCuDseVDPJPhfg4FSIsADj1yErHAV5FKL8
         S1t0bqt89K+Lc5pkYMmyps4tua32FHi/m3X+Qm2N9tu5spNurDrzv2ElIJEVt1A/WvRq
         +BOaYatU7RKKrQL2FqVXMyOpiesemLuaSVyFZDPcriSbHp0VWh5025BRLvA8XHRpoXZd
         6VNZ6r0db5YEIVxSV7mPswZxZIZB5l4zgZ2picy5wsiR2lQ6xMd8iQ27TOa4gxGzAl63
         zBI8CwFHbRF2CjIgQX/c7yBg2CIHrcwG5rZnet8YTFXWYyOpNqOI4PAWPz9k9crFRe6x
         dP8w==
X-Gm-Message-State: AJIora87Ql/W0wJv0azIsyZkXY5V9EZ/8jlJb2YmqcWD7tI8Jk9OIVJh
        krbJ9nvzl+Z80QydQxfeKyJcO+c+ddkInAPpelVt3A==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr10304575ywd.64.1655988985132; Thu, 23
 Jun 2022 05:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com> <20220623095825.2038562-12-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-12-pdel@fb.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 23 Jun 2022 13:56:14 +0100
Message-ID: <CAFEAcA_iOeL50nGaTSNRa23P0GKH8_0fpiSOxktAOA22CGgZvA@mail.gmail.com>
Subject: Re: [PATCH 11/14] aspeed: Switch to create_unimplemented_device_in
To:     Peter Delevoryas <pdel@fb.com>
Cc:     clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
        berrange@redhat.com, eduardo@habkost.net,
        marcel.apfelbaum@gmail.com, richard.henderson@linaro.org,
        f4bug@amsat.org, ani@anisinha.ca, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ttaVLP6AiaxL

On Thu, 23 Jun 2022 at 13:04, Peter Delevoryas <pdel@fb.com> wrote:
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed_ast10x0.c | 10 ++++------
>  hw/arm/aspeed_ast2600.c | 19 ++++++++++---------
>  hw/arm/aspeed_soc.c     |  9 +++++----
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index d259d30fc0..4e6688cc68 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -158,12 +158,10 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>      }
>
>      /* General I/O memory space to catch all unimplemented device */
> -    create_unimplemented_device("aspeed.sbc",
> -                                sc->memmap[ASPEED_DEV_SBC],
> -                                0x40000);
> -    create_unimplemented_device("aspeed.io",
> -                                sc->memmap[ASPEED_DEV_IOMEM],
> -                                ASPEED_SOC_IOMEM_SIZE);
> +    create_unimplemented_device_in("aspeed.sbc", sc->memmap[ASPEED_DEV_SBC],
> +                                   0x40000, s->system_memory);
> +    create_unimplemented_device_in("aspeed.io", sc->memmap[ASPEED_DEV_IOMEM],
> +                                   ASPEED_SOC_IOMEM_SIZE, s->system_memory);

This is SoC code, so it should probably be handling its unimplemented
devices by creating and mapping TYPE_UNIMPLEMENTED_DEVICE child
objects directly, the same way it handles all its other child devices.

thanks
-- PMM
