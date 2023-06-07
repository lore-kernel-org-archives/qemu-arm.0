Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp157581ejb;
        Wed, 7 Jun 2023 03:56:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6udyRL2j8tn6JyRE7h4pA+ORR5sV9UhOTQDpL8rNFTUJCoDimUarPXbIBs7UR4tAeTPQF/
X-Received: by 2002:ac8:5784:0:b0:3ef:3511:f494 with SMTP id v4-20020ac85784000000b003ef3511f494mr2910334qta.16.1686135370916;
        Wed, 07 Jun 2023 03:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686135370; cv=none;
        d=google.com; s=arc-20160816;
        b=fY6kcOXSKFWE8uqtFm4aw6T2krN3W7EukxB4JvGGZOKPm7yNLHVIsgBS/+qH+HFnd0
         JS9Jq5IAqT7o+qh0fyBe6zESLHbDY3Vv35Sl46qHQG3LrdwgEZqV0QPv+RqN0eq7KxdO
         g5YeN/KzUpQof8+ePKdFBM5UXhjfQCYz5NmRVg8d5FghfqeuouO/QDPVvUU1thfhcn2W
         xmrBY6spiOgZyiBUGksxisIhWCd5Q8KGtYp+yyGMaf1pwuot/XeuaLztwweIs9PvWsSv
         t7y8C5xLUeTjPhMjRsdrDPVei1QUQxb8wi8coduyY9dTuOcPmWeL2zD7xUoVZgNfJOjf
         uIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ib/4dh6/10KWhyrEZa+6Se/dqChCjxMLXkvXYuPbCas=;
        b=uWonPgNPYQXV71UjNdAmuQQbJrBjIB4Tf9NJy8nqL8Si0Q1F3COseAPNWmwdbBA7Kb
         fEMmodWqpMYCU4LWf6GbW1Al+F5RXq4+LFIjq+OduX9FOD2/Xuo4WPIJQ+Yliiu/KuB+
         8uWUga5lTMoOmVIKyeeFXbx45xhORfjX2Q3E3uwM/sIKDIWJ78BFGEX+n4Ym8fLHcsF2
         u6b7YrU0ZdrFvmLUBnGjPL4RzQNooARPZ8skW2eJ67XC7h75QMR+ekELNXqBdwA/XUmJ
         xP88MXV+U5g+HLzZbb5tlc2oMHjxsDpmInOMa0GPFxxZ1/EQWIsisGqEF/AS0ZQsOJ1n
         4JTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=R3929sJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ac87c45000000b003f53ff4be0bsi7669518qtv.46.2023.06.07.03.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 03:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=R3929sJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6qpa-0006Ot-CZ; Wed, 07 Jun 2023 06:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qpZ-0006O9-RJ; Wed, 07 Jun 2023 06:55:57 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1q6qpY-0001jF-By; Wed, 07 Jun 2023 06:55:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9768fd99c0cso97682666b.0; 
 Wed, 07 Jun 2023 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686135354; x=1688727354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ib/4dh6/10KWhyrEZa+6Se/dqChCjxMLXkvXYuPbCas=;
 b=R3929sJQOd3me3oyX/IeFlAZ8irxYnxqKjkGvR6eD+Qj8KztoaxszFUVKclB+Q5ARG
 wy979yaZQO0LozEnp2WypER1A6XMXKdIsH36vIb2x1jaqfW0i9xshHNYpa9hqR+FIMk1
 k4kfxX2CsoOGkF/yE1AsdfmJZqYMVmApEEBu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686135354; x=1688727354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ib/4dh6/10KWhyrEZa+6Se/dqChCjxMLXkvXYuPbCas=;
 b=Vr7XBAx9plpzOQoFHtgYIWpmKnpHfqTQw+5/RFta8s0lUu9lPPK5ZneL9m3OBP7YBe
 BpGUihlTzzfLV5B1ChVvAm9C9W7hz3z3ZGb9OKjzhtVvuaak1Y5JzYjUX5Q4+DwXMD0y
 Svhp9C7RtAdUqM0Am7g0Erwy0X3UW3+EdySocQgflLdtoXKFYShlEOOAmy4KsaFhAC3a
 oTmK1IANjvkdeyCqSHIinbJ8R4G/PRbtm6CCbcBtSEWYcCeAi2GWzuFWLrptYyqtPi6W
 M0j3ecgoAXKz1UWiv7di/SW9t44pZlaCztaksyn1litYx/Jt0RBPwb0rrWzxVRD1xGHq
 Kfdg==
X-Gm-Message-State: AC+VfDx+uArmdkON7eSfhz9AyWTAqnF8gSS7OaHFs55xgjQUgxvFkGmy
 mmRUyBkiznF+VuQyGUDRoppm8SVkLFGve30SpXxVuWdv
X-Received: by 2002:a17:907:9816:b0:978:2b56:d76e with SMTP id
 ji22-20020a170907981600b009782b56d76emr6153261ejc.12.1686135354281; Wed, 07
 Jun 2023 03:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-11-clg@kaod.org>
In-Reply-To: <20230607043943.1837186-11-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2023 10:55:41 +0000
Message-ID: <CACPK8XfwFKB6rNq5SU=CbRNTdMEn18wk6jA2K72XdhXxVLF1mg@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] aspeed: Get the BlockBackend of FMC0 from the
 flash device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62b.google.com
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
X-TUID: mDHHRV+YMlh7

On Wed, 7 Jun 2023 at 04:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> and get rid of an unnecessary drive_get(IF_MTD) call.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index efc112ca37b0..8beed0c2a66e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -15,6 +15,7 @@
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/arm/aspeed_eeprom.h"
> +#include "hw/block/flash.h"
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> @@ -427,11 +428,12 @@ static void aspeed_machine_init(MachineState *machi=
ne)
>      }
>
>      if (!bmc->mmio_exec) {
> -        DriveInfo *mtd0 =3D drive_get(IF_MTD, 0, 0);
> +        DeviceState *dev =3D ssi_get_cs(bmc->soc.fmc.spi, 0);
> +        BlockBackend *fmc0 =3D dev ? m25p80_get_blk(dev) : NULL;
>
> -        if (mtd0) {
> +        if (fmc0) {
>              uint64_t rom_size =3D memory_region_size(&bmc->soc.spi_boot)=
;
> -            aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(mtd0), rom_=
size);
> +            aspeed_install_boot_rom(bmc, fmc0, rom_size);
>          }
>      }
>
> --
> 2.40.1
>
