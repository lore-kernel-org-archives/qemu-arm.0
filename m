Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1509630lfj;
        Tue, 3 May 2022 08:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGW5ERXj0LrMm6imprx9/TF2bFOHZKuhmR58I53Kb7gOEABESZ05Q5Aam0s2kZ/uF7OclF
X-Received: by 2002:a05:6214:1d27:b0:45a:9439:f114 with SMTP id f7-20020a0562141d2700b0045a9439f114mr6391879qvd.6.1651593560923;
        Tue, 03 May 2022 08:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651593560; cv=none;
        d=google.com; s=arc-20160816;
        b=AQa09wlzfcuZNJ2I9pi3OrpsDcGQe4kToT758OxG/HOKZt+DYWUEuDFccTVh38n2SJ
         iVBXnw78gOj9V9gb8DlnufoSmLNXkyJNqHvWHNnuS8mxKvlt2vW2aNkzEDkefR8M2fwB
         gzKL+XZRwiibbwIit/Y8g3CgRlODSknHNY+cHcap8AFTfsTNdT+9DUGYX6ViwYj8PVMB
         MYH1h72OP4sGBzRRjExOkASfiQz3mIjWCRBGu5/yKhr/WnIy2m8NCZiWn1S2BtJCBAse
         772WKg2g0MP3E17UT3M/7JPUreHBaz+zyb2K8Rr3h0coa0BA4Dakyk2div14VdS+4rJo
         Gk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=acCMj7lJQCHh3LpulGNebbMVX2arzLXWkrGtPvynfqg=;
        b=qmNYZ8xk1FxhU85PyUbddsnjn1yEh2aRYDq5Bl9TDCkG4/82yPG0hQ81oRm3cGV/8l
         LVUUAY2fyda3wEu7clGxZN3n3xhhfrbMGjsjP+HqfmlPwAMFre/BekFPEr4rQU/PxhH9
         DWojKHEjZ13ct6XlGEWV4T0mvl6S9hfuwTrAHj5LoZZj/4qNC18YU7tr/Y6NUH3XjmZ+
         xWDBIWbyDRe8a6wN2BO7UbZHJDGifHdJSyuIFBX1D63XKmTIF3SxzGMnTs4lnbO80jCk
         qgpgIb5maIS4CB21VBS/X7g1HrvLXLz1eh6OTjVICCveCIX54Hr7LV83/V/yAzu3+qyD
         YRMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gyTsiOUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv13-20020a056214240d00b00456344a8d86si5699873qvb.124.2022.05.03.08.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 08:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gyTsiOUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nluvo-00032t-DY
	for alex.bennee@linaro.org; Tue, 03 May 2022 11:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluvG-00031N-Cy
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:58:47 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluvE-0001j4-IN
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:58:46 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k14so14388714pga.0
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=acCMj7lJQCHh3LpulGNebbMVX2arzLXWkrGtPvynfqg=;
 b=gyTsiOUY8JeZ5Em2AN7T0Hy/QvsYqBGzIklbHejjXZWmhG3hBn0AkUOS6bhkJfPQYa
 TQ3Z6fsLS576Fug21Il0T/145AOnqcIFIDmV8NNiwMErqxbS3njdcUUvB5bhwU7JvU3D
 hjVrtQB1RNz1w415jQSe+TujMFCePImi2Lpz9VbLh62ldbrkd+LBAZ3mItCbAsK5AfJX
 pn+Et0PVqKNrLO0MOur6ocpzqxw0jL/M9CTQ0vdxztxFRaDjabHOmmC6YDfZRnFNWbTB
 Gu3dK9G8/a2koqf/Xg34tKSLMS4IsB620x+Fu1OqKcdnSNycb9Lkkbrkj1dkuWFqoFpH
 Xv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=acCMj7lJQCHh3LpulGNebbMVX2arzLXWkrGtPvynfqg=;
 b=Qsf6Bzz5283mJ3OxPGQXVRmvJkuAHDC6SP+RatEV04lH1RUjJMQ/Q5JNyCfkf8M4Q/
 Qr6A61HPXWs4mFPxsunYJCJAnmmTEk832ImfaYIs2E5donXcoK6uAOYT4Q59SqJAH3CS
 eNRnURdJRX7Bf5vnGb2hDM45sIvYveMg6dJ2TyOL1UTStqA9JRoVsZ7JJ1MfYx94DWIK
 7HOpg3tLj1nqJOFEKgIU/VENwFdWl4bqFVtMr450gjyYmr7MRqwwysveRcHd+VLV5vQW
 1KbBakGAd4wqHdb+rT9waZEhrPFImUJx9z0Hg6phAfsTafBjw4VlAekvwIzIbhsUqERC
 RKsQ==
