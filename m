Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1416033lfo;
        Mon, 7 Mar 2022 03:33:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWszE8hcYbRCikOwsMkSxhc/kCnYjK+hj3hGgF2esJMmuadbuLZek2NSrBfNWNAW2WypYe
X-Received: by 2002:a05:622a:10f:b0:2e0:29ea:5ea1 with SMTP id u15-20020a05622a010f00b002e029ea5ea1mr9252572qtw.670.1646652838130;
        Mon, 07 Mar 2022 03:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646652838; cv=none;
        d=google.com; s=arc-20160816;
        b=DfqVW93W/kHF9dHaGHRYweH3IR9vd9ZRPCxJS7PzEo+FOYYg1RMwc23REuP6uQyBcs
         NFVve8mwrUddLDCUMMU5MHanYXOv9UQdvPUmShxjUEvC6cB2UvtMfSN4qajhVlPa0AuK
         M16VL/3Tkd/cWI/Ahq6QouHE2IDxuu9eT73ERlL9J+PXbRwQv3hifK0CbyH5gmINlz6A
         YzECphilFKJkyPXdv8LEXVLRCaY/kEj2YPqxDtOikUN4NOAatlP8xLlGAiBZ3S6LnaU9
         /MsK/4pFfzJKJKVBWHmUPICho8fWYff11qvL4jEVCx34uZQygUz6wHRJ7WyJKvWkpVhH
         jcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ouAmCle6B3dbO/a12UFjmEanteOsMmT+/TxjMSS+W/M=;
        b=KK4mecG1fLkPTQG5dVth42sA9bJIRWC6wWUhNaqRCtrT5EXIGeJuNHP2S8VF4Rlh8D
         zsQYJHU8QUxgufYxijFmXd1/moF0t4t+Gs4dqY5P4SugfY/eCA/BrQWK5dLmdxB9xK8J
         JRJvvfMirZ/Pd+07y02sq+g/gLkuISmKKeM2XLly/Agde3VBJ6MTsYG8FUppysWZJSxD
         pKLxX8o12BIC29q6F5iUEyckm5NmrTx2Ro68ocAiM80im1osVtmVZv9A+YEfofB3EXX0
         DCfBuA00C7f9d37km/VFSldqMzRKcZKy85Yow0ZL1kg+HqnReiRVMzY9xxlr2ZRlOHYE
         wzYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="hKj/QB+K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ac85a45000000b002de9f1c02e3si5408124qta.641.2022.03.07.03.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 03:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="hKj/QB+K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRBcj-0000e7-71
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 06:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBGj-0007kp-4v
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 06:11:13 -0500
Received: from [2607:f8b0:4864:20::830] (port=40839
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBGh-000547-Jg
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 06:11:12 -0500
Received: by mail-qt1-x830.google.com with SMTP id t28so12874736qtc.7
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 03:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ouAmCle6B3dbO/a12UFjmEanteOsMmT+/TxjMSS+W/M=;
 b=hKj/QB+KMDi5aW3JGCO+0lA2ZWW0GX2kyULzS+IHRbBAiuh5acdyVwfvXsXpgQGyGX
 1R/VOFKR1eo/hTfDlJ3GrShzPHsYq24qayyrn4m87hkITZ25XVrlES9Psue0pJn8g4lb
 sDNCvXPdgThC880B3kiczkePnmi8L9bBWD950Xu5aUd9M2F8L1Ty8HUHOBGhhk/5Asw5
 vX2Y6uD4WAekCEpaEQZeU+WYP8ORmOaBt++cOQGsgeFHltTh6OoONFxxSPmJMga055WA
 C9KLPEiBPn1/jV42RtLW2ACWn1eE8JBoQmeer2mtBI00ZDSlhFrvnSySjMZFlcxWxBQo
 rABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ouAmCle6B3dbO/a12UFjmEanteOsMmT+/TxjMSS+W/M=;
 b=pk/V0LyrOZnTOysvPi98tD9/FtR+9wMmbKny1IQGUMifpb1ah80gsRI75TWpiMLG9h
 54mO7HARXqAM4a3kJ9yNGD7d23Y3IxqVPUA+sp9eQmxQkqfngQwXQtvAkT807BkOZqd2
 +g0gydZW2E9TiJV47xIkjMtOTlsom8DJhbRQbD/00dE0GxE2vYkNlhO0PIUd/BocquCl
 uYcnAuYPIUgVsVdvSrpBOTg+XwIOG++D7I04mLwR3mfiDZa0hvA1lUpd1/S2JzcvaPrM
 /oMAv7jnZ0UEqZsOUcAF52zzZW7gqvuqCjMDYigAki2+AmVM0csPdVpbQZuXdsE/xPAm
 3svQ==
X-Gm-Message-State: AOAM530Ry+2abmabHJoF5eYHJzQHHjzvkoRHMa8BXFiE//uRHD9ELdZh
 BAxbdzDx4kQ03z7vem0qCkSgKOnZf5noXds+Tx4eFcNNSHc=
X-Received: by 2002:a05:6638:15ce:b0:317:b681:157b with SMTP id
 i14-20020a05663815ce00b00317b681157bmr5976456jat.66.1646651056037; Mon, 07
 Mar 2022 03:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-2-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-2-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 21:03:49 +1000
Message-ID: <CAKmqyKPqpB-QjTJGKL-3=6DHg1Siq1TA7xeUW9deW2HKn_ZX=g@mail.gmail.com>
Subject: Re: [PATCH 1/6] aspeed/smc: Use max number of CE instead of 'num_cs'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9f5Cd4Ny6u9B

On Mon, Mar 7, 2022 at 5:43 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Aspeed SMC model uses the 'num_cs' field to allocate resources
> fitting the number of devices of the machine. This is a small
> optimization without real need in the controller. Simplify modelling
> and use the max_peripherals field instead.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index d899be17fd71..a5d8bb717fc7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -693,7 +693,7 @@ static void aspeed_smc_reset(DeviceState *d)
>      }
>
>      /* Unselect all peripherals */
> -    for (i =3D 0; i < s->num_cs; ++i) {
> +    for (i =3D 0; i < asc->max_peripherals; ++i) {
>          s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
>          qemu_set_irq(s->cs_lines[i], true);
>      }
> @@ -1042,7 +1042,7 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>           addr < s->r_timings + asc->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl) {
>          s->regs[addr] =3D value;
> -    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
> +    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
>          int cs =3D addr - s->r_ctrl0;
>          aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
>      } else if (addr >=3D R_SEG_ADDR0 &&
> @@ -1139,9 +1139,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      s->spi =3D ssi_create_bus(dev, "spi");
>
>      /* Setup cs_lines for peripherals */
> -    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
> +    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
>
> -    for (i =3D 0; i < s->num_cs; ++i) {
> +    for (i =3D 0; i < asc->max_peripherals; ++i) {
>          sysbus_init_irq(sbd, &s->cs_lines[i]);
>      }
>
> --
> 2.34.1
>
>
