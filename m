Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1532598lfq;
        Mon, 11 Apr 2022 04:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8usf9LSb2JBxgg03vYSUlxR/FoaXOfIiw4AENszZbeYY9DT0YZU9nLnpROlsyFrPK9bAh
X-Received: by 2002:a05:620a:2416:b0:67d:7735:4bbf with SMTP id d22-20020a05620a241600b0067d77354bbfmr21205831qkn.501.1649674970695;
        Mon, 11 Apr 2022 04:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649674970; cv=none;
        d=google.com; s=arc-20160816;
        b=w420L65CTNnYNDHKwH8SSBo0ucH3B6qP5+ZgfVO/0UtfTyZTwNsEnX6m4MYsKBqLwZ
         XCc3DNOYfys0X0R+LXwvxwqM9+q4RgwkBd9k+tI0UnNYOdBKlHLSMTB/djoypFJecm50
         5XmHEq8OdoOsDaQQRv2ELQvNCP/9dliwTQsyNuigbCYs+FV2H59bxCNb7q44oYCOENBL
         GHz7RlcXaz3irJKvclU2bk+SOgxHpvlihwvGv0wGF6VahWn0Kxcmc6Fc54AVZ2kkJKHQ
         LnO7fRw7wm3/Jakmbyf+1K6kSmqGMpTmumZB25/VYrgMi21HmalL/dgLYPbN8obTBa5N
         dGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfCWCaizk9dfJOILFckcsPWNvFZDEkl+dcr6dlMzCoI=;
        b=NawhIG0VS1RJtpGdB9tsVv8QgcEPF+OHSC9h4sfsBzsUok6v4UrnVtg80R/Zuz48YA
         JPkvlN4/wwDdWQEo8Wyfh+DYMfqF9jreRypNbDi0TDIqr7rSpkguL7GHjAkOvUQGaG9p
         n64oE0vKlFpDv2d7xRaFqd0lMFPYeKn4W3MTGLoMXsE+bvPEK8chYA0jO+I90Nc2KPZU
         haBE9aDbnBRtBzg8UUq/Q1BB5RLnBIEGkrDgHotPobr/BZgdReeCPDDWD1EMg51IugsI
         MLidaWMaEM/esl4MqR/3/bT3AO/8nsTHi2ec7jc+ZbkDwm7l/+UFbc7IRNqGooIX4Bpe
         0VOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e0OYl00M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020a0562140c2300b00443cd1fe11asi3884898qvd.240.2022.04.11.04.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 04:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e0OYl00M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndron-0004El-Dd
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 07:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrjc-0005Oo-3z
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 06:57:28 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrjX-0004Dp-83
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 06:57:24 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ebf3746f87so65481197b3.6
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfCWCaizk9dfJOILFckcsPWNvFZDEkl+dcr6dlMzCoI=;
 b=e0OYl00MEZULSV78ZYPpU1sZT8ki1YgTQViMdFZT7fC3XpjjaQhKTYDaS1wRiWNoz4
 DA4/sLdRFPEOP6k0iT507KLSOIl/3qjZvYCmzkQDMTQeStXrnkVZT6B7qTUgZybE56fi
 mFZWQPh0NFh7+8N2hMkx/lZGPtEUf+DZfRyzDPUQ2JcHpCtiT6ehWAuRaAIjSI2kfCry
 nlrdlKB2RhwClzm5QSQ3WXvfk6Fqoh+DFHc+CGhi2oKLim8WN+S2zTOfMOkRT+X6rz3i
 uQ3aK5HDNM0UeNrZq48qLvXHA5wk+Qp3FAT7vm+fk+IwCvPC2AkhubrIJa+NUbUqhFom
 dm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfCWCaizk9dfJOILFckcsPWNvFZDEkl+dcr6dlMzCoI=;
 b=0ztYIPPaxf/yZuwYOydovW9WAk84oXwqL07Xtnn4gIwIWUSDw9oikxwgEFpMtz8r9z
 WAcbooqvqMD79pezLCku2TUnPoxhgKDu56GAjZ1NsYFNJNbQ5WoqOBXFDtvIoYkp4uzJ
 +R/tpZgh9ZoPx7tVhGkRvOofDtSokjT1+5VCShf2yBes9QzHQB8FEi1LnHK01xfWyXvc
 RLC48v+OpeFAJz7KTflcSd0jH2cHQN7gZpLqdyoZUc46RTX8syBq2JwJRLMgWMlRmbkP
 PD9NM6VHsu39k5S5oZOBpOpgAgV8Igv8WltMeMO6cf35t6weyCzNubuJi9kSPR50WV4/
 OqQg==
X-Gm-Message-State: AOAM533ZliXiAoDwbaF6JrmiP/72f3zl9aN0InTGIdBcKUaxx88i+KWm
 aTMfYRFbfmm9riBwRI4up7LPYrCLhWujQ2Ju5gX8WA==
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr25704244ywm.329.1649674642348; Mon, 11
 Apr 2022 03:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
 <20220406223440.2901032-3-wuhaotsh@google.com>
In-Reply-To: <20220406223440.2901032-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:57:11 +0100
Message-ID: <CAFEAcA-tqq=KiNw4XTZ1jD=SbPTrGdjMU1oTfSBbY+Cgh3Rkxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0d9Tnurp1M7S

On Wed, 6 Apr 2022 at 23:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch uses the defined fields to describe PWRON STRAPs for
> better readability.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 0678a56156..62d4092657 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -30,11 +30,25 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/block-backend.h"
>
> -#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
> -#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> -#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
> -#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
> -#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
> +#define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
> +        NPCM7XX_PWRON_STRAP_SPI0F18 |               \
> +        NPCM7XX_PWRON_STRAP_SFAB |                  \
> +        NPCM7XX_PWRON_STRAP_BSPA |                  \
> +        NPCM7XX_PWRON_STRAP_FUP(FUP_NORM_UART2) |   \
> +        NPCM7XX_PWRON_STRAP_SECEN |                 \
> +        NPCM7XX_PWRON_STRAP_HIZ |                   \
> +        NPCM7XX_PWRON_STRAP_ECC |                   \
> +        NPCM7XX_PWRON_STRAP_RESERVE1 |              \
> +        NPCM7XX_PWRON_STRAP_J2EN |                  \
> +        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))   \

You don't want the trailing '\' on this last line.

> +
> +#define NPCM750_EVB_POWER_ON_STRAPS ( \
> +        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_RESERVE1)

This was 0x00001ff7, but the new macro definition makes it
0x1fef (since NPCM7XX_POWER_ON_STRAPS_DEFAULT sets all bits [12:0]
and we then clear bit 4).

> +#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
> +#define QUANTA_GBS_POWER_ON_STRAPS ( \
> +        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
> +#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
> +#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
>
>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";

thanks
-- PMM
