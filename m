Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp108142lff;
        Fri, 30 Jul 2021 03:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo43wkGPQau7ndR8F3os751sGbMMDduWk4wRuLz4TARVq4hi9BlnIa/6WolGuThkc9OI4q
X-Received: by 2002:a25:db0c:: with SMTP id g12mr2186566ybf.6.1627641426099;
        Fri, 30 Jul 2021 03:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627641426; cv=none;
        d=google.com; s=arc-20160816;
        b=FRUNAmorSFgGRRiGAbwDXgDA2FXPseE6mzr6lRHUY9LDqRkBAqJ1J0DnajjZ9S1Vax
         rppEu6IjfkAv6pxCL/a/l4KwoCXEvc2cVM7wEZ2Ku8gT/TIINSobBMLEEM6G/ZIoYeGL
         ey47CJZkKgtMj6Aq3TDmq7rLgqRicDIecJfXqcPdMUVn58n/yLxHlSt5VlxPkiwGKvtK
         Q4kHAw944OA/n3pK9AiWekSmgr7A18BOcbCQhgy1rlO7Jea4vWD3OVwnfo9K5vxPbQpM
         FXDjB8Y0vrILne+bZUOJIg436OKOY7qKIV9RYQei6VlINsZjUC3kazNnrJUeB2DK0FeF
         OXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BSnEsKtnMUfjtuJ2cmvipbicq8L+ExXFMKJLSrmWY0=;
        b=G3VLAGMBcsCKaUSMEafm3tF6lRYya0xSFnXw3NkCIQ885PbeGPIFxOGSY6BxG+lHC9
         qA6FGTe6uYfNyuy5qVhnZvju8NVtFC0w8/sIPHmhFE/cC6Bso3oOHitpnrnV5plA2jUS
         NaI9WWf77fq5WdQp4F3RZIg42a3rQy3LY+Q+LO1i5uG3wSes2swRa3nUXsb1QwK4172z
         B5QHdkvM5GO4ZL6HbMbL3nv+7QKH5frgfnELYunkhN3ATk1EXbCDewoLXbUS5xShTqEf
         /B1F5BfOgoJuj7Gg9hc79/17JdzE0GyVoLWCCySdThizpY/J5SvfOUWxyTp9wfhmaWZQ
         1vwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkYSaKlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si1314455ybo.285.2021.07.30.03.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 03:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkYSaKlu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Pt3-0005tz-C6
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 06:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9Pso-0005ry-My
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 06:36:50 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9Psm-0003YB-Rr
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 06:36:50 -0400
Received: by mail-ed1-x535.google.com with SMTP id x90so12468162ede.8
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3BSnEsKtnMUfjtuJ2cmvipbicq8L+ExXFMKJLSrmWY0=;
 b=lkYSaKluujz5Vjy8j2UUksk8/7LWtvTnRoWrD2zO3x8nXb3p4f9u3jUBL/BTQHQB4P
 GoKop+5Blvj9pwWx6H60m86KMzIBP2DlM2rXexDqsbsxK3e1AlgwkT321S4muNptNFcl
 BG+cufR8PqXkFu8z+/X8IRbAmCkQWDp6vzX5aEBUxs86yYlCUylGUMrSXCS1MYVUNvp4
 PlqmZ9yovjR2Bes0xgFCsIVy4nyQrCXuNM2mt5Sh+TSXAGQ6hqOAqi6Qd+CYlSaI4Hvf
 +gV4rcBpaqOYppSziGocB95+gkx4kcD7J6vKuVqAXdaqRTxoff6M8HQKVpnXfrwCloAs
 hBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BSnEsKtnMUfjtuJ2cmvipbicq8L+ExXFMKJLSrmWY0=;
 b=QKdgmO/12CALYtVLBaSJ2wG1U3zD1BZ5Z1Sp3BYzmElHWN0QfuBI1pP+HC10oAMvMw
 fQ7C1+XzSSmWZJNFsKfOGy/Uz+xdy3z4Zrs/cmY54j7fdLr7G+4A5S7vExCbMTULJCCn
 EnlyltHyptRozhp2EU2vJmnHFRQwMYHkfVOt+yXcDQ35j63NQl6d96VeP3zYKLkjA5Ui
 GjUNeMkistav1nQ4rF8Eoo5Q7aaS2mrktjRJpSfBN89tH96p0gFJFAYJngyBlxJY2E1o
 thpW+H3qMi+fNdf3+ckjS6HfzTYzMbaKWoSllOaScaGhjkaCL85o0z1mB7zrFWJ4ffkb
 +94Q==
X-Gm-Message-State: AOAM530RER2bM/dHu93vbfIkZG0Zr34kn/JeGl5i70d8OY7hmR5Wl0S2
 DQF/oV6V3mYsF4YvaM6DU2Yx1eP/InVUV8Sj6dTncg==
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr2197416edb.36.1627641407361; 
 Fri, 30 Jul 2021 03:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-4-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210730030821.231106-4-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 11:36:04 +0100
Message-ID: <CAFEAcA-F3V2ByQ=AJjNWU8H1FHiHZBUYAN4UAfEFMjmo8PK7eA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target-arm: Add A64FX processor support to virt
 machine
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KhCIzbG6k1C7

On Fri, 30 Jul 2021 at 04:08, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Fix for patch consistency.
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06993.html

Commit messages should describe what the patch is doing and why,
so the reader can understand it without having to cross-reference
old mailing list threads.

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 27652adfae..5329e952cf 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..10286d3fd6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };

thanks
-- PMM
