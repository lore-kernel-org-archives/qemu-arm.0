Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2202501lft;
        Wed, 22 Jun 2022 08:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v26W80yZbVzivQhmo/Se9wJudjVWDf29vydist3FoV7rfbuV6zlNxigBDZqB4X5BCGrDad
X-Received: by 2002:ac8:5903:0:b0:305:2900:4099 with SMTP id 3-20020ac85903000000b0030529004099mr3609051qty.93.1655913185556;
        Wed, 22 Jun 2022 08:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655913185; cv=none;
        d=google.com; s=arc-20160816;
        b=Iazbz8h45adEGxr4Fd0saDcLsGMe7xNkaBp8hG/5ZLJcrnxxCZejP8BBSIauQzjavu
         neGwtLMXU6nhZ4HKHchUF7DgUH05u+SkOpamtwhhIPTT5xHHNf3bttfon0XS1CbYcVb1
         d80kWguRurAVROfbxCM4d+11RbPt1qUxJVHVFDVD6W5hMtynZ7z2U08Puf+cwU+22A7e
         VRCFwBNxp3Fuku0kr9dEDu/esi0qbOxwnY2OAKvDhwnPow3unoPVB1O0PAd0as7MEy1y
         eNfagNvnJFZQHn66sw/ZzXJfiAORlxE3mOUxZQCkg6TXL1mha9dIXiqebN493rhd9DHm
         peFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pqbUpJm2J/cy/kumBh1N+prFFjTQEoM2sBbD+5p3VgU=;
        b=JiZEcFN7daBETt2cwI7P9vpMhmO0GByhmLr0E6fvchOrsXc3QbCk3fYPBUuACsYwO6
         HROXta03mU8If2yr8XNgo69pJiZit3+Xg+dJ4MvdeT47mI9jk+Y4I9XYrauxPaIoR4o0
         EFdKapgB9ZnXp/IxBY8hyjFCyUOTFGHYNBlztFIockXPE1ClCUo7SGAo5sIpisXt8IOe
         +AJeHjXC/krexdYfBnA4J4AYZskcjnttMGkuRfviojYf7Rb6E2Wd9mrul+ElZm7q4Hg5
         a6qhHbnlEKzIxBcLVxbfk9DxIDOlCBpTo8Us5QX5xbS4vivYR3KkqSp3KquULHw+bs/V
         3SEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwnoeaOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020ac85fc3000000b00304e82f9457si11783559qta.723.2022.06.22.08.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 08:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwnoeaOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o42fB-0001eM-1v
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 11:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o42eh-0001cB-FQ
 for qemu-arm@nongnu.org; Wed, 22 Jun 2022 11:52:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o42ee-0002rZ-U0
 for qemu-arm@nongnu.org; Wed, 22 Jun 2022 11:52:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso78146pjg.1
 for <qemu-arm@nongnu.org>; Wed, 22 Jun 2022 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pqbUpJm2J/cy/kumBh1N+prFFjTQEoM2sBbD+5p3VgU=;
 b=YwnoeaOLdNyLe4QORXzSQ6MDz8/2hP4AZUmvU9fjEYnF7RyKP4F/Y6GJf4WJXZrhJH
 JrtNgzyiR/NVWrdZ6JFga0JfGq1NmxIcFeqaMtRZO8zpuA3ZKtPRdFOv1PPVbvRXkIAz
 Qu1LUSyrcI2bULvqU6JvbZdCSfsqLO4scj4b9iaivAooQ9tT3kPOmYgfNoPYUgOXVlro
 BoA/BDE+UtvK2V4tEpQYfg2gZKOYJMQfoeHYILv6CrSihiXSj+tCjMl91j0zC65MZB6k
 59nSaqzzObpwrAzh84eTkPcH8L4ZLj2hmLQF7N5qUWvT0/iOBwj/wR0SEkmvx6boU9xz
 wfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pqbUpJm2J/cy/kumBh1N+prFFjTQEoM2sBbD+5p3VgU=;
 b=SUZY/mlzo9HPP9krNRB/et6JxzCMDDG+HQACoSzKIX+z2BMTjuK2zLmXOzRAh80iJe
 HmTB3tUOA6P1M0Eill/wr0nkzpmgnp1TNZXO+G76MO9SK4x1p8VJBX05n1tKRhLPZZxq
 fgP59CGvRiPx4WNsA+ik10PWNMEYcfgxBe6cvKEQ3kM/YdZpDMEuRfWuv92ZP4hMUDF0
 VmwCZ1sOC7bbIgdAbdTcAauqtW1ob7VLw+n8YpYlU2U3xvjpsbIzARpsf1kyNF5V2mWK
 u9rPrVyEIC4weeMXA++GUzoxDPsJq2Ph7zvE1aa5baVSzm8NvXO7CL5s4B215lBnzxXA
 /r2g==
