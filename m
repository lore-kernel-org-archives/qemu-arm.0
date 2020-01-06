Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23534503lff;
        Mon, 6 Jan 2020 08:01:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqye6BI42Xo0pVUVrVB9xn1JM/bopGGrdq+6R83Lm3tqvoDRI98M/2QebsTaLTThB5zirz+V
X-Received: by 2002:a17:906:7c5a:: with SMTP id g26mr104248380ejp.249.1578326498057;
        Mon, 06 Jan 2020 08:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578326498; cv=none;
        d=google.com; s=arc-20160816;
        b=iJoPWG6oSF2A+/Lm4VOR9f1y0ZLt0BMHXgeuuAiKSLUYJSLBKz1NHKejW15XTV03Fi
         LGikmZhi1qYn7daIjTqS+OSXIoKOvAX/m2tx2IK7TAypNq6Ywcat0Icy85ROWlmS/0v+
         PVKAZRG6u0tebZMNtTUG4Cn8Ec3bo0oXYfJ/cBVgX4Me8r8rVlM1kZNHKvRBhNdNQyiZ
         oXElxKclKi3nHmHKdzNPaBM+dZ6ah/GQB4Kpd6/Kv8poCc0N9CxtU3yU3n6WU+bej7tw
         spYMlNqWnM32xUk42xhwd3w2VznRMnM/Qix8KIJilf0mqhB6BwM85mISMTJnCYD4IvHe
         R+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fjHBg905L5Ky0lWVe6NXpfNqzz1ujavN84hCA1yqE0I=;
        b=VAj/qbC/23Ql9yN4fzWk7K89EDeB9bxYAGGRJas4DLmrmvoIkUVAeQYQxIUCs7QP46
         r10nZaUFx3ZMtGX9DEls7IorOI8026cOtzQ/KaxvJb1JTI9h6vul4AhtQdeVFAtXAr5Q
         HiwGYRFkgyztgp2wVdaI5+fyfpz6/r5Rmd9/LPZGVKIXjvjp0b3XnByldkzvOTzA1/zA
         1HSuBOQWwb6yNtVaLh6yRhUkg07QOsBvM4k724n4SHLb7RImpXHY+D2xvq2nWlRsfp6c
         BTP0CHZPOzZ3mImb0JS52HWdoMee3q2dRFS7EWkzhK85tyTvNQQUSD22As2T+tCEOQqq
         NLrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RTKTJFym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si45310276ejx.285.2020.01.06.08.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RTKTJFym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioUoy-0004Uj-Q5
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUom-0004Rg-CW
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUol-0003tW-Ag
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:01:24 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioUol-0003sx-5U
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:01:23 -0500
Received: by mail-oi1-x243.google.com with SMTP id n16so12125677oie.12
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fjHBg905L5Ky0lWVe6NXpfNqzz1ujavN84hCA1yqE0I=;
 b=RTKTJFymWlrUjINowAhL9lrVMjl/2B7Vsua1kq8rpJfNRB1kOxhcJRymUn2AmZfLy7
 y/i5Fd/UuvHUxlbgEF/qJlEpz7xL6MSac05yFlIvMKc+b7TEgsnmzIE5YkdWF+FwRH5M
 vgJmodhmUikkUY30SwzkCGFBOBNA3l2RWo81IZX3xiL+UdksTzrpKFnTRIdzzxOdlgsm
 LSfyJUmSzY5MdT6d4IwMwnPyzHyeglq2zZ3alQxrypq58KE/t9z6BEqmbyOmk2Vr0i94
 v7eoIxAncAjKxCUVxWlVtlzh77zyJMUzq2G8Xsls5hcTCn+x8yNXCTXsANCelp17HPa5
 rcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fjHBg905L5Ky0lWVe6NXpfNqzz1ujavN84hCA1yqE0I=;
 b=TdenDUkpyerNcQGtF9HMPel8pjiiteKRT+kxtYpBkDrafYaCnZQJUVOLO3ZVavyCL6
 aA8CSzqIXlOh5xbo/KqfZ8W5OjZ4SugA2cNWy/3Qz/1JtG7Lov93oeKrWKxHudXFgzJG
 Q2mFe/OFmupPTj3okdV5PSlTMrnHkIfUOjCXD0kMC5o6ilPjq/Rz9u+OKQ1wx2Ldk3Rt
 LTHOrSTcxQujcf/8LW383M+XRV4InIFP2zUYt1URv/v669CSR9qDIPyLHLmaKiwop7eD
 c0irw/j7kZO31dT6BrY8MxtB39/VuzhYEl7MWDIE9mO2R7Qkg66RJahhzec7R0HUNALE
 PdCA==
X-Gm-Message-State: APjAAAXgmrtWZrKcrTjcRGCfc1kOsAgu5490MqlHSFEzwAEynBvJ4Rvk
 jCkK2qfi8TnUGKqeKSKDca9CNb25Z/wNB6F8zXylcw==
X-Received: by 2002:aca:570d:: with SMTP id l13mr5450072oib.146.1578326482292; 
 Mon, 06 Jan 2020 08:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-5-f4bug@amsat.org>
In-Reply-To: <20191230110953.25496-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 16:01:11 +0000
Message-ID: <CAFEAcA8oR4b4DZXcLV=QjyCBMc9ot-Wj10cUM=UU=Y9-kBfxEg@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/arm/allwinner-a10: Simplify by passing IRQs with
 qdev_pass_gpios()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAY6s+B3m0w2

On Mon, 30 Dec 2019 at 11:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> By calling qdev_pass_gpios() we don't need to hold a copy of the
> IRQs from the INTC into the SoC state.
> Instead of filling an array of qemu_irq and passing it around, we
> can now directly call qdev_get_gpio_in() on the SoC.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/allwinner-a10.h |  1 -
>  hw/arm/allwinner-a10.c         | 24 +++++++++++-------------
>  2 files changed, 11 insertions(+), 14 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
