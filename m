Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2722479lfk;
        Fri, 4 Feb 2022 09:16:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyor40uhOquyJJRyYvdPGC/o01rDdUOzVNXGHhXCtWwxTU2hwf11KcCv1D1ObYfShhe+uLi
X-Received: by 2002:a81:b608:: with SMTP id u8mr3956460ywh.502.1643994979303;
        Fri, 04 Feb 2022 09:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643994979; cv=none;
        d=google.com; s=arc-20160816;
        b=UiQQG6xUDZAtRuqpT12x8vl6/8fXivoKZkxWbu+CM3E1rGDc16QQItbgmrFIHENIUr
         WSjE52uuYGSXJ9z8OomCkncfeGwKU62GHTfcWWAczsF+eTVaVT7nDCJAU6dcpntCL48u
         BTY76rC5xDzkWrb8x8Q1y+0bAAYdGg/AgRloxdkrHAJjeYpHveA7vuY7XbzC2Z6UuEJK
         u51mW1KxyYle6686WNtKN53SV1NkGUik46c3aU2g9Q+mBvwW2oZ3WYiM/cdKA4Nzpym1
         Wt6yRDGPii3+t1F+eOhsFJ4r+1EVYcxNTQ7cLDELhMKJpek9Llj9rTvyPaLUveK0LuYq
         IcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3cMp5GXWifbsDRQz/PRIW9EDidnx8bTrMAZ88QWFGhs=;
        b=fFbyaT2icyHZi3+BL87MBtBX/cpe6PFrQZu9hmUHF1wYeK+j9fpvmlYKcX7BpohTn2
         at3H5Qd3lGG+aXhL29IUN7nrxK1RdBHv+A+9PXRfwms9LhpUpL0wJlR7Qeewemdcew/i
         2u4qbbIybnNo4IZk85TOH3rHOtX9kbnqXvLp0huUhEqwrQU9MzLonedYur8EWVrRSVFB
         YRVpJcBSCJkMpXRF8GUv1ZANRJe/Q6QtUiPbEduBFy2RJPexeR5mRh0zPZv59gwAhJGh
         S/7FvABM3lTBTv5XEojUCc8UcgSvLBuRvQq3TxHXZwbn/9QGYPnwwp4qJJP7UZBz4uZc
         L1zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mx4AEzxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n204si1766571ybb.399.2022.02.04.09.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 09:16:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mx4AEzxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG2C2-0005Vt-Mw
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 12:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2AI-0005TP-Gg
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 12:14:31 -0500
Received: from [2a00:1450:4864:20::42f] (port=40600
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2AG-0006Wl-QB
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 12:14:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s18so12561828wrv.7
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cMp5GXWifbsDRQz/PRIW9EDidnx8bTrMAZ88QWFGhs=;
 b=mx4AEzxXO+KH4gqSV5pSxi+FtoG0k9daWV747HZDQ1BkUiDkvfgwaibWpWZwZZz5/K
 sBiieHh01krhQn5JyuUkWVLYCMFiq6tOD4XR+Q9rv0SKO1BMdidTHUD0N/Zdb9QXU9rW
 9W4O+4wVXTDaeUf1u0Sq2utIi4KiP6ZXau6U4eh9V5Tw2PeaJR2ynLirgE8jz9Uf14Ft
 kNFr4tBkoyXr56uCXce3FMfUP4rFeYsGj0uBNfBn57vMj1NL+V2/o89nS+27OCKtKhvf
 wIVDkM4F7nNjww2hvRfATDeALwRxsHm7he9R1Un1mQFowlGkXuaTFlrqEfnRwSYI5X7q
 L5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cMp5GXWifbsDRQz/PRIW9EDidnx8bTrMAZ88QWFGhs=;
 b=muIyxQXzyi0rEmIntxg7P7TMlD92iuVIDHq9JMxAUWSPq+5g2WZRqbjlMYFblx6i7u
 eT6B/JErwNiEk0bNSe0rS7VVrLrlzvti0lxlEAs7Oepm2BXiB9QcpK7GFOSIxnLQimXq
 nQiTcsHC2HtZ/asWdePkhYRzrjQc91o/6BQjP264vmDPFGuxXJ1aEFiQ2x2tOHe3DHJK
 WQitD5s/Ur9CzhTwXSzz/ElTjR9kDvF3uiiNkfX5R9rL1dGlbriZZpv7G0TpxLIOHHJ/
 nxuP7iZInRSodIkwkidNtaKihX0dCOYOZEvZgsdJWGRWcfc60f4P++JjtM6sm1BZl1dX
 bL/A==
X-Gm-Message-State: AOAM5308IADe2CFeH5RheCwLm6NW0cGP24BPFsatGnaTq9K0vRIYsNXQ
 yNVh2R8FUmofQ/lkleVWmH4/WItJkPxM18TTFYckNw==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr3376410wrq.172.1643994866983; 
 Fri, 04 Feb 2022 09:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
In-Reply-To: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:14:16 +0000
Message-ID: <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
Subject: Re: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
To: Jimmy Brisson <jimmy.brisson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PETDReSgPaIU

On Wed, 2 Feb 2022 at 15:23, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> Turns out that this manifests in being unable to configure
> the ethernet access permissions, as the IotKitPPC looks
> these up by name.
>
> With this fix, eth is configurable
>
> Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>

Can you explain the issue here in more detail, and maybe
provide a repro case ? The AN547 document definitely thinks
that APB PPC EXP 0 has the Memory Protection Controllers and
AHB PPC EXP 0 has the GPIO, USB and Ethernet devices:
https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
(tables 6-2 to 6-4 on pages 35, 36).

thanks
-- PMM
