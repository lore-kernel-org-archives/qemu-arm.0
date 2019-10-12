Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2321665wrm;
        Sat, 12 Oct 2019 09:45:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXe6fDVQzAJe0u96L3+J1YcIyPuBOJhKEVGRwi6OySyhYJMm0C0z6/yCk/EhsoaRYGQaYs
X-Received: by 2002:a17:906:bcdc:: with SMTP id lw28mr19996393ejb.183.1570898733035;
        Sat, 12 Oct 2019 09:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570898733; cv=none;
        d=google.com; s=arc-20160816;
        b=Hddi/arQMTR3QnvLcXxURp1gvNbyFvkBirhLdJTSoDeBBJi9N36Lxw5JGIb6ba9Ljg
         Itm/hraP74ayhmxt6Q/Hqt0tQwYM8VZB/uA7jKpzIaCqw9ctbqQvmLcqx0rtKKsUE4Wa
         ZL6a7N4t8e9bCKbQh7aIVS4vi3wxMsJQsc2i4xaONb8W1dzcHGh4wHop5FZrdsSBMdvA
         dWaGfBFcc42B8eG1lIx6DrojU96n9oLzhAUQ3pxjn7ziLN37aZ/czLJOzsDzjzB7AUu9
         WxDlHLpHBodVPJvc7rxOAHpDRDdXHcsRXvgWS95auFoOAQm95uHu8tuuEJgDL+bcYLQR
         gA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aEN0BXrZm6iZSlp+WUj/6WY/Tz+UnFpcDTWoVbuLCDw=;
        b=FwpMMeIBKs5EAk1DRU2GdzAIgZbY7tAbdAwUWMigeTe9WJIendg8GlfTjh6vUi+g9+
         7hI5ZD19Yl1UKSZDYNSS20OSrao6WPP2/8GuHa5cCDcyeRARaqvYKZjyXrzbyU1fN/6N
         tFswtIhUl/9AMbPTibDXipvR5tjFPadE7P55cx94w4+gPYWOnBWOefHFt+0sBVrNjFuv
         wCe/Knn0MhCvt/CjSibWN6rC2Xb5/iZx8Uuq1MsPGAI8v7W/E3lglf5jbCB9XRi82CY5
         9udZiwRtz1cvQIpYUZmw7BZXBYJ/itz6CnlWFr/FM+aPhGBQJmZ+Oi56M0XMytbyI8Zw
         xY7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHMI0YJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si7699899edx.168.2019.10.12.09.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2019 09:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHMI0YJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJKWJ-0003F9-Ab
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iJKUQ-0001Fk-JJ
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 12:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iJKMA-0002iw-8z
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 12:35:03 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iJKM8-0002i2-Uk; Sat, 12 Oct 2019 12:35:01 -0400
Received: by mail-lj1-x244.google.com with SMTP id a22so12724709ljd.0;
 Sat, 12 Oct 2019 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aEN0BXrZm6iZSlp+WUj/6WY/Tz+UnFpcDTWoVbuLCDw=;
 b=KHMI0YJVyp8pwjZXhMnwSW9SyIEwYEAB9BfF3mVPA5O6vH3BVulwmVfX0ZhlseJZo5
 sbdew8Dnsvk61uM6Yv/J2titD7eLpzGvNnmVwYkcgQZK1cUcJr6g63+XJ2WC1/sCRhRA
 LJ6qUb7t0EP4XKDFMcLOR0UvdSWaecY1YxaxCNHzBbiEfpZTdpspejOZa1ayCNssmaon
 u/EsVf4bPtVoMSwO+4g5GlAasu2WTzCVsqkJd4a4e2Lb2onVA0EoI/qOwj0DoGCDJGGV
 d/8FkwKX42VAr2ypPMdA0ZIkoccGRAHA+W7kJ16fqpTM6EYDEit/HTfiNBjJNW+y+hYr
 YW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aEN0BXrZm6iZSlp+WUj/6WY/Tz+UnFpcDTWoVbuLCDw=;
 b=fB2N3VeFKDH942ttq89kmKXgXC+WM6sDexeTnrhuw79XJp9HiST21+Q5UxtG1CmUuj
 JqhUZ+WvH0p3VcxyPQknD3fxh4K8ogeU89Y6KR+A7FgN0T73n+d/0PvzNWpgRjfoHV6d
 56Y22dVEMvvhBwHi7p2zWcmbAZrQ/0pBLohxF07ky6gjOTRaRB/jH/+/DxQN5GXQEPih
 F/g7m8H/XSAENbyeSRf7kRWYvAOeXU5NY5rD1bNMLWWdSgEfvIIK94i98zQktn6JrXQr
 NKzDoYmP+BuvlMFxO53K5oaKdCvMGTY3Ihl31gH5cLHXMfJjRCF+WMTk4PJm1fwciw+g
 kJgA==
X-Gm-Message-State: APjAAAWXIPpUtPKJLwn+f7YCzal2H2dGno7w504J1XuA0tHPGBscWRV3
 oVJpHaQg3fSE9yi0R5eJEpPb2Vkh7uIPN1ayNAU=
X-Received: by 2002:a2e:9890:: with SMTP id b16mr12855552ljj.4.1570898099300; 
 Sat, 12 Oct 2019 09:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191012065426.10772-1-philmd@redhat.com>
 <20191012065426.10772-3-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 12 Oct 2019 09:34:32 -0700
Message-ID: <CAKmqyKON_tkLgHBXEDHe4vCMKrfRwu7YO3Z6-t2bqwqtfO9geA@mail.gmail.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lnFrNvmrr8Qi

On Fri, Oct 11, 2019 at 11:56 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Not all ARM machines sections Cc the qemu-arm@nongnu.org list,
> fix this.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47eae9fc46..65fbc6d7b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -805,6 +805,7 @@ F: hw/arm/virt-acpi-build.c
>  STM32F205
>  M: Alistair Francis <alistair@alistair23.me>
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/stm32f205_soc.c
>  F: hw/misc/stm32f2xx_syscfg.c
> @@ -817,12 +818,14 @@ F: include/hw/*/stm32*.h
>  Netduino 2
>  M: Alistair Francis <alistair@alistair23.me>
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/netduino2.c
>
>  SmartFusion2
>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/msf2-soc.c
>  F: hw/misc/msf2-sysreg.c
> @@ -836,6 +839,7 @@ F: include/hw/ssi/mss-spi.h
>  Emcraft M2S-FG484
>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/msf2-som.c
>
> @@ -1349,6 +1353,7 @@ T: git https://github.com/jnsnow/qemu.git ide
>
>  OMAP
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/omap*
>  F: include/hw/arm/omap.h
> --
> 2.21.0
>
>
