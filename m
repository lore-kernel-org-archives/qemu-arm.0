Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp43185lfc;
        Mon, 8 Jun 2020 18:41:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDsM4rENiQs2vH2pFYbeCl8nazMKxhFemSz80TjazSuBg9coClE/Nwcxfg3Sy5TRsw/0Y3
X-Received: by 2002:a5b:382:: with SMTP id k2mr2502781ybp.215.1591666868494;
        Mon, 08 Jun 2020 18:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591666868; cv=none;
        d=google.com; s=arc-20160816;
        b=BNoe/sqVgItxiBygc5UcOPukuQY2eKKUs5tYNEkkfnbB4zyVaBM5wbRlgGzWpxwQvZ
         p4FPSwZ/W8ZTYLxZfiCD0Z5m78QUzo/1BxuYlqRHgPLj4fGr06L3n69YO2TK6QhF+bPF
         K8MbMv5WFgwzXISavbX6nBScHTTc8Qv4bZO6Jj5PkjFHhHa8FKUeFI2AMrSri/WBRVRN
         5G57fSmWRNH6CF+hib9r7zCMvrugtQbxeNAUd0yP8kcG+FQkdaDZ1TpC7fWBN6NQ/TUP
         Q/81qq/dUI92AkUHd/2zic9QVqiU5x4TRRbprb2Pw5LjH9n8QV/d7wVMZFUX5WrHwWhm
         JNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JchWu3Nmpi3YL/W95vchMtR9JFZKQQTDuwnTA2bm/mI=;
        b=WcsHVrjlp+LO1vtBtgVR4gO12c38R6IOPVncLJiLSFLggakWEr3r+tGFmcxH69Yv5m
         fryCmTbJGsXEfi0gCK4koQeepiuQ2ciTrrNF3mm2kOqBG96m36x2PBti6msfWwWyWhn6
         lAvbJjA4MehQlLnT97YbMJAG58+0DVMcGWTJniNbaZzlECSBS9OCwUThEKbhzdFhJw9F
         kl+SxbVCA+78slh54gf/QaSig8LZVSQYKmPPhWUX60Vibec9uAfnEIl+5xWFxn3w+I74
         0Lji4bLgYGgJkzICoyk07il729w5w5Gd5+9xw3ccp0owCtVLkLnl5JuMqHxJgB2Axn8g
         jrfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="nJ/15e2m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23si363355yba.272.2020.06.08.18.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 18:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="nJ/15e2m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiTGF-0005ri-Py
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 21:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTCI-0003gd-BI; Mon, 08 Jun 2020 21:37:02 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTCG-000098-Ka; Mon, 08 Jun 2020 21:37:02 -0400
Received: by mail-ed1-x543.google.com with SMTP id d15so2508718edm.10;
 Mon, 08 Jun 2020 18:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JchWu3Nmpi3YL/W95vchMtR9JFZKQQTDuwnTA2bm/mI=;
 b=nJ/15e2mfWjXcC3thZV28PgfbUsNdP/02imftTMICW8kD52ZzFkI8sPKZkSuhKJEp1
 g8m3YorPUgFEy6Pcvb35JpPl4bwzNbhA6u3oNun1oa8REgaV0jUFysOoo2RAYCppLId4
 3qkZDMdeNQ7TjoyIrmDnB25J2fwlvC7hJe9ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JchWu3Nmpi3YL/W95vchMtR9JFZKQQTDuwnTA2bm/mI=;
 b=sYYc1n/FAun/Vocz8SbO95xuyCcLxqc9LnFbYoTQvcZ+4ZNXd3zgICZgCKFlkp9JiC
 mUzI7lx8xysDXuQcrmlvmaSMlckUdSZkFUqskiSH49ZfRNmIeRHU8fWMbARlPVQjd/j7
 BQEwVE9no8dSBS+H2kRPY6MKLbGUSZ9zK01wAKJDjplkoN04dJU2e5RHmfr5UYPE5kbK
 WPEAY00Zd6oYizyR4x5LHSG2z9bM5jAbIJ57+D9ejdkICi+mP0FgsZfPOzokAPyWMR3Z
 uBA/5BcXVtWwWKR7sOi6ckGdjzSZgayVZWPbpT8AwrivsUbLDJiCYEi6YgGFfsl6m8K6
 9W5A==
X-Gm-Message-State: AOAM533U+eIc0Z7IbJzMj/FWGPICi3gXW97fxG7es84LOKmotHu5MNqP
 pPv+noo4enmAUknB/R/lnE6qxHXKLGTXEw4o4/Q=
X-Received: by 2002:a05:6402:1750:: with SMTP id
 v16mr25353204edx.137.1591666618876; 
 Mon, 08 Jun 2020 18:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-7-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-7-hskinnemoen@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jun 2020 01:36:47 +0000
Message-ID: <CACPK8XeidP3PzyJcqvP3m8xjiH40r08x9MPsEaEvjLy2CLOzCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm: Add two NPCM7xx-based machines
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kfting@nuvoton.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sVpwUnkgTa65

On Thu, 21 May 2020 at 20:39, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> This adds two new machines:
>
>   - npcm750-evb: Nuvoton NPCM750 Evaluation Board.
>   - quanta-gsj: A board with a NPCM730 chip.

You could note that these are the two boards supported by OpenBMC.

> They rely on the NPCM7xx SoC device to do the heavy lifting. They are
> almost completely identical at the moment, apart from the SoC type,
> which currently only changes the reset contents of one register
> (GCR.MDLR), but they might grow apart a bit more as more functionality
> is added.
>
> Both machines can boot the Linux kernel into /bin/sh.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
