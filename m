Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3703757lfk;
        Mon, 29 Nov 2021 05:31:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeQxie8Ri6UE8ZsgJowZVlc9sdXbcc7R9lI0pYGjmbH9W3X0ZZKPMalQ1t6BKpisqyEsjQ
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr34220597wrn.294.1638192691125;
        Mon, 29 Nov 2021 05:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638192691; cv=none;
        d=google.com; s=arc-20160816;
        b=vfL5G7Hn85dBZuaNLQAFLhSIfM/O/XfrsQtbPGWvRx/4OSptsvydtLnPSh2DhV4gGw
         PjbPGKs6BFFv9z+iVdNvar+QgCXmNTeZJL7kvz/xZzABBshi2vfAU+YUuTCpw9Cg+MPZ
         FZ9r0t3Y+N2fGpcV36w3JAbnBYOSB1Nzd3Hh4sus9uSpjDG6F82b8+LRlH/y5VJRNDAn
         1cZyu6UaeJJsDJBW4vC5HE+rJfIPUfuOT4TV9ntDjkNVIMQVlYNtImOAHUfHp3oI0y+0
         hN3hg6PAmSL+jV0xHqfNQUymxn5y5jNcyngfo7fXqG4cSswrfw2vG8E9Yp4Q4zmlMIEg
         GAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Bkxxa/NonxkKC9sGxKxeuVuP9IpRYiGzwsRbwSljUo=;
        b=AzxpC5UD4n2WYlKQhjMlskMh50FCAghBkBGijXcxO75Pps1fM3aSu09tm44PO/ypsz
         fKryfdpD4gwqIujdjCRdaXCRaXDk4tMFTYO6ZcwJxmT7iItJEDVg/c/JwQCQewcuPjY8
         IlbWRg3X2gyF5ONiQIsdCd6YwwXLphBSpnt+Atd6FVlm0eJ36nQRCS9TyrTxXBG7M4Mp
         4UNNYZuCzeTIIXoBsbPBVzDX6KajfFZKydsn0rf6FmD6S/4a/rPtaN045mxLnV2KpfEw
         5BoFWeNPaDyRTMhpByD48iEj6hCVZSM2IpRPwtEbVFsBqLURIEau1NrxWEz44rrkGL2X
         ok9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iC+PiRIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si18378137wrr.557.2021.11.29.05.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 05:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iC+PiRIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrgkk-0007M0-7g
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 08:31:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgdH-0006GK-V5
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:23:49 -0500
Received: from [2a00:1450:4864:20::334] (port=54856
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgdF-0006Y0-Jl
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:23:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id i12so14592561wmq.4
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Bkxxa/NonxkKC9sGxKxeuVuP9IpRYiGzwsRbwSljUo=;
 b=iC+PiRISMsaoCrZ6wlgWvWIlda56aLc8emqeT7vZUMTZH8/hViyHseadKeiEDVAHJP
 zybvAXNCyRwDpuTLcj6WVSqYMYNXaQ49sfFtNY5eEHWi+w1l4vETaKOrZrmYQL3xrNVz
 2aTyN9y7yr9mLlzKIGneyQLsmviZGNpc7LJLTGuYTLhaoSpjGfgqvLWkcTTfwPXk3Bzv
 Hsx5szmUVsy3flsRdtcjpAVpN7Wtn/bOlfjLuys1VkzYw3paKNVGG7byreQZQjn9I+nR
 Bz1ou/0DsXftKhKhdDuOxatfElCO9gmnqgdiab3lQnAEQ1Ig3PPapibwGrvdbKsR5umi
 rZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Bkxxa/NonxkKC9sGxKxeuVuP9IpRYiGzwsRbwSljUo=;
 b=6eWO0qqdxFz219fYOQkxPyASauF/enEVl8EheRXYa4RBx3SHx7GKcz0DGT1x31jkNX
 4ny3Ilfk+L3la8WoBVo/zP0OMxjY+s5zWn+sp7JLsMRnR2ZO6AZh/n9NYcn/4FbFNu7v
 XUqjRr6/oBGweBpDs797gUcGtIPKwtMHwoMwBtMYYchE2+O/Ds12zJ/7JsByAmhtjBLP
 PMajmGH8V+9pWDEKjoBpKbVhHmp/juvxzZjsywC0/ScQnFtI9B2zLPMXUr0MdTV+tqIP
 zJB/EFiRnWdpQm/3w8+f+kpiIAzQBZh/tvNRzEf/pjDfNhSS/etBo2C/SgH+zG3pKQyW
 kJNg==
X-Gm-Message-State: AOAM5317GFbZyVXSWpv6xR8eloXT/P5+CjX0hs3zCop3Z12ACOTKcaJ6
 zfMxigr97tYrPNKnvC5Zjxg8f4g+lp/rQubt2o8NsuJ6BUw=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr36637866wmd.133.1638192223535; 
 Mon, 29 Nov 2021 05:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-8-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-8-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:23:32 +0000
Message-ID: <CAFEAcA-5S7+S9qG3sMEgRc-5UiZqiOg4GDnkYRU9Y5zYN4QuXw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] hw/arm/mcimx7d-sabre: Replace drive_get_next()
 by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zX5VLBDtrLBP

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Machine "mcimx7d-sabre" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
