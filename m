Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp157514ejb;
        Wed, 7 Jun 2023 03:55:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6knSeQRjloqoKcNG0l2qEtSwz2gtFdSdZQYKMMl9zXXr3ZZTjQyFsmAHyP/cC+dGi+20zH
X-Received: by 2002:ad4:5f45:0:b0:62b:68cb:cb9b with SMTP id p5-20020ad45f45000000b0062b68cbcb9bmr2929982qvg.35.1686135358234;
        Wed, 07 Jun 2023 03:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686135358; cv=none;
        d=google.com; s=arc-20160816;
        b=dHajNVyRWDAJDjZnCYSGIafBvOj1Z9uyCzjJtHB3Ecg+rZ3cKJMx5dfYn6neG7HC6B
         PJH7hmgZmDV2ekE8sXAMIJyTf4rNwwlTOvlf1G4qbxTWaBr3EhGljeCi2re2KXaz1wEA
         3Jz1llKBSVAjBv+uZTmgOD2MEQT2vLIxOG6wJyPdZ+JDfW/EoCHA8C9xLu2j9G8JKK5I
         PVch3G9Wa0A3pfJBLYuVNrhUfqU0Ep6H3lGkOWq2qb/wIk0MePQB2r3W/1uDn2jcIQwH
         Zm6Qqy++5LoJJH1tDcB0S9dyxDIwZv+Am5XYekvF7z6Z6A5hrHQLF94aL0g9lVfvWUp1
         7dSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9asYw7vpaUzs2Cw1L3wgCpr5l4u3ymdgFHG59ZE7HYs=;
        b=Z10ADYLL/1QxL+owPkX9wDnYWMZXNRmCPr1FHIFqLTh4RZ+D5GGVznBEDJKKtsoar8
         mJ9JBdGtsTjjZT6c+qLKPHf8KbraL8UiGZ+LK3p/OBE+y/KzjGtulIMflPU7EkANa3BN
         wPsEabyVTPybAeP2x9uM0f8tnftyEWH8kMH9fo9PY3KZijW6cqxuFfmzVz7dX1ZStLTV
         SZym4mDI+1uS7wvH+DrguPllQZGp3xm6FbRMmfsYXxqP+Om+9OdkCJIVhHJw37lrZax8
         onm+yRkS6CbZT1O9G3AGxVlegHh1tXY++ij/SeU5cVNkKXC8G+sPYW9WelJgaUSZFAMR
         ERCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ZouV7kP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020ad4574f000000b0062b76742ff4si187136qvx.166.2023.06.07.03.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 03:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ZouV7kP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6qpK-0006LR-Af; Wed, 07 Jun 2023 06:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qpH-0006KU-6D; Wed, 07 Jun 2023 06:55:40 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qpF-0001g4-Kb; Wed, 07 Jun 2023 06:55:38 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-978863fb00fso64806266b.3; 
 Wed, 07 Jun 2023 03:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686135335; x=1688727335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9asYw7vpaUzs2Cw1L3wgCpr5l4u3ymdgFHG59ZE7HYs=;
 b=ZouV7kP9quQKOpo71zIR2x7+GM/1TGckmyxbc1j5dFNYaPwkjFdrqu1oayvqsPukE+
 taN2LcE+inIbgwkienNb+BhY7GneXpT882M2ERCjF1KlgpxF1Og+pPN6NQBpUzFiAHkH
 gWXiMl7DF0xhCNE8qUNZNItX6V3IbJpInramE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686135335; x=1688727335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9asYw7vpaUzs2Cw1L3wgCpr5l4u3ymdgFHG59ZE7HYs=;
 b=lB+lMSLROhZhKIkqPUEhsw8+uZWzyKReJ5xq8ndTkVcMicAo8OrzeXvtwykqF3PC3z
 nC0tXg0kmlNoSQXmISxMcDQfgZH7WL2+F8v8A2VQxz/SwmjH4/JB0JsG5RVPLR4pctSG
 fOGrXgzdHmjyFdlu1ZjMywUAm7JQ2tkGSp7qfRJ7yAuKEoIuCDbTn+90zAajDcV4HrZe
 H6UMfY+tCtSMCAnNUeF9zGG2o5kB+lqXWglJ0N2VT1Bp7FJ2bQszQ3U7mnvTjJphSO5C
 Fge7zFCkWendYAb4JDr5Zb08ML8vGI3ioSTadRs6KzLWTAxBqXCdw7P7GjaPEhI2jYlS
 oiqA==
X-Gm-Message-State: AC+VfDybOV1Z+CSiRiagOkaC1oYrrfUKkpl3CMGGgPDatNFNDJ68GExI
 1RuIls72UYYmVHBQ8RYlTGELJwQIoyyU2VGfGJE=
X-Received: by 2002:a17:906:9751:b0:973:fa96:aff1 with SMTP id
 o17-20020a170906975100b00973fa96aff1mr5955881ejy.35.1686135335240; Wed, 07
 Jun 2023 03:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-10-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 10:55:23 +0000
Message-ID: <CACPK8XfncDzLXFQvhzqjO8Lq5aF5QWzhzNXaKoC=rBw-VifO-w@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] m25p80: Introduce an helper to retrieve the
 BlockBackend of a device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x631.google.com
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
X-TUID: U1N1BwIw6Vg1

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It will help in getting rid of some drive_get(IF_MTD) calls by
> retrieving the BlockBackend directly from the m25p80 device.
>
> Cc: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

One suggestion below after reading patch 10.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/block/flash.h | 4 ++++
>  hw/block/m25p80.c        | 6 ++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 7198953702b7..de93756cbe8f 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -76,4 +76,8 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>  void ecc_reset(ECCState *s);
>  extern const VMStateDescription vmstate_ecc_state;
>
> +/* m25p80.c */
> +
> +BlockBackend *m25p80_get_blk(DeviceState *dev);
> +
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index dc5ffbc4ff52..afc3fdf4d60b 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -25,6 +25,7 @@
>  #include "qemu/units.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/block/block.h"
> +#include "hw/block/flash.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> @@ -1830,3 +1831,8 @@ static void m25p80_register_types(void)
>  }
>
>  type_init(m25p80_register_types)
> +
> +BlockBackend *m25p80_get_blk(DeviceState *dev)
> +{
> +    return M25P80(dev)->blk;

Is it qemu convention for the caller to do the null check on dev, or
should it go in this helper?

> +}
> --
> 2.40.1
>
