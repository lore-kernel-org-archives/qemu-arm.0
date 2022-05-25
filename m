Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1177319lfh;
        Wed, 25 May 2022 13:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmzmiJMGOZnv3n1hnf7kh5tckaAjwkUeX+aDtSOuek0teCfxQjojfIZOsewef8wGt/WEik
X-Received: by 2002:ac8:5894:0:b0:2f9:42ee:b443 with SMTP id t20-20020ac85894000000b002f942eeb443mr7950571qta.26.1653511547898;
        Wed, 25 May 2022 13:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653511547; cv=none;
        d=google.com; s=arc-20160816;
        b=tLUb9VQ6v9abPcVnl6MD8Jd+Ckj4xqv3aeJztRRvF6hrEpkCcuLZZzf62q8XI+FrdW
         c9anogrsVnySbW9t3PwXfu582MlUx4mUpEraqFB6abc7EBtjAJoXkVK9OM24eGnAc9LQ
         OQqLFaXvhKUmFQ6x/HAXsC+2itRZy1lUq0spo6I8Q6GV4KIMaaETLMOiw81GnFMB+NIf
         dghO7txn/kb8dlmjBiF7WpkLw4ZtLkj5Ef8+Mhd9r/Pk4oL5q+/DSLp0Pr/Rkc2GG99M
         g53o0sHTykizC/Ltbxr77+ccjCZkIos2Uz9puTl0s8XZvm9nG51N3gHTzC+Q/jx6Xbt/
         /JiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C+AHWhvrxtlTirVHdpnFVckkGQ08Su9qwAAjqNyefQk=;
        b=FSZTq+dkMx8YxrwlqVQl2c25kiiA5AB6yFCbVfnWbv9cuegFikBWTNy4ULplzxAu4t
         y2G4ISCsWpPclG6Wbgj/33kC98AQxHLFhvmSNlNa67oxaO/ZZHcn1KvrtwT9CW3amMLt
         yCOG0dmnqTl1CEl6arXrMcUDSaDL0YslXl5C+swZHBUxbbXVKPBigZvrFyRo3uWiXTeI
         MX9Unnh/dcvHoso3zSQvj3dctAL6F5ypd4GoochG5HyfdSyrEK0PqxGxl9ZGjU4ZHT0o
         NskRy1lk3Hz2461u0AitFO0VPol4u0gIo39QyhbNYUDUlDQR8yWx7S34A4f5qkqwJH9M
         W+IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E8850heQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s123-20020a375e81000000b0069fb5373d60si1590549qkb.529.2022.05.25.13.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 13:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E8850heQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntxt5-0004Zu-EC
	for alex.bennee@linaro.org; Wed, 25 May 2022 16:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxs9-0004ZS-PG
 for qemu-arm@nongnu.org; Wed, 25 May 2022 16:44:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxs6-0006N7-FY
 for qemu-arm@nongnu.org; Wed, 25 May 2022 16:44:49 -0400
Received: by mail-pg1-x529.google.com with SMTP id x12so19805375pgj.7
 for <qemu-arm@nongnu.org>; Wed, 25 May 2022 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C+AHWhvrxtlTirVHdpnFVckkGQ08Su9qwAAjqNyefQk=;
 b=E8850heQE7zxbr0orWGO+Z3vpkL3VoY7bKGKGeQa7LjlEnwSYf2ZBVc5lfWOBQiPpi
 babmqbJky7np//uzF/AGA4LERd2hDWW1/S9JXvmuusHVE15e8GnRqj/mdzfY4p2yFbQy
 weH2om8nyMA8Ek0YTsSTwCvAFKQSYFNfpkFZeEnJ7csFeKVnnT+HsuUmuFBYcNpWSb7O
 JNdJzCaeIzrA5dKLXl2+hqu4jdPNXm+Ygax2PRXt+2+kewRFO851M4mMdSD1zgokSSnA
 8o8Y+CcOEy7VMA2SkPkAYp02SuwQZ1eDir/GI4BxuF0zZ65RcPVpygb/cGhTBx8s2ORK
 zESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+AHWhvrxtlTirVHdpnFVckkGQ08Su9qwAAjqNyefQk=;
 b=jY7OP2ewHKjE/At8qPOk1EJrOzFAblc+pEP2OUU7Ws7TeOdsw0okyiMvr770hiLkxE
 kQb4KN1FOm0G6HRYLCfox9AFnN+vqvOvSly0fQvmsnjC8IyQrErqFcxYkYbqR+PiwF+K
 /gRDnw1Yd2vzDanvbKBFa1WSCrgJjT0GdbwNnsHL1wh2CzUBQ1ofbhaWxk/SSb7Xo1ye
 qr4A0BNLPjZD9TbQDa5N3uFx9S7g55C/hSbHMTbIVxHYdJOef73nunDZhMLZK0F7j9MT
 52zXAONKGw1XfITwTsWstmqmkJxAuCyXzX7A7k5BuGdiu/rAJZgHVEhTR5u/ntOOtHIr
 VMUg==
