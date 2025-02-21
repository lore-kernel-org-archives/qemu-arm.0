Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp443225njc;
        Fri, 21 Feb 2025 09:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVC1WSMqzwS7cBESwa5Cqzd1u7GSlEHLb9Vz+ZLpNYstq8ZbVaOhRFV3bBw37jpiaNk3l4qYO1dE9+UaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGaC3flLuH7tDlnWBNq1NQOGmZM2XCjvC+3lKLrr87Ry7bCjouTch1O2gG+QNMWpeajsUZI
X-Received: by 2002:a05:6214:2482:b0:6e4:2e00:dda9 with SMTP id 6a1803df08f44-6e6ae994f9amr56099996d6.31.1740158716314;
        Fri, 21 Feb 2025 09:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740158716; cv=none;
        d=google.com; s=arc-20240605;
        b=GWzoTxRwipjFZJlUWzxF7gac29O1F2bqztBFzSBZa/Dqsg6KOwy1qmFqDjmjpkGvj7
         vwB1OppWlPfaMmSOb5B2slxhsXx/1UiXi0OYcjluBu0QnK5asdoNHoGdpum3+nAJC0dy
         Vl0m7N3YS8CLNuo9QGp9lerG9cgsssGc1Hh0BzcUee8qUbvcB1qCK0jCQ8dlH1Cpu9PI
         YuRH+ERoCyMQ48tbZ3Kc2fgE1oF+yNs84LNjAKwXFjDG2XOra/5+r+Mby1gpzi0Y1mK5
         Cgqky9KkNn6rwl9ufWVT7MKJ4qtF+NnByvlHSljf2pRaLoxDpxfErxjAV0vjT0ppR3WQ
         Ty0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=2ufPIVAz2Vh7QKQXM5OBTRyowMxEJmxXIsZBKAtX8SA=;
        fh=uYgLQ/RASatA36862a0CBA0fRsT+kExSFwR1sQIxk/c=;
        b=Cu+NyJxGFQaX80W58iNRsypSrb+oxvTd7SNUtrgK46o+rb8O3fEl8qq4yYImRCOfab
         d2J/MKTENyralmTOqve3ojzE+2hJq0U6qwmKgx5fVMCiTM7OW0ILKuYn06ohBoCdlARe
         RAhcoHS6trjqBOKF83Dk9E/T295P5MrSx06mi9rrm9LwhHEX4dkeGgMIWX/n4ufbqVqQ
         cx1aHhAV/Y/r8fu/s57ogUvGFd3qBhz5RVSyMuoi+FxRs2NH/5fr4q1QdrnACmO2yL8A
         ZRhAbg+axWLU+5fBN3ioqDy5GP/bMazis62ifpegtYKPqnKY7J5HjVqrjvEtH5WKea8x
         QEJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c081dsi168084146d6.282.2025.02.21.09.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 09:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlWls-0002Zu-CF; Fri, 21 Feb 2025 12:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ENLZ=VM=kaod.org=clg@ozlabs.org>)
 id 1tlWle-0002ZB-Pa; Fri, 21 Feb 2025 12:24:54 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ENLZ=VM=kaod.org=clg@ozlabs.org>)
 id 1tlWlb-0005YX-8v; Fri, 21 Feb 2025 12:24:49 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Yzxny5pXPz4wyk;
 Sat, 22 Feb 2025 04:24:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yzxnv24kFz4wcm;
 Sat, 22 Feb 2025 04:24:34 +1100 (AEDT)
Message-ID: <06b4ab70-5fa4-4b46-9461-f03eb0b5cbd8@kaod.org>
Date: Fri, 21 Feb 2025 18:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/28] Support AST2700 A1
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
 <4bbd5a9e-934e-4535-b829-1d4fe070d63d@kaod.org>
 <SI2PR06MB5041D7BFF0F491FFA7CE3159FCC42@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <SI2PR06MB5041D7BFF0F491FFA7CE3159FCC42@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ENLZ=VM=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: bEkL3Ixba20/

