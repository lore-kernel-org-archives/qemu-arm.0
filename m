Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1440451lfg;
        Fri, 25 Jun 2021 04:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM2aQ3qIYobHVjParw2xOsuxeESEe4AUILSVrFh14c4u6mp/QQMmLFKZUeex2O79poJB43
X-Received: by 2002:ac8:7d12:: with SMTP id g18mr632600qtb.332.1624622357631;
        Fri, 25 Jun 2021 04:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624622357; cv=none;
        d=google.com; s=arc-20160816;
        b=RycUbw39E2EZ3+lxPuHuZgswP9mx/lf7M+ZndYNIyZ+8bNRULs9oq/wlr8GhpGcfz/
         spcouXx99+F1B+ht7TkRuX7Y6Wxj+I/7op0lHpiiCLIv1BBtSBlc/lY9QDiERaqJPFPw
         plXcZhCPmY/ljDnMFnJL/HvJwcYDJgHU2SlBVIXTg29jJREKCUw9jgrJqdwW15Mxq5uw
         dmjAOAm0cqN9DlRN5jiPkyNa+Duum2RzIuWc1CSHm8QejD3GBbDXT4zvbG3Jd97APYYd
         G7MnPm7CCIfcOrvqYJ359gvqUtvE51qdQ4oJ8Num27Lr04TLQidbbKTEjGoJtggI7dLH
         fjVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDLNWQpvFdLZlLS1A+C+hm97XGNq9lsltKtbdrTL57E=;
        b=pulitSuFdHhpqFsfiaoeH3OutOGfzI/U8bBp2TLopfhQNKqQ2V/WNG+Z2Z8KVo4DD4
         cn0IPDlFNCeKpgl9OXGuHDRt1dtjWsrANRkLDF4G/9n+qwiyK3FbXZlm4KPm9wd+0XM+
         t4/7VuBDnvqXYbnerDu/RFOZusJ30WTfYy4kovu3nEFaTSG/AFvXKYpHuA6/A7mg/mth
         m1qXfRJgAIS/zBYIewT7a55z+F2Z4fovcvmgkwU+DRGHv5+K1yzTScNeUedRRft3Lk+r
         bI+cBCJnHF937Bz8+Lj7UrGchspW2hbw1y4oCsrjct+y90a4AQ9rN0XY3y2YAbVxuhc0
         gPxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K7JiF7D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si4088842qkp.11.2021.06.25.04.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 04:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K7JiF7D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwkUP-00040U-27
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 07:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkUB-0003ui-7f
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:59:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkU4-0007XL-En
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:59:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id hq39so14698917ejc.5
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDLNWQpvFdLZlLS1A+C+hm97XGNq9lsltKtbdrTL57E=;
 b=K7JiF7D9AMjQD/Hwo03KlGcIMqEcObeAprmeF6uPK6eW/Rk8nwxAt2MTg2EpcvIjr/
 xi9zkkTHB+O3BwFzvxqAwhlaudDsUsBU6ZtcBZy9kWyVKmscxlbx7Imq1jCU6H0j3a0n
 9bTimYY5stRfAt0hi5CV2nxq7Tll2D/6N2Ge/BI+MmVRHIo6AyEvCrh0oUP4IJROKPRC
 jrIakZH9heajuIGgTfX2eFJKP/Kjc0UVBFwKwy/RAmVs5a840sqEfeMPbaBGrnxdrE75
 XprP98WXnrbngRrSaO8DdBIlQlWKrgw65HzQ9e3vvKQgBr/DZVmkO1u86V6OjpkDudPs
 4APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDLNWQpvFdLZlLS1A+C+hm97XGNq9lsltKtbdrTL57E=;
 b=TwFonVpd2ArO5uis7HCXbVCYgd9qrD4Is26AFEPnKUbS0ovT4Q5qzWh5vLeoF46pQ9
 WKbMkMmrehuL64gBakkQLENyy8U32v2rBmkqWos5DAUjCrwdYVWB8jpglhaf4Kzu3eju
 36ZgNm9rNkPFd6bffOGKcDJeb8s3dkzTXzRxhqQ03Gj3BU4RyQkmJ+icGwxc55tzzfZW
 eFTysGOjw+00mDFikCJnn/viI5TsIQwQSm62t+nJriiu4/QmCzAss+ZFfKovo/tgFw5z
 b1Pozdjrb2xjgQguxFkegdYtcaRe08F6t9fn+3Xil4n7iruA6Vl8RDLE+26htW6a9TK6
 sieA==
X-Gm-Message-State: AOAM5326VORO2Dz7Uebz4afQaCjw6LXE5ZeF77bVKVE2vVO2OphnO6nx
 KeWPqBsuzQ1sjXbwcrRkzRcV5hyVYMCtrEUrgtK3QQ==
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr10636211ejc.85.1624622331048; 
 Fri, 25 Jun 2021 04:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210625111842.3790-2-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 12:58:14 +0100
Message-ID: <CAFEAcA9Q9kc2-8h5xprg1FsKf3F7Uo7DaxMftecWgZFFoWYWXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm/virt: fix irq mapping for gpio_pwr
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zf2lYQlaJQ8M

On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Fix irq mapping for virt machine reboot and shutdown
> interrupts triggered from ATF code.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4b96f06014..d83f4ebdd3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -846,8 +846,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                             "gpios", phandle, 3, 0);
>  }
>
> -#define SECURE_GPIO_POWEROFF 0
> -#define SECURE_GPIO_RESET    1
> +#define SECURE_GPIO_POWEROFF 1
> +#define SECURE_GPIO_RESET    2

I don't understand why this is needed. QEMU counts its GPIO
lines from 0 for the PL061, so wiring up lines 1 and 2
should be no different from using lines 0 and 1 (either way,
we tell the guest what lines to use in the device tree).

-- PMM
