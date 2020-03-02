Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2582333lfg;
        Mon, 2 Mar 2020 07:44:58 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvRgLHvUU4q2sUXlyilGcbug/oLkqniHAEbfVUQ/LvcSZ/B7WAwbtEZ9pVre/8Rt5hp1Wfx
X-Received: by 2002:a37:4254:: with SMTP id p81mr3398413qka.98.1583163898121;
        Mon, 02 Mar 2020 07:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583163898; cv=none;
        d=google.com; s=arc-20160816;
        b=Fh+ziJZjuGrGeIc/k2xBYdnK1+ZLyR82aJJA2BrEm9zv4KwIUBmONCSQFCOO1OExk+
         eBJOZQaCyhORAsOHNvw9iOYiqk5qnCqLevwK8B1XFH0r33cB2glr2YE44tinIrtXSOgK
         6ZZ/uEUq4XBz0Zx9D7l8+72RobwWXavUXDXenfFms6A+hxsLMByc56rgCuXwoy5cqyc+
         EEWrVH0Hpai0T6rp/dUO4pV6RUp0aRP4XIBuh+1o1LzGo/0Bdykas2DLxg9uBvlmyzCo
         aczkM/dpXZhpAAhPrrwmKNwgjCH3XuRGWHWTCLeSHjApgzgvMf8UqjvGw5uBRg0jsHoB
         cW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyRwetK4iaXS3mSeej/UIS0tNCUXW66arMw8aU9xvNI=;
        b=WZKek4dnshSuLxg48A+nqkGVbw1NvZNawDmUVQi8PuxCJ/5dDRmo87l9ufkdCBDeOg
         GlnV5tgNxMdPPtupAv9WMDojErFT9DdEz5ggs6jWxxb0ailmp6c+i8lBgzyHeAkHGPXi
         GGxCKfS/qhm5apmtwG+pYKccm5BdjZ6jxT/z2FNLJU0OITWuyZbn4/bVhWX0K/pe7c+3
         700jcrMsk/7R3jygmSk+GA1nhmv2/Im4yC219VLmRZSv7p+Bb0+CMWCfSraP98BzsI8c
         qrx6ghVTvR0DlPGdA7AieqnLhnH+Fh9M8wzcUXkoQZq2i823XOeBzz1VO01UInRXiUKb
         ACYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJUFiFMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si5842602qtj.330.2020.03.02.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 07:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJUFiFMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8nFZ-0008Cz-Ib
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 10:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nFQ-0008Cd-2W
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:44:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nFP-0001A2-5Q
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:44:48 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8nFP-00019f-0X
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:44:47 -0500
Received: by mail-ot1-x342.google.com with SMTP id 66so10121916otd.9
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 07:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyRwetK4iaXS3mSeej/UIS0tNCUXW66arMw8aU9xvNI=;
 b=JJUFiFMs54cUkZhLrk6Vk/vK7JEYU28xrp/2KTtyJ8iJ/OXBCEVBk0cPoHeanyhNtp
 L7bQe1Hxlc7KmxbuM6Z8bmZ0UtKMzKTDrizCpVbNGXA0G5gyYGZ9uVCfH6uHKcl80+sq
 baPZPl7MguNXUEEiTjslkmLre/tINC24lzJbCG3rNtuWfA3ZBIjs6g6a+M/68lwZTInG
 I940CDIUTrFqt5oetALzIdsU6l1r6ITbgSWRwqgEXL20xoeb0sxT4gXZYtvhVkooxocv
 6jhr9mv+Yha/6NJ2pRU+O47qq9C4woWnJpQ+i5bjWpWWlKbEIT7T/ZBVFuYUrLsqrxEi
 MjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyRwetK4iaXS3mSeej/UIS0tNCUXW66arMw8aU9xvNI=;
 b=MitDLLx7vQ49EcLD/bSrtJlUp2Y0Wuvtw5see9XgKO9jkn6iX+P73UaDztb3GxCS3U
 DIdT5jxshriqlp/KqOnXFYwPxDIFJb2+meXtzwJ0652ouqBMJ3R6JXINiYV/oUyCYxEP
 7p1FpKhR9dCRgre7MuholSK9J/5VrX0VqLbweS16A/x4eEAiC6dZ0/D4bLGvRrGYW+c9
 x/96vWLkuvUN0Pq+Y9LgHuU//5Z0vwoPW0O6vLPgv7tiOiTwVRT+QsFEKdAvMgJiXCqk
 rwBFm/zJy+QnknZepq8svgThVKs8L9aKb8F4kMelmuQlIW1+RvpBC7LZ+/S4FQHAw8us
 yLtA==
X-Gm-Message-State: ANhLgQ0WsoAsbONL3yX/hvb1thWLJ2AfwvydMfdKZwWgQHRrcwdJC00Q
 ZHN/wJH5N3R6G5Z7pbnmJ+U2p3YI2wkDTn6LDPhNHQ==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr5387723otq.91.1583163886316;
 Mon, 02 Mar 2020 07:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-5-nieklinnenbank@gmail.com>
In-Reply-To: <20200227220149.6845-5-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 15:44:35 +0000
Message-ID: <CAFEAcA94U=G7Bhiayt5YyJHFUMjyKwT1m5VNOH+1rV-NMysR7Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] hw/arm/cubieboard: report error when using
 unsupported -bios argument
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dYFGFdtXCfSn

On Thu, 27 Feb 2020 at 22:02, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Cubieboard machine does not support the -bios argument.
> Report an error when -bios is used and exit immediately.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  hw/arm/cubieboard.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 6c55d9056f..871b1beef4 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -19,6 +19,7 @@
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
>  #include "hw/boards.h"
>  #include "hw/arm/allwinner-a10.h"
> @@ -33,6 +34,12 @@ static void cubieboard_init(MachineState *machine)
>      AwA10State *a10;
>      Error *err = NULL;
>
> +    /* BIOS is not supported by this board */
> +    if (bios_name) {
> +        error_report("BIOS not supported for this machine");
> +        exit(1);
> +    }

We don't usually bother to check this, but I guess there's
no reason not to.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
