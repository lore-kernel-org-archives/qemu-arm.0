Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp630799lfc;
        Thu, 12 Mar 2020 06:20:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsOXyzJZfCGpX3radXqVPd4teWU5YZgbq87/AIauXbIoQJNvbrbHUmAClxb2MkK5Ut4q/b0
X-Received: by 2002:a0c:fb4c:: with SMTP id b12mr7370156qvq.161.1584019204972;
        Thu, 12 Mar 2020 06:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584019204; cv=none;
        d=google.com; s=arc-20160816;
        b=oTuHoBxm1POk+AdOS4uuznHTHY1hJfK/YE7ZwkNdJl4bjHgZg7sV2wTZUKyRe5EK2E
         dJLySH0doIvI9rDEIcxiA2GXWSVhBK+L1VSBHrSbteQnndrPe2GaNyqWlZsODUwcezxF
         HUh0f700DLxy/tOZ3OQm1r4gyjBlvh8MuK12m9T5PKfavh8+q4+Z6xH1kCUPMnWVkOJb
         xJ0k6Of6Le4PUfF6ZmCGoOhTeqssPt5zjUl4X5g6L/NWjBuaz4kdM0P8NjfJry9ivNwv
         fVeUP7w+2ujX4euhTDV/qjnKZKbyHMouNFm38tobu+SOVzFS8To/2TUe40PgWS4k/K1o
         ekQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/cNo1o70PZrIiyrIkcN27XUdEr6GJ9T+R0TNlmRIjyY=;
        b=gebfu2ZZOK1dLC6z7Rw3A1rflMCA0+uApY4D6srThK6PALSji1rsIlQrla9ixDXAa1
         WeS93TbqRHOYxVncf7tKY61RGzIFLob23QjnrbT8Pw9vHQE7jk5SuA6YufSdd9FLXoFg
         DCIR1xUDtoQYxIN0TT1Cth9siV3XS+Gt2Wuk632Gq4G9iJ5mDREDx0FP2XeWXemvBndo
         120q4slIjgrhwlll4PM5gK03WzlBqaPUEqY8+bAoN3R+AXpzOshOR1Vkj1wgp1h8xYmd
         lTdZm9KFyRbcOj/v4fsNT/N7jCaND7vk09sMyrFazLU6km2uWH7RRtIGf4ycg92yPWvD
         7kew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7nFNDqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v131si2981568qkb.222.2020.03.12.06.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 06:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R7nFNDqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCNkq-0008Lu-DI
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 09:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNki-0008Lh-CB
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNkh-0007A6-CE
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:19:56 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCNkh-00078i-6O
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:19:55 -0400
Received: by mail-ot1-x343.google.com with SMTP id j14so6167884otq.3
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cNo1o70PZrIiyrIkcN27XUdEr6GJ9T+R0TNlmRIjyY=;
 b=R7nFNDqvsIJkVAvdwd3B7KLt3rsQNN9iioCIfDokZHPoNYbE3nLOZpZwi/0m5BZiC+
 7Vdm/o164PkWl0k0NzBsd/p5nfGo837fSZH65QCYryddtP3PpKd7864vyldgLYXT394C
 XvgeheVZxLPcwpVyY8h+K5bLC8CbZrrDaU4M45WdzhybeUZ8HlLb6VSoFyOvojIFuelI
 FaiM3mlLpivXusTuqsTkbVc9eYiqz7O3XZJTSK3bQAGIzmikm1tos2jtt6Pmy41s4AFY
 fj3kljpVRo8Oy+HWWH2UCj65/HEYcWugrsn7TEv2wYF2QXx46vZLhfd6QervqezVWTQM
 FCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cNo1o70PZrIiyrIkcN27XUdEr6GJ9T+R0TNlmRIjyY=;
 b=tQylkDR2CzIXSJLRuiPn1GUrexWmAtCTcc9av5CRmjbm81Wn3BbHRcR4q++6MorHYU
 OGmsAOScJlIvoO4E6OnhSceXWAmqXM3B2uWcpXrScfxA3VhqvLn/7qIIqA13uzSoWW5B
 VMfmWC2ao83MOgHKvEpeHMamhL/EuNr2Hds3KK2WCV/fLRkatwWGGtKWxhXyuqVcjVr/
 y5aanBDBu/IcVtFk+Asy30yV7sWjHVdeJckR0CaaW++AMLKv5HZNGSqG4rNsBnqiqaE2
 lcvHRz2WTfZe795CZoHcWGCRHaxlMF7KZcgtV5OWKFYHr+q0uefUD3FYv4PtxCocWPKb
 xuog==
X-Gm-Message-State: ANhLgQ3vJOaIf7U1meBXsA04ztjU2JLwpJYUkLg6VfWJI5lKCXYC2BMw
 hRk6hx+RqyVe6YrW29Jsk6D80hjiiEa7fyd1EjZvig==
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr6335114otl.135.1584019193088; 
 Thu, 12 Mar 2020 06:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-3-linux@roeck-us.net>
In-Reply-To: <20200310210434.31544-3-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 13:19:41 +0000
Message-ID: <CAFEAcA811Zo6JjCait2G467oQo-nL0RTYVdqE-ofmDSxWPcuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm/fsl-imx6ul: Wire up USB controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M89NHapWp/1v

On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
>
> IMX6UL USB controllers are quite similar to IMX7 USB controllers.
> Wire them up the same way.
>
> The only real difference is that wiring up phy devices is necessary
> to avoid phy reset timeouts in the Linux kernel.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Use USB PHY emulation
>
>  hw/arm/fsl-imx6ul.c         | 33 +++++++++++++++++++++++++++++++++
>  include/hw/arm/fsl-imx6ul.h |  9 +++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> @@ -456,6 +467,28 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>                                              FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
>      }
>
> +    /* USB */
> +    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
> +        static const int FSL_IMX6UL_USBn_IRQ[] = {
> +            FSL_IMX6UL_USB2_IRQ,
> +            FSL_IMX6UL_USB1_IRQ,
> +        };

Do we really want to wire up USB1 to USB2_IRQ and USB2 to USB1_IRQ ?
If so, a comment explaining that it is deliberate would be useful.

Side note: not used here, but in the header file we define:
    FSL_IMX6UL_USB1_IRQ     = 42,
    FSL_IMX6UL_USB2_IRQ     = 43,
    FSL_IMX6UL_USB_PHY1_IRQ = 44,
    FSL_IMX6UL_USB_PHY2_IRQ = 44,

Is that last one correct, or a cut-n-paste error that should be "45" ?

thanks
-- PMM