On 2/20/25 06:11, Jamin Lin wrote:
> Hi Cedric,
> 
>> Subject: Re: [PATCH v3 00/28] Support AST2700 A1
>>
>> Hello Jamin,
>>
>>
>> On 2/13/25 04:35, Jamin Lin wrote:
>>> v1:
>>>    1. Refactor INTC model to support both INTC0 and INTC1.
>>>    2. Support AST2700 A1.
>>>    3. Create ast2700a0-evb machine.
>>>
>>> v2:
>>>     To streamline the review process, split the following patch series into
>>>     three parts.
>>>
>> https://patchwork.kernel.org/project/qemu-devel/cover/20250121070424.246
>> 5942-1-jamin_lin@aspeedtech.com/
>>>     This patch series focuses on cleaning up the INTC model to
>>>     facilitate future support for the INTC_IO model.
>>>
>>> v3:
>>>    1. Update and add functional test for AST2700
>>>    2. Add AST2700 INTC design guidance and its block diagram.
>>>    3. Retaining the INTC naming and introducing a new INTCIO model to
>> support the AST2700 A1.
>>>    4. Create ast2700a1-evb machine and rename ast2700a0-evb machine
>>>    5. Fix silicon revision issue and support AST2700 A1.
>>>
>>> With the patch applied, QEMU now supports two machines for running
>> AST2700 SoCs:
>>> ast2700a0-evb: Designed for AST2700 A0
>>> ast2700a1-evb: Designed for AST2700 A1
>>>
>>> Test information
>>> 1. QEMU version:
>>>
>> https://github.com/qemu/qemu/commit/ffaf7f0376f8040ce9068d71ae9ae872
>> 25
>>> 05c42e
>>> 2. ASPEED SDK v09.05 pre-built image
>>>      https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.05
>>>      ast2700-default-obmc.tar.gz (AST2700 A1)
>>>
>> https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast
>> 2700-default-obmc.tar.gz
>>>      ast2700-a0-default-obmc.tar.gz (AST2700 A0)
>>>
>>>
>> https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast
>>> 2700-a0-default-obmc.tar.gz
>>
>> The part adding new functional tests needs a rework. See comment.
>>
>>> Known Issue:
>>> The HACE crypto and hash engine is enable by default since AST2700 A1.
>>> However, aspeed_hace.c(HACE model) currently does not support the
>> CRYPTO command.
>>> To boot AST2700 A1, I have created a Patch 21 which temporarily
>>> resolves the issue by sending an interrupt to notify the firmware that
>>> the cryptographic command has completed. It is a temporary workaround
>>> to resolve the boot issue in the Crypto Manager SelfTest.
>>>
>>> As a result, you will encounter the following kernel warning due to
>>> the Crypto Manager test failure. If you don't want to see these kernel
>>> warning, please add the following settings in your kernel config.
>>>
>>> ```
>>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
>>> ```
>>
>> Would it be possible to send the hace changes in its own series ?
>>
>>
> Currently, the HACE HW engine and crypto self-tests are enabled by default in
> SDK v09.05 FW. To boot QEMU for AST2700 A1 with the SDK v09.05 pre-built image,
> a CRYPTO workaround patch is required.

can we upstream the HACE changes before having full AST2700 A1 support ?

Thanks,

C.




