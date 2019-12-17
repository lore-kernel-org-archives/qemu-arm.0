Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6335256lff;
        Tue, 17 Dec 2019 09:39:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNljZ0fdTXTou8YH1Vm8cRE7wXGxPKd/efkTA5UH+vnMHwSlgbRpcY4l1uQ9e81yx5E3fb
X-Received: by 2002:a05:620a:918:: with SMTP id v24mr6303817qkv.22.1576604386222;
        Tue, 17 Dec 2019 09:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576604386; cv=none;
        d=google.com; s=arc-20160816;
        b=G7aP7ZdvbVZO+4CtRGZSKkyLGTllSBkFMHMwSTPmTjUYLUoEjkWTyUxg3PyuQZpMuu
         TSfAvq/ra26VlASvSZxRvBPwVWayHV/tiWCQ88Yg2BWX9NkuJ++2ZR771hAjlyJF3FUS
         Nwk2hqdaV85f2wN0jb8qK9ta8EYso0tyfqXIDKKMK/T66SHrVRavwAGES+HZVr/vetX3
         UPJSoGMwelJs9zMKzt7B3Cx1TDai9MF8i9cX09BwItXUWxYQ7hslrmCsodEWzlnfgLuI
         QB/3FrlhzyGEB1JKb/tOnxej2EKRQ7jygHu6/SJshXJ+P6bxXFDEwPEKkoPVe0Z3k0Xu
         hIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6nMlH6NQ/zXzXEPNeLi6nAjmBQajsuEkVBCjNWQcD0=;
        b=dZjG+bpQlEQs6xXqOABRoMlxHduI+eZvDti36uOO+H6IgffpxFvzOKp1d4Bv8F+AKC
         U1PdvMeJ0rcKqESq2ZKbnL/oTcG+Y2J7I81eISS93l7h8SXghvX20FVrMuc4fSYGam+e
         oOmT3p0tM3+8EMZcBvlU2G8vRHjJUQPIkZuKkZiPynhzKbice09CbO7L2TFl/u1BnTsf
         NhdIb/CoCWyeQcA/m2zrbxgT0QXosDzXkAQMWSSoildNHE8b5FZzFys24eUtbzWb3xrN
         iXlXVL5IheZVGBvCO4zGmFmKQk1+T1ZrzMZoP9m8GDTP9f/iHbKBdlQrfggc/bsKfv5B
         xybg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gubyXtSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si12821317qvc.7.2019.12.17.09.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 09:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gubyXtSh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihGoz-0001IB-II
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 12:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihGoW-0000gs-8B
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihGoV-0007k6-1L
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:15 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:32978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihGoU-0007gu-Lt
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:14 -0500
Received: by mail-oi1-x243.google.com with SMTP id v140so6055321oie.0
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r6nMlH6NQ/zXzXEPNeLi6nAjmBQajsuEkVBCjNWQcD0=;
 b=gubyXtSh0zHIgd1Re0/fWLr0b0mA3drEhj/W9zkdeQOx/PRivitrxOyU2vII8ACCiW
 RLJX90qNIllHkvM9VELh/n9gw0TCy1HRFZ0b1HJSYrXnRSK15qsDqy513O9sE3MTUTzO
 DGsm+cfW24w5bdDwRU/RnV7hyTr0HzcK70vFSTzokUUT2zevhXAYWhVFFQul9Pbd84uf
 iFB1i8ksaAcm4190NS/AhLRrRO/KF+dBELhlLNH1Pgm17ihdIMmAh7zec7J4+p9m7SU8
 AO2pyInuDPggJEWqw83Wv+1NLM6WBYwortx8/EQc2BgbhCpeKrxBhXQ0/QYUtdWiGA6f
 c7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r6nMlH6NQ/zXzXEPNeLi6nAjmBQajsuEkVBCjNWQcD0=;
 b=Z4Y9XbAFml/z4ac1+NeSrCB9iicmqeKVppP3jIoaJcenBhQE4+5ebruWe3hoo8cVpe
 ivH6IpIqJceixfz8pmQ7WnrmGfHPhUHeCfCIPH6S3b8izBlywWhYX42mmFmgc/PMQ8AA
 H7m1jLPPKMTJA9aY2XD8kM7ioqzWvocFRjcRr5NHmIXnjaCIFLMAop7GblIoaz9ZYi3f
 sHb1uQFngc52xlNGsdccZWkbTBwuZiQ3EnqNA2wH0NsDuKWVN31hlOSWVxCDb+/z0Kxx
 OeVIvMTYdZlYWx3BVJoi06Rqga+uCy9j+0Hu5Jy2WRdvR60/PYjMMKGu9/hEeExAI8QL
 lbSQ==
X-Gm-Message-State: APjAAAXxMdrStQdKVEeEKI3wwjkwr9u+5qebdvIc/n2+nEHMdlB8G1zn
 swMBe7tvDxnoSKL5GSY9wK3a85YKeWyL1oZzkr/0Yg==
X-Received: by 2002:a05:6808:996:: with SMTP id
 a22mr2135701oic.146.1576604353813; 
 Tue, 17 Dec 2019 09:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-7-nieklinnenbank@gmail.com>
 <CAPan3WpW1Q3zpnqgk=MWRWe99=MQ4XoW2kw8L3tioFxfEBXd+Q@mail.gmail.com>
 <CAFEAcA8Viii4Em_bf4Y=AG0jU+EFFFTX6dO-52qd=RT4uHbCVw@mail.gmail.com>
 <19e4f2ac-6067-f61f-f340-108545fb0f02@linaro.org>
In-Reply-To: <19e4f2ac-6067-f61f-f340-108545fb0f02@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2019 17:39:02 +0000
Message-ID: <CAFEAcA-mzCB2OhU4AvgpSfjQMqvxm8Nn3iamoW9CY4QSA4k3gQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] arm/arm-powerctl: rebuild hflags after setting
 CP15 bits in arm_set_cpu_on()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZIvJ7iXaFvrr

On Tue, 17 Dec 2019 at 16:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/17/19 6:12 AM, Peter Maydell wrote:
> > Cc'ing Richard : this is one for you I think... (surely we
> > need to rebuild the hflags from scratch when we power up
> > a CPU anyway?)
>
> We do compute hflags from scratch in reset.
>
> It has also turned out that there were a few board models that poked at the
> contents of the cpu and needed special help.  Some of that I would imagine
> would be fixed properly with the multi-phase reset patches, where we could
> rebuild hflags when *leaving* reset.
>
> In arm_set_cpu_on_async_work, we start by resetting the cpu and then start
> poking at the contents of some system registers.  So, yes, we do need to
> rebuild after doing that.  Also, I'm not sure how this function should fit into
> the multi-phase reset future.
>
> So:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; I've applied this patch to target-arm.next.

-- PMM