X-Gm-Message-State: AOAM530JDfPqyeRgn7a05cl69NB6xFgmaK9VVLqbwqoj2te/wO0OQq91
 fw+8HV686nvQDWEO/lJ/3byB3Q==
X-Received: by 2002:a63:4004:0:b0:39d:8634:fff2 with SMTP id
 n4-20020a634004000000b0039d8634fff2mr14104221pga.28.1651593522907; 
 Tue, 03 May 2022 08:58:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a170902c7d100b0015eab1ad02esm3224641pla.215.2022.05.03.08.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:58:42 -0700 (PDT)
Message-ID: <f585a5ca-b38d-8531-b05f-2f9cfb87d592@linaro.org>
Date: Tue, 3 May 2022 08:58:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/19] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220503065848.125215-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: erKzJMGm2jrK

On 5/2/22 23:58, Cédric Le Goater wrote:
> The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:
> 
>    Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220503
> 
> for you to fetch changes up to e056c52233910ef156e6d790ce41b33cd838bad6:
> 
>    aspeed/hace: Support AST1030 HACE (2022-05-03 07:17:20 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * New AST1030 SoC and eval board
> * Accumulative mode support for HACE controller
> * GPIO fix and unit test
> * Clock modeling adjustments for the AST2600
> * Dummy eMMC Boot Controller model
> * Change of AST2500 EVB and AST2600 EVB flash model (for quad IO)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Jae Hyun Yoo (1):
>        hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model
> 
> Jamin Lin (2):
>        aspeed: Add an AST1030 eval board
>        test/avocado/machine_aspeed.py: Add ast1030 test case
> 
> Joel Stanley (2):
>        aspeed: sbc: Correct default reset values
>        aspeed: Add eMMC Boot Controller stub
> 
> Peter Delevoryas (1):
>        hw/gpio/aspeed_gpio: Fix QOM pin property
> 
> Steven Lee (13):
>        hw: aspeed_scu: Add AST2600 apb_freq and hpll calculation function
>        hw: aspeed_scu: Introduce clkin_25Mhz attribute
>        aspeed/adc: Add AST1030 support
>        aspeed/smc: Add AST1030 support
>        aspeed/wdt: Fix ast2500/ast2600 default reload value
>        aspeed/wdt: Add AST1030 support
>        aspeed/timer: Add AST1030 support
>        aspeed/scu: Add AST1030 support
>        aspeed/soc : Add AST1030 support
>        aspeed/hace: Support HMAC Key Buffer register.
>        aspeed/hace: Support AST2600 HACE
>        tests/qtest: Add test for Aspeed HACE accumulative mode
>        aspeed/hace: Support AST1030 HACE
> 
>   include/hw/adc/aspeed_adc.h      |   1 +
>   include/hw/arm/aspeed_soc.h      |   4 +
>   include/hw/misc/aspeed_hace.h    |   7 +
>   include/hw/misc/aspeed_scu.h     |  45 ++++++
>   include/hw/timer/aspeed_timer.h  |   1 +
>   include/hw/watchdog/wdt_aspeed.h |   3 +
>   hw/adc/aspeed_adc.c              |  16 +++
>   hw/arm/aspeed.c                  |  70 ++++++++-
>   hw/arm/aspeed_ast10x0.c          | 299 +++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_ast2600.c          |   6 +
>   hw/gpio/aspeed_gpio.c            |   2 +-
>   hw/misc/aspeed_hace.c            | 159 ++++++++++++++++++++-
>   hw/misc/aspeed_sbc.c             |   7 +-
>   hw/misc/aspeed_scu.c             | 108 +++++++++++++-
>   hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++++++
>   hw/timer/aspeed_timer.c          |  17 +++
>   hw/watchdog/wdt_aspeed.c         |  34 ++++-
>   tests/qtest/aspeed_gpio-test.c   |  87 ++++++++++++
>   tests/qtest/aspeed_hace-test.c   | 147 +++++++++++++++++++
>   hw/arm/meson.build               |   6 +-
>   tests/avocado/machine_aspeed.py  |  36 +++++
>   tests/qtest/meson.build          |   3 +-
>   22 files changed, 1199 insertions(+), 16 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast10x0.c
>   create mode 100644 tests/qtest/aspeed_gpio-test.c
>   create mode 100644 tests/avocado/machine_aspeed.py
> 

