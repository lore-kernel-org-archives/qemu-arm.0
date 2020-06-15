Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1683568lfm;
        Mon, 15 Jun 2020 06:18:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUXfw/viYv4wfTZKeou2ErBnIPw05dWdn0z+uDW1Movpv2G/c5xfleapCl14P91p07tjIx
X-Received: by 2002:a25:d151:: with SMTP id i78mr11635418ybg.74.1592227103312;
        Mon, 15 Jun 2020 06:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592227103; cv=none;
        d=google.com; s=arc-20160816;
        b=zctMlkPcLFnugo/OChGifT5I8NMklve/eK894HHgNdXTnh47qzx6BbHaJDv0e2YXra
         78OGbtExHdKwCt3usa0h88G8wjzARCsSrWekjg3kOukvKE8xGyPKGcaJNgLmehYbAhWN
         8K/JK+Mr3kvJls23tlS8KnSv86VVcQJs7YIgIE5+CtsUIkUjQGZndyAAlfHqXZ+3tx2A
         fohellpUa636lmsQBZxaNVkUglf6mLwDoDr2pdHmloxjXVGfLno74CRpZtaw/uAUAU3k
         aPOe8X7BsU53JJ5LL/KKwAEQluySY1FLL1clhPImkW+RkM8iD937l8MgvjmRPeIRhokf
         8sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C9iU4xzLDYGTz5JXVfcQMLl8F0Fm+tJzkudP0dqBOnw=;
        b=fdSIaCkt0utSYq6A0J3J6/mApXwb9IOSiqkCRuoDUCqk4wVh2KIiSiQ6b7O4w9rGTj
         NDcZFO24DNm+Px/LrxNpFECvpMT3tqOfDSGJ7xWAHCE2TLms6E8WZba6y73SKh4ipcXz
         XJ+RFAsY1GVEp+ssgehs1sQkZ2YQcMBq6+VgNs1UZjZnA1tcp0VMArzRVZtt2953hcY5
         p0TgFxtuTRDAf9A7jlyLPxt3hrBZDor8HcVaSFdmaN4gx8R4FzF3wBpXxAEQo+z8Jqim
         3jdexT5UeN1SEhxTxhTU1vKzKDQIJnMyEx7nWqFC9EnjWjeNOOGCQntkCXwKB4ns2aXy
         bGYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MbeNEfx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si14520523ybk.397.2020.06.15.06.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 06:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MbeNEfx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkp0I-0005Fh-Lv
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 09:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkp0B-0005EV-3r
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:18:15 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkp09-0002Se-2W
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:18:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id g7so13034288oti.13
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C9iU4xzLDYGTz5JXVfcQMLl8F0Fm+tJzkudP0dqBOnw=;
 b=MbeNEfx8v+yWc+GRLCSHSsUJTP6X+CoJmAaxBG05trp5Kkxx52q5XBfDh7T0Ec9VM7
 0VT/UzZS/Ds647O7LtJIl5sLi9h0ayOigyllgkAjVmAo8EQTTiDqGiIg0vGYY5roG1Yz
 jb03g/siksYQyZPAH9tgPplvSDqLi+Ki7KPWry6XldiKCCcL/znLkKQeDoi5+1HxlARH
 RhF2rQzSh69+jpLI0T9k2hbZEGqBSwXQVB1Y4sKfPENRwWFHp2QRQFZCBIYtlpGXZR0k
 /sdwPlj35LEYyAk/7GsFTjP9AbMlTuaNCV3yhBpcE1HJvl54BLqmo5IgaSnC1Wz6uEeZ
 h+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C9iU4xzLDYGTz5JXVfcQMLl8F0Fm+tJzkudP0dqBOnw=;
 b=DieSOxJjyiobVHGSRJWY+noRX6nkW0usWGT3+Km38Un4TDbfIXNJkDgRyUE/NNBj23
 Ctwte5LcZQuQjVleRwFl4bsJvgO4/1HGGXDRI4+V36gUbOuCnBsv4D71+I3Xq20VFLsz
 u6ZB4oEsYjEK5b9EVwMXWacWPnRDrWIP2lkltVnDDYP1T/sZ+m8q2pWrjDP6eQpnEXNO
 +yzlSbM+qvUG0r28tEP7JVrV4JMhqoaFHjWxL/DZaai3lSYF722Jk/uDU6kyaeeDBre8
 XiJyyzj2bOnOXsFqrbI/6dxnPecRMYhey5Gdv6elyt9ix38SdkXhBgNz+UsNI09XjOux
 XUWA==
X-Gm-Message-State: AOAM531y031g7JitlNWPdSYSVBqH8/a/iar6hRASM5baoDKT6jMdMRCn
 eP2t3zQc9glwYfY8t58z3UM63Zgc2o1eP6PnVAZ0DQ==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr20428357otn.221.1592227091647; 
 Mon, 15 Jun 2020 06:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200603145258.195920-1-linux@roeck-us.net>
 <20200603145258.195920-3-linux@roeck-us.net>
In-Reply-To: <20200603145258.195920-3-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 14:18:00 +0100
Message-ID: <CAFEAcA9HE0Be9QNfGKxp4YL-V_+khUNS4KOL43LBC9mQd75eLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw: arm: Set vendor property for IMX SDHCI
 emulations
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/OGfi5/QYEM

On Wed, 3 Jun 2020 at 15:53, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Set vendor property to IMX to enable IMX specific functionality
> in sdhci code.
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Added missing error checks
>     Added Philippe's Tested-by: tag
>
>  hw/arm/fsl-imx25.c  | 6 ++++++
>  hw/arm/fsl-imx6.c   | 6 ++++++
>  hw/arm/fsl-imx6ul.c | 2 ++
>  hw/arm/fsl-imx7.c   | 2 ++
>  4 files changed, 16 insertions(+)
>
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index cdaa79c26b..a853ffcc00 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -274,6 +274,12 @@ static void fsl_imx25_realize(DeviceState *dev, Erro=
r **errp)
>                                   &err);
>          object_property_set_uint(OBJECT(&s->esdhc[i]), IMX25_ESDHC_CAPAB=
ILITIES,
>                                   "capareg", &err);
> +        object_property_set_uint(OBJECT(&s->esdhc[i]), SDHCI_VENDOR_IMX,
> +                                 "vendor", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }

The existing error handling in this function is wrong -- for multiple
calls that take a pointer to a local Error*, the
check-and-error_propagate() has to be done after each call, it can't
be rolled up into a single check after all the calls. (see
include/qapi/error.h for the patterns that are valid).

On the other hand this change is correct-in-itself so I guess it
isn't making the problem worse...

thanks
-- PMM
