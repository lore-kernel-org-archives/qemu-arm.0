Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp1048989njb;
        Thu, 26 Sep 2024 09:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfCxXrHyPU4qlKd9wX/NVk53zyzDi+EXIu7v5PhjH9+4YZ6A8l0XDvbv4EkdXeKNPCerNX8IAPgZJa4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHVKL73d9lOBRa0PG3qVWWqA/mEzH38yQO6JCuy7iYsJVtfEX9ci6HWjTDI4Q3isoeIAGhD
X-Received: by 2002:a05:620a:1921:b0:7a9:b250:d57b with SMTP id af79cd13be357-7ae37825c86mr16211585a.5.1727367168439;
        Thu, 26 Sep 2024 09:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727367168; cv=none;
        d=google.com; s=arc-20240605;
        b=JO50mS2EqkrVeHJQGSgyyRzpH+1qPWQeS1JHoz/NGICRZBx724upITPU3vd8p+ywKh
         UYkbRoB2azp2VTNp4JksID7O3npWc8qxcwWmQGZHJz9mvXJRjXjYDcoTVpMHReEj/G7Y
         Bk6XZypDEnt2t4JUl54Fh7wAZe8I2kipVJ785tX5ukCCwI9PfknI/U1qOuI7LKZRPOQm
         826EYSEhEyFLaKwxqsjHh3zXUaeYrWJJXE2YX5VWWEyTbBvMSPDIstjP3GQLT7ayODi6
         sO8epDmXqThjSTVrvwbqnvWwLK2MPWP3R0uS+pUrYlgcMlV5Oht80K88nb1aqbMlgKjC
         FPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=hwnYDiN9iruXdL1k/b8PKm8DKXuN49nkytBLRMgXlQI=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=G3rZIVlGPgG+lNzk813ZwMfuumzLQSV2L//4ckiMddsknWnkzN0MVy6wKM+g5NUFih
         GvdC3AwUbTeTU0aLfTFram39ekJdVb1LfbT2QZ1U5I39EIs0CHCnZGdMl4FMdEGAIwgk
         TM1gkmqcn8FPp8QYAluxm0D/ggvF1kl6ncdeYD9SBbsZJn6Bx5NDn9g1pbEBY/qAvcd0
         QZNuu0XDaqqrYCEnrb4mlNO2nzMQw5K9cz3joj1G8wQETUO9HVg8Axg2JREIvHlofqLb
         ceLUBG/e+6fdSsqdwiqtD3Kb97rfIEhzIwkEQUhZHCPSTKwXvfXxkRIEsFj53rsFfXF7
         HbEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37871192si5979485a.608.2024.09.26.09.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 09:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1str6l-00055C-3Z; Thu, 26 Sep 2024 12:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str6j-0004zb-Pa; Thu, 26 Sep 2024 12:12:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org>)
 id 1str6i-0004Rn-5a; Thu, 26 Sep 2024 12:12:45 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XDzCF42rdz4xQS;
 Fri, 27 Sep 2024 02:12:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDzCB0001z4xNC;
 Fri, 27 Sep 2024 02:12:37 +1000 (AEST)
Message-ID: <e1076f8e-2e32-41ba-adf4-8e28aae8e526@kaod.org>
Date: Thu, 26 Sep 2024 18:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Z/Ab=QY=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.246, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Mg+MqlZN0Fg+

Hello Jamin,

On 9/26/24 09:45, Jamin Lin wrote:
> v1: Support GPIO for AST2700
> v2: Fix clear incorrect interrupt status and adds reviewer suggestions
> v3: remove nested conditionals and adds reviewer suggestions
> 
> Jamin Lin (6):
>    hw/gpio/aspeed: Fix coding style
>    hw/gpio/aspeed: Support to set the different memory size
>    hw/gpio/aspeed: Support different memory region ops
>    hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
>      mode
>    hw/gpio/aspeed: Add AST2700 support
>    aspeed/soc: Support GPIO for AST2700
> 
>   hw/arm/aspeed_ast27x0.c       |  18 +-
>   hw/gpio/aspeed_gpio.c         | 427 ++++++++++++++++++++++++++++++++--
>   include/hw/gpio/aspeed_gpio.h |   4 +-
>   3 files changed, 430 insertions(+), 19 deletions(-)
> 

Could you please to add tests in tests/qtest/aspeed_gpio-test.c
for this changes ? At least one with the ast2700-evb machine if
possible.


Thanks,

C.


