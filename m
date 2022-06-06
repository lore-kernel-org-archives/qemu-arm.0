Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1737480lfb;
        Mon, 6 Jun 2022 16:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx62BhCVitpbc8iBFfKYgIHwfwTPrb+ZdpPMIYWkqttxv/mwsdez5xfF6Zb91sWgVzuGwP3
X-Received: by 2002:ac8:5e53:0:b0:304:d910:27df with SMTP id i19-20020ac85e53000000b00304d91027dfmr17884482qtx.132.1654559960935;
        Mon, 06 Jun 2022 16:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654559960; cv=none;
        d=google.com; s=arc-20160816;
        b=EGqP9x9aY+jCPTWFy0jE4k2LyaYrTQqnEOFPm5qmuowUXFz/mUQsBiP6gysyJ62d+3
         0u8ARNxI0GXglVKViY5f+8s9NYaV9bt11/5zW9hWwtqQ7n7vyh2AQUQhTZtP9L3bsTPz
         20jbauZ8ER6FhO9F5DNXQ9/NFhpo1SNMY3/lh00c66tvmF2OJZ5jOikH7XqDVNratQvP
         U/cxHuSs5gRLexzmLcX+EVsDrVWF+ihW76j+FtYloGKqptBONJvTUJ39jpaiAazwE67k
         cAYEnf+3JitVGckHIh6GUCI1j2tQ6oPqVyFGCYR716OjsIlIzUEhNo/G00jcflkFmWa/
         SrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CJwzMwV650Mzu4mPktcg1xqP4MrVDXRsCWRwvAmv408=;
        b=sZj3vZjfPtc61qQgROWJHLDCWgO8HGDKA/v1BYytvpKmo33/lZ+PuSQcbTan0xgKA+
         qbsqKPwbwPzgti/Vus16iQPy48QHm3dEUlH1a7RexK5ss7WGUp/ce7ChwjO+GV/i+2Cm
         /6AYAB9Q8AE+PVAYq0SP9+e9bPX8lLrhTB0OmdLy2eCTwIFfFA0wVfCdaVnmKtNKXOzN
         pgYDTA++2ehhnRpcWaPfEHBVq0k9w6qgXnYxJtLZaszgYwlnjqui1HlinDQi6kzM/Djl
         Z1WXXqEsg6fsYAnLNXzX6TqWwT+2la4UtZWUIXmikcnpNC1G3a/UhT5Y3S/QtNwTiksk
         ISMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=V5Nnv13Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020ac85f4e000000b002f530da30c0si9330975qta.388.2022.06.06.16.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 16:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=V5Nnv13Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyMcy-0003Tx-Ei
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 19:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyMTM-0006aM-Jq; Mon, 06 Jun 2022 19:49:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyMTJ-0008Nf-0Q; Mon, 06 Jun 2022 19:49:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id q26so11444468wra.1;
 Mon, 06 Jun 2022 16:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CJwzMwV650Mzu4mPktcg1xqP4MrVDXRsCWRwvAmv408=;
 b=V5Nnv13ZabjNL18jV1cA7E/X74OZnBpAy1qzPbGYC8QNbJVpFoTlLSJmyXm1sVUEMM
 aD/ZJf0togKu9vxBEZNKJjgwCENF6ZRFIp/XfVvPxA3G0d69+5kv5fzjuBLNj8E0zUt1
 SkY0y6yECjdveqsf9TdF9puT0uWSUEZAz0/JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CJwzMwV650Mzu4mPktcg1xqP4MrVDXRsCWRwvAmv408=;
 b=x73gd50M0lbQ5FJCxfXRwkfDEi5/AuCqoNSEuimVbYV7pTt84V0ZAvFSm+vSojJTfK
 2JBw0jJmUz0oFN7sPvSPc2yRrEh0Tzvm2/CMZUDwcbCPjMBH5GfuN5M9XuJlW0kxahyo
 pmk5smGFMWr3KqIAUTqrNqSCb9WKcLNr4I0hN64nq7l4Coz9xP/M8X3AM0YOpqvIMqHk
 OxizRR1nrj7hW9N2GyOIZj6DSUzRpzu/KqtfTmkz9kHy2wOpFU6ZcJVUyeFtkdsIeyjU
 HdI9RAn6Yy3knQt1l1x6XBlX73mKjX5v5tj9zjJOvlFyQYQW9PIw626q5u0b/yEqbkrE
 viOg==
X-Gm-Message-State: AOAM532VCYrCNs+Tm1b9vzj+hHBb35AzR9oDtyF8vaPLOzTo+xlR90Pj
 hvau+ID3J3CiBTggCwTpT0pCpO4BSiVFVr1FWwY=
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr11888277wrd.606.1654559358966; Mon, 06
 Jun 2022 16:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-5-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:49:06 +0000
Message-ID: <CACPK8Xe1n-N157r9Ea8DR_7TK6qDbe4Z-9z+qvRfOWU+RxJuSg@mail.gmail.com>
Subject: Re: [PATCH 04/21] aspeed: i2c: Use reg array instead of individual
 vars
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m1hhzTEo3hII

On Mon, 6 Jun 2022 at 15:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joe Komlodi <komlodi@google.com>
>
> Using a register array will allow us to represent old-mode and new-mode
> I2C registers by using the same underlying register array, instead of
> adding an entire new set of variables to represent new mode.

The downside of this approach is you lose the safety of having
discrete types. A write to s->regs[R_FOO] can overwrite R_BAR.


>
> As part of this, we also do additional cleanup to use ARRAY_FIELD_
> macros instead of FIELD_ macros on registers.
>
> Signed-off-by: Joe Komlodi <komlodi@google.com>
> Change-Id: Ib94996b17c361b8490c042b43c99d8abc69332e3
> Message-Id: <20220331043248.2237838-5-komlodi@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/i2c/aspeed_i2c.h |  11 +-
>  hw/i2c/aspeed_i2c.c         | 286 +++++++++++++++++-------------------
>  2 files changed, 133 insertions(+), 164 deletions(-)

> @@ -858,12 +834,12 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
>  {
>      AspeedI2CBus *s =3D ASPEED_I2C_BUS(dev);
>
> -    s->intr_ctrl =3D 0;
> -    s->intr_status =3D 0;
> -    s->cmd =3D 0;
> -    s->buf =3D 0;
> -    s->dma_addr =3D 0;
> -    s->dma_len =3D 0;
> +    s->regs[R_I2CD_INTR_CTRL] =3D 0;
> +    s->regs[R_I2CD_INTR_STS] =3D 0;
> +    s->regs[R_I2CD_CMD] =3D 0;
> +    s->regs[R_I2CD_BYTE_BUF] =3D 0;
> +    s->regs[R_I2CD_DMA_ADDR] =3D 0;
> +    s->regs[R_I2CD_DMA_LEN] =3D 0;

Could this become a memset of s->regs?

>      i2c_end_transfer(s->bus);
>  }
>
> @@ -921,10 +897,10 @@ static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI=
2CBus *bus)
>  static uint8_t *aspeed_2400_i2c_bus_pool_base(AspeedI2CBus *bus)
>  {
>      uint8_t *pool_page =3D
> -        &bus->controller->pool[FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL,
> -                                          POOL_PAGE_SEL) * 0x100];
> +        &bus->controller->pool[ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL=
,
> +                                                POOL_PAGE_SEL) * 0x100];
>
> -    return &pool_page[FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, OFFSET)=
];
> +    return &pool_page[ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, OFFSET=
)];
>  }
>
>  static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
> --
> 2.35.3
>
