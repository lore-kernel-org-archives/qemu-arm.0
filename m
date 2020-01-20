Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2904040qvm;
        Mon, 20 Jan 2020 05:42:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4C1tXrDLN7Etqei+EQYtZhCtJAgl1KZmE11pSAISO/OIfcJ9Ax3zgzJhvnoXbZQoSfJcX
X-Received: by 2002:a17:906:a950:: with SMTP id hh16mr20643459ejb.75.1579527774412;
        Mon, 20 Jan 2020 05:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579527774; cv=none;
        d=google.com; s=arc-20160816;
        b=RQIyVq3/GLrDZMYADEpPx3tpbR/Q+y6C3jfVXp7fUCcYT9dWjrB14hkAcA9emmnqei
         v84L25r7FqYN4syovcjUdhfeLiNqFypltQ8CDRV4MAp6aj8KwF/t7lFCVxFfxiaC61ot
         iKxwHHsgpGSxHimMU4boq1unVK/ZaqHrabm9By5jZJzxHNtVsOTl7Hvcoa1v6l1cs9lj
         zQ/TBFNGEJDNuQ1CXwWL1R/FV0CTlKSWhZ5/WSaZyusx6i0coqNZGXvSgdXu+7GV17d4
         C5TjtFpmoTGIUqTFOPHzeQyjKlwRsNOFUB+RpfoooE48RmiP3ojVGZl2vZVlMe81uAkX
         nFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdNEsOiVaIODjv6dgkstvRzqdNiV8ZCDhWNk6pNFEro=;
        b=QGiM9Nw3VlXMUQzfx4kUpS+uPZlZPoSGXeHqJ5CGs819vJAgzU+kRwx4ogZ/I0p+al
         /b57gfXjQG1bVEYQaQoVRyOWoAkkQniZ/Lz6FFigJUeW76e+2p2Y0Uua7cNPBJ4R9G3s
         /rHkifEqleaPZvPhSfN06/rGv//uRUJRFfs5Og+IpTISdmVIN9ClNtQtRmxRLmodJydJ
         +D981lfKCrAYIqadztuqg7/956WUHdGRr3C2twOsqTUbor+2No1z4A3ncQYNyvCmIcqN
         abCwuMk53R+oy+bDG6nTDJLzvNrZnjs8+VvNHLOXR+nD4Q9r6SXvrsO0Pvy77THytmIS
         AO2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XrXyBbfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si22305295edc.332.2020.01.20.05.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 05:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XrXyBbfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itXKP-00016V-5X
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 08:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itXJn-0000EK-Rx
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itXJm-0002Eu-K8
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:42:15 -0500
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:38045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itXJm-0002EP-GI
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:42:14 -0500
Received: by mail-ua1-x941.google.com with SMTP id c7so11470227uaf.5
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdNEsOiVaIODjv6dgkstvRzqdNiV8ZCDhWNk6pNFEro=;
 b=XrXyBbfDBJEPfmFTbgFFEgHOKg+Pq9bdOvewvjb6SyiMeF+KxuiUDaWFXZQNzKXEjO
 KPNFrEaeF8FBZNCvgtO6CIiMYlBJKQ6L//66uj2hDxIkDvVJZ9uGLVBLXUzIH4n+MdYI
 Kb+q3SfpAAtbsNptWwYpkVpBOC21Rr0d7ae/bxuEIlXA/BbMcqYuONdD9LoiE429hj5T
 nXDWxW7IWbM1FrIGnPrNdsQOL20VH5ABMEWc+iW3YB+ZbHzFouLIv5HCJnrw8zRWf0yh
 unK+H4W2AFu8URlyvd47Xu/EOcvIIME61vMG/AKRmyMIfWtsZBri4naQkatA11M8JQk5
 kmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdNEsOiVaIODjv6dgkstvRzqdNiV8ZCDhWNk6pNFEro=;
 b=YXQ10VVrClYhwavQMkaZ1I8zQeGCy8gTNKgdjgeoQx1PJz/yHVIQEzEl23iBDxT/+H
 IeXj07S2tAjyiYmg8nm3TUm/fBNdr9cheUE2uHvu7H9pcRaG9Zl1ckGSSFhoetohymIe
 Hm8NQTcwBoQSpPtwY2XcWGprozUQstgvgEVAhD6T9SfDlgwsH4ShuHmhTHKWZfPYfSOY
 S4ebeaUUMFA6YVjxgVQ2ND34szpKiNoNSQhWelNvqJD5FDXND6eLRHTMgBJwP8FWvERf
 V1btz3yonSNqYxG9kcFxVpTAz1R/KNGK12kMIh6NYdzr/Pq+SvagKZRWeItVEEBKxylo
 zR8A==
X-Gm-Message-State: APjAAAW+bX0l6qNnp0FVtuD0xLZSGUzb1sPnqMfOc2EBEC6JYajRcQth
 7XtPXqPGZ29q0atNOqnh6jXpO0A0lVrhC953YSWJ1o/frhQ=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr15109614otq.97.1579527338736; 
 Mon, 20 Jan 2020 05:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-3-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-3-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:35:27 +0000
Message-ID: <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] hw/arm/exynos4210: Fix DMA initialization
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::941
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
X-TUID: GuiK9xW3bt/H

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> First parameter to exynos4210_get_irq() is not the SPI port number,
> but the interrupt group number. Interrupt groups are 20 for mdma
> and 21 for pdma. Interrupts are not inverted. Controllers support 32
> events (pdma) or 31 events (mdma). Events must all be routed to a single
> interrupt line. Set other parameters as documented in Exynos4210 datasheet,
> section 8 (DMA controller).
>
> Reduce the number of DMA events to 30 for both pdma and mdma. QEMU's OR
> interrupt gates are currently limited to less than 32, and we would need
> 33 gates to support 32 event interrupts plus the abort interrupt.
> Operationally this should not make a difference since they are all
> routed to a single interrupt line anyway.
>
> Fixes: 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Use interrupt combiner instead of connecting all events to a
>     single interrupt. Limit number of events per DMA channel
>     to 31 to meet qemu interrupt combiner limitations.
>     [Not sure if "assert(s->num_lines < MAX_OR_LINES);" should be
>      "assert(s->num_lines <= MAX_OR_LINES);"]

Yes, that looks like a bug in or-irq.c -- it should be using <=,
so 32 is permissible.

As the comment in or-irq.h notes, we can safely simply bump the
#define value without breaking anything if you need more input
OR lines than 32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
