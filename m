Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10152238lff;
        Fri, 17 Jan 2020 10:21:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJjsxzRqASCQM5d8oNxJJsFEwc1OxoCNVgiVt1epuUe33ayG6uTPSrPlYTTVWCmh7JSf6A
X-Received: by 2002:ac8:ff6:: with SMTP id f51mr8713216qtk.60.1579285306360;
        Fri, 17 Jan 2020 10:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579285306; cv=none;
        d=google.com; s=arc-20160816;
        b=It8pBLxRHHqsqQrIa4pEyi+IlEAlDXT+7TGHCorpMdkTAdzBmXSJvLTieRM0m33VPn
         tHCwKStiwYME+oPY27HjE/3/xP3RUYTv8k+A03smnjFNn2Nk7aHUTGfpvHPIXbGebaj7
         npW5Ii6tpwJwRsAbFDUA+N94SgSg+H16XW1ThSsA1yEUk+VyEgkbSnyiz+zjQtANDGXY
         rDEizB0daH4utEvcybh8dtPRRNNfdvQSEEyLa4QvvW9H6IOuv57hq2sPweMvmLZb2H8+
         /fuT2pIAGoQPZOj5HTQ/vus6Aw2B/sAkEB7wmnroZLPCkL//wuc45A0dOLy4v8IuVLWv
         JVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=u9shOCD9O1+12r3IyiFFm4tISZkGsIgPercoRilwGsk=;
        b=gJMx3TdJ2XdfyOkzrkw2D23Ydmfau+wJ9pxcdvtmkpNQUjRDGhZv5sqW988+JjcB+t
         GxCRcPb1KFpp99z5ZZcDjvD1zEqI+noTFo/NiWmclSDch/HJE8K8FC5JpKU+0JneDLMg
         f3vY5i05FPO8MRzQPjkllSxZj6/Ws2s+7AtZW7+CP/nJ/cKV822gkqfFQtgor9qFO33T
         aq2a49mAjNGEkea+wei+YYuyKDjp/I1IX682YeL7xcMFdccUIuSskq6r9gFp+srAyI/a
         iXlZwmMDxKvhD8rnr1AzLmTrMf7ijUygTjPiOGKwcTFjU92idqowtsrkmHmMCAIQaEqR
         W/Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Iin/iOB3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a125si15681746qkd.262.2020.01.17.10.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 10:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Iin/iOB3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isWFd-0002Wm-EC
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 13:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isWFR-0002TP-4y
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isWFQ-000303-4Z
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 13:21:33 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:39761)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isWFQ-0002zT-0c; Fri, 17 Jan 2020 13:21:32 -0500
Received: by mail-yb1-xb44.google.com with SMTP id x18so6286626ybk.6;
 Fri, 17 Jan 2020 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u9shOCD9O1+12r3IyiFFm4tISZkGsIgPercoRilwGsk=;
 b=Iin/iOB3SKzNFH6118zWBmdpqwRqox1lN/pUQaOr0WzKC0uW+e571oN+v/Mg6I94Js
 EAu4F1yM/+2kvxXgwximMJafM5W/hMtKhWDf2WcwHmL9PWKtfNQ/ChWGB//6VEjTswhp
 IhiZxUtWsv9B4r6iLw8c1+rVQnVvgbyGp8plgF+ACMOrdm7j6MRKqUYIJqwAnilYx32A
 gZlKpojdUDjOkIAW0XNAvFpHFMqEa/d8hFTOmlw+NPzfnHh0rgdloIW9MRTxCrrgvt8P
 A02g5uoaDiTX7o+kv5fBfycDDwV5UeB28PpU98h1+dc9HHKyZ8WdjSvL9pS/ZPa88i6A
 2yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=u9shOCD9O1+12r3IyiFFm4tISZkGsIgPercoRilwGsk=;
 b=LdP11CoNcY1pB1nhCO6fqhluLVx7+yjoyQcEuF2gerRYm+82XHZS3vlo2O/b9r6NtL
 3+LkCOcrHSoywV5afK1CkJ0eK9qEET07ROCaoJoo7KEz8E3YXZ+Br6CPOBQsja8mNiV3
 H2VfmIiuBYF/u4KLSaIAl/xgHdY5urcEUXJRokclmTC86gsB3RVG4rBR3RQlymr0XwTP
 quazyUgxlBqkt3vhfyJtR05G3ruQ818Tsr4SRR9VzyoixiiVONJ9sbes1Z3ztraOw20I
 fthee9AdFWQLSs9viDjw0eDKC63G8aSJbh0l4g3l2ZwoG2klExc01cJtfjEDU7xyG1z/
 Wqww==
