Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp872379lfm;
        Tue, 18 May 2021 16:28:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd2u1/T5Ohr7sJlngAwivXlosjSnN/qWoR7Vqcl16tHWBsubsGxYlu5xFdXUhFcsi+X+Rm
X-Received: by 2002:a92:ad07:: with SMTP id w7mr6653678ilh.98.1621380526921;
        Tue, 18 May 2021 16:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621380526; cv=none;
        d=google.com; s=arc-20160816;
        b=X1vftpUMzta9uY7fHTDUedfa/jbZgaPdtH0/O49ffB5tCW79S1a5mUSl9EzEkwCo1p
         S9UMHpYzc3hM7y+7UZY/K9UDkZf3kWLCsy+REs5jVl4RtzXLHvF52AiY/2NBIWP2VzDG
         8UCO++qlwRy5ilA59gV70ntLnFuKL4REyz8pbp0uS3hm8fhXRa1VHZCZNmC/rh4+RUVc
         kctAI3PxAkpbv+39W/G55HleXTIEmfMmCm4WQyX57U8jcDpYzjsfo+cLQQblqlnHu4KO
         wZCMCVeNw+Uq1rLBC/3qZ2SkFzIBp6dakjnnT9LwB4y6wp0Mp9y6rU+8hcGtALhwDPfJ
         33YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zr3gbfe3nEKjTQ3ubXtTdmZ02SvB3/QXG6/L7CdKajU=;
        b=ZE1YJVQGTnd6kf06ZgF9L9hGzvDpQTrZjG3KDcAjxFEap9tTafXPpahDHyYU/knIHJ
         lcBAe5dUXbBIn1pQj6ioQ7kMSP6g3tJGD8o/iTEOG1tyVHyyMBkX2ATwWlPW/9NUSRkL
         UTgMzzJwMvM4DrVxebPD3R1dDPM6qrX7H0nXIWF/SjWm5EIIrOA5//v16FvF/YD8EBnk
         atBBlvGuDmlxcycNs8akBmgi9Vyg+jMyFfoESbHLoF08vqoy7abEc+lGVgSQLs+NhuOf
         UGiXC0s/5faezeeSARTVvFsQ7KJiF+eFp7N4SNw1f+wgjykfYkdxZ27/NNK3+pdMdCXY
         ChKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=euAwVxLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si8318187jam.26.2021.05.18.16.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 16:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=euAwVxLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj98o-0008If-4Q
	for alex.bennee@linaro.org; Tue, 18 May 2021 19:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj982-0008GI-7x; Tue, 18 May 2021 19:27:58 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj980-00037H-Mb; Tue, 18 May 2021 19:27:58 -0400
Received: by mail-qt1-x835.google.com with SMTP id t7so8865670qtn.3;
 Tue, 18 May 2021 16:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zr3gbfe3nEKjTQ3ubXtTdmZ02SvB3/QXG6/L7CdKajU=;
 b=euAwVxLCL5oRNZzSoVPMp53onJmmrCSh+SLCjZJb8UCiaRwlIDG/zPjhqSocaea8Fs
 trMih6Dnv7wBI3pZpuhrmrDe7vxNRDTDqH+w9KFowEjPy1DBfD7rwxTuMql8bHRkQj+8
 MM8aiBJ0kLjnRYrIW7/NlWmQyf8ZS4zoD+/j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zr3gbfe3nEKjTQ3ubXtTdmZ02SvB3/QXG6/L7CdKajU=;
 b=WyaqdRw6v4mdnRJZO654Q0pIkKLUAJ84VJRU40FGQEjCZUq45BoIk0pOzRuadAFXIp
 C0NkK1Bh4V30QQjAGycBYvrZ5w4/fAM5Z5bxu3NPhfKpRY9Mue/LVYGfRVck34LYWTR9
 hVtNjV+DT/mdVwW6FUegKPTDjFNBD+kSH7yIWA7lNARJQxrhzLvdQs/iVMCc5PXT5Su7
 FjwR71WeBMw2VMvvlZPpcks69OH4CFMHpF9H1/BJlg4MICOT67EtW52I8ETmCuUFX1lk
 UmR3BD5P44MH+FigJV/TnEqsRX/vbdGfX0r92QUrtvOWXpuMT1ONTfZtg69kV+aKbpYD
 DMQA==
X-Gm-Message-State: AOAM533YKf4qLGsq+nxPJjjIiN9OvoXhZ7BRNa4dtTzcOaKFvddB2QT7
 wt2CAqLDnkbmjQBSSbdzVILSVulgLZZ3UjCs6AA=
X-Received: by 2002:ac8:5459:: with SMTP id d25mr7774744qtq.385.1621380471748; 
 Tue, 18 May 2021 16:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
In-Reply-To: <20210518194118.755410-5-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 23:27:39 +0000
Message-ID: <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x835.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: acTM8RNk3vDM

On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>
> Enables the pca954x muxes in the bmc board configuration.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Not sure about this one, there's no device tree for it in Linux.

> ---
>  hw/arm/aspeed.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 35a28b0e8b..27fd51980c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
>
>  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>  {
> +    I2CSlave *i2c_mux;
>      AspeedSoCState *soc = &bmc->soc;
>
>      /* bus 2 : */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> -    /* bus 2 : pca9546 @ 0x73 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
>
> -    /* bus 3 : pca9548 @ 0x70 */
> +    /* bus 3 : */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
>
>      /* bus 4 : */
>      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>      /* bus 6 : */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> -    /* bus 6 : pca9546 @ 0x73 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
>
>      /* bus 8 : */
>      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>      /* bus 8 : adc128d818 @ 0x1d */
>      /* bus 8 : adc128d818 @ 0x1f */
>
> -    /*
> -     * bus 13 : pca9548 @ 0x71
> -     *      - channel 3:
> -     *          - tmm421 @ 0x4c
> -     *          - tmp421 @ 0x4e
> -     *          - tmp421 @ 0x4f
> -     */
> -
> +    /* bus 13 : */
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> +                                      "pca9548", 0x71);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
>  }
>
>  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> --
> 2.31.1.751.gd2f1c929bd-goog
>
