Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp155049ejb;
        Wed, 7 Jun 2023 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61lDogeelNu2we6vCchPVuIknih+hbTfWN36u0IUSi/8dPlv82C9ESCdVXFDwuvMCDT0NA
X-Received: by 2002:a05:622a:58a:b0:3f0:ac80:1ed7 with SMTP id c10-20020a05622a058a00b003f0ac801ed7mr2504103qtb.45.1686134998502;
        Wed, 07 Jun 2023 03:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686134998; cv=none;
        d=google.com; s=arc-20160816;
        b=qpStLvURVKXhlkYGEO519+CMoW36OvqkX331iZQHx+PCRvCs82AFXjnmLz5veNX0yU
         9j9wX5NzNan//HAlOF0E47c1sLBGjlUKehy3Z905G9UUxB/xLVcsZhiZOj7L7BxEUdE3
         IciPEIGN3h5wWJRq8D51uMDsN2bvxcLEUp8dBra7/haYAdAc9Z7Qks7TwC8eOVWQERDz
         1768jnqtF4dPGjg5xl19yQpqRk6zuy35NhagghGgVe/cBpkNR5NaMaZ9B6aiKvBGmsp9
         uPRK9bw1cSsoq4BjdNkAW67Wk3jT2AcuoPCYwivtKMMwUh/4g6/UDf9hKkMtbROTnrwi
         8wAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=f+9EsLR5hGLk6IiVZY0iNaK//xKtDnHaSVG+LD8LPug=;
        b=f5vjLHF6f11Et5o6rOQGWHdqQwa+MfYk57YK77jf9hXAo6I/HWsXFlmTGnw3XqlaHw
         nJ1vzN1NDWBhNVWD9n+ce9E6mttJZ+aTXelOd9u8ykBsj/f1MnZnnuCaQ5ZDyfyqCMSx
         nCPcAgYBYivsgSOHM6rzIxg2VZq7W9U8US1tOVhEx75xX2VQGLJHVRhfePodlgZDHlTN
         0yFHNSMTc0cALHHrBFPrYg6q4UNsBn+i66wgkYupY/qWtI80wWGiphLqKR1iyMxKrb0i
         6Yxl3RdRq70r/HyMWO6yetH1CRXiw9Nmo/Efb1ITFIUSzUytCYq6kbe/Xz3MdxYh3UYI
         WWwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=G0fz+sbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac87d92000000b003f50846bfe6si7693143qtd.355.2023.06.07.03.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 03:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=G0fz+sbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6qjc-0004BQ-4q; Wed, 07 Jun 2023 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qjZ-0004Am-DL; Wed, 07 Jun 2023 06:49:46 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qjW-0000I4-9C; Wed, 07 Jun 2023 06:49:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-97458c97333so959682066b.2; 
 Wed, 07 Jun 2023 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686134980; x=1688726980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+9EsLR5hGLk6IiVZY0iNaK//xKtDnHaSVG+LD8LPug=;
 b=G0fz+sbZoEzRUWlMVKn0Y8KUTssb8JHogdgs1cs9h5AHCfQuSC8lQEwBRFioa3Po4s
 BCR0oF+/tHD0TmejeHuKxQb/Ssq7UpTnbdHBOtAFH0B29vKMWF9SX9Cpgy9Fttv53OKB
 7INm5OLzhBmOBKSpAaMepthYTHHVWkaYDKwjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686134980; x=1688726980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+9EsLR5hGLk6IiVZY0iNaK//xKtDnHaSVG+LD8LPug=;
 b=bJNRG2/6gvHbaEByEdjVsBBd01XV4zPXja8jggIlnBZYsjjWfi6bmgD2MsqY6x6r5s
 jG7+22eMTNER8oMiaK173VBVnjCttQO/UoV25rIWFHb2oZ5uZ04ctPcVXd36Beqj8mT2
 PRcyNUINIY0VAyUd5Cu56jgGxr7y+4sizCuWrqWZOy+mX/cNLsOg+dqbgRMTQ6v0x8Aq
 nYMQnjN2JZK6xDucJa4OTa7Ab0wsxQzKnrBL3/RzdvyafPXUSy4Tz21D2NTclAJ1z0co
 zbD+M1CwC5Fp5Zy/rh3KS9njcpsxHDUDcTLzGSxV3Cm8kDUfQD1Iw3OjjGZ3LOS7yTED
 u6/A==
X-Gm-Message-State: AC+VfDxZS8jnjpbEEYsc5s0VMkmUNprsqeYe8ojWnQxQNjZ6keO1SCAt
 OuJ1JTaJ7wwgLVakFrSpDse6BdT+Uc3jXqvtUs4Er575
X-Received: by 2002:a17:907:1693:b0:960:ddba:e5c3 with SMTP id
 hc19-20020a170907169300b00960ddbae5c3mr6079580ejc.32.1686134980001; Wed, 07
 Jun 2023 03:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-7-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-7-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 10:49:27 +0000
Message-ID: <CACPK8XfRyLqNrTtKBp+dh44-6KF14ovorU=Tz0tUuLtEj0y=DQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] aspeed/smc: Wire CS lines at reset
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x37MDU6QRT7q

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, a set of default flash devices is created at machine init
> and drives defined on the QEMU command line are associated to the FMC
> and SPI controllers in sequence :
>
>    -drive file<file>,format=3Draw,if=3Dmtd
>    -drive file<file1>,format=3Draw,if=3Dmtd
>
> The CS lines are wired in the same creation loop. This makes a strong
> assumption on the ordering and is not very flexible since only a
> limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
> which is less than what the SoC really supports.
>
> A better alternative would be to define the flash devices on the
> command line using a blockdev attached to a CS line of a SSI bus :
>
>     -blockdev node-name=3Dfmc0,driver=3Dfile,filename=3D./flash.img
>     -device mx66u51235f,addr=3D0x0,bus=3Dssi.0,drive=3Dfmc0

I don't like the idea of making the command line more complicated.
That is not a comment on this patch though, but it would be nice if we
could head towards decreasing the complexity.

> However, user created flash devices are not correctly wired to their
> SPI controller and consequently can not be used by the machine. Fix
> that and wire the CS lines of all available devices when the SSI bus
> is reset.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  hw/arm/aspeed.c     | 5 +----
>  hw/ssi/aspeed_smc.c | 8 ++++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 76a1e7303de1..e5a49bb0b1a7 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -299,17 +299,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, c=
onst char *flashtype,
>
>      for (i =3D 0; i < count; ++i) {
>          DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
> -        qemu_irq cs_line;
>          DeviceState *dev;
>
>          dev =3D qdev_new(flashtype);
>          if (dinfo) {
>              qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo)=
);
>          }
> +        qdev_prop_set_uint8(dev, "addr", i);
>          qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
> -
> -        cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
> -        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>      }
>  }
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 72811693224d..2a4001b774a2 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
>          memset(s->regs, 0, sizeof s->regs);
>      }
>
> +    for (i =3D 0; i < asc->cs_num_max; i++) {
> +        DeviceState *dev =3D ssi_get_cs(s->spi, i);
> +        if (dev) {
> +            qemu_irq cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS=
, 0);
> +            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
> +        }
> +    }
> +
>      /* Unselect all peripherals */
>      for (i =3D 0; i < asc->cs_num_max; ++i) {
>          s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
> --
> 2.40.1
>
