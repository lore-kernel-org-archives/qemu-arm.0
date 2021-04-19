Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1134201lfb;
        Mon, 19 Apr 2021 05:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS5ugL0581562z+xZzljISzO4AYdb3+hiRHSBlLpEuU6/X/dFBZeafA61poA0+k+qSH4MU
X-Received: by 2002:aca:dcc6:: with SMTP id t189mr15497840oig.9.1618836363755;
        Mon, 19 Apr 2021 05:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618836363; cv=none;
        d=google.com; s=arc-20160816;
        b=rdGFrnDD176gslwFtPYCBEyzT7666j1C/kkFfa5AOsC8EcwaLv4IQwYsc6EaCzsZvQ
         mO4AH/OpqOW5KJPz8Dfr33DFLUJGOxtLF/7n1E1t0Y6gWRWkvPuNIRC5l6V4FsVxIZf8
         Xh29x0YuYMlvVNjQOwCISXm1W1GZArI6mssueYi0ZLDj231mE548sbSBHkXW/b+K9NxF
         di3Ntoe1HJ9rT1pCD8XhlI9tle7/FSnYP2YboaBxHjWxbBShYII+pDqze3B3TAXuyIaB
         LCMGPHSs/eBrHPWtt9y4Vii+FlL7WGQY38A4Ty6ETCHagOeyyPPWUn65PQ2LF/6i/MIV
         eKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sv9j8dcxEc6wXtTNRbe2rX+iPyC8tU9lgWbMtiVd+24=;
        b=JLDFi3sG6rcqoVu2D6tRJbFLF8Nwxw84ndeJIoD1dG+WLvTVBvDOTutVs3PL34vAuU
         JTj0cwt2TglrYi70jZBPKEqHwmCJ1Es0mtqqDZEpVEga+uHMIZkpoS/FD4LmxjZqeVX9
         G69aeBQI4iKMNpItfEiIw5WdAbHEzp0zwKcJs8n621e4vDrYRC7/hUM3Fbhy4APOHrNN
         /rpoooJiHbN/6Ftmor1AUAW4B3AinWtwI2rtBYJrHllecnvGYpP7c4/ZfHA6hVLRmzIc
         h0zsDWJTyqx3euFepgDGicqCyXnTeXolBkqtn5tX4gZGqMNpwudhvXx7+scVrViY7ljL
         7vLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cxJ+knlC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si13516186otk.218.2021.04.19.05.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 05:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cxJ+knlC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYTHv-00085e-0r
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 08:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTHg-00083O-8Y
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 08:45:48 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTHe-0002VV-O1
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 08:45:48 -0400
Received: by mail-ej1-x634.google.com with SMTP id mh2so31152563ejb.8
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sv9j8dcxEc6wXtTNRbe2rX+iPyC8tU9lgWbMtiVd+24=;
 b=cxJ+knlCQRSVBj03oav5jzTEou+471yOSOiP4siL05Xt+4oNW2a5K0/VMGF3fdyBD6
 hTrVSboUgS37zKKLwY/pX8xdvUTGKldbXtXBz4OyJsEoG8B4vVo54P8DKONbgOx41U7g
 RVwnLqmm6HtqJnIdZPcGgcCN37ir9JUmCSF762rlrpOpUNUJ5OLMl3ayzjF3lQaw4NDe
 uyruHwt1dKSqc9Zztp5djpXyG61dYqMtRlOkGrN/H+0DZ3UdTslPYqvd0ZfPame5J7rl
 Ti8AED4c9cb2XdXRsW0TgOIWOyZgaeiUgiK87cmW1svXxzGG12G10grDKKppbV7fLyYV
 K/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv9j8dcxEc6wXtTNRbe2rX+iPyC8tU9lgWbMtiVd+24=;
 b=S7Cs2Bg5rO389/pXDDr5rvxNbUjQIB/8kiujPGC0KRHUB5QnjSgLUMAwLxtEITat54
 GoV1MRfFrEbrpOWzst9IihtHhhKVyeJnjh0/xBbFsFoyjm+RtzpKDZRcH69loowvADRW
 SUmfLVXEM1VpEglIcG3vkerL/2mNfUW2rEihoBGKD/Lcsbt9zHCfgBKfqnAZW33s/SiH
 VUGZgdChN7zY9vvyDXdw29v6RMnQ6CHr+cC3G1mIEHWIYKGZ9DZqqKIAnl9dmYIq6rM7
 xftuAcMxDSC6158X33q24Kw9SQRvBI/OVU6a6UnJT5RUnG3ZBr8mTHDFnPC0ZkIskRYB
 Z1Bg==
X-Gm-Message-State: AOAM5325nMkySCy/OBW71tt2+ZCGlrdKvB2x2FaEjl/CuGnifwseoFm+
 5oUbiX1zmGhKTa53FvTSVmz11lh849X8dPVWHfeDfQ==
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr21729457ejc.407.1618836344624; 
 Mon, 19 Apr 2021 05:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-8-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 13:44:53 +0100
Message-ID: <CAFEAcA-gqyn3GKWpxGed_7ehPfYP6pW8TQ4zSAVf+P88SWTZDA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnNIk5xQjMHo

On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
