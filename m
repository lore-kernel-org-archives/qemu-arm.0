Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D645CCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 02:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8rBO-0004pL-Nu; Tue, 14 Oct 2025 22:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8rBM-0004or-DO
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 22:24:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8rBE-0003rE-Ci
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 22:24:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6394938e0ecso9933124a12.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 19:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760495030; x=1761099830; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Fy2DzKv5ocTuVCF4u1TR+Cq+6ExdELyYXIxCr1MuYA=;
 b=PN9E2aHC3/yWJWeg3IrAj/yd8Mbq5XiCvtYJIsmQqDTJj4vENVVj35meAmIfc8S67A
 7ziwTti3Nyvzya0rrdHO0a6q7Lb2v460q3bzth9nf2EAZmoVBKtnE6ToPO12ZkoFPrAT
 KHdo5RvCAuNZnPxmSrnzgSX/3hFOatwR7vmsQ8jX00Lm7DGug0WNVXeZeR3808lPiOil
 6/c7LuNuHaqrP2326zyfkOI65LxWyShpw1W6r/h6iUfN6io0z/aaLDNUob5s0qvKk63R
 EJ53EoFxmUaHpj0cpDG4sF5Obsy8ivRXAkqbzBKikrGVksOQGHuegQ6TX1gO43I9oKyT
 d32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760495030; x=1761099830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Fy2DzKv5ocTuVCF4u1TR+Cq+6ExdELyYXIxCr1MuYA=;
 b=WxX16uUjaosFiWk/PaD3JKUM4j2yjkDO0GBv41hOeyrMayM5TPKlSskNodz/kuAxhW
 LdvEAS+YiCSCtiX5WBZ5VbgtkazfSCisPSXN2kyGF+PgCi/DE/YFYOL7PfSaVvHZYIbw
 AcqHs6F60Ju6q1OdeS/azqDueedTeHY3jqOIZIGGJhQauBRIAsMsV2hkVUeYxuv4ke1m
 Cb5+4x/9E5kbXW5lcF4wtgBwqlWvfaen55bGMuOe6FSdtDs1WxFEJ/qVyAkt25ftWEdx
 9McXzqy0+Z/qTGbAnEZ4oklF0pkAFRFcL89OLwCnTGFh9mCDmQX5TFL1W3AQ/h1vqeji
 9f5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXbXsfcc0yTWKrMgD788AWKeTXdad0ouN/spLlDERXEFhIO2tlq9FJVielWAn5UT8YI7h0kfwJrA==@nongnu.org
X-Gm-Message-State: AOJu0YzTPJLCY3L9RbceNp3bLQSS8meGxBaRGAbB/9cSsHWGlJaJRRqo
 K2CZCo7k0vN453ZC74ibU9KnMqvQi7ZIYQZq9QKb9vJSNAO8v9XhaYpdJzw2zG1D/9Vu6wIFu2y
 Ruaieoh/76NZzrd4ao/2XZVxMlTonnGE=
X-Gm-Gg: ASbGnctpP0Aq6iHE07HgZNlz1UjS3/g8cnNWazBnockZ7QVmkW6mYoYg7HAUBxr1bgN
 jfnMdabb18KnnDAZUDdiSu3ABN26a4JRb75Mkn3TDNU2L/NIxWlu1TEh6YuxEcFm7Qy79KxPp02
 SrGxOL+6R5ROVn2OZzddaRGZbauN27+jyD9vZFVdnKex2fXyiX/0AkGptS8MM0hVzKBmL1WiQ+s
 cKXMOW5PGV7ukLAqCxMGqLbVFdImexDV/xgrAFvt4p6n4HHdQ2d+O1BnbTWeDSq0DU=
X-Google-Smtp-Source: AGHT+IGrg9ABMKG27JCwmA000Ud2iktGvzAnc4Q+3gUta/+RHr0bUnhmFwdWCcRbea7ZdR7Oji15BlFVmF995X8cGHg=
X-Received: by 2002:a05:6402:35ce:b0:634:c377:e188 with SMTP id
 4fb4d7f45d1cf-639d5b57b06mr27140186a12.6.1760495030257; Tue, 14 Oct 2025
 19:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251004200049.871646-1-linux@roeck-us.net>
 <20251004200049.871646-4-linux@roeck-us.net>
In-Reply-To: <20251004200049.871646-4-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 12:23:24 +1000
X-Gm-Features: AS18NWBKVEuQQqj9cieP6rq05dD3n3W2YoTdkavY3oDi9G7Mkcr5482jzCL6-fU
Message-ID: <CAKmqyKNX6TEdj9CVmXEy+sxXU9rwbeo-wL44a66Z0v3XjoNmdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/net/cadence_gem: Add pcs-enabled property
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Oct 5, 2025 at 6:03=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> The Linux kernel checks the PCS disabled bit in the R_DESCONF register
> to determine if SGMII is supported. If the bit is set, SGMII support is
> disabled. Since the Microchip Icicle devicetree file configures SGMII
> interface mode, enabling the Ethernet interfaces fails when booting
> the Linux kernel.
>
> Add pcs-enabled property to to let the driver know if PCS should be
> enabled. Set the flag to false by default (indicating that PCS is disable=
d)
> to match the exiting code.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/cadence_gem.c         | 7 ++++++-
>  include/hw/net/cadence_gem.h | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 520324adfd..44896f1801 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1477,7 +1477,10 @@ static void gem_reset(DeviceState *d)
>      s->regs[R_TXPARTIALSF] =3D 0x000003ff;
>      s->regs[R_RXPARTIALSF] =3D 0x000003ff;
>      s->regs[R_MODID] =3D s->revision;
> -    s->regs[R_DESCONF] =3D 0x02D00111;
> +    s->regs[R_DESCONF] =3D 0x02D00110;
> +    if (!s->pcs_enabled) {
> +        s->regs[R_DESCONF] |=3D 0x00000001;
> +    }
>      s->regs[R_DESCONF2] =3D 0x2ab10000 | s->jumbo_max_len;
>      s->regs[R_DESCONF5] =3D 0x002f2045;
>      s->regs[R_DESCONF6] =3D R_DESCONF6_DMA_ADDR_64B_MASK;
> @@ -1821,6 +1824,8 @@ static const Property gem_properties[] =3D {
>                        num_type2_screeners, 4),
>      DEFINE_PROP_UINT16("jumbo-max-len", CadenceGEMState,
>                         jumbo_max_len, 10240),
> +    DEFINE_PROP_BOOL("pcs-enabled", CadenceGEMState,
> +                       pcs_enabled, false),
>      DEFINE_PROP_BOOL("phy-connected", CadenceGEMState, phy_connected, tr=
ue),
>      DEFINE_PROP_LINK("phy-consumer", CadenceGEMState, phy_consumer,
>                       TYPE_CADENCE_GEM, CadenceGEMState *),
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 21e7319f53..e63941f18f 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -62,6 +62,7 @@ struct CadenceGEMState {
>      uint8_t num_type2_screeners;
>      uint32_t revision;
>      uint16_t jumbo_max_len;
> +    bool pcs_enabled;
>
>      /* GEM registers backing store */
>      uint32_t regs[CADENCE_GEM_MAXREG];
> --
> 2.45.2
>
>

