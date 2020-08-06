Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2091976lfy;
        Thu, 6 Aug 2020 15:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD93gMD3thdIQHhix2x7yQUaO17tXu3U0L5xKdmYC3JpnrbydhnXSpC22gDfN/NoL7B7tw
X-Received: by 2002:a25:6981:: with SMTP id e123mr15322196ybc.346.1596754664275;
        Thu, 06 Aug 2020 15:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596754664; cv=none;
        d=google.com; s=arc-20160816;
        b=daurB6+E5qH2Au6eGjL7sgUnd9RIwEM1YVZQ4tWWnXGHRLNMTu1R6nrpH5b+pYVWXs
         AYp6MSo6ORaklG/DzCixhH8OsXMzjPkQT+tdYVvFuSMwHEgs9vBINJbpSdh/aScyP/4n
         3BXRUXvSKBJxTmf/zL/LKVS5ip58OPVxvi8zSexjF4SJ1wMtKreatEbtRwdfLm6iyFOT
         dbyYr8q+r3UbFv/nNcmh8dkJCoycvloYSlhY3B8rjVsoXlmtdqurReGNpuOfb1sFBiM8
         WmYHnCkSsSR2t9CQAd2xqcD52hDildNoRol1JdBk4DBMNgQyPRI1kHtwwkc4Z0mcoi27
         tDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X+IxDrTb6WKRXsCWuzJFD3rPRYDnU0xSRi/GSEo8MoA=;
        b=POcmPtzwE1+TAuNudR9mKCIQEvUqdcqf5kIX3OCyAkY423X2GjsWVPLEDw8xy5H9b9
         epDtTaOTXsV4XFEmzM9nFs4qmgS9tlFRElKBkx/s7cGNYUCDDtEXKYNEIuTm3NcMi1wg
         bonAKnBFU017M6f7KmSIQzsCMtzV3Jp0vA8Zq9NggSVSl972/TiRB0xg/Y5k7Iw6/6kI
         quyh0nRjyYAz++BoOFNTDjJc5Nv1goUspZVVCKjO+gzYjdn2mBpOjMyf1CSh8NW4x79Q
         Wp0z60mIIjxB4mU3znDiYFUGFz20kUMpN7fq1/LURfNtL179CZm8uXdD4IVW+o/zOKxm
         n8rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mFedqXKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si5979574ybf.116.2020.08.06.15.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 15:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mFedqXKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3opT-00063a-FL
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 18:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3op7-00062H-FL; Thu, 06 Aug 2020 18:57:21 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3op5-0007iO-VM; Thu, 06 Aug 2020 18:57:21 -0400
Received: by mail-ej1-x642.google.com with SMTP id a26so80594ejc.2;
 Thu, 06 Aug 2020 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X+IxDrTb6WKRXsCWuzJFD3rPRYDnU0xSRi/GSEo8MoA=;
 b=mFedqXKUmOHwRIYhMtDBCVnB8CaJM2tMYiAlaGRdTPB5Ak6v/c3CdZVtQ8YqD2qu+L
 Ld6hupFm3t7zuJ96ZktIZ9Mr1BiqxMWuFxgrBmWqPw7N/kqecp1xNoewtwzixu5Y5jJg
 ahRZ45EZK8We1hdxD62AgrbkNAyKqX2cDl/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X+IxDrTb6WKRXsCWuzJFD3rPRYDnU0xSRi/GSEo8MoA=;
 b=IqagjM5xDIjrL3wQwLQAd4v8wYVjfNTBNnmlliOEd++9Bi9G8WYQMPxB+EvA4tt69X
 m+oz5hHv8EmPfxcIOSJ0bno1gz9l/CMZZim1xD1Qgz3fDxEpWQxydTt+LIz+EdYjfSPM
 dCnQzbCu3hjuhiChH/bM+rboaO8n5YWGa8sHpJi36b48LmdftQBVBS7DtRQEgOJfVA1U
 XvsqtVd9FPbrIjT7gwVUNecNLETEDzKn8OCXTmefi7VzjDMcSx1xF0VGzaeZrcLgL+fd
 kjWDvsvA4i54j4yv2cDjF1/lvqzWxL5MXg9bulDYqg8Om/bxhwxknlaYsjWBzB26mRv9
 mczw==
X-Gm-Message-State: AOAM530+FPJySjGUxYMV+IuRkFmvwam/tLdy1M51iUYx/msRDPdMCOR5
 PaPyyV4J6qdp+QXrMJrc13lB7DK073J8agHNKtcT0QyzbUU=
X-Received: by 2002:a17:906:1ed3:: with SMTP id
 m19mr6350906ejj.396.1596754637999; 
 Thu, 06 Aug 2020 15:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-5-clg@kaod.org>
In-Reply-To: <20200806132106.747414-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 22:57:05 +0000
Message-ID: <CACPK8XeWDDL0L=FKho+aXe4cx1CLB2BSq-=ERGBc1X6L76ZryQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 04/19] aspeed/scu: Fix valid access size on AST2400
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
 erik-smit <erik.lucas.smit@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Op3cPrtLJiTR

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The read access size of the SCU registers can be 1/2/4 bytes and write
> is 4 bytes. Set the min access size to 1 byte to cover both read and
> write operations on the AST2400 but keep the min access size of the
> other SoCs to 4 bytes as this is an unusual access size.
>
> This fixes support for some old firmware doing 2 bytes reads on the
> AST2400 SoC.
>
> Reported-by: erik-smit <erik.lucas.smit@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/misc/aspeed_scu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index ec4fef900e27..764222404bef 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -328,9 +328,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops =
=3D {
>      .read =3D aspeed_scu_read,
>      .write =3D aspeed_ast2400_scu_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> -    .valid.max_access_size =3D 4,
> -    .valid.unaligned =3D false,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 4,
> +    },
>  };
>
>  static const MemoryRegionOps aspeed_ast2500_scu_ops =3D {
> --
> 2.25.4
>
