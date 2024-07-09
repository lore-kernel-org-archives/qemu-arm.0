Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3178289njb;
        Tue, 9 Jul 2024 02:54:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbFUF6VTJIWj+jnhP5olA/789eQbX+d/3EfBzVvC7O6EFTqg+nvFtM+3nDRb82WVcUGTbENSoMWU/K57nKnuk+aBEsYRbb
X-Google-Smtp-Source: AGHT+IHKwMa3GKv4KLgU9yGg1sK/UWvve0bX4GX5fpafdhTDM6yTlavooDsy8xTSA0258S+vNKlf
X-Received: by 2002:a25:ac94:0:b0:e03:a70d:c12e with SMTP id 3f1490d57ef6-e041b058688mr2892768276.15.1720518839827;
        Tue, 09 Jul 2024 02:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720518839; cv=none;
        d=google.com; s=arc-20160816;
        b=wa0hhKAu2z4RKWmWJMrfqTUsLuguhHU6iJzgvg7+yEkuTZSS/y8JKqq/0zklwlXBl7
         IZO9fO4jTdTWyQWqIft7pDwKciTe/zxPg3TK1ZSRUPKNjx87Gz5gKfZn2cz42vCcgfSJ
         X75owXKSKA/9dP0zkK+jtJ9wViNuqBjMqV7hd/VRVyoe/XNAro6/zFp6bdFeshd8Ra7C
         Odok3/ebxP7yoBUELP8CN9oePtCdIkQtk+jwyRkPknK498F64mYRh7AfOyvIOt+3UEeu
         2nr7VYDS/Q7BglivbWqVN70VmLELJMxEEJdKI6fDIOuZZrQjOvGXhzYFNM0/AVfLF6LS
         +gXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=teMu7+urL1OPTMd9P8EcvwBDZPQzT16BJYi7mw1Mc/4=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=aLddUQIiVkoCQPr6/pObargDSMTfmDHPXiUWBDW7B47o8bI5X9m3qkcRIEo7SBcgqM
         OU7RG7SyMDHYujVR2zIQFts5SRfCw8wdHELyEELCGvu6jQRMqusG1GFAt/ydhHvOeufl
         yaS50ZBpC/2TOYo/ldkPuoXRoS15rXqGGz4HMHdyqDVWZVafw5vblV61aEf6S66/Ci1h
         shNlcnrkZO8nY4Tzpz7dQcQS54+JV66R74TpMcIKcfjhkkuMkIKri3wR/cQM4mwtRTMB
         HApUKanfNjAbd1mHEL7apY9onKCOxiFafEcw0xSXKCa2q3eFnXzSn7pTkpq59OQN80B/
         U86w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61baadb12si18381516d6.362.2024.07.09.02.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 02:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR7Xc-0000Hl-LE; Tue, 09 Jul 2024 05:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sR7XT-0000GO-Br; Tue, 09 Jul 2024 05:53:40 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sR7XF-0007ic-CF; Tue, 09 Jul 2024 05:53:34 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJGWm0t4Gz4xPg;
 Tue,  9 Jul 2024 19:53:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJGWc5b23z4w2K;
 Tue,  9 Jul 2024 19:53:00 +1000 (AEST)
Message-ID: <528e5ee9-c49b-425c-a779-dc5dcb57da93@kaod.org>
Date: Tue, 9 Jul 2024 11:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] support AST2700 network
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QLfotE+k4cFo

On 7/4/24 10:29 AM, Jamin Lin wrote:
> change from v1:
> - ftgmac100
>   - fix coding style
>   - support 64 bits dma dram address for AST2700
> 
> change from v2:
> - ftgmac100: update memory region size to 0x200.
> - ftgmac100: introduce a new class(ftgmac100_high),
>      class attribute and memop handlers, for FTGMAC100_*_HIGH regs read/write.
> - aspeed_ast27x0: update network model to ftgmac100_high to support
>    64 bits dram address DMA.
> - m25p80: support quad mode for w25q01jvq
> 
> change from v3:
> - ftgmac100: update memory region size to 64KB.
> - ftgmac100: using a property to activate the region for new registers,
>    instead of a class
> - ftgmac100: introduce TX and RX ring base address high registers
> - ftgmac100: split standalone patch for easy review
> - ftgmac100: update TX and RX packet buffers address to 64 bits
> - aspeed_ast27x0: set dma64 property for AST2700 ftgmac100
> - machine_aspeed.py: update to test sdk v09.02 and network for AST2700
> 
> Jamin Lin (8):
>    hw/net:ftgmac100: update memory region size to 64KB
>    hw/net:ftgmac100: update ring base address to 64 bits
>    hw/net:ftgmac100: introduce TX and RX ring base address high registers
>      to support 64 bits
>    hw/net:ftgmac100: update TX and RX packet buffers address to 64 bits
>    aspeed/soc: set dma64 property for AST2700 ftgmac100
>    hw/block: m25p80: support quad mode for w25q01jvq
>    machine_aspeed.py: update to test ASPEED OpenBMC SDK v09.02 for
>      AST2700
>    machine_aspeed.py: update to test network for AST2700
> 
>   hw/arm/aspeed_ast27x0.c         |   3 +
>   hw/block/m25p80.c               |  16 ++++
>   hw/net/ftgmac100.c              | 147 +++++++++++++++++++++++++++-----
>   include/hw/net/ftgmac100.h      |  17 ++--
>   tests/avocado/machine_aspeed.py |  12 +--
>   5 files changed, 162 insertions(+), 33 deletions(-)
> 


Applied to aspeed-next.

Thanks,

C.


