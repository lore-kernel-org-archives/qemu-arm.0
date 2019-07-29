Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3129436wrv;
        Mon, 29 Jul 2019 06:03:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXEPY1IcCOC9LcrBWQkxnx/tBDirEqefvc7+ExZQwq52ESOBL9hPwg8tO70pEApR8vRK1M
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr98999wrq.333.1564405410724;
        Mon, 29 Jul 2019 06:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564405410; cv=none;
        d=google.com; s=arc-20160816;
        b=GsnXCyjwwCELdYGj82FNuxwcH0nLONkXN8ZTk8BmIp+BagcMIAWz+mLMWYOcvVuudq
         4RkM8C7q9oUC4tCrxwilEqELvH+pA38+Xd5pFeIQVsahA9RqtKR4w+zEgCaX7Enf3ci9
         bmSLrHeYqirPT9Vr0CIkTzRMDxxztUp/UEeuMunmOH4trUjteFKzUmAldqtPyWfcvVsZ
         3r2CXJa1JF0qpIkF8U61CGmdIGQPMXz87oDwjFhrwuwHMw4fkkKJKgRHTfaWJUF0ufit
         4s+weAREDQUqjcu+G3v45o2cBWCwGl3ICpM+IkLHC4Er5yW/QyrDLP5RKo49omzGEvFN
         0DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=0nmGx14sqB9+L0dLj4XTAPxsMuhGjWxWPCBTknT9k8k=;
        b=vxNLYQeAH70VCcd4dGtc1SYplQ6JNA5Hy53frTzAmJYh0ae2MRSRNQseEx3f9Bwywb
         87NeNO9smaV7cS+FYDzxuhEFuiLfhinJ9DWlVFGoLu8yFw6nkEpiCFuo4IjWsGlAJdUp
         LqKE4557JHg8z58Lu87oOE2rH6OZY2QrDJ2C8fHW+hNz/SkshUO5a/Ff6HMpMflT86QS
         OO804QLI7ILX1jyK1V/QQjxHOj+LysGMkRcPNVCXqf1zd0jBZy8f5sbIgQABJin/PX8g
         77i5GkQ6H7RtLQHAXWDZT9dCNd5JCVsBOQi7M7iY2+zCCbIsVRYveZ+2yv9t+FIUEt20
         b/DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eNNtL/kr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g44si16879364edg.58.2019.07.29.06.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 06:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eNNtL/kr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs5JJ-0005aF-SC
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 09:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs5JC-0005a4-Dm
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs5JB-0002YG-6k
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:03:22 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs5JB-0002Wz-18
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 09:03:21 -0400
Received: by mail-ot1-x342.google.com with SMTP id n5so62491154otk.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jul 2019 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0nmGx14sqB9+L0dLj4XTAPxsMuhGjWxWPCBTknT9k8k=;
 b=eNNtL/kr32vxeow49yoLZ4wX++qkTYfLQVwLqxxQWCr3blmct+u220G6Rdon3naR1f
 Q6U6b8ZyEEK0PtwXR9fSvlm77qErM+WY2syi3wVl2kiBaJfRRlLy7vwMwvW0vP3dXPTy
 709nqfrp2GWhkcTE6S7sgR4Kgs068fFJXBP2BACEKQYSjYwO3GbvHi3bDD076J1mdzXD
 ciJcTJ0eOvTrazKimaTsZv6Yd2d/s5UQ2C0x+On0OqnkV9ecn8O2XP2Z0mjCIKZ9G1Y2
 XVPZoC1uDDCphh7CBvGcbMiNxkDqgqrLAEk2aG79e55cowl/+/cLZNTKrtQLcG1Dd7aw
 QORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0nmGx14sqB9+L0dLj4XTAPxsMuhGjWxWPCBTknT9k8k=;
 b=tXznvMwdIkY8nDcIok4+Eo66rqBl5HytJY68KXThiMDqJKHe7rcYOamCU2PCnO8fAC
 FU5YyWxLUAlxDa2PTOQ7+Ir4vDbrWiZJaGvWFMfPr8LvE+AgJ5qQtzO+yQ9vRAuhHl4C
 vqMWMM2YLWYIl5WcCdJ3cQx6oTw9Ttde0Ku7tSNqP5DbvDFxehkamqR5xnjYffbK5Qu1
 KWL3fCOGc4cTFTlXe4Sirf462Z7hMBMqclCO5XlV2phBXosswVbkzz4I8tKhw62wSBQn
 KkwReph62/nn9SbSVGQPwFP4w3tq63M66W3oGxL/n7qajfsWAdYH5EGl/xWm+LT2vBKS
 xT1Q==
X-Gm-Message-State: APjAAAUFl/PoRg6dZLlM+EkixxgJn/lVfgd0o+pk5Gr1DynDerbTlfyG
 LmRoeodZdewRh+xZZVcvvIOdzuVmUF7wkCHJV7/WGQ==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr52045292otn.135.1564405400036; 
 Mon, 29 Jul 2019 06:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-4-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:03:09 +0100
Message-ID: <CAFEAcA_m3LiLQqL8y6rT=HGeoa7B5XAQH9Wuo=Hg-94PaV3Zsg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 3/6] hw/arm: Use sysbus_init_child_obj for
 correct reference counting
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h2kKj1+L3sAq

On Mon, 1 Jul 2019 at 13:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> As explained in commit aff39be0ed97:
>
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/exynos4_boards.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index ac0b0dc2a9..5dd53d2a23 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -129,8 +129,8 @@ exynos4_boards_init_common(MachineState *machine,
>      exynos4_boards_init_ram(s, get_system_memory(),
>                              exynos4_board_ram_size[board_type]);
>
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
> -    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(machine), "soc",
> +                          &s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>                               &error_fatal);

I suspect the code change here is correct but it doesn't seem
to match the commit message -- the old code is not calling
object_property_add_child() at all, and the new code does not
call object_initialize_child()...

thanks
-- PMM