X-Gm-Message-State: APjAAAUF6/sbXOIsbg+Wk1fjXgPSmEUQWoPhgswHpLeSm3p+udQ28HnN
 /F5RWMj/qAm67PI0PWCIgOY=
X-Received: by 2002:a25:abf2:: with SMTP id
 v105mr15317290ybi.518.1579285291296; 
 Fri, 17 Jan 2020 10:21:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w142sm11782737ywa.87.2020.01.17.10.21.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jan 2020 10:21:30 -0800 (PST)
Date: Fri, 17 Jan 2020 10:21:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/6] hw/char/exynos4210_uart: Implement receive FIFO
Message-ID: <20200117182129.GB13396@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-5-linux@roeck-us.net>
 <CAFEAcA81V46N8eqTtBo7YZE0kDaqVNz=iAjbqdv8m=GPRsaewg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA81V46N8eqTtBo7YZE0kDaqVNz=iAjbqdv8m=GPRsaewg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
X-TUID: rWpwiYYdoluR

Hi Peter,

On Fri, Jan 17, 2020 at 01:42:54PM +0000, Peter Maydell wrote:
> On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> The subject just says "implement receive FIFO", but the
> existing code clearly has an "Exynos4210UartFIFO   rx"
> which it does some storing and retrieving data from.
> Could the patch be more accurately described as something
> like "Implement interrupts for rx FIFO level triggers and
> timeouts" ?
> 
Sure, no problem.

> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/char/exynos4210_uart.c | 120 ++++++++++++++++++++++++++++++--------
> >  hw/char/trace-events      |   3 +-
> >  2 files changed, 97 insertions(+), 26 deletions(-)
> >
> > diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> > index fb7a3ebd09..61134a7bdc 100644
> > --- a/hw/char/exynos4210_uart.c
> > +++ b/hw/char/exynos4210_uart.c
> > @@ -24,6 +24,7 @@
> >  #include "migration/vmstate.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/module.h"
> > +#include "qemu/timer.h"
> >  #include "chardev/char-fe.h"
> >  #include "chardev/char-serial.h"
> >
> > @@ -118,6 +119,7 @@ static const Exynos4210UartReg exynos4210_uart_regs[] = {
> >  #define ULCON_STOP_BIT_SHIFT  1
> >
> >  /* UART Tx/Rx Status */
> > +#define UTRSTAT_Rx_TIMEOUT              0x8
> >  #define UTRSTAT_TRANSMITTER_EMPTY       0x4
> >  #define UTRSTAT_Tx_BUFFER_EMPTY         0x2
> >  #define UTRSTAT_Rx_BUFFER_DATA_READY    0x1
> > @@ -147,6 +149,9 @@ typedef struct Exynos4210UartState {
> >      ";
> >      Exynos4210UartFIFO   tx;
> >
> > +    QEMUTimer *fifo_timeout_timer;
> > +    uint64_t wordtime;        /* word time in ns */
> 
> You need to do something on incoming migration to handle
> the new fields. This probably looks like a .post_load function
> that calculates the wordtime based on the register values
> that have been set by the incoming migration and set the
> QEMUTimer appropriately.
> 
Doesn't that mean that the .post_load function is missing even today,
and that it should call exynos4210_uart_update_parameters() ?

Thanks,
Guenter
