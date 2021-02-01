Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3705707lfo;
        Mon, 1 Feb 2021 11:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeUPHU9hfshGI+Bhq5cmIHo2KHj4ZExuJKw/zvs/OL2TdyPMDTVdNBFckAOuiS2/juvwik
X-Received: by 2002:a25:35d4:: with SMTP id c203mr27801319yba.371.1612209458939;
        Mon, 01 Feb 2021 11:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612209458; cv=none;
        d=google.com; s=arc-20160816;
        b=b1WDsYAnWrL93gMl2uVBXM7rOIwqbkgX3HlnM1KnvlAj21oq8FsO1c2NXB8BJFZiro
         BnEkbwRFGH29IlgJH7XmVWDzhjSyGBRWbzO97y+53UNm5Fjahis92+e+TpNypQGWfwLM
         7bJosaBmcM5eLA8MWidn7cHPdin0YrARZfKRCVNcLRWUyzAnb0oBWMhplNc4WLv4JFQf
         HF6Rpie8Q3iJ0vtpYbapsnVhZN0HbEfgLRL/U3Gd1uOf4RSXNVO+pmbYpQc8qMDolrbt
         sLxSAwAEI2DM+Lb0GevOWoIBDZng25zXtGq4H4B7eleK5CV5LFu2N2snU8zLLG2j9pAx
         QHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MJpC+ZhoVpPrt82JDN2+JYljtbRDmVTcwos129cyrEY=;
        b=Z75pxIgNLZnGdE3DBWvGe0/FA8nMzgr6v96i7DOfTfA8CusdJZLFJH12VsggIJz5AA
         5YZ/7i7aK0QvTdSytSuDLAbIRWQ+8cj6YA6icz/7WuVIAtdAgeVzbSIE9gqJf89sTgBw
         hI9UR4yrpq79xDXH6/8iw0GdbYFXQAjtO/k6O+H2XQj+dGe97voSaML4qErCRORgmBa6
         hUqe3FUoaMVpD6QuWgzrPcq2DE9kmy7FHC2ksRsZezO9sw6pXWPzm9pAL751+cNuYxgu
         FiYe+DKiqvhW4tsLqwBHq/jO1IKntJrm6ncnXLYgHwXff7HIowAmyrlQj6eR20K2Khvd
         2qcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eXtLoe8a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k67si12206728ybc.123.2021.02.01.11.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 11:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eXtLoe8a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6fKM-0000IH-AX
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 14:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJU-0000Em-Km; Mon, 01 Feb 2021 14:56:44 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJS-0005UL-V5; Mon, 01 Feb 2021 14:56:44 -0500
Received: by mail-io1-xd2b.google.com with SMTP id y19so18761378iov.2;
 Mon, 01 Feb 2021 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MJpC+ZhoVpPrt82JDN2+JYljtbRDmVTcwos129cyrEY=;
 b=eXtLoe8a8JJSEVA7zc0HC8MGyIpGJodjCwSAA9/YRrCB09CwQQOUBsI+rLl/98mZmf
 5v7hiUCA5BQJsIdsiSPWL/ZGpqOAKiP5AVRaVep631lC4Y0b7wnjVk0OYh/1lKwJiQkP
 Q/mTn2GACqe5uIMNKRsZ74IOsQhrF3PFAD1KmOgj8UM3Ib7F3J/kWemc3a3ImOsOcWM7
 UNSQ5ABQ49Sa9cWil+lrC/kvvR4Oq3NIR1N4fMqxQSbmpiq55hLpz9L63LRVGruJcVKJ
 t0/2WD39T2tvjTOUuHKGtL2O42CHhTCy1w/qfT31p0EbasO0MW5KLzpfR+kYx9s+cJGP
 +5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MJpC+ZhoVpPrt82JDN2+JYljtbRDmVTcwos129cyrEY=;
 b=s8FJrXUEDxrWCBBTMzziEhwLNAFBNc3ujYV7erBrRrQ/GNMqw7T/y0KTn8JmJ3vJRj
 UYWvAGuXyghFbPwevOERljeJGxzoZdlymi2zNILVgaYzyaK+cLddXfnistz+rrfKnbIg
 rcWbgl0GhejjhzGDGflQYWjp95WDoCtmhYwWnLeRdJwoyPVmk4AdbrLcFoJSqfcG2Whb
 jGev+cscW+33BsjcJ46b1HavrZuTpRuD/TP2hVNnRiw2D2dLuNTmwJmilq5EKUrtBrCY
 ZfImxEXClKA+KqmRyGbywJ9DfCK2K1lLaNihz4AQoyL46ixTLFbjddmOmxicmr2Rj0Co
 7X+w==
X-Gm-Message-State: AOAM532EYqFKwoXDrwIe0L/0v2Bkq8A66M4t2J5L20T0CpVnaM20FDo1
 kYAn52ctx2FjyO0EBeOJcHQwHSRlyAvtqYpWCPKuRdx/OJ4=
X-Received: by 2002:a6b:4003:: with SMTP id k3mr13377175ioa.105.1612209401352; 
 Mon, 01 Feb 2021 11:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-5-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:56:14 -0800
Message-ID: <CAKmqyKNRGf6jF_T6A_t=LK_kROa3Vg4tZjRo9+qeRXhJGM6Zpg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/arm/xlnx-versal: Versal SoC requires ZynqMP
 peripherals
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUvZ47J76SQ8

On Sun, Jan 31, 2021 at 10:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> The Versal SoC instantiates the TYPE_XLNX_ZYNQMP_RTC object in
> versal_create_rtc()(). Select CONFIG_XLNX_ZYNQMP to fix:
>
>   $ make check-qtest-aarch64
>   ...
>   Running test qtest-aarch64/qom-test
>   qemu-system-aarch64: missing object type 'xlnx-zynmp.rtc'
>   Broken pipe
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 09298881f2f..be017b997ab 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -364,6 +364,7 @@ config XLNX_VERSAL
>      select VIRTIO_MMIO
>      select UNIMP
>      select XLNX_ZDMA
> +    select XLNX_ZYNQMP
>
>  config NPCM7XX
>      bool
> --
> 2.26.2
>
>
