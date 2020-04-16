Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1940428lfm;
        Thu, 16 Apr 2020 08:22:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDm/XA2+Im1fWKPlNrgyp4PKx8+xhinFw1UB1LtdI6+kNbCsqfmixB3wYvZ7oNrcFF8xUy
X-Received: by 2002:a05:620a:1405:: with SMTP id d5mr25085900qkj.329.1587050577965;
        Thu, 16 Apr 2020 08:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587050577; cv=none;
        d=google.com; s=arc-20160816;
        b=NWZBvS9en3eHLPKjRU9O6MLForU6gyTTzJhXixtBaqW0t7myC9LUdjMiF0l+rM67WE
         G7fmKgvRxZ0E5Svfqg3jXvuSmT3aLTeHYA9g6ueluOVEJkznaqzBD87oBc/ZqNMOBPjb
         5n101fmV/9IVKVSLMh6jJJj2JOy2Fe+iVsLekS4IvjBdTG7AjDdZeCuph6luskz+BtQP
         mic+Gt1tECvxzPO7ux3U+Fcvk6eskbUPWP/GbKvKaUMsndfPRDLuxKA8Am1pkDAYHWJw
         25AaqEBT63y1L1GD+qsB4hwRosvN8mnBpuQ42CxzY+ECCA0XvbZ01xCgq3JrwS5z7jel
         RCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ge2yQ0GbVdyo4A7ocWftWeRhBpa1p8Io8fLZ46j5vEk=;
        b=xxpMQ73afqIL0VhS5ZJef7ZAa/cMX8o22x1GsLfHdupXb4DhPHC7rXCTIIHqM3+6Hi
         yPmNGYlkYgCPo4cgDdfgzex96bcs/h29SbTLiN5N5sZ6OCt1bNM2rz7KEuAGn5bBPgLn
         c8Kwvlc1SFxmTYlIPxpZ54TMp1HdyQbWSoO1QYDahRWshsGPPEXVOCPlOXKJvqEtt/Pk
         R7rIEEE0pUNC97vluD0dnqHg9AmhnLR0umZEB3DLlKr9FoSEMpsDjkWtY458Uc5KHGsk
         eD+Hr9arZzHMRENkzsgmEG/MnH56MmlI4D4Po71+s8jr4D0u6rfUkD6HWbacTKaQztdd
         snBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=po+32DyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si11253219qva.4.2020.04.16.08.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 08:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=po+32DyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP6Lx-0004Y6-Dw
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 11:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6LS-0003og-Bl
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6LR-0002eZ-DM
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:22:26 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45556)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP6LR-0002e4-8l
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:22:25 -0400
Received: by mail-ot1-x341.google.com with SMTP id i22so3323902otp.12
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ge2yQ0GbVdyo4A7ocWftWeRhBpa1p8Io8fLZ46j5vEk=;
 b=po+32DyCOLn9UtCPYKlsCBA9XXc/hVSEixDY9Ck5KJtHWBUzfuYSUaEl5Lcp3Z1WIg
 FZ/uyCHA9bNkC6x97AIRRrBmUmQujGPDdx0hHgTTECgLLKtYA1XxiYqkNNNIrTCclxc5
 jWgY2B7pbEJ6WMcG9+1xBa58tgmR8MMINWDvIp42v5G5K+9pNs0Rtu4TPQNIDyrtzD3G
 YGxriw+2y8X195EV4EwV274A3r9/8Xu5x5HoHGqYVKbwYe+ySqzPLwGWfBMarZcFbJ8O
 r7b47D+vK3TK3Nqay26vw6aNamwnJLfdFx8zdFE1fOVZ8EB2GihRH7RHhNLzh3XESK1g
 EBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ge2yQ0GbVdyo4A7ocWftWeRhBpa1p8Io8fLZ46j5vEk=;
 b=shPX+gOU7glaIEvmKl7pB7/51nKC0wtSgvvvWKIvscOGLUosJniJw6aqNRNa4Yq4/y
 dXIzG/uQufrrvJbPiGQJAzmUNMctMpj0wl+EovmuRkL1/yhDgdOfFH6F4M2qQhshs4qW
 z/cDQGbr8h+Mp3SP1z0DIUQ1xsK2WS7hiTPLFR9KwgZ8VQQUlsLVJDHJfvb3QCH8X1mz
 KIfZQ+/Tj8gwxp0d7RgDQFmWtqziw/RoR71PeUXgCtqoe1w0AeE3ykIux5V288dqhp0a
 QO1fflcS1C3ZXxGsyUvyd4nBfgsJGHRErPyUZ5TNLPvdDrRclj51ZENZtCeMZvsOPYer
 WBew==
X-Gm-Message-State: AGi0PuZ1bKhX/p5Shi0zjWfIspB+Um3zbgWgmpsvNhf0K63TfYFQxW2i
 MpNitO3u8Wy1SufAfeIq4KoFvg+Rv5RrZAGdLjn82895sAQ=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr5643398otc.221.1587050544306; 
 Thu, 16 Apr 2020 08:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200322211919.11335-1-linux@roeck-us.net>
 <20200322211919.11335-8-linux@roeck-us.net>
In-Reply-To: <20200322211919.11335-8-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 16:22:13 +0100
Message-ID: <CAFEAcA9J7SkzqDbxDiH1_YHkSRoyPKCLJDR62ED1b-7oKypT9A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/arm/fsl-imx7: Instantiate various unimplemented
 devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
 Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee2m0irbDKTk

On Sun, 22 Mar 2020 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiating PWM, CAN, CAAM, and OCOTP devices is necessary to avoid
> crashes when booting mainline Linux.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