X-Gm-Message-State: AOAM531OsjzSE61wTtAKpsfpGxf/7HVkGbvUSSHjbIXe/oRXSD6Gp5dI
 gPqwM3uKq4xcEgMF3WulMcrkDQ==
X-Received: by 2002:a63:8ac3:0:b0:3fa:e447:ec3 with SMTP id
 y186-20020a638ac3000000b003fae4470ec3mr3647036pgd.606.1653511484732; 
 Wed, 25 May 2022 13:44:44 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 l184-20020a6391c1000000b003fadfd7be5asm1766854pge.18.2022.05.25.13.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 13:44:44 -0700 (PDT)
Message-ID: <cb16fb54-80dd-7c02-d836-4c44173d2c1f@linaro.org>
Date: Wed, 25 May 2022 13:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/15] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220525160136.556277-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hdm76m3qTRIH

On 5/25/22 09:01, Cédric Le Goater wrote:
> The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:
> 
>    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220525
> 
> for you to fetch changes up to 52bcd997800fab67d57bea6d93e368f6f7a93b24:
> 
>    hw/arm/aspeed: Add i2c devices for AST2600 EVB (2022-05-25 16:22:37 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Aspeed GPIO model extensions
> * GPIO support for the Aspeed AST1030 SoC
> * New fby35 machine (AST2600 based)
> * Extra unit tests for the GPIO and SMC models
> * Initialization of all UART with serial devices
> * AST2600 EVB and Documentation update

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Cédric Le Goater (1):
>        aspeed: Introduce a get_irq AspeedSoCClass method
> 
> Howard Chiu (1):
>        hw/arm/aspeed: Add i2c devices for AST2600 EVB
> 
> Iris Chen (1):
>        hw: m25p80: allow write_enable latch get/set
> 
> Jamin Lin (5):
>        docs: add minibmc section in aspeed document
>        hw/gpio Add GPIO read/write trace event.
>        hw/gpio: Add ASPEED GPIO model for AST1030
>        hw/gpio support GPIO index mode for write operation.
>        hw/gpio: replace HWADDR_PRIx with PRIx64
> 
> Peter Delevoryas (7):
>        hw/arm/aspeed: Add fby35 machine type
>        docs: aspeed: Add fby35 board
>        hw: aspeed: Add missing UART's
>        hw: aspeed: Add uarts_num SoC attribute
>        hw: aspeed: Ensure AST1030 respects uart-default
>        hw: aspeed: Introduce common UART init function
>        hw: aspeed: Init all UART's with serial devices
> 
>   docs/system/arm/aspeed.rst     |  62 ++++++++++
>   include/hw/arm/aspeed_soc.h    |  13 +++
>   include/hw/gpio/aspeed_gpio.h  |  16 ++-
>   tests/qtest/libqtest.h         |  22 ++++
>   hw/arm/aspeed.c                |  74 +++++++++++-
>   hw/arm/aspeed_ast10x0.c        |  48 ++++++--
>   hw/arm/aspeed_ast2600.c        |  32 +++--
>   hw/arm/aspeed_soc.c            |  46 ++++++--
>   hw/block/m25p80.c              |   1 +
>   hw/gpio/aspeed_gpio.c          | 257 ++++++++++++++++++++++++++++++++++++++---
>   tests/qtest/aspeed_gpio-test.c |  40 ++-----
>   tests/qtest/aspeed_smc-test.c  |  43 +++++++
>   tests/qtest/libqtest.c         |  24 ++++
>   hw/gpio/trace-events           |   4 +
>   14 files changed, 607 insertions(+), 75 deletions(-)
> 

