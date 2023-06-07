Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp85291ejb;
        Wed, 7 Jun 2023 01:10:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7jX5DC5suKFNzq9LJPSCcPCYmaKZHFuNcA3MIadMudWHUZxgYY775VLVZv3UIcoltftFnC
X-Received: by 2002:ac8:5784:0:b0:3f3:b1d4:744f with SMTP id v4-20020ac85784000000b003f3b1d4744fmr2748459qta.0.1686125447344;
        Wed, 07 Jun 2023 01:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686125447; cv=none;
        d=google.com; s=arc-20160816;
        b=gnl0qQ4aU1ohZDEsIghWrYig359nm2weFaRiwIaul46q1QE2azb/4K7nvtvm1d+wmn
         CfnACEfLCPrLu4ffusWtZ2x+b291lf80qyptv9PacWDN+W4d4M8sYhcFUd6brNnju2JP
         nxFVTIMqQrZg4R4G2Md5O8O0sOUfUiIKGQDmDVG6c8LYm366YHd7rNk1RHCELs6LgVR2
         H92c7kL1JyQuebV0RrCgmggnMSMWGtOeM0UPwu/AVAObZe/bf33cAhUfi0rBKQOqzvPr
         eIu6on9pNBedv18N+izq804lToSaSJ6TDb7p2VbGTpv+rNg1/AZGWrJvPLSzyTu9ilkV
         6cXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VEROPl4wnYl2usylybGJHLWtfF4dJ8jyRIeiQ19RWiA=;
        b=BF7ySExDCYsg0oJ8o+5yTkqKwwk7Nv98NHJ+O5MtoXfNHADRZk0pnZj9AdzLcSAzJY
         zs83XWu8C4m+EBv6wRfdpkWhLcI1xwXbf5jI5zRamdD9QRxtUIj6hRoSry7DktxS3sGj
         slMZuzp9WBfj9w5rFqkTvHomJGaBDe/eQaUr7ksebwzr0yC15a1YxrZmyozuGDhx4utA
         bBtEVhIBOCUipx2H1afCz1mwmDylhPYK4CKDCNL7dUpBx85CRT37Rt4fnTFrEqIlg56t
         tR3/G3CoDwCeoTTX8g+/VctrfGSG6ZvtdpypfD+JrelqijkFKP8fz2/gJOafXY5y1BFB
         eFzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=V5k6OMT+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac87f49000000b003f3875db680si2023513qtk.610.2023.06.07.01.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 01:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=V5k6OMT+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6oFc-0001bi-SW; Wed, 07 Jun 2023 04:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6oFZ-0001bN-N0; Wed, 07 Jun 2023 04:10:38 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6oFX-0007uA-GS; Wed, 07 Jun 2023 04:10:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so986256a12.2; 
 Wed, 07 Jun 2023 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686125433; x=1688717433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEROPl4wnYl2usylybGJHLWtfF4dJ8jyRIeiQ19RWiA=;
 b=V5k6OMT+uMDj2T6f0ZER3iSqWauH0aHkWLQsGWaoyKu2xLR/B0u71PP9nHN4nuha6S
 fvvq1EScLforiCnxzpxwkgaR3edqLK+/o5vIZC+CYJkqDyK/Difw5NDK/ceDfty14UTe
 TGzzotErKHi3BWxkei5uR6r1/sMhy4iWgDamw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686125433; x=1688717433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEROPl4wnYl2usylybGJHLWtfF4dJ8jyRIeiQ19RWiA=;
 b=ZjNP31RfSJ9mkPSe2QRlBOp+EF36p3OERZK63VKgB91tNNFo7bBhN2zHlN/9oW1GYb
 2NK5gy2tUU7QgGbAHh0xbVpmBYpNQdcUO1DOMKe07lIX625pccFGYb5o+jH6BkllNfYB
 Ic+qQGp10J5knc1E1qmjXroK5uGXi8266JOHMTr5lgMLbHOoFdpdc9YqLlV6CMpRQ7x4
 K+EsVH4c1BINiJYy6pJhK3mHih8b8oEkaka/RbkyXvezZyqbqxIpK351F8PP6dKCyAcN
 g0xz4DT0hETXNzKHDidEIcl73ezQOn0IlIBwt1raX+K5oqOjQdX63f0A8QHSRzu8Jpai
 MVZw==
X-Gm-Message-State: AC+VfDx0NSG0XeVDlBPjO7wYmlt/U1JS9pbpPlOq0KIL6RDw+dE0WbP1
 IeSo2cx1oo5uL2P4wxIAUcZXtNsJKuu1XkYAImg=
X-Received: by 2002:a17:907:7f24:b0:974:1d8b:ca5e with SMTP id
 qf36-20020a1709077f2400b009741d8bca5emr4868338ejc.14.1686125433157; Wed, 07
 Jun 2023 01:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-6-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 08:10:20 +0000
Message-ID: <CACPK8XfzcSrDjO9cWDuyucfewDop_jKKfx+779ySLwX+LKa2MQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] hw/ssi: Introduce a ssi_get_cs() helper
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2BQhN+8k20qU

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Simple routine to retrieve a DeviceState object on a SPI bus using its
> address/cs. It will be useful for the board to wire the CS lines.
>
> Cc: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/ssi/ssi.h |  2 ++
>  hw/ssi/ssi.c         | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 9e0706a5248c..01662521b09a 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const cha=
r *name);
>
>  uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>
> +DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr);
> +
>  #endif
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index d4409535429c..7c71fce0db90 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -27,6 +27,21 @@ struct SSIBus {
>  #define TYPE_SSI_BUS "SSI"
>  OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
>
> +DeviceState *ssi_get_cs(SSIBus *bus, uint8_t addr)
> +{
> +    BusState *b =3D BUS(bus);
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &b->children, sibling) {
> +        SSIPeripheral *kid_ssi =3D SSI_PERIPHERAL(kid->child);
> +        if (kid_ssi->addr =3D=3D addr) {
> +            return kid->child;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static const TypeInfo ssi_bus_info =3D {
>      .name =3D TYPE_SSI_BUS,
>      .parent =3D TYPE_BUS,
> --
> 2.40.1
>
