Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp115304lfb;
        Tue, 24 Nov 2020 18:49:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgqCo49B6vctmOOO/nKdzpipoJAxFMWGeGu9ALG4IRd5j4icGKL3BQfw8/3130mqnOIJQ6
X-Received: by 2002:a25:aa45:: with SMTP id s63mr1339066ybi.471.1606272588961;
        Tue, 24 Nov 2020 18:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606272588; cv=none;
        d=google.com; s=arc-20160816;
        b=a7nvjhim2dpQ9dODUoEAhhTg/li4xtvGtawlLCoYemCbBn8vfTZUxxILVcBpi61tIf
         fJpqWmcmYer6wVdjtLUx3hbobMfCFKR563/aEE6Cd6LyIAa/wGHqlNWvLZnrVVQaU2YR
         KU8w28A+bdxprGq9DV6fMinA/dfLsN8ykAzqrUIjfOmr8MxaPOxVyCEiiE7ejGQNEfyl
         Mje3yCrOzB9PPOH4hBWuCWZz/APadsIzRG6Y3KnI5tHxqJWhgDH+Nst/JCxxmPXwKl0F
         L0BfGi9r+laGRgqLSTT7vXa9vk0UOVEH/OBAxdgrnjaU8ieLnnBTAG1NuS6Dwq71HWft
         g5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kXVueYUa/uAk7l7Au0UFCAqyQlpGibXkR/Ajck+DQXw=;
        b=zOSDwvcbukySBr99kUi8Wre+cD3qlB97kF0u5RCI3MvNkJqvhUYDIcxrqJ0GUWFdET
         Hwl6oFEgnnM9Bz7Rd8c14JFFQqXCuJf1ssJIX80mhxQJqesvSPhlhJVv1XZ6I28mRF++
         qfx5lBWAOopnm7VxoVNspE0xYuJtGzTZGBsbgwDYYdwi6WguDwMNzqbOFV7p2/tPBuyN
         u0ce00rV1OUXCG23lqwE5yUp4SyL9wMvNCinjEliwyFUChiMLlTnCv7zal7/di+jmolC
         7OUvCh8d7mABRsz8OAl5sAds4874ZfFrd+yv2CaqQJ/pL1PctYw5YoiMRD6skjjCPe94
         yd1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=T0sbynXv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si864833ybg.329.2020.11.24.18.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 18:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=T0sbynXv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khksO-00072v-9d
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 21:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khks0-00072e-Jw; Tue, 24 Nov 2020 21:49:24 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khkry-0005jr-NM; Tue, 24 Nov 2020 21:49:24 -0500
Received: by mail-qk1-x742.google.com with SMTP id v143so1913208qkb.2;
 Tue, 24 Nov 2020 18:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kXVueYUa/uAk7l7Au0UFCAqyQlpGibXkR/Ajck+DQXw=;
 b=T0sbynXvxjJlW2mjh707bCTWU8V0Dsga87ovVjeF8E7cAGvB9v8460dSyXMIzpwTy/
 I7YGrwCjMAdgOWdMubbR0KxaM4GSlM/ulR3SDqWx2OQvzpRMBpv+FCk1iw1Z5IOli5K5
 7wgA91/RYLaKC+59/0/5nlrUaOCkXHG0Oz3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kXVueYUa/uAk7l7Au0UFCAqyQlpGibXkR/Ajck+DQXw=;
 b=Aie8Z9t4E/Kx+APUK4+gdQ9oUjdZKLlh4w4Kw5JsCNzWNhoFNLElyz4YUhyqbKKtGX
 jfCaM+yaFinA2ivondYMfK9syCeQ7nzYvQdyR7BQa2apwhi3d+yPI8aGBdYeoJjsZF89
 pYptc3wbZc03rU3CJVSj7ul7drKE/b1DKPsLUAvKteFbpB++6Y83315C8FFngjOmTfyJ
 MjTprMPr46q4HX8wn+RYuE3FBuNEu6HfNTG+ohrpBLu3QFJIwQwTdzi1+cYk+JIVNGsf
 IpGkB7beMSisIff7RxHdXpJs86ewfzSq2ZtPai7hAFIVSEP/FsarlaOIWVtFTW0hbHNf
 N3sw==
X-Gm-Message-State: AOAM5301T335zTGERyqove/wB97R1PWmX6GcVc4WQUmJ9OSDWD2BtQUa
 NGGch4YlAELvpXSGC1niEE7gL1xHVenirMmQTGI=
X-Received: by 2002:a37:664d:: with SMTP id a74mr1330409qkc.487.1606272560639; 
 Tue, 24 Nov 2020 18:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201120161547.740806-1-clg@kaod.org>
 <20201120161547.740806-3-clg@kaod.org>
In-Reply-To: <20201120161547.740806-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Nov 2020 02:49:08 +0000
Message-ID: <CACPK8Xf_Q2_r=B54hvxmq4ezwmAndDPqGqOh9+YGFDCb4jfqig@mail.gmail.com>
Subject: Re: [PATCH for-6.0 2/2] aspeed/smc: Add extra controls to request DMA
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x742.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTuuCCyNxbpO

On Fri, 20 Nov 2020 at 16:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The controller has a set of hidden bits to request/grant DMA access.

Do you have the ast2600 datasheet? It describes these bits:

31 RW DMA Request

Write SPIR80 =3D 0xAEED0000 to set this bit ot '1'.
And hardware will clear the request to '0' after DMA done, or FW can
clear to '0' by writing SPIR80 =3D 0xDEEA0000.

30 RO DMA Grant

0: DMA is not allowed to be used. All DMA related control registers
are not allowed to be written.
1: DMA is granted to be used.

Do you want to add the magic behavior to your model?

>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index e3d5e26058c0..c1557ef5d848 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -127,6 +127,8 @@
>
>  /* DMA Control/Status Register */
>  #define R_DMA_CTRL        (0x80 / 4)
> +#define   DMA_CTRL_REQUEST      (1 << 31)
> +#define   DMA_CTRL_GRANT        (1 << 30)
>  #define   DMA_CTRL_DELAY_MASK   0xf
>  #define   DMA_CTRL_DELAY_SHIFT  8
>  #define   DMA_CTRL_FREQ_MASK    0xf
> @@ -1237,6 +1239,11 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
>
>  static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
>  {
> +    if (dma_ctrl & DMA_CTRL_REQUEST) {
> +            s->regs[R_DMA_CTRL] =3D dma_ctrl | DMA_CTRL_GRANT;
> +            return;
> +    }
> +
>      if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
>          s->regs[R_DMA_CTRL] =3D dma_ctrl;
>
> --
> 2.26.2
>
