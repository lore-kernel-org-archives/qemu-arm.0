Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9806924lff;
        Fri, 17 Jan 2020 05:32:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJxTF6/LKOhofxTckA7Xd+5MTfVeUO99JD8+fyrAlk474511sTZox+OAnDPd03LmK4ZZBo
X-Received: by 2002:a37:9bd2:: with SMTP id d201mr37728369qke.55.1579267957478;
        Fri, 17 Jan 2020 05:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579267957; cv=none;
        d=google.com; s=arc-20160816;
        b=jXTb0GNKP3oN1ZKLRSO1FqBxEQLhxZaTq1PzlpbotIFfThq3G477xzUGEb3b25TKJ9
         weUqXrFXQj7MA58VwWVZDO9p7ogjPq3UjbvBNvGdWrYzwhAdw+cipFTGY+2a94BNMRdQ
         ONOClBQKEn1GBiDSx/oU9O9OZLqVCHaEEkEdE1/dzpyoTUA9CsyvscZn/UtS5Um246Ik
         JRn//uYX3iUNyTNJp6bBGAWQmxjKjJ4wbNWzq/2k7z2rWGgp9L1aZCujYO2Sfy2FGOLi
         wFPIEHJyv/2ZDGZYY+0LCh+aVkT6aLiZeiKfA41edfTJ8fFus+xBan9gsro6DRLp60Jr
         xzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hy18uxb89ZZQrsLX5KmzibiBKtF/Qypel7x5Z2d3dsQ=;
        b=VuYJ17xmG82GJc6S9jXJPHnxwh7hyRp2+26K9Zc7pSmTCyoO93XYHacEuFVeJS5jap
         Op48WDCEG2WYf+mahaYapFD+3BzxxxZqcvhPBT7bCkkhhIITm3jLceBY1lNS+1z9o+J6
         BlnjMpPHRmfiOhUaMJrA4td2Jjf78nTYn6OaIT9nqmT188S5ylVYNfWflMAju/jp2X1o
         E6ED38UOXcL1oy663Nmx3SiW88kX2r0IzoPrl61hC7neEreA373q+jK2DAIyL9w/SrQq
         gQNnZB0anngbvKRq02HAw3KyIyq63CpF+oLjocUDB2fUSAKWpalPZDhzwlZK3mUHD3s7
         qI4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBqhwJ+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si15174247qkc.197.2020.01.17.05.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBqhwJ+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRjo-0001kj-Au
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRjX-0001eK-IL
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRjV-0007QT-O6
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:32:19 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46205)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRjV-0007Ik-Jd
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:32:17 -0500
Received: by mail-ot1-x344.google.com with SMTP id r9so22514218otp.13
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hy18uxb89ZZQrsLX5KmzibiBKtF/Qypel7x5Z2d3dsQ=;
 b=bBqhwJ+9IuA7HmwDo1/5Gk8LgevyWIx7EB4TKepe529xZWcOOsm4ImGJnLnVlJtgHE
 O+wSYzecH6SMYoG8Auym2qvL9ECLzbZYhl+0R5/8cFTltHDcv9+tgXP/YLMaSKfF0ZLZ
 vUOmVh8aaX9ZIu0w01mESHQWvqWxot2tbfMEq9mIgf62t2wJmqGdeQ1d9Of2//CC3+mV
 8YxMsZnvBxFXOk5CGIDSQV5bv7DCAh0Ip2pbEOvIv5Kq3BW9FKzqL2rg3kS409hhGQDu
 uqIAAEyYhuZIcfATT3mDRGo00VfIVxKXdaZznyUZTaaLAQicc//5pTlJLL2LufGPgBg6
 FpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hy18uxb89ZZQrsLX5KmzibiBKtF/Qypel7x5Z2d3dsQ=;
 b=GnXg2lpUTyHTGtpEbLiiSklCe/mr9NUtZnomUmGbd6EeRj7NG6wkey+fzkY7uGzqtt
 A/ZY5YYmcJiGytYFgtlV+uN2KbJgwo4VqcucjLtKsXIqo6jH4WurVrum7xNpUjtGEnZH
 j9uOE/Nwl1C8XtZ9REkMKRw3bnuPTfPjzF/fhivl4lftBbQnziheJduKdPR7kyodc04y
 VtGGjepg05aRvUGV6yAF2y7265JNld+ld8sieUDwZCM5uwKqhR9XjlIO7Zgwzz4Wqy44
 S8EPpF2WdoEmI8kICfvezzF2Mp+LXfmDjcaAF8xrFC3FUJgvhtd1Ma1W93S7Iw7cGI4h
 +AOw==
X-Gm-Message-State: APjAAAWASJ+3ZgkCjez4bLrdrZvTLWHsUFni0Qi1SK4eaZMaiqaTuWnL
 CYCalG9EE8JLkpgmw8netrIJb16YHSvJvDmZsBgsGQ==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr6133219ota.232.1579267925453; 
 Fri, 17 Jan 2020 05:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-4-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-4-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:31:54 +0000
Message-ID: <CAFEAcA8UdoaCO7WFJXuUzz-T4B8JrptUBJ+Wdp3fzUesYT-qcg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/char/exynos4210_uart: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-TUID: 1VNkBpVYhUAv

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Replace debug code with tracing to aid debugging.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/char/exynos4210_uart.c | 96 ++++++++++++---------------------------
>  hw/char/trace-events      | 17 +++++++
>  2 files changed, 47 insertions(+), 66 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