> 
> The AST2700 A1 patch series includes functional tests. To make the functional tests
> pass for AST2700 A1, I have included the HACE patch in the same patch series.
> 
> There are two ways to split this patch series:
> 
> Solution A:
> 
> 1. Create series 1 to support AST2700 A1.
> 2. Create series 2 to support HACE.
> 3. Create series 3 to support AST2700 A1 functional tests.
> 
> Series 3 should depend on series 1 and 2.
> 
> Solution B:
> 
> 1. Place a pre-built image called "ast2700-a1-qemu-disable-self-test" in the SDK v09.05 Github repository.
> https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.05
> 2. Create one patch series to support AST2700 A1 with its functional tests.
> 3. Create series 2 to support HACE.
> 
> Could you tell me which solution you prefer or could you please give me any suggestion?
> 
> Thanks-Jamin
> 
>>>
>>> Jamin Lin (28):
>>>     hw/intc/aspeed: Support setting different memory and register size
>>>     hw/intc/aspeed: Introduce helper functions for enable and status
>>>       registers
>>>     hw/intc/aspeed: Add object type name to trace events for better
>>>       debugging
>>>     hw/arm/aspeed: Rename IRQ table and machine name for AST2700 A0
>>>     hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
>>>     hw/intc/aspeed: Support different memory region ops
>>>     hw/intc/aspeed: Rename num_ints to num_inpins for clarity
>>>     hw/intc/aspeed: Add support for multiple output pins in INTC
>>>     hw/intc/aspeed: Refactor INTC to support separate input and output pin
>>>       indices
>>>     hw/intc/aspeed: Introduce AspeedINTCIRQ structure to save the irq
>>>       index and register address
>>>     hw/intc/aspeed: Introduce IRQ handler function to reduce code
>>>       duplication
>>>     hw/intc/aspeed: Add Support for Multi-Output IRQ Handling
>>>     hw/intc/aspeed: Add Support for AST2700 INTCIO Controller
>>>     hw/misc/aspeed_scu: Add Support for AST2700/AST2750 A1 Silicon
>>>       Revisions
>>>     hw/misc/aspeed_scu: Fix the revision ID cannot be set in the SOC layer
>>>       for AST2700
>>>     hw/arm/aspeed_ast27x0.c Support AST2700 A1 GIC Interrupt Mapping
>>>     hw/arm/aspeed_ast27x0: Support two levels of INTC controllers for
>>>       AST2700 A1
>>>     hw/arm/aspeed: Add SoC and Machine Support for AST2700 A1
>>>     hw/misc/aspeed_hace: Fix coding style
>>>     hw/misc/aspeed_hace: Add AST2700 support
>>>     hw/misc/aspeed_hace: Fix boot issue in the Crypto Manager Self Test
>>>     hw/arm/aspeed_ast27x0: Add HACE support for AST2700
>>>     test/functional/aspeed: Introduce new function to fetch assets
>>>     tests/functional/aspeed: Introduce start_ast2700_test API and update
>>>       hwmon path
>>>     tests/functional/aspeed: Update test ASPEED SDK v09.05
>>>     tests/functional/aspeed: Renamed test case and machine for AST2700
>> A0
>>>     tests/functional/aspeed: Add test case for AST2700 A1
>>>     docs/specs: add aspeed-intc
>>>
>>>    docs/specs/aspeed-intc.rst              | 136 ++++++
>>>    docs/specs/index.rst                    |   1 +
>>>    hw/arm/aspeed.c                         |  21 +-
>>>    hw/arm/aspeed_ast27x0.c                 | 291 +++++++++---
>>>    hw/intc/aspeed_intc.c                   | 593
>> +++++++++++++++++++-----
>>>    hw/intc/trace-events                    |  25 +-
>>>    hw/misc/aspeed_hace.c                   |  44 +-
>>>    hw/misc/aspeed_scu.c                    |   5 +-
>>>    include/hw/arm/aspeed_soc.h             |   3 +-
>>>    include/hw/intc/aspeed_intc.h           |  32 +-
>>>    include/hw/misc/aspeed_hace.h           |   1 +
>>>    include/hw/misc/aspeed_scu.h            |   2 +
>>>    tests/functional/test_aarch64_aspeed.py |  47 +-
>>>    13 files changed, 963 insertions(+), 238 deletions(-)
>>>    create mode 100644 docs/specs/aspeed-intc.rst
>>>
>>
>> Patch 1-9 and the hace changes could be merged quickly.
>>
>>
>> I need  some help on patch 10,12,16,17.
>>
>> Andrew,
>>
>> Would you have time please ?
>>
>> Thanks,
>>
>> C.
> 

