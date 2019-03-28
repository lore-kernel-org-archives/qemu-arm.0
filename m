Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp749608wrx;
        Thu, 28 Mar 2019 08:17:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysens3a2rICD6Ayd7vHJpGL5J5ARGcQOnNk9u+tp7bQJC89s0eweiNfLFVTWfJf6cCd/pU
X-Received: by 2002:a24:5e53:: with SMTP id h80mr519370itb.48.1553786259817;
        Thu, 28 Mar 2019 08:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553786259; cv=none;
        d=google.com; s=arc-20160816;
        b=iSxFOUn1AoEbG4yLEhv/q8z4I58LmAhCkY9zPlhvsScInv/VGrnty13x6Cxv2uOzVT
         XzGGABazT2Jdf6gAN+Z8Eb52e4Q3nSc0p8XnL41SVCQL+Kz1MCPABiz3mfdj0vN8Ye8c
         2OCUEQq/RARiGB4WqxjNWKWAv41sUy2wml1RHzTO8xPgzk566RVqQzYnkiFNRhrEovt9
         o19kqSpApFD3Dp8rqMr8Oz6JdbdtZ9+xj5G0QO1mk01utI6q1+k5E/SHdEVjo3UsZ+Zd
         0c7BApdeGBw8md4MJ4C2c8zAQNm+WC4+seeLR+OF0dGsjTHQgZfP0Rku3nlubMaiWl+4
         GfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pUSJ9iZvF0R+unWAoRhSEiD4MD2HYXnXlWkz2e0/ytU=;
        b=GOEw2I9wRor/INf013V4F9iJKksbWMRnKvIFrPCsSfMGiWdclTpjx0OPXcu94zdOKK
         Eg6/HM9AMIlEQALMsmavdFE9ezMSIWjCZ3RIHURqwklQxtkzPtCWrphYzfbneaclqSmb
         hPoxRQzS0yOzzf1FJR6x4yGaX0EYkiorpkoRLQe6ZbIEjxb3zo7xM98TZbyjoVMLHyKs
         92HgUMyJcEiB1FNoEo73GXYL37iWlntP5T09iaJ86Yoo+pTWpFIn+Tqi1+9MkkhrnFhV
         BjkL31O1Nh8AKhXL5V2Wy883FTEAI6v4YYUbq/eC2BKlwv+2iegeOvBQWFXnvHFhIOJc
         Ywyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=biA7bbXB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si739285ioh.70.2019.03.28.08.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 08:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=biA7bbXB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9Wmh-0003Mm-4t
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 11:17:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9WlI-0002iz-4z
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9WlG-0001NR-UH
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:16:12 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9WlG-0001LV-E5
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 11:16:10 -0400
Received: by mail-oi1-x242.google.com with SMTP id y84so16018960oia.12
	for <qemu-devel@nongnu.org>; Thu, 28 Mar 2019 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pUSJ9iZvF0R+unWAoRhSEiD4MD2HYXnXlWkz2e0/ytU=;
	b=biA7bbXBshdjXhNsbU7cff/wT2+VqHXHYHI6AjLMWJfYREP6rhlRJUS3+ip7fY3crs
	H2Kord1IjHwfFnqCay53O5ZGK8/f6ZQ9LdSB3ryKwQ1PpRIcckmHbbKMTPB6adAAODAZ
	81LrlGcPQKOlxFDCQo1ZeZZHeMXXadLOvsWLbRkwL09Rzh+Qazih5geheA3dhSVMf150
	YE6nExZzJ7PF2+FYphCrYN9GBKgSccGJefnu3GSsGPb9wEz3CaBEUmA8yp5+u1pCMOCy
	673SKnOohNL1xOVimIMYG49Rv0lLXGqXSA4DqEJd06HcubrqmEXfO59paEiLf54LqXm4
	KiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pUSJ9iZvF0R+unWAoRhSEiD4MD2HYXnXlWkz2e0/ytU=;
	b=N8D/uw0ydmeKei4lHc2GzFriUJobmmUzvTsibguiYc8tqsLnNhX/QfVWbzH4DFL/Jw
	KlLkb61vJi34pnPVFNWP1kQukvZ8FS4rGHR+dheSTtwN0ScbJh6rRwfBTdfmMUNmxM89
	GOzhM1RvS/KMPJaKSPHAIjSQQjxBlg7RHzUfrkDs636oN0qwzuZMwestnq3EeB8YK494
	39w9luInMnYiWZx6B8CUu1p4wmo6zo97LgVeprKT8XqIwh+DqO7lm8DfYjj7SEXgLKha
	v5DZcqr/EhB1VTvCXZ1d4uX5wYm7NeAxduOUsowI0/fy7/dmm1RP2uaThPBqWEMI6iN1
	A3MQ==
X-Gm-Message-State: APjAAAUh+mePVqBvMxfsHDpDYJ7nNDVZmiFK86xtMk7QZugIkXmfbd1o
	olHbN5MrgndGejNkf5tMYoDSMLMd58pBYK780KrmzQ==
X-Received: by 2002:aca:4c88:: with SMTP id z130mr371151oia.170.1553786169574; 
	Thu, 28 Mar 2019 08:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190328095736.4480-1-peter.maydell@linaro.org>
In-Reply-To: <20190328095736.4480-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2019 15:15:58 +0000
Message-ID: <CAFEAcA-JSonEz4cbYXL6TtJyZbiC==BPKyOn-tz-Egw=5bpDXA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH for-4.0] hw/arm/raspi: Diagnose requests
 for too much RAM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlAA86GK+vxi

On Thu, 28 Mar 2019 at 09:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Raspberry Pi boards have a physical memory map which does
> not allow for more than 1GB of RAM. Currently if the user tries
> to ask for more then we fail in a confusing way:
>
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> Aborted (core dumped)
>
> Catch this earlier and diagnose it with a more friendly message:
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/raspi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c28dc1..c7a18a319bc 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -12,6 +12,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
>      BusState *bus;
>      DeviceState *carddev;
>
> +    if (machine->ram_size >= 1 * GiB) {
> +        error_report("Requested ram size is too large for this machine: "
> +                     "maximum is 1GB");
> +        exit(1);
> +    }

No patch is so simple that it can't have a bug or that it's
not necessary to run 'make check'. The condition in the if()
should be ">", not ">=", as 1GB is both valid and the default...

thanks
-- PMM
