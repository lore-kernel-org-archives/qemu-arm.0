Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9819054lff;
        Fri, 17 Jan 2020 05:43:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMYg3xelNU962a4MML9UIvs93B+wUteoVmneS2BW0zQWTVb3h74BW0yA+AsteCgjTR3JeV
X-Received: by 2002:a17:906:a444:: with SMTP id cb4mr7869381ejb.42.1579268619902;
        Fri, 17 Jan 2020 05:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579268619; cv=none;
        d=google.com; s=arc-20160816;
        b=ikvbF6gv1IqqDpkJHd5pGBIXrJ1FjRVTGcnYP/syWc9YGTrFP/gJgwrsCzx7XzpBp0
         GHP86phhN48JOKZ1wJl9aiVNAw7KE/zfVwtFoIuJglkwyHszwImyCUEdKrIPTu4VbeVA
         751lj12UagT40mV/JWbnd30hHWI8EXRJvH+LqRW6B/0ebj2TuKn85/ozouJB6LzPU42Z
         ouWeyG9hIsGMhHHdrvt0w0SIcfZuiQ2R0Od/K/8XBxZzZAZCofcm3qbV811+4o7D7dfQ
         V0EiaQcTI27unbX1UtHD+GhlHSXAXt4rQKJotMfbMzVl5yz3KeWs5JQjgLIaM95RPzll
         Knuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHjqrPiiAA/pjq37bbCBfMTIkCnkKIakDVz/jgpBkyM=;
        b=Z2+CHVUCbH2Yp52q9YcneYDdEPKjrfWbs7wwZn16SRZ/vK4EzDa93mnI+iLl1P+f4H
         OezzZE8ALsyrhWqmUCtD7pbFRGvCymYH52NKnXCeIRauM8Se8yHOH3Z9sb+W+A2O/Uvx
         /EAm1fpwg4ZvnRgLmDj9Jhz5p2DbyqJnrp6rtFMS5vIXiMbnLh0zjB871vr3vifFF/AB
         DAfIJiumt198wZk1Oy+b8BS0a4tGeI5/5AK0JyJZAkb6Re6H9E+nFjA26ChRpW8qxpy9
         KAcWXogoyqqN/WwotKpnJfp38xhyBZhwy+qItoO1WelAr00xEn448mVn1mSRUYfjlUNJ
         SLuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+6qWSB1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si15054240ejc.466.2020.01.17.05.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+6qWSB1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRuU-0005iG-Bi
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRu0-0005ef-O7
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRtz-0006oR-Cn
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:43:08 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRtz-0006nE-3Y
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:43:07 -0500
Received: by mail-oi1-x244.google.com with SMTP id d62so22147435oia.11
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SHjqrPiiAA/pjq37bbCBfMTIkCnkKIakDVz/jgpBkyM=;
 b=m+6qWSB1Hss8yp231rHDVzh3/WIOHh0omyX0zBfVjFHXDO2Xu/l6aHVrQ/t94AXavT
 iyl/g6WyUe9ccV71hOpchsSu2rIqdrrkZhAo8RmJdMhHEPO4uxBaOTqqXDHaAMwzXkdr
 AdJjHpUio/2R6svhh+poG+ZFPLv1HZo1IhFj2JHTlPInZNG5aGQHNVm3ZUuQdBXOIv+F
 o/70V1VazJwfgC2nho+cLRqM8XxwdBbUWoySuotCJj7f6rmvcIWFbB+nN8ghGXNt2ume
 XSjlPQTJfbJAffxVieCVP6DSHhcfrez0IA4Yvpt0gCz7KEd8hgYUhGX13JGdELERR/ZE
 IZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHjqrPiiAA/pjq37bbCBfMTIkCnkKIakDVz/jgpBkyM=;
 b=dY1epBi0JxXU5LsIWIZYIhZHUDrEZltNYiwNyTdy1TaNsNZ+gA4GeOeRs2injPx5sn
 b8iH3tLVBSuLux9zdzzMxzhlFxD4hePgJjQKGWqSaXYuYTSpP1ac/0j8GZa1MWZlHWkA
 MY6k+8B6A7qUeXhD+A/WgzONvmDWaP+70WWw4FTtgvCWMomoTyZ+wZvMggHOOSTDuc1A
 qYG56tFJA+gt2vnaV8fhAMWvxkgbPwlsx7xPYSNp54b9dUr8tl7pglVwnOsnJk98TxL3
 B7S7C4GinQTC/OMOO+y9xZtbOiyKVZsZcw1yY3zm7xLcOg4HLEFhwvL548Xlk2Mu03PN
 RVbA==
X-Gm-Message-State: APjAAAWD9g6o8cHUpV7hh6tx53GfpgHQ4+iXNQLTYEld46YZFnKZX3db
 3uR1wHgD+P7vwqrtAlceatFXUl0nFHXfRBa0QHCbEg==
X-Received: by 2002:aca:3182:: with SMTP id x124mr3500687oix.170.1579268585863; 
 Fri, 17 Jan 2020 05:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-5-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-5-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:42:54 +0000
Message-ID: <CAFEAcA81V46N8eqTtBo7YZE0kDaqVNz=iAjbqdv8m=GPRsaewg@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/char/exynos4210_uart: Implement receive FIFO
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b63OexYAxUxM

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:

The subject just says "implement receive FIFO", but the
existing code clearly has an "Exynos4210UartFIFO   rx"
which it does some storing and retrieving data from.
Could the patch be more accurately described as something
like "Implement interrupts for rx FIFO level triggers and
timeouts" ?

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/char/exynos4210_uart.c | 120 ++++++++++++++++++++++++++++++--------
>  hw/char/trace-events      |   3 +-
>  2 files changed, 97 insertions(+), 26 deletions(-)
>
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index fb7a3ebd09..61134a7bdc 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -24,6 +24,7 @@
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> +#include "qemu/timer.h"
>  #include "chardev/char-fe.h"
>  #include "chardev/char-serial.h"
>
> @@ -118,6 +119,7 @@ static const Exynos4210UartReg exynos4210_uart_regs[] = {
>  #define ULCON_STOP_BIT_SHIFT  1
>
>  /* UART Tx/Rx Status */
> +#define UTRSTAT_Rx_TIMEOUT              0x8
>  #define UTRSTAT_TRANSMITTER_EMPTY       0x4
>  #define UTRSTAT_Tx_BUFFER_EMPTY         0x2
>  #define UTRSTAT_Rx_BUFFER_DATA_READY    0x1
> @@ -147,6 +149,9 @@ typedef struct Exynos4210UartState {
>      ";
>      Exynos4210UartFIFO   tx;
>
> +    QEMUTimer *fifo_timeout_timer;
> +    uint64_t wordtime;        /* word time in ns */

You need to do something on incoming migration to handle
the new fields. This probably looks like a .post_load function
that calculates the wordtime based on the register values
that have been set by the incoming migration and set the
QEMUTimer appropriately.

(Side note while I'm thinking about it: this device has
an "Exynos4210UartFIFO tx" but it never does anything
with it except call fifo_reset() on it. We don't migrate
it either, which is a bit of a bear trap for anybody who
adds code that uses it in future...)

thanks
-- PMM