X-Gm-Message-State: AJIora+suSAG+lstOZ938NrTi8f3Ny0pWA5nXk7XXzZyUGy5MJP3o7On
 6lipj7tx6sWVPBzlmxymt67h4g==
X-Received: by 2002:a17:902:e5c9:b0:168:baf0:ec7c with SMTP id
 u9-20020a170902e5c900b00168baf0ec7cmr35062959plf.62.1655913151229; 
 Wed, 22 Jun 2022 08:52:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:4bf9:2153:b33e:91d?
 ([2602:ae:1543:f001:4bf9:2153:b33e:91d])
 by smtp.gmail.com with ESMTPSA id
 mp15-20020a17090b190f00b001ec92c52285sm7777146pjb.21.2022.06.22.08.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 08:52:30 -0700 (PDT)
Message-ID: <75d442e1-8ad7-a4e2-21ca-5ad809a6a7aa@linaro.org>
Date: Wed, 22 Jun 2022 08:52:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/19] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220622095520.3683321-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 38lCjm69wD3y

On 6/22/22 02:55, Cédric Le Goater wrote:
> The following changes since commit f200ff158d5abcb974a6b597a962b6b2fbea2b06:
> 
>    Merge tag 'pull-tcg-20220621' of https://gitlab.com/rth7680/qemu into staging (2022-06-21 13:47:20 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220622
> 
> for you to fetch changes up to 92a45bde8cf4257f755ce718fbf7db5f2d607a15:
> 
>    hw: m25p80: fixing individual test failure when tests are running in isolation (2022-06-22 09:49:34 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Extra avocado tests using buildroot images
> * Conversion of the I2C model to the registerfield interface
> * Support for the I2C new register interface on AST2600
> * Various I2C enhancements
> * I2C support for the AST1030
> * Improvement of the Aspeed SMC and m25p80 qtest

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Cédric Le Goater (8):
>        aspeed: Remove fake RTC device on ast2500-evb
>        test/avocado/machine_aspeed.py: Move OpenBMC tests
>        test/avocado/machine_aspeed.py: Add tests using buildroot images
>        test/avocado/machine_aspeed.py: Add I2C tests to ast2500-evb
>        test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
>        test/avocado/machine_aspeed.py: Add an I2C RTC test
>        aspeed/i2c: Add ast1030 controller models
>        aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
> 
> Iris Chen (1):
>        hw: m25p80: fixing individual test failure when tests are running in isolation
> 
> Joe Komlodi (6):
>        hw/registerfields: Add shared fields macros
>        aspeed: i2c: Migrate to registerfields API
>        aspeed: i2c: Use reg array instead of individual vars
>        aspeed: i2c: Add new mode support
>        aspeed: i2c: Add PKT_DONE IRQ to trace
>        aspeed: i2c: Move regs and helpers to header file
> 
> Joel Stanley (1):
>        aspeed/hace: Add missing newlines to unimp messages
> 
> Klaus Jensen (2):
>        hw/i2c/aspeed: rework raise interrupt trace event
>        hw/i2c/aspeed: add DEV_ADDR in old register mode
> 
> Troy Lee (1):
>        aspeed: Add I2C buses to AST1030 model
> 
>   include/hw/i2c/aspeed_i2c.h         | 289 ++++++++++++-
>   include/hw/registerfields.h         |  70 +++
>   hw/arm/aspeed.c                     |  17 +-
>   hw/arm/aspeed_ast10x0.c             |  18 +
>   hw/i2c/aspeed_i2c.c                 | 820 ++++++++++++++++++++++--------------
>   hw/misc/aspeed_hace.c               |   4 +-
>   tests/qtest/aspeed_smc-test.c       |  74 +++-
>   hw/i2c/trace-events                 |   2 +-
>   tests/avocado/boot_linux_console.py |  43 --
>   tests/avocado/machine_aspeed.py     | 136 ++++++
>   10 files changed, 1095 insertions(+), 378 deletions(-)

