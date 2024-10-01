Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp271784njl;
        Tue, 1 Oct 2024 08:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNDo4t1dlVQJS4D8ezVkM4Gl3X/gTUuVAUfUMuq49uyjgj5v13aeykO+3nINrPxbdS3oaNacXZW1wMwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcoCwghqNYkACarN6g3nWd2aQbHOxxNlALG0V23+VQj6jlmnmIokOhaLwd2JZJa+fGO1iw
X-Received: by 2002:a05:620a:2907:b0:7a5:1ca:d008 with SMTP id af79cd13be357-7ae6275db11mr9488685a.66.1727797389104;
        Tue, 01 Oct 2024 08:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727797389; cv=none;
        d=google.com; s=arc-20240605;
        b=b6UT5JTwqr2NmyOPgNrn8pku7pwfOSS2kZN/SnwztGcKiMRyyStSIyc5+XGuNRp05g
         JDO3RIS8LbnvNn4DK8hePcWY/hJ74NpNQbf8XerhRUtfkhYlIpPScslRQ+1QZvP3zfhU
         vr/PEsHRTYwcdmBNtyJr8YCIK5ivuMhMrDodcIhH5qeJgOg1xoDyPgTXh5aVUqBgGiyR
         VPfU9zjYw3AdQvOSd5MjfARD3JjiLKR1Z80Jay8TkkvIuUi9F9ESxqB9a2JChKdO7ZAQ
         rF1i14fHjrmWKp/+tkYZ5iv8dRBbFupbGy+T+zSuVoExHzHQKnhoRT9Gqf1hMFoRsmQH
         0DoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Fp7qDKqb2xOia3NMUm2DYy+s/BDB+sIW9LJh3hYXYd8=;
        fh=97uyR/uuvr4jnX3vPrzCNtEvGPs9ZT7AiNCQmcU+/V4=;
        b=RBj59DHEvjr+7pApQWph9DGKx2vSx4PbX8axZMZ9rKm7NCesEea/KyXQvJYXwMKBGf
         bnIM5ZCz4CmO3QMfTBSFcwkuCiTegoIRrxw82B2HO4Vkce98kw3w7X2Sa7Rdyh0Tf00v
         0a4/rhL4fZZUA3yHi+aJ6YSmHKuadyDuK8Op1ZbM5XRQZaVoQ8FNgxByx14sUXKpqRzn
         dBLChn7zKyNGwHG8L01SIJFUBFXW+f5BMEYyaABo6EJZQtrLWziWmxF0e3zLhtOOHtX2
         lkGPTb7FeS2LgpVQ+W1PiA+6FwurWyQV+gC4TjjC5qmXU0le9qN1DQFM3eVna8VOqxNV
         qzFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae377d0683si1098867185a.7.2024.10.01.08.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 08:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svf1d-0006Ze-RK; Tue, 01 Oct 2024 11:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org>)
 id 1svf1a-0006Xp-Qg; Tue, 01 Oct 2024 11:42:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org>)
 id 1svf1Z-0007Ss-2W; Tue, 01 Oct 2024 11:42:54 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XJ2JR5d74z4x4c;
 Wed,  2 Oct 2024 01:42:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJ2JK3tHbz4wb0;
 Wed,  2 Oct 2024 01:42:40 +1000 (AEST)
Message-ID: <eceb3377-58a7-4b90-a4b7-452500771da0@kaod.org>
Date: Tue, 1 Oct 2024 17:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v7 0/8] Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Mbl9Hgf1WsTF

On 10/1/24 04:43, Jamin Lin wrote:
> v1: Support GPIO for AST2700
> v2: Fix clear incorrect interrupt status and adds reviewer suggestions
> v3: Remove nested conditionals and adds reviewer suggestions
> v4: Add test cases to test GPIO for AST2700 and update commit messages
> v5: Fix aspeed_gpio-test test failed if arch is arm
> v6: Add to test aspeed_gpio-test for aarch64
> v7: Move GPIO testcase for AST2700 to ast2700-gpio-test.c
> 
> Jamin Lin (8):
>    hw/gpio/aspeed: Fix coding style
>    hw/gpio/aspeed: Support to set the different memory size
>    hw/gpio/aspeed: Support different memory region ops
>    hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
>      mode
>    hw/gpio/aspeed: Add AST2700 support
>    aspeed/soc: Correct GPIO irq 130 for AST2700
>    aspeed/soc: Support GPIO for AST2700
>    tests/qtest:ast2700-gpio-test: Add GPIO test case for AST2700
> 
>   hw/arm/aspeed_ast27x0.c         |  18 +-
>   hw/gpio/aspeed_gpio.c           | 427 ++++++++++++++++++++++++++++++--
>   include/hw/gpio/aspeed_gpio.h   |   4 +-
>   tests/qtest/ast2700-gpio-test.c |  95 +++++++
>   tests/qtest/meson.build         |   3 +
>   5 files changed, 528 insertions(+), 19 deletions(-)
>   create mode 100644 tests/qtest/ast2700-gpio-test.c
> 


Applied to aspeed-next.

Thanks,

C.


