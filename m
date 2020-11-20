Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1467754lfb;
        Fri, 20 Nov 2020 08:49:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9cSSgfue36qBJ9wyxJbBkNz100Tf0XMiAopYYUUOdrRwYExseYGPwOS9kgU4SFrMBcHTu
X-Received: by 2002:a25:40d3:: with SMTP id n202mr24884957yba.352.1605890972799;
        Fri, 20 Nov 2020 08:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605890972; cv=none;
        d=google.com; s=arc-20160816;
        b=SqcGOYNOPOTpDN9knKs4sUn1Wux1C56IGKHXpgpqC5TVZD2amoln5OfUA/U2lQY0mr
         DrtUChc2w44LGfMER7h16R1iJJld4C32IHb1Ax6fu5D2/I+SGsOM9ACrZbpHUGr5GmRT
         9ehVtzTjpqEHu2zdOZ80TYUFv3IfYuvPmthyxcQUH+rGP5ihd4Ucv9GJ64FiApDErWQH
         fNyDwAReil5idCGLfhwVUYxwZq1OZlKqD5Y41X0gSEOjEEO9ArrwWIBiuVTbA63o4shg
         4+8lChU97/oGEqHt9JOh1wXSWpcxHWjZSjRV2dYv1Hf/CQ9oiQ9DHGbLfHbChv7CB0O1
         sKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Odi3BoS2qTZsg8YLZLhOiqoD3J/LWyFvB/MSV4PWi+g=;
        b=RaEBZWiVqX1s8zqExE5hcsh8oGaTnItSnZVsB4rFSktRRWxBF3LrFrvNFmq1Zhv904
         /6zQiiLmgDh2SHsvW1I5o0NpLCKHH0AJLAIBjajJT3wh3nr1i520bmDj8+I/b5+lkBAP
         //k1v1O8ABllXOsy7SKXn2st5MonncD9wqpBEEbUsoE4jILI+1ODrza9hQMLghLE5ucp
         kI4W0K44s9CzeBDrypFgt1jdfOB/RmtqFBffqOOPaqcsR05aD9BQ66k9UGRcYQjTXktV
         3oZrdBLeJheT9cvjCFWQwfpae6Woj2fFR7YXeuyY9d1YGKIeZajfwT1W2iftgK/rYc1Y
         8Ncg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eG1/P3j8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e85si3246837yba.19.2020.11.20.08.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eG1/P3j8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg9bI-0000sp-5P
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9aa-0000qw-V3
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:48:49 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9aZ-0002nQ-7S
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:48:48 -0500
Received: by mail-ej1-x632.google.com with SMTP id o21so13773915ejb.3
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2020 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Odi3BoS2qTZsg8YLZLhOiqoD3J/LWyFvB/MSV4PWi+g=;
 b=eG1/P3j8wU7Z+sjgERs9wsKeCEGq339W0FJGaqLMpa5Usvad4p7pk+ATDDNWDEYNgv
 HnRsFFJV1zDzfno/oNIVpVNFY2W8pNJOkul6h0oMGdPuxP7kjTOpPm6xDVA4a6K+vMJH
 xxtu+uJmuXhC/zMMJ2BCvFJWODke5sDTZcLK5arvhwGjkR9bfvuaNgkcC9kfkUCsA3x/
 xOpdHNWtYLAbT7OpQTGtn+65Fy6NYPFI71nDzUeUl/Nlo6hSNpYzFYIWv+SXh3wHi3JS
 znVBDfyIafTFE2Q+fNbBwRg/kNzw70m1gvGQlEf5mb6DcpZBc1lgtIValvpZnROLQZjK
 DTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Odi3BoS2qTZsg8YLZLhOiqoD3J/LWyFvB/MSV4PWi+g=;
 b=gFG8OwbvpHQJCapEb5y6wFjJwVPpfEOEbOfo+sMnkYOhHdU3+Ls/4T5JfbuMzaKiGQ
 GmlylWFxJvyV9flYvCMwWJ5iAT266jNGz+2w5rfpXmN2hpfnYLbVT96Z4I0ubHvPwlJ2
 hGZIuOB2+LdQBi1bInkwHsktSHLvPhf8btW6NpnLcX9f1P8B+qnXFRHMnAQImcEj5wIT
 OI5zTWET2LUiLKi0M/k84WLXpiRhnicjrIxAiZ/7ZHCDg8McugjJAmA/cmd+2Gnocbld
 ixkS5p43KkOha62mLCVrFpi2vzYnzTKRdgzOr7TQ2h0THPXBm7XuUctUJVqJnI7OP7Ep
 HPyA==
X-Gm-Message-State: AOAM532Yj9e/0prMm47wez8IBdErPDObyKQ0pTwlc8luGDcynZptgE36
 16mfuV1FlJ2SdgOAVQVso6jt++RvXCYbubivOxsisQ==
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr35242879ejr.56.1605890925956; 
 Fri, 20 Nov 2020 08:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-3-f4bug@amsat.org>
In-Reply-To: <20201120152140.2493197-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:48:34 +0000
Message-ID: <CAFEAcA85nhCv6DH-Kf0CqfaN5rYrhzE=TY54MNEqn5ko3wkDNQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 2/4] docs/system/arm: Document the various raspi
 boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPljd+5++HgX

On Fri, 20 Nov 2020 at 15:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Document the following Raspberry Pi models:
>
>  - raspi0               Raspberry Pi Zero (revision 1.2)
>  - raspi1ap             Raspberry Pi A+ (revision 1.1)
>  - raspi2b              Raspberry Pi 2B (revision 1.1)
>  - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
>  - raspi3b              Raspberry Pi 3B (revision 1.2)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 docs/system/arm/raspi.rst
>
> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> new file mode 100644
> index 00000000000..b19284e4481
> --- /dev/null
> +++ b/docs/system/arm/raspi.rst
> @@ -0,0 +1,44 @@
> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``=
, ``raspi3b``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +QEMU provides models the following Raspberry Pi boards:

"models of"

> +
> +``raspi0`` and ``raspi1ap``
> +  ARM1176JZF-S core, 512 MiB of RAM
> +``raspi2b``
> +  Cortex-A7 (4 cores), 1 GiB of RAM
> +``raspi3ap``
> +  Cortex-A53 (4 cores), 512 MiB of RAM
> +``raspi3b``
> +  Cortex-A53 (4 cores), 1 GiB of RAM
> +
> +
> +Implemented devices
> +-------------------
> +
> + * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> + * Interrupt controller
> + * DMA controller
> + * Clock and reset controller (CPRMAN)
> + * System Timer
> + * GPIO controller
> + * Serial ports (BCM2835 AUX - 16550 based - and PL011)
> + * Random Number Generator (RNG)
> + * Frame Buffer
> + * USB host (USBH)
> + * GPIO controller
> + * SD/MMC host controller
> + * SoC thermal sensor
> + * USB2 host controller (DWC2 and MPHI)
> + * MailBox controller (MBOX)
> + * VideoCore firmware (property)
> +
> +
> +Missing devices
> +---------------
> +
> + * Peripheral SPI controller (SPI)
> + * Analog to Digital Converter (ADC)
> + * Pulse Width Modulation (PWM)
> + * Security features

"Security features" is a bit vague; could we be more precise?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
